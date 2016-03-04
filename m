Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id CC37560721
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 17:23:23 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id ir4so5426378igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 09:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H4VAT4ugf/asA7aLcPyKXSC8I2S4OIh0/RxgSFjHjnU=;
	b=o2zix97qET8KrrvWIiFqou5TTUgUFGzLrJHL4uk7IJA2qVNLi2uJu/VbSW1HWIlDpJ
	mUtf7p/a02S7H4ePCTeWAWucMfspa5SzMDw3YeeHFc7+ImtIzQZxVhgdMINdP9ZfDvof
	iKC1lqu8gtm0rQ/l6vrpeXSerds3XdIo9199lW33LbX8SEi1tBd9jyFtazoF+RPdUI0k
	mHd5ASKSKrayRkAnyGb5zUfBbd/9sqBJ5muxaD9K/x5ftRCaT9873PlcO/SWlCJ86Aw/
	+o8WbeYSm2hDarDwzmD7S9Nph5MmyoepivRe9teE+Ylv6eGb/nsahdIaON3N+C+X/M6l
	dEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H4VAT4ugf/asA7aLcPyKXSC8I2S4OIh0/RxgSFjHjnU=;
	b=YOjPXCEs6SNKVtHIVrkDsjEz2OUe+toLUEFdzktH87ZNS0OLduQK/UCFbJN8BRdHek
	kjM48XsSqaNmRWHxjpvKztMjyC199r6v8mVOdC/NRRB2RPNvYBAoRl66a0/ggDrd7kmV
	LLmp5g7E9fBwyC17SPtj+uVnJqQi3clMg7796OQkrrmpORjQSQ03GGI34GnZsxSH4r4b
	ufuIPt7JEHr+WJb3uxXGjtBcnd5bh+BLh8M2BJj3JfakrOSX48D/bx/mk0PfIbeD3QyQ
	2PYBgm9vUkkDUIgZrpEiMuW2T2BI2Yh5csMQhSY3aUzz20QWwaKJ39q9L7xIjBWNEGB1
	cOpQ==
X-Gm-Message-State: AD7BkJKrU7mtJmB+iAtmSDbPsAEs+ruoA7Tp932kvZ3zu6HLQmT7G+wYOfJJqse3t0+kCyabBs/xP7pvRLgm3A==
X-Received: by 10.50.221.75 with SMTP id qc11mr11254igc.87.1457112204426; Fri,
	04 Mar 2016 09:23:24 -0800 (PST)
MIME-Version: 1.0
References: <1443533265.5162.35.camel@linuxfoundation.org>
	<919610E7-93B7-41EF-ADC7-8C6A179C9950@gmail.com>
In-Reply-To: <919610E7-93B7-41EF-ADC7-8C6A179C9950@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 04 Mar 2016 17:23:14 +0000
Message-ID: <CABcZANmn149p+4tas5nxwuLoXa2AwbHgJutk41EO8u2Y0nLi9w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linuxloader/image-prelink/image-mklibs: Fix non-standard path prelinking
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
X-List-Received-Date: Fri, 04 Mar 2016 17:23:27 -0000
Content-Type: multipart/alternative; boundary=001a11344f4057c48d052d3c5f09

