Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TvrbF-0002Fk-5q
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:41:54 +0100
Received: by mail-la0-f49.google.com with SMTP id fk20so2733167lab.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 07:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=eNLuGLAjVs6PqD9fNDevmd7Bbs943jI3wnXhOPSWsd4=;
	b=yEKoUlCNG5dRq4EmMigP/ebp5HJa840VjUCuFI6kiuDqhttZWac1xeqK+bXv52UTrA
	FSww9xsmpJ+a3yzpVProZsfH5YCv3p5vxvA1euaB81SyHOM27ITZEhVAkyGLyRlY5NsW
	lVYBz1wq6/wZ4qzxCvXbvyQN/Lq6Pyb4pXWPA+NC2+fWg0qMKnDzBGdVMAva+BGIig12
	nhq1zEIGQM2PN6A+Qb2wR6LUWgRdDVFV5Yc8oGQ2VZRn58cHUbXpHMMWGcpLYYPBAkp9
	ZAbFRM/TPer8MSXiKOnn+f9gsADAyQ+K3sU/loyxWTlj0+yhwsuDONBx9ljsI0ozMa/P
	WlNQ==
MIME-Version: 1.0
X-Received: by 10.112.36.137 with SMTP id q9mr2434498lbj.42.1358436389897;
	Thu, 17 Jan 2013 07:26:29 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Thu, 17 Jan 2013 07:26:29 -0800 (PST)
In-Reply-To: <81a1810d4c60fe2648c4e34d64c63ced7e0a7296.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
	<81a1810d4c60fe2648c4e34d64c63ced7e0a7296.1358432402.git.laurentiu.palcu@intel.com>
Date: Thu, 17 Jan 2013 10:26:29 -0500
Message-ID: <CADkTA4PZem1HgYWwot4AohkuJp2wO+bqfgL+3EwOs4+m-SiwHg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] kernel.bbclass: remove references to update-modules
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
X-List-Received-Date: Thu, 17 Jan 2013 15:41:57 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe351878485004d37d9e35

--e0cb4efe351878485004d37d9e35
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 17, 2013 at 9:58 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> Since update-modules is now obsolete, remove it from the bbclass.
>
>
This seems to capture all the concerns that I had about removing
update-modules.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>


