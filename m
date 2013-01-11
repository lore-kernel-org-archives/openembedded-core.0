Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ttgdf-0008Cd-7Z for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 16:35:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0BFK6De018328;
	Fri, 11 Jan 2013 15:20:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17527-01; Fri, 11 Jan 2013 15:20:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0BFJxAh018312
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 11 Jan 2013 15:20:00 GMT
Message-ID: <1357917602.4072.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Constantin Musca <constantinx.musca@intel.com>
Date: Fri, 11 Jan 2013 15:20:02 +0000
In-Reply-To: <cbe92655aebcddb452f3855ba543be2560ac8a1c.1357721541.git.constantinx.musca@intel.com>
References: <cover.1357721541.git.constantinx.musca@intel.com>
	<cbe92655aebcddb452f3855ba543be2560ac8a1c.1357721541.git.constantinx.musca@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] gcc: enable multilib for target gcc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 15:35:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-09 at 11:00 +0200, Constantin Musca wrote:
> - add a task to setup multilib configuration for target gcc
> - this commit adapts Nitin Kamble's work to gcc 4.7
> 
> Tests:
> root@qemux86-64:~# gcc -m64 t.c -o t
> root@qemux86-64:~# file t
> t: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not stripped
> root@qemux86-64:~# ./t
> Hello World !
> root@qemux86-64:~# gcc -m32 t.c -o t
> root@qemux86-64:~# file t
> t: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not stripped
> root@qemux86-64:~# ./t
> Hello World !
> 
> [YOCTO #1369]
> 
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc              |   2 +-
>  meta/recipes-devtools/gcc/gcc-common.inc           |  23 ++++
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +-
>  meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 132 +++++++++++++++++++++
>  meta/recipes-devtools/gcc/libgcc_4.7.bb            |  44 +++++++
>  6 files changed, 202 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

This triggered some build failures:

http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/769/steps/shell_29/logs/stdio


> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 2fad764..13a1e7e 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>  
> -PR = "r14"
> +PR = "r15"
>  
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.7.1
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index 6e64441..0d29800 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -34,6 +34,29 @@ def get_gcc_multiarch_setting(bb, d):
>              return multiarch_options[target_arch]
>      return ""
>  
> +# this is used by the multilib setup of gcc
> +def get_tune_parameters(tune, d):
> +    availtunes = d.getVar('AVAILTUNES', True)
> +    if tune not in availtunes.split():
> +        bb.error('The tune: %s is not one of the available tunes: %s', tune, availtunes)
> +
> +    localdata = bb.data.createCopy(d)
> +    override = ':tune-' + tune
> +    localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES', False) + override)
> +    bb.data.update_data(localdata)
> +
> +    retdict = {}
> +    retdict['tune'] = tune
> +    retdict['ccargs'] = localdata.getVar('TUNE_CCARGS', True)
> +    retdict['features'] = localdata.getVar('TUNE_FEATURES', True)
> +    retdict['baselib'] = localdata.getVar('BASE_LIB', True)
> +    retdict['arch'] = localdata.getVar('TUNE_ARCH', True)
> +    retdict['abiextension'] = localdata.getVar('ABIEXTENSION', True)
> +    retdict['target_fpu'] = localdata.getVar('TARGET_FPU', True)
> +    retdict['pkgarch'] = localdata.getVar('TUNE_PKGARCH', True)
> +    retdict['package_extra_archs'] = localdata.getVar('PACKAGE_EXTRA_ARCHS', True)
> +    return retdict
> +
>  # We really need HOST_SYS here for some packages and TARGET_SYS for others.
>  # For now, libgcc is most important so we fix for that - RP.
>  SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 4eb59fd..08cc98e 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -25,7 +25,7 @@ EXTRA_OECONF_PATHS ?= ""
>  EXTRA_OECONF_INITIAL ?= ""
>  EXTRA_OECONF_INTERMEDIATE ?= ""
>  
> -GCCMULTILIB = "--disable-multilib"
> +GCCMULTILIB ?= "--disable-multilib"
>  GCCTHREADS ?= "posix"
>  
>  EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> index f41301f..809f937 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> @@ -1,4 +1,5 @@
>  require gcc-configure-common.inc
> +require gcc-multilib-config.inc
>  
>  EXTRA_OECONF_PATHS = " \
>      --with-sysroot=/ \
> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> new file mode 100644
> index 0000000..3d9c026
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> @@ -0,0 +1,132 @@
> +GCCMULTILIB = "--enable-multilib"
> +
> +addtask gcc_multilib_setup after do_patch before do_configure
> +
> +# following code modifies these definitions in the gcc config
> +#    MULTILIB_OPTIONS
> +#    MULTILIB_DIRNAMES
> +#    MULTILIB_OSDIRNAMES
> +#    GLIBC_DYNAMIC_LINKER32
> +#    GLIBC_DYNAMIC_LINKER64
> +#    GLIBC_DYNAMIC_LINKERX32
> +#    GLIBC_DYNAMIC_LINKERN32
> +#  For more information on use of these variables look at these files in the gcc source code
> +#    gcc/config/i386/t-linux64
> +#    gcc/config/mips/t-linux64
> +#    gcc/config/rs6000/t-linux64
> +#    gcc/config/i386/linux64.h
> +#    gcc/config/mips/linux64.h
> +#    gcc/config/rs6000/linux64.h
> +
> +python do_gcc_multilib_setup() {
> +    import re
> +
> +    # do this only for target recipe
> +    if d.getVar('PN', True) != 'gcc':
> +        return
> +
> +    srcdir = d.getVar('S', True)
> +    multilibs = d.getVar('MULTILIB_VARIANTS', True)
> +    target_arch = d.getVar('TARGET_ARCH', True)
> +
> +    gcc_target_config_files = {
> +        'x86_64'    : ['gcc/config/i386/t-linux64'],
> +        'mips'      : ['gcc/config/mips/t-linux64'],
> +        'ppc'       : ['gcc/config/rs6000/t-linux64']
> +    }
> +
> +    gcc_header_config_files = {
> +        'x86_64'    : ['gcc/config/i386/linux64.h'],
> +        'mips'      : ['gcc/config/mips/linux64.h'],
> +        'ppc'       : ['gcc/config/rs6000/linux64.h']
> +    }
> +
> +    if target_arch not in gcc_target_config_files:
> +        if multilibs:
> +            bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
> +        return
> +
> +    gcc_multilib_target_config_files = gcc_target_config_files[target_arch]
> +    gcc_multilib_header_config_files = gcc_header_config_files[target_arch]
> +
> +    ml_list = ['DEFAULTTUNE']
> +    if multilibs != '':
> +        for ml in multilibs.split(' '):
> +            ml_list.append('DEFAULTTUNE_virtclass-multilib-' + ml)
> +
> +    libdir32 = 'SYSTEMLIBS_DIR'
> +    libdir64 = 'SYSTEMLIBS_DIR'
> +    libdirx32 = 'SYSTEMLIBS_DIR'
> +    libdirn32 = 'SYSTEMLIBS_DIR'
> +
> +    multilib_options = []
> +    multilib_dirnames = []
> +    multilib_osdirnames = []
> +
> +    for ml in ml_list:
> +        tune = d.getVar(ml, True)
> +        tune_parameters = get_tune_parameters(tune, d)
> +
> +        tune_baselib = tune_parameters['baselib']
> +
> +        if tune_baselib == 'lib64':
> +            libdir64 = tune_baselib
> +        elif tune_baselib == 'libx32':
> +            libdirx32 = tune_baselib
> +        elif tune_baselib == 'lib32':
> +            libdirn32 = tune_baselib
> +        elif tune_baselib == 'lib':
> +            libdir32 = tune_baselib
> +        else:
> +            bb.error('Unknown libdir (%s) of the tune : %s' % (tune_baselib, tune))
> +
> +        # take out '-' in parameters
> +        multilib_options.append(re.sub(r' +\-+', ' ', re.sub(r'^ *\-+', '', tune_parameters['ccargs'])))
> +        if tune_baselib == 'lib':
> +            multilib_dirnames.append('32')  # /lib => 32bit lib
> +        else:
> +            multilib_dirnames.append(tune_baselib.replace('lib', ''))
> +        multilib_osdirnames.append('../' + tune_baselib)
> +
> +    # go over t-linux64 kind target files
> +    for ml_conf_file in gcc_multilib_target_config_files:
> +        # recreate multilib configuration variables
> +        lines = []
> +
> +        lines.append('MULTILIB_OPTIONS = ' + '/'.join(multilib_options))
> +        lines.append('MULTILIB_DIRNAMES = ' + ' '.join(multilib_dirnames))
> +        lines.append('MULTILIB_OSDIRNAMES = ' + ' '.join(multilib_osdirnames))
> +
> +        with open(srcdir + '/' + ml_conf_file, 'w') as f:
> +            f.write('\n'.join(lines))
> +
> +    # go over linux64.h kind header files
> +    for ml_conf_file in gcc_multilib_header_config_files:
> +        with open(srcdir + '/' + ml_conf_file, 'r') as f:
> +            filelines = f.read()
> +
> +            # replace lines like
> +            # #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> +            # by
> +            # #define GLIBC_DYNAMIC_LINKER32 "/lib/" "ld-linux.so.2"
> +            # this is needed to put the correct dynamic loader path in the generated binaries
> +
> +            filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKER32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
> +                r'\1"/' + libdir32 + r'/"\3',
> +                filelines, flags=re.MULTILINE)
> +
> +            filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
> +                r'\1"/' + libdir64 + r'/"\3',
> +                filelines, flags=re.MULTILINE)
> +
> +            filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKERX32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
> +                r'\1"/' + libdirx32 + r'/"\3',
> +                filelines, flags=re.MULTILINE)
> +
> +            filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
> +                r'\1"/' + libdirn32 + r'/"\3',
> +                filelines, flags=re.MULTILINE)
> +
> +            with open(srcdir + '/' + ml_conf_file, 'w') as f:
> +                f.write(filelines)
> +}
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> index 5eaa515..c17c78a 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> @@ -15,6 +15,10 @@ FILES_${PN} = "${base_libdir}/libgcc*.so.*"
>  FILES_${PN}-dev = " \
>    ${base_libdir}/libgcc*.so \
>    ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
> +  ${libdir}/${TARGET_SYS}/${BINV}/64 \
> +  ${libdir}/${TARGET_SYS}/${BINV}/32 \
> +  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
> +  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
>  FILES_libgcov-dev = " \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
> @@ -70,3 +74,43 @@ BBCLASSEXTEND = "nativesdk"
>  
>  INSANE_SKIP_${PN}-dev = "staticdev"
>  INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
> +
> +addtask multilib_install after do_install before do_package
> +# this makes multilib gcc files findable for target gcc
> +# e.g.
> +#    /usr/lib/i586-pokymllib32-linux/4.7/
> +# by creating this symlink to it
> +#    /usr/lib64/x86_64-poky-linux/4.7/32
> +
> +python do_multilib_install() {
> +    import re
> +    # do this only for multilib extended recipe
> +    if d.getVar('PN', True) != 'libgcc':
> +        return
> +
> +    multilibs = d.getVar('MULTILIB_VARIANTS', True) or ''
> +    if multilibs == '':
> +        return
> +
> +    binv = d.getVar('BINV', True) or ''
> +
> +    for ml in multilibs.split(' '):
> +        tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, True) or ''
> +        tune_parameters = get_tune_parameters(tune, d)
> +        tune_baselib = tune_parameters['baselib']
> +        tune_arch = tune_parameters['arch']
> +        tune_bitness = tune_baselib.replace('lib', '')
> +        if tune_bitness == '' :
> +            tune_bitness = '32' # /lib => 32bit lib
> +
> +        src = '../../../' + tune_baselib + '/' + \
> +            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
> +            '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
> +
> +        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
> +            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
> +
> +        if os.path.lexists(dest):
> +            os.unlink(dest)
> +        os.symlink(src, dest)
> +}