--001a11344f4057c48d052d3c5f09
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 29, 2015 at 10:09 AM Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Sep 29, 2015, at 6:27 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> >
> > Prelinking on x86-64 wasn't working out the box as it uses /lib and
> > not /lib64 for libs. Prelink was refusing to link as the dynamic loader
> > didn't match its idea of the right path. Passing in the --dyanmic-linker
> > option avoids this.
> >
> > We can share code from image-mklibs so abstract that into a new class,
> > linuxloader.bbclass.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > diff --git a/meta/classes/image-mklibs.bbclass
> b/meta/classes/image-mklibs.bbclass
> > index c455a8e..45a66fb 100644
> > --- a/meta/classes/image-mklibs.bbclass
> > +++ b/meta/classes/image-mklibs.bbclass
> > @@ -2,6 +2,8 @@ do_rootfs[depends] += "mklibs-native:do_populate_sysroot"
> >
> > IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
> >
> > +inherit linuxloader
> > +
> > mklibs_optimize_image_doit() {
> >       rm -rf ${WORKDIR}/mklibs
> >       mkdir -p ${WORKDIR}/mklibs/dest
> > @@ -15,26 +17,8 @@ mklibs_optimize_image_doit() {
> >               | sed "s+^\./++" \
> >               > ${WORKDIR}/mklibs/executables.list
> >
> > -     case ${TARGET_ARCH} in
> > -             powerpc | mips | mipsel | microblaze )
> > -                     dynamic_loader="${base_libdir}/ld.so.1"
> > -                     ;;
> > -             powerpc64)
> > -                     dynamic_loader="${base_libdir}/ld64.so.1"
> > -                     ;;
> > -             x86_64)
> > -
>  dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
> > -                     ;;
> > -             i586 )
> > -                     dynamic_loader="${base_libdir}/ld-linux.so.2"
> > -                     ;;
> > -             arm )
> > -                     dynamic_loader="${base_libdir}/ld-linux.so.3"
> > -                     ;;
> > -             * )
> > -                     dynamic_loader="/unknown_dynamic_linker"
> > -                     ;;
> > -     esac
> > +     # Set $dynamic_loader
> > +        linuxloader
> >
> >       mklibs -v \
> >               --ldlib ${dynamic_loader} \
> > diff --git a/meta/classes/image-prelink.bbclass
> b/meta/classes/image-prelink.bbclass
> > index d4bb3ae..4bb090d 100644
> > --- a/meta/classes/image-prelink.bbclass
> > +++ b/meta/classes/image-prelink.bbclass
> > @@ -2,6 +2,8 @@ do_rootfs[depends] +=
> "prelink-native:do_populate_sysroot"
> >
> > IMAGE_PREPROCESS_COMMAND += "prelink_image; "
> >
> > +inherit linuxloader
> > +
> > prelink_image () {
> > #     export PSEUDO_DEBUG=4
> > #     /bin/env | /bin/grep PSEUDO
> > @@ -20,8 +22,11 @@ prelink_image () {
> >               dummy_prelink_conf=false;
> >       fi
> >
> > +     # Set $dynamic_loader
> > +     linuxloader
> > +
> >       # prelink!
> > -     ${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root
> ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
> > +     ${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root
> ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker
> $dynamic_loader
> >
> >       # Remove the prelink.conf if we had to add it.
> >       if [ "$dummy_prelink_conf" = "true" ]; then
> > diff --git a/meta/classes/linuxloader.bbclass
> b/meta/classes/linuxloader.bbclass
> > new file mode 100644
> > index 0000000..578df14
> > --- /dev/null
> > +++ b/meta/classes/linuxloader.bbclass
> > @@ -0,0 +1,23 @@
> > +
> > +linuxloader () {
> > +     case ${TARGET_ARCH} in
> > +             powerpc | mips | mipsel | microblaze )
> > +                     dynamic_loader="${base_libdir}/ld.so.1"
> > +                     ;;
> > +             powerpc64)
> > +                     dynamic_loader="${base_libdir}/ld64.so.1"
> > +                     ;;
> > +             x86_64)
> > +
>  dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
> > +                     ;;
> > +             i586 )
> > +                     dynamic_loader="${base_libdir}/ld-linux.so.2"
> > +                     ;;
> > +             arm )
> > +                     dynamic_loader="${base_libdir}/ld-linux.so.3"
> > +                     ;;
> > +             * )
> > +                     dynamic_loader="/unknown_dynamic_linker"
> > +                     ;;
> > +     esac
> > +}
> >
> >
>
> For readability it would have been nice if it was returning the value from
> function so it could be used
>
> myloader = call this function
>

Agreed, I was just thinking this could be used for UNINATIVE_LOADER in
uninative.bbclass.

