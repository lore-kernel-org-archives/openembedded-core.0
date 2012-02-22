Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0CGN-0000h6-Jw for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 14:29:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MDLOu3028366
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:21:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27859-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:21:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MDLFwP028360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:21:16 GMT
Message-ID: <1329916874.20261.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 13:21:14 +0000
In-Reply-To: <e63f62b491b637aa4d97174fb7a0682fff6a872b.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
	<e63f62b491b637aa4d97174fb7a0682fff6a872b.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 08/10] target gcc: gcc-multilib-setup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2012 13:29:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Nitin,

This is a good start but I think this still needs a little bit of work.
I'm particularly concerned it appears necessary to rewrite all the tune
files to make this work, we shouldn't need to do that.

I've given this some thought and explained how I think we can avoid this
and some other issues below.

On Tue, 2012-02-21 at 22:37 -0800, nitin.a.kamble@intel.com wrote:
> +python do_gcc_multilib_setup() {
> +	import re
> +
> +	# do this only for target recipe
> + 	if d.getVar('PN', 1) != 'gcc':
> +		return

Please use ", True" instead of ", 1" in all new code.

> + 	srcdir = d.getVar('S', 1) or ''
> +
> + 	multilibs = d.getVar('MULTILIB_VARIANTS', 1) or ''
> + 	if multilibs == '':
> +		return

Even in the non multilib case, we still need to alter the configuration
to match whatever library layout is being used (the values of
base_libdir and libdir) as the 64bithack.patch does now.


> +	gcc_target_config_files = { 	'x86_64'	: 'gcc/config/i386/t-linux64',
> +					'mips'		: 'gcc/config/mips/t-linux64' ,
> +					'ppc' 		: 'gcc/config/rs6000/t-linux64' }
> +
> +	gcc_header_config_files = { 	'x86_64'	: 'gcc/config/i386/linux64.h',
> +					'mips'		: 'gcc/config/mips/linux64.h' ,
> +					'ppc' 		: 'gcc/config/rs6000/linux64.h' }

What about building 64 bit as a multilib on an i586 system? This also
doesn't account for powerpc64.

For i586, we probably need to add the configure option
--enable_targets=all and then we can add i*86 to the above list also
pointing at gcc/config/i386/t-linux64. We'd need more investigation to
figure out what is needed for powerpc64.

> + 	target_arch = d.getVar('TARGET_ARCH', 1) or ''
> +
> +	if target_arch not in gcc_target_config_files:
> +		bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
> +		return
> +
> +	gcc_multilib_target_config_file = gcc_target_config_files[target_arch]
> +
> +	gcc_multilib_header_config_file = gcc_header_config_files[target_arch]
> +
> +	ml_list = ['DEFAULTTUNE']
> +	for ml in multilibs.split(' '):
> +		ml_list.append('DEFAULTTUNE_virtclass-multilib-' + ml)
> +
> +	tunes_32 = ['x86', 'core2', 'i586', 'mips', 'mipsel', 'mips-nf', 'mipsel-nf', 'powerpc', 'powerpc-nf']
> +	tunes_64 = ['x86-64', 'core2-64', 'mips64', 'mips64el', 'mips64-nf', 'mips64el-nf', 'powerpc64']
> +	tunes_x32 = ['x86-64-x32', 'core2-64-x32']
> +	tunes_n32 = ['mips64-n32', 'mips64el-n32', 'mips64-nf-n32', 'mips64el-nf-n32']

I'm afraid I strongly dislike lists of hardcoded values. How about
having the code below that uses this doing something like:

if ml_tune.find("-n32") != -1:
	libdirn32 = ml_baselib
elif ml_tune.find("-x32") != -1:
	libdirx32 = ml_baselib
elif ml_tune.find("64") != -1:
	libdir64 = ml_baselib
else:
	libdir32 = ml_baselib

?

This also reminds me that we have an open bug about sanity checking the
multilib configuration. This code would lend itself well to sanity
checking the multilib configuration, e.g. if any of the above variables
all get set to the same library location, that would be an error. I'm
starting to think we may need some library functions to handle this
better.

The sanity checks can be a secondary step and patch but it would be good
to start thinking about this now.

> +	libdir32 = 'SYSTEMLIBS_DIR'
> +	libdir64 = 'SYSTEMLIBS_DIR'
> +	libdirx32 = 'SYSTEMLIBS_DIR'
> +	libdirn32 = 'SYSTEMLIBS_DIR'
> +
> +	multilib_options = []
> +	multilib_dirnames = []
> +	multilib_osdirnames = []
> +
> +	for ml in ml_list:
> + 		ml_tune = d.getVar(ml, 1) or ''
> + 		ml_tune_features = d.getVar('TUNE_FEATURES_tune-' + ml_tune, 1) or ''
> + 		ml_baselib = d.getVar('BASE_LIB_tune-' + ml_tune, 1) or ''
> +
> +		if ml_tune in tunes_32:
> +			libdir32 = ml_baselib
> +		elif ml_tune in tunes_64:
> +			libdir64 = ml_baselib
> +		elif ml_tune in tunes_x32:
> +			libdirx32 = ml_baselib
> +		elif ml_tune in tunes_n32:
> +			libdirn32 = ml_baselib
> +
> +		ml_tune_ccargs_list = []
> +		for feature in ml_tune_features.split():
> + 			ml_feature_ccargs = d.getVar('TUNE_FEATURE_CCARGS-' + feature, 1) or ''
> +			ml_tune_ccargs_list.append(ml_feature_ccargs)
> +		ml_tune_ccargs = ' '.join(ml_tune_ccargs_list)


I'm guessing this piece is why you ended up changing all the tune files.
To access this (and other multilib information) you should be able to do
something like:


for ml in multilibs:
    localdata = bb.data.createCopy(d)
    override = ":virtclass-multilib-" + ml
    localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
    bb.data.update_data(localdata)

    tune_ccargs = localdata.getVar("TUNE_CCARGS", True)
    tune_features = localdata.getVar("TUNE_FEATURES", True)
    baselib = localdata.getVar("BASE_LIB", True)

and here tune_ccargs will get the value applied in each multilib along
with some other variables I noticed you were looking up.

Of course this doesn't get you just the TUNE_FEATURE piece of
tune_ccargs but it does remove the need to re-namespace all the
variables.

> +		# take out '-' in parameters
> +		multilib_options.append(re.sub(r'^\-+', '', re.sub(r' \-+',  ' ', ml_tune_ccargs)))
> +		if ml_baselib == 'lib':
> +			multilib_dirnames.append('32')
> +		else:
> +			multilib_dirnames.append(ml_baselib.replace('lib', ''))
> +		multilib_osdirnames.append('../' + ml_baselib)
> +	
> +	with open(srcdir + '/' + gcc_multilib_target_config_file, 'r') as f:
> +		filelines = f.read()
> +		f.close()
> +
> +		# recreate multilib configuration variables
> +
> +		filelines = re.sub(r'^\s*MULTILIB_OPTIONS\s*=.*$',
> +			'MULTILIB_OPTIONS = ' + '/'.join(multilib_options),
> +			filelines, flags=re.MULTILINE)
> +
> +		filelines = re.sub(r'^\s*MULTILIB_DIRNAMES\s*=.*$',
> +			'MULTILIB_DIRNAMES = ' + ' '.join(multilib_dirnames),
> +			filelines, flags=re.MULTILINE)
> +
> +		filelines = re.sub(r'^\s*MULTILIB_OSDIRNAMES\s*=.*$',
> +			'MULTILIB_OSDIRNAMES = ' + ' '.join(multilib_osdirnames),
> +			filelines, flags=re.MULTILINE)
> +	
> +	with open(srcdir + '/' + gcc_multilib_target_config_file, 'w') as f:
> +		f.write(filelines)
> +		f.close()
> +
> +	with open(srcdir + '/' + gcc_multilib_header_config_file, 'r') as f:
> +		filelines = f.read()
> +		f.close()
> +
> +		# replace lines like
> +		# #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> +		# by
> +		# #define GLIBC_DYNAMIC_LINKER32 "/lib/" "ld-linux.so.2"
> +		# this is needed to put the correct dynamic loader path in the generated binaries
> +
> +		filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKER32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
> +			r'\1"/' + libdir32 + r'/"\3',
> +			filelines, flags=re.MULTILINE)
> +
> +		filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
> +			r'\1"/' + libdir64 + r'/"\3',
> +			filelines, flags=re.MULTILINE)
> +
> +		filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKERX32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
> +			r'\1"/' + libdirx32 + r'/"\3',
> +			filelines, flags=re.MULTILINE)
> +
> +		filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
> +			r'\1"/' + libdirn32 + r'/"\3',
> +			filelines, flags=re.MULTILINE)
> +
> +		with open(srcdir + '/' + gcc_multilib_header_config_file, 'w') as f:
> +			f.write(filelines)
> +			f.close()

I'm slightly puzzled why this last open/clode is indented differently to
the first set above. I'm also wondering why you don't do all of this in
one pass over the file and instead use two?

Cheers,

Richard