> [YOCTO #3598]
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/kernel.bbclass |   36 +++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 46ba55f..4893cf2 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base module_strip
>
>  PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native
> virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> +DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native
> virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}"
>
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS = "1"
> @@ -293,12 +293,17 @@ fi
>  pkg_postinst_modules () {
>  if [ -z "$D" ]; then
>         depmod -a ${KERNEL_VERSION}
> -       update-modules || true
> +else
> +       depmod -a -b $D -F
> ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>  fi
>  }
>
>  pkg_postrm_modules () {
> -update-modules || true
> +if [ -z "$D" ]; then
> +       depmod -a ${KERNEL_VERSION}
> +else
> +       depmod -a -b $D -F
> ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
> +fi
>  }
>
>  autoload_postinst_fragment() {
> @@ -403,12 +408,10 @@ python populate_packages_prepend () {
>
>          dvar = d.getVar('PKGD', True)
>
> -        use_update_modules = oe.utils.contains('DISTRO_FEATURES',
> 'update-modules', True, False, d)
> -
>          # If autoloading is requested, output
> /etc/modules-load.d/<name>.conf and append
>          # appropriate modprobe commands to the postinst
>          autoload = d.getVar('module_autoload_%s' % basename, True)
> -        if autoload and use_update_modules:
> +        if autoload:
>              name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
>              f = open(name, 'w')
>              for m in autoload.split():
> @@ -422,16 +425,15 @@ python populate_packages_prepend () {
>
>          # Write out any modconf fragment
>          modconf = d.getVar('module_conf_%s' % basename, True)
> -        if modconf and use_update_modules:
> +        if modconf:
>              name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
>              f = open(name, 'w')
>              f.write("%s\n" % modconf)
>              f.close()
>
> -        if use_update_modules:
> -            files = d.getVar('FILES_%s' % pkg, True)
> -            files = "%s /etc/modules-load.d/%s.conf
> /etc/modprobe.d/%s.conf" % (files, basename, basename)
> -            d.setVar('FILES_%s' % pkg, files)
> +        files = d.getVar('FILES_%s' % pkg, True)
> +        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf"
> % (files, basename, basename)
> +        d.setVar('FILES_%s' % pkg, files)
>
>          if vals.has_key("description"):
>              old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
> @@ -447,17 +449,13 @@ python populate_packages_prepend () {
>      module_regex = '^(.*)\.k?o$'
>      module_pattern = 'kernel-module-%s'
>
> -    use_update_modules = oe.utils.contains('DISTRO_FEATURES',
> 'update-modules', True, False, d)
> -    if use_update_modules:
> -        postinst = d.getVar('pkg_postinst_modules', True)
> -        postrm = d.getVar('pkg_postrm_modules', True)
> -    else:
> -        postinst = None
> -        postrm = None
> +    postinst = d.getVar('pkg_postinst_modules', True)
> +    postrm = d.getVar('pkg_postrm_modules', True)
> +
>      do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$',
> output_pattern='kernel-firmware-%s', description='Firmware for %s',
> recursive=True, extra_depends='')
>      do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$',
> output_pattern='kernel-firmware-%s', description='Firmware for %s',
> recursive=True, extra_depends='')
>      do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$',
> output_pattern='kernel-firmware-%s', description='Firmware for %s',
> recursive=True, extra_depends='')
> -    do_split_packages(d, root='/lib/modules', file_regex=module_regex,
> output_pattern=module_pattern, description='%s kernel module',
> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
> extra_depends='%skernel-%s' % (['', 'update-modules '][use_update_modules],
> d.getVar("KERNEL_VERSION", True)))
> +    do_split_packages(d, root='/lib/modules', file_regex=module_regex,
> output_pattern=module_pattern, description='%s kernel module',
> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
> extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
>
>      # If modules-load.d and modprobe.d are empty at this point, remove
> them to
>      # avoid warnings. removedirs only raises an OSError if an empty
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efe351878485004d37d9e35
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 17, 2013 at 9:58 AM, Laurentiu Palcu <span dir=3D"ltr">=
&lt;<a href=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurenti=
u.palcu@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Since update-modules is now obsolete, remove=
 it from the bbclass.<br>
<br></blockquote><div><br></div><div style>This seems to capture all the co=
ncerns that I had about removing update-modules.</div><div style><br></div>=
<div style>Acked-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@wi=
ndriver.com">bruce.ashfield@windriver.com</a>&gt;</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
[YOCTO #3598]<br>
<br>
Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel.=
com">laurentiu.palcu@intel.com</a>&gt;<br>
---<br>
=A0meta/classes/kernel.bbclass | =A0 36 +++++++++++++++++------------------=
-<br>
=A01 file changed, 17 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 46ba55f..4893cf2 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -1,7 +1,7 @@<br>
=A0inherit linux-kernel-base module_strip<br>
<br>
=A0PROVIDES +=3D &quot;virtual/kernel&quot;<br>
-DEPENDS +=3D &quot;virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGE=
T_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules&quot;<br>
+DEPENDS +=3D &quot;virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGE=
T_PREFIX}gcc${KERNEL_CCSUFFIX}&quot;<br>
<br>
=A0# we include gcc above, we dont need virtual/libc<br>
=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
@@ -293,12 +293,17 @@ fi<br>
=A0pkg_postinst_modules () {<br>
=A0if [ -z &quot;$D&quot; ]; then<br>
=A0 =A0 =A0 =A0 depmod -a ${KERNEL_VERSION}<br>
- =A0 =A0 =A0 update-modules || true<br>
+else<br>
+ =A0 =A0 =A0 depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_=
VERSION} ${KERNEL_VERSION}<br>
=A0fi<br>
=A0}<br>
<br>
=A0pkg_postrm_modules () {<br>
-update-modules || true<br>
+if [ -z &quot;$D&quot; ]; then<br>
+ =A0 =A0 =A0 depmod -a ${KERNEL_VERSION}<br>
+else<br>
+ =A0 =A0 =A0 depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_=
VERSION} ${KERNEL_VERSION}<br>
+fi<br>
=A0}<br>
<br>
=A0autoload_postinst_fragment() {<br>
@@ -403,12 +408,10 @@ python populate_packages_prepend () {<br>
<br>
=A0 =A0 =A0 =A0 =A0dvar =3D d.getVar(&#39;PKGD&#39;, True)<br>
<br>
- =A0 =A0 =A0 =A0use_update_modules =3D oe.utils.contains(&#39;DISTRO_FEATU=
RES&#39;, &#39;update-modules&#39;, True, False, d)<br>
-<br>
=A0 =A0 =A0 =A0 =A0# If autoloading is requested, output /etc/modules-load.=
d/&lt;name&gt;.conf and append<br>
=A0 =A0 =A0 =A0 =A0# appropriate modprobe commands to the postinst<br>
=A0 =A0 =A0 =A0 =A0autoload =3D d.getVar(&#39;module_autoload_%s&#39; % bas=
ename, True)<br>
- =A0 =A0 =A0 =A0if autoload and use_update_modules:<br>
+ =A0 =A0 =A0 =A0if autoload:<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0name =3D &#39;%s/etc/modules-load.d/%s.conf&#39;=
 % (dvar, basename)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0f =3D open(name, &#39;w&#39;)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0for m in autoload.split():<br>
@@ -422,16 +425,15 @@ python populate_packages_prepend () {<br>
<br>
=A0 =A0 =A0 =A0 =A0# Write out any modconf fragment<br>
=A0 =A0 =A0 =A0 =A0modconf =3D d.getVar(&#39;module_conf_%s&#39; % basename=
, True)<br>
- =A0 =A0 =A0 =A0if modconf and use_update_modules:<br>
+ =A0 =A0 =A0 =A0if modconf:<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0name =3D &#39;%s/etc/modprobe.d/%s.conf&#39; % (=
dvar, basename)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0f =3D open(name, &#39;w&#39;)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0f.write(&quot;%s\n&quot; % modconf)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0f.close()<br>
<br>
- =A0 =A0 =A0 =A0if use_update_modules:<br>
- =A0 =A0 =A0 =A0 =A0 =A0files =3D d.getVar(&#39;FILES_%s&#39; % pkg, True)=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0files =3D &quot;%s /etc/modules-load.d/%s.conf /et=
c/modprobe.d/%s.conf&quot; % (files, basename, basename)<br>
- =A0 =A0 =A0 =A0 =A0 =A0d.setVar(&#39;FILES_%s&#39; % pkg, files)<br>
+ =A0 =A0 =A0 =A0files =3D d.getVar(&#39;FILES_%s&#39; % pkg, True)<br>
+ =A0 =A0 =A0 =A0files =3D &quot;%s /etc/modules-load.d/%s.conf /etc/modpro=
be.d/%s.conf&quot; % (files, basename, basename)<br>
+ =A0 =A0 =A0 =A0d.setVar(&#39;FILES_%s&#39; % pkg, files)<br>
<br>
=A0 =A0 =A0 =A0 =A0if vals.has_key(&quot;description&quot;):<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0old_desc =3D d.getVar(&#39;DESCRIPTION_&#39; + p=
kg, True) or &quot;&quot;<br>
@@ -447,17 +449,13 @@ python populate_packages_prepend () {<br>
=A0 =A0 =A0module_regex =3D &#39;^(.*)\.k?o$&#39;<br>
=A0 =A0 =A0module_pattern =3D &#39;kernel-module-%s&#39;<br>
<br>
- =A0 =A0use_update_modules =3D oe.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;update-modules&#39;, True, False, d)<br>
- =A0 =A0if use_update_modules:<br>
- =A0 =A0 =A0 =A0postinst =3D d.getVar(&#39;pkg_postinst_modules&#39;, True=
)<br>
- =A0 =A0 =A0 =A0postrm =3D d.getVar(&#39;pkg_postrm_modules&#39;, True)<br=
>
- =A0 =A0else:<br>
- =A0 =A0 =A0 =A0postinst =3D None<br>
- =A0 =A0 =A0 =A0postrm =3D None<br>
+ =A0 =A0postinst =3D d.getVar(&#39;pkg_postinst_modules&#39;, True)<br>
+ =A0 =A0postrm =3D d.getVar(&#39;pkg_postrm_modules&#39;, True)<br>
+<br>
=A0 =A0 =A0do_split_packages(d, root=3D&#39;/lib/firmware&#39;, file_regex=
=3D&#39;^(.*)\.bin$&#39;, output_pattern=3D&#39;kernel-firmware-%s&#39;, de=
scription=3D&#39;Firmware for %s&#39;, recursive=3DTrue, extra_depends=3D&#=
39;&#39;)<br>
=A0 =A0 =A0do_split_packages(d, root=3D&#39;/lib/firmware&#39;, file_regex=
=3D&#39;^(.*)\.fw$&#39;, output_pattern=3D&#39;kernel-firmware-%s&#39;, des=
cription=3D&#39;Firmware for %s&#39;, recursive=3DTrue, extra_depends=3D&#3=
9;&#39;)<br>
=A0 =A0 =A0do_split_packages(d, root=3D&#39;/lib/firmware&#39;, file_regex=
=3D&#39;^(.*)\.cis$&#39;, output_pattern=3D&#39;kernel-firmware-%s&#39;, de=
scription=3D&#39;Firmware for %s&#39;, recursive=3DTrue, extra_depends=3D&#=
39;&#39;)<br>
- =A0 =A0do_split_packages(d, root=3D&#39;/lib/modules&#39;, file_regex=3Dm=
odule_regex, output_pattern=3Dmodule_pattern, description=3D&#39;%s kernel =
module&#39;, postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=
=3Dfrob_metadata, extra_depends=3D&#39;%skernel-%s&#39; % ([&#39;&#39;, &#3=
9;update-modules &#39;][use_update_modules], d.getVar(&quot;KERNEL_VERSION&=
quot;, True)))<br>

+ =A0 =A0do_split_packages(d, root=3D&#39;/lib/modules&#39;, file_regex=3Dm=
odule_regex, output_pattern=3Dmodule_pattern, description=3D&#39;%s kernel =
module&#39;, postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=
=3Dfrob_metadata, extra_depends=3D&#39;kernel-%s&#39; % (d.getVar(&quot;KER=
NEL_VERSION&quot;, True)))<br>

<br>
=A0 =A0 =A0# If modules-load.d and modprobe.d are empty at this point, remo=
ve them to<br>
=A0 =A0 =A0# avoid warnings. removedirs only raises an OSError if an empty<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div></div>

--e0cb4efe351878485004d37d9e35--