--001a11344f4057c48d052d3c5f09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Sep 29, 2015 at 10:09 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
&gt; On Sep 29, 2015, at 6:27 AM, Richard Purdie &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Prelinking on x86-64 wasn&#39;t working out the box as it uses /lib an=
d<br>
&gt; not /lib64 for libs. Prelink was refusing to link as the dynamic loade=
r<br>
&gt; didn&#39;t match its idea of the right path. Passing in the --dyanmic-=
linker<br>
&gt; option avoids this.<br>
&gt;<br>
&gt; We can share code from image-mklibs so abstract that into a new class,=
<br>
&gt; linuxloader.bbclass.<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt;<br>
&gt; diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mk=
libs.bbclass<br>
&gt; index c455a8e..45a66fb 100644<br>
&gt; --- a/meta/classes/image-mklibs.bbclass<br>
&gt; +++ b/meta/classes/image-mklibs.bbclass<br>
&gt; @@ -2,6 +2,8 @@ do_rootfs[depends] +=3D &quot;mklibs-native:do_populat=
e_sysroot&quot;<br>
&gt;<br>
&gt; IMAGE_PREPROCESS_COMMAND +=3D &quot;mklibs_optimize_image; &quot;<br>
&gt;<br>
&gt; +inherit linuxloader<br>
&gt; +<br>
&gt; mklibs_optimize_image_doit() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${WORKDIR}/mklibs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/mklibs/dest<br>
&gt; @@ -15,26 +17,8 @@ mklibs_optimize_image_doit() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| sed &quot;s+^\=
./++&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ${WORKDIR}/=
mklibs/executables.list<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case ${TARGET_ARCH} in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc | mips | mips=
el | microblaze )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld.so.1&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc64)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld64.so.1&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux-x86-64.so.2&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i586 )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.2&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.3&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;/unknown_dynamic_linker&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Set $dynamic_loader<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxloader<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mklibs -v \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--ldlib ${dynami=
c_loader} \<br>
&gt; diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-p=
relink.bbclass<br>
&gt; index d4bb3ae..4bb090d 100644<br>
&gt; --- a/meta/classes/image-prelink.bbclass<br>
&gt; +++ b/meta/classes/image-prelink.bbclass<br>
&gt; @@ -2,6 +2,8 @@ do_rootfs[depends] +=3D &quot;prelink-native:do_popula=
te_sysroot&quot;<br>
&gt;<br>
&gt; IMAGE_PREPROCESS_COMMAND +=3D &quot;prelink_image; &quot;<br>
&gt;<br>
&gt; +inherit linuxloader<br>
&gt; +<br>
&gt; prelink_image () {<br>
&gt; #=C2=A0 =C2=A0 =C2=A0export PSEUDO_DEBUG=3D4<br>
&gt; #=C2=A0 =C2=A0 =C2=A0/bin/env | /bin/grep PSEUDO<br>
&gt; @@ -20,8 +22,11 @@ prelink_image () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_prelink_co=
nf=3Dfalse;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Set $dynamic_loader<br>
&gt; +=C2=A0 =C2=A0 =C2=A0linuxloader<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# prelink!<br>
&gt; -=C2=A0 =C2=A0 =C2=A0${STAGING_DIR_NATIVE}${sbindir_native}/prelink --=
root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0${STAGING_DIR_NATIVE}${sbindir_native}/prelink --=
root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker=
 $dynamic_loader<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove the prelink.conf if we had to add i=
t.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$dummy_prelink_conf&quot; =3D &qu=
ot;true&quot; ]; then<br>
&gt; diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxload=
er.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 0000000..578df14<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes/linuxloader.bbclass<br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +<br>
&gt; +linuxloader () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case ${TARGET_ARCH} in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc | mips | mips=
el | microblaze )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld.so.1&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld64.so.1&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux-x86-64.so.2&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i586 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.2&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.3&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dynamic_loader=3D&quot;/unknown_dynamic_linker&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +}<br>
&gt;<br>
&gt;<br>
<br>
For readability it would have been nice if it was returning the value from =
function so it could be used<br>
<br>
myloader =3D call this function<br></blockquote><div><br></div><div>Agreed,=
 I was just thinking this could be used for UNINATIVE_LOADER in uninative.b=
bclass.</div></div></div>

--001a11344f4057c48d052d3c5f09--
