Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5751A615F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:33:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r858kN5Q031500; Thu, 5 Sep 2013 09:46:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Bf-I6O1nNv8Q; Thu,  5 Sep 2013 09:46:22 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r858kFvG031489
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 09:46:17 +0100
Message-ID: <1378369981.32427.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nitin.a.kamble@intel.com, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Sep 2013 09:33:01 +0100
In-Reply-To: <2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
References: <cover.1378361078.git.nitin.a.kamble@intel.com>
	<2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: meta-intel@yoctoproject.org, saul.wold@intel.com, darren.hart@intel.com
Subject: Re: [Patch-v2 1/1] mesa: avoid unnecessary rerunning of tasks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 08:33:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 06:15 +0000, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> When this recipe is rebuilt for a different machine with same arch,
> then the previous change to EXTRA_OECONF was causing rerun of
> all the tasks starting from do_configure.
> 
> This commit avoids this behavior, needing only rerun of the
> do_populate_sysroot task. This is achieved by letting the mesa
> recipe build the GL components provided by the emgd-driver-bin
> recipe, but avoid these conflicting files getting populated in
> the machine specific sysroot.
> 
> Fixes bug:
> [YOCTO #5120]
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  common/recipes-graphics/mesa/mesa_9.1.6.bbappend | 69 +++++++++++++++++-------
>  1 file changed, 49 insertions(+), 20 deletions(-)
> 
> diff --git a/common/recipes-graphics/mesa/mesa_9.1.6.bbappend b/common/recipes-graphics/mesa/mesa_9.1.6.bbappend
> index b92831d..8024f0f 100644
> --- a/common/recipes-graphics/mesa/mesa_9.1.6.bbappend
> +++ b/common/recipes-graphics/mesa/mesa_9.1.6.bbappend
> @@ -1,24 +1,53 @@
> -
>  # The emgd binary driver also provides egl, gles1, gles2 library & headers.
> -# To avoid conflict disable egl, gles1, gles2 from meta-dri if the BSP image
> -# is bundling the emgd driver.
> +# To avoid conflict do not populate sysroot with  egl, gles1, gles2 files
> +# from mesa recipe if the BSP image is bundling the emgd driver.
> +
> +EXCLUDE_FROM_STAGING="${libdir}/libGLESv2.so.2 \
> +                             ${libdir}/libEGL.so.1 \
> +                             ${libdir}/libGLESv2.so \
> +                             ${libdir}/libEGL.so \
> +                             ${libdir}/pkgconfig/egl.pc \
> +                             ${libdir}/pkgconfig/glesv2.pc \
> +                             ${includedir}/KHR/khrplatform.h \
> +                             ${includedir}/GLES/glext.h \
> +                             ${includedir}/GLES/glplatform.h \
> +                             ${includedir}/GLES/gl.h \
> +                             ${includedir}/EGL/eglext.h \
> +                             ${includedir}/EGL/eglplatform.h \
> +                             ${includedir}/EGL/egl.h \
> +                             ${includedir}/GLES2/gl2.h \
> +                             ${includedir}/GLES2/gl2platform.h \
> +                             ${includedir}/GLES2/gl2ext.h \
> +                             "
> +
> +# override the function from the staging.bbclass
> +# An exclude list is conveyed to the tar
> +sysroot_stage_dir () {
> +        src="$1"
> +        dest="$2"
> +        # if the src doesn't exist don't do anything
> +        if [ ! -d "$src" ]; then
> +                 return
> +        fi
>  
> -python __anonymous () {
> -    import re
> -    xserver = d.getVar('XSERVER', True)
> -    if xserver and 'emgd-driver-bin' in xserver.split(' '):
> -        extra_oeconf = d.getVar('EXTRA_OECONF', True).split()
> -        take_out = ["--enable-egl", "--enable-gles1", "--enable-gles2"]
> -        put_in = ["--disable-egl", "--disable-gles1", "--disable-gles2"]
> -        pattern = re.compile("--with-egl-platforms")
> -        new_extra_oeconf = [ ]
> -        for i in extra_oeconf:
> -            if ( i not in take_out ) and ( not pattern.match(i)):
> -                new_extra_oeconf.append(i)
> -        for i in put_in:
> -            new_extra_oeconf.append(i)
> +        # We only want to stage the contents of $src if it's non-empty so first rmdir $src
> +        # then if it still exists (rmdir on non-empty dir fails) we can copy its contents
> +        rmdir "$src" 2> /dev/null || true
> +        # However we always want to stage a $src itself, even if it's empty
> +        mkdir -p "$dest"
> +
> +        if [ -d "$src" ]; then
> +                tar -X ${T}/exclude_from_staging -cf - -C "$src" -ps . | tar -xf - -C "$dest"
> +        fi
> +}
>  
> -        d.setVar('EXTRA_OECONF', ' '.join(new_extra_oeconf))
> -        depends = d.getVar('DEPENDS', True)
> -        d.setVar('DEPENDS', depends + " emgd-driver-bin")
> +# here the exclude list for tar is prepared
> +sysroot_stage_all_prepend() {
> +        truncate --size 0 ${T}/exclude_from_staging
> +        if [[ "${XSERVER}" =~ "emgd-driver-bin" ]]; then
> +                for i in ${EXCLUDE_FROM_STAGING}
> +                do
> +                        echo ${D}${i} >> ${T}/exclude_from_staging
> +                done
> +        fi
>  }

This is certainly better and is heading in the right direction. The two
issues I can see are:

a) do_populate_sysroot still needs to run again
b) do_packagedata installs pkgdata (shlibs) which says mesa provides 
   some of these libs yet is no shouldn't for the given MACHINE.

I did think this shouldn't be too difficult to fix however life is never
quite straightforward.

For a), rather than change things before we create the sstate package, I
was thinking we could change than at installation of the sstate package.
We have SSTATEPOSTINSTFUNCS however these run after we have placed the
files in the sysroot so its too late. SSTATEPREINSTFUNCS sounds better
but this actually runs before unpacking the sstate files which is too
early for us.

There is only one user of SSTATEPREINSTFUNCS (useradd.bbclass) so I'm
going to propose we rename that one to a more logical
SSTATEPREUNPACKFUNCS and add PREINSTFUNCS at a more sensible place. We
can then add a SSTATEPREINSTFUNCS to the mesa recipe which for
do_populate_sysroot and do_populate_sysroot_setscene deletes the files
in question. That should resolve a).

b) is more tricky since pkgdata is arch specific, not machine specific.
I had thought it was machine specific but checking now, its not.

To be quite honest, I don't like what pkgdata does at the moment. We
have cleaned things up a lot compared to where they used to be but the
search process the system uses to find information is truly horrid.

It would be rather tempting to decide to install pkgdata in a machine
specific directory much like we do with populate_sysroot already. There
would be minimal performance overhead since the files are small and we
could then bin all the "search all, then arch, then machine" type lookup
code we have right now. If we did make it machine specific, we could
then use the same trick we use in a) but for do_packagedata and instead
of removing files, it would run some carefully crafted sed operations.

Right now, we might not need to fix this 100% properly. If emgd installs
itself as machine specific, it should be first in the providers search
paths so the second lot of pkgdata should get ignored. emgd is of course
not machine specific at the moment, nor should it be apart from this
issue :/.

This also raises some other questions. The existing code in meta-intel
adds EMGD into the DEPENDS. It does this so the normal PROVIDES for
virtual/libgl and friends don't have to change. It does mean the sstate
checksums for anything depending on mesa change however. If we don't
have the dependency, things may try and build before emgd is built,
libGL would be missing and things would break.

So somehow we need to add in the dependency let leave the sstate
checksums unchanged. This is possible in the sstate checksum validation
code but its probably easiest to change that in the core, not
meta-intel :/.

I'd also appreciate someone (Ross maybe?) confirming that if we build
application A against mesa, then change over to a machine that uses emgd
and swizzle the libs around in the sysroot, do we need to recompile the
app? This approach is assuming we do not need to do that. If we do,
there is a different approach we need to take.

So in summary, this problem is far from simple, we do have most of the
pieces we need to fix it with some tweaking but some of the changes are
invasive and might need to be deferred to 1.6. As it stands, the change
will cause issues due to the changed DEPENDS. We do need to think
carefully about this and solve it once and for all in a way which works
optimally but the existing workaround might be best until we can pull
all the better pieces together.

I hope this was a relatively clear explanation of the problem, let me
know if I need to clarify anything. I've cc'd OE-Core since I think more
people probably need to see/think about this.

Cheers,

Richard






