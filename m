Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A1EC77B7C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 05:09:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.1862.1685077746146316566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 22:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=K+8ONpNn;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f601c57d8dso2985145e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 22:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685077744; x=1687669744;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H9LiTdpnqt17sZ30WvfzLwkO2Ag5VEKbFcOIUlOwXOM=;
        b=K+8ONpNnwVC+H8igsWgrgkDtV91Doxk1aUVRZ1aO8zRmGrldlQ4OcZK+b16h5pvoJK
         pYd1E4o2e10685BvGdlDGNIOEptDS8EVsaxDazd2By6sYGMzCAyGbCQM6Dml4aA3qchB
         n6Ei1azdZGtLqyBXowupZHfP8gQdkZ0Ckj/cJB/rK7Mvi5vpnAryXSV0gF93Jmb/AenB
         DPYlp15EPFwfwDcQONdFzyz9i8/BS3XZhIdg6f1mYyXC5mCagXNVv3VyIsVL7hW7TXzR
         ZfPWdqpWPxz369ufMg+6tUlicZw7I2KpXcKHEkZ9JZV9CVZ3d/seAPbbP3suuxT+DmlL
         a+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685077744; x=1687669744;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9LiTdpnqt17sZ30WvfzLwkO2Ag5VEKbFcOIUlOwXOM=;
        b=XQWe+/MU4k4dwCOjcexd6aBfQxMY9omE9YVfiy/49yRpETt6qNxynO6iyqtid09rQR
         e4wuKCDYKGnKCApmf05E0d/05OXS35m1a46kHAQSLPyXzrhQoY2oDcI8kpge16IUFeZM
         ZD7CaXZc0QyL62dlzHZUHM/U7Dtl7WXwupSd8E5FT/IuqW1qYWAWG172hLMiZlKFP66D
         tqKyFUeAZgcy9Z0D++Fci8rmrkmyiMp2+r0VGBctfZGLLVgy/Aa9VE8l6hFX9hnPqonW
         iHq/Zl2hZFzZXCrl25Vuz691lvI3FBAUM1PrfMgOu65VnIdeLnk5zSIan0NPPPcfp2Bv
         AO/Q==
X-Gm-Message-State: AC+VfDybBIAuGPaDbDg49aBGfPFIEGU2eofZmy0Pthr7IncBPh7fPn5v
	ZfzN/6mG7/Dbaa2GqfcHdv3PTjBaT2+3zOGTey0=
X-Google-Smtp-Source: ACHHUZ7L5UJ5xrQy0UHsdJiD/9D5FNPbUP187eA4ewRX7IW3GgdjF8gW0nlsIWA84PPh+XrgOdmFlFqxvl2gMp6ULBg=
X-Received: by 2002:a05:600c:4181:b0:3f4:e432:7589 with SMTP id
 p1-20020a05600c418100b003f4e4327589mr4002803wmh.10.1685077744099; Thu, 25 May
 2023 22:09:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:ec4e:0:b0:309:59d8:d065 with HTTP; Thu, 25 May 2023
 22:09:03 -0700 (PDT)
In-Reply-To: <CAMKF1sp9KXzt7Phfm6pNdXeCi-VD2KGwfGErOE8Ga7JMdWENMg@mail.gmail.com>
References: <20230526012356.175746-1-raj.khem@gmail.com> <CAEHkU3U5vcCOgDz6qAhGDtHMXnzq+Gv89uageghdYLKoh+smgg@mail.gmail.com>
 <CAMKF1sp9KXzt7Phfm6pNdXeCi-VD2KGwfGErOE8Ga7JMdWENMg@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Fri, 26 May 2023 07:09:03 +0200
Message-ID: <CAEHkU3W0RL2buVxpsqHnYZoB+OOYgKof40-tZ14CV0P5Go+ETA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Make built-in libtraceevent plugins
 cohabit with external libtraceevent
To: Khem Raj <raj.khem@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005b24e905fc91bcaf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 05:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181758

--0000000000005b24e905fc91bcaf
Content-Type: text/plain; charset="UTF-8"

On Friday, May 26, 2023, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Thu, May 25, 2023 at 7:44 PM Max Krummenacher <max.oss.09@gmail.com>
wrote:
>>
>> Hi Khem
>>
>> On Friday, May 26, 2023, Khem Raj <raj.khem@gmail.com> wrote:
>> > This will package the plugins built by perf into kernel specific dir
>> > under libdir, so it does not conflict with plugins from newly added
>> > libtraceevent recipe
>> >
>> > Fixes
>> > do_sdk_depends: The file
/usr/lib/traceevent/plugins/plugin_cfg80211.so is installed by both perf
and libtraceevent, aborting
>>
>> Starting with kernel version 6.4 libtraceevent is removed from the
kernel sources and perf depends of an externally provided libtraceevent
unless explicitely opted out.
>>
>> perf.bb with this patch will fail when built with a 6.4 kernel.
>
> Why will it fail ?

The file which sed works on, ${S}/tools/lib/traceevent/plugins/Makefile, no
longer exists.

>>
>> I guess as an interim solution building perf on 6.4 without traceevent
would fix the SDK issue you see with older kernels.
>> I could then try out how to build perf with an external libtraceevent
also for older kernels (LIBTRACEEVENT_DYNAMIC) so that it would work for
all kernel/perf versions.
>>
>> Regards
>> Max
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > Cc: Max Krummenacher <max.krummenacher@toradex.com>
>> > ---
>> >  meta/recipes-kernel/perf/perf.bb | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-kernel/perf/perf.bb
b/meta/recipes-kernel/perf/perf.bb
>> > index 67b01a7f65a..d31f59f460b 100644
>> > --- a/meta/recipes-kernel/perf/perf.bb
>> > +++ b/meta/recipes-kernel/perf/perf.bb
>> > @@ -137,6 +137,8 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
>> >  do_compile() {
>> >         # Linux kernel build system is expected to do the right thing
>> >         unset CFLAGS
>> > +       sed -i -e
's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g'
${S}/tools/lib/traceevent/plugins/Makefile
>> > +       sed -i -e
's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g'
${S}/tools/perf/Makefile.config
>> >         oe_runmake all
>> >  }
>> >
>> > @@ -364,7 +366,7 @@ RSUGGESTS_SCRIPTING =
"${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}
>> >  RSUGGESTS:${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
>> >
>> >  FILES_SOLIBSDEV = ""
>> > -FILES:${PN} += "${libexecdir}/perf-core
${exec_prefix}/libexec/perf-core ${libdir}/traceevent
${libdir}/libperf-jvmti.so"
>> > +FILES:${PN} += "${libexecdir}/perf-core
${exec_prefix}/libexec/perf-core ${libdir}/traceevent*
${libdir}/libperf-jvmti.so"
>> >  FILES:${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
>> >  FILES:${PN}-tests = "${libdir}/perf/perf-core/tests
${libexecdir}/perf-core/tests"
>> >  FILES:${PN}-python = " \
>> > --
>> > 2.40.1
>> >
>> >

--0000000000005b24e905fc91bcaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, May 26, 2023, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt;<br>&gt; On Thu, =
May 25, 2023 at 7:44 PM Max Krummenacher &lt;<a href=3D"mailto:max.oss.09@g=
mail.com">max.oss.09@gmail.com</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; Hi Kh=
em<br>&gt;&gt;<br>&gt;&gt; On Friday, May 26, 2023, Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt;&gt; &=
gt; This will package the plugins built by perf into kernel specific dir<br=
>&gt;&gt; &gt; under libdir, so it does not conflict with plugins from newl=
y added<br>&gt;&gt; &gt; libtraceevent recipe<br>&gt;&gt; &gt;<br>&gt;&gt; =
&gt; Fixes<br>&gt;&gt; &gt; do_sdk_depends: The file /usr/lib/traceevent/pl=
ugins/plugin_cfg80211.so is installed by both perf and libtraceevent, abort=
ing<br>&gt;&gt;<br>&gt;&gt; Starting with kernel version 6.4 libtraceevent =
is removed from the kernel sources and perf depends of an externally provid=
ed libtraceevent unless explicitely opted out.<br>&gt;&gt;<br>&gt;&gt; <a h=
ref=3D"http://perf.bb">perf.bb</a> with this patch will fail when built wit=
h a 6.4 kernel.<br>&gt;<br>&gt; Why will it fail ?<br><br>The file which se=
d works on, ${S}/tools/lib/traceevent/plugins/Makefile, no longer exists. <=
br><br>&gt;&gt;<br>&gt;&gt; I guess as an interim solution building perf on=
 6.4 without traceevent would fix the SDK issue you see with older kernels.=
<br>&gt;&gt; I could then try out how to build perf with an external libtra=
ceevent also for older kernels (LIBTRACEEVENT_DYNAMIC) so that it would wor=
k for all kernel/perf versions.<br>&gt;&gt;<br>&gt;&gt; Regards<br>&gt;&gt;=
 Max<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; &gt; =
Cc: Max Krummenacher &lt;<a href=3D"mailto:max.krummenacher@toradex.com">ma=
x.krummenacher@toradex.com</a>&gt;<br>&gt;&gt; &gt; ---<br>&gt;&gt; &gt; =
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb">perf.bb</a> | 4 +=
++-<br>&gt;&gt; &gt; =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<b=
r>&gt;&gt; &gt;<br>&gt;&gt; &gt; diff --git a/meta/recipes-kernel/perf/<a h=
ref=3D"http://perf.bb">perf.bb</a> b/meta/recipes-kernel/perf/<a href=3D"ht=
tp://perf.bb">perf.bb</a><br>&gt;&gt; &gt; index 67b01a7f65a..d31f59f460b 1=
00644<br>&gt;&gt; &gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://per=
f.bb">perf.bb</a><br>&gt;&gt; &gt; +++ b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb">perf.bb</a><br>&gt;&gt; &gt; @@ -137,6 +137,8 @@ PERF_E=
XTRA_LDFLAGS:mipsarchn64el =3D &quot;-m elf64ltsmip&quot;<br>&gt;&gt; &gt; =
=C2=A0do_compile() {<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Linux k=
ernel build system is expected to do the right thing<br>&gt;&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS<br>&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i -e &#39;s|\$(libdir)/traceevent/plugins|\$(libdir)/traceev=
ent_${KERNEL_VERSION}/plugins|g&#39; ${S}/tools/lib/traceevent/plugins/Make=
file<br>&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|\$(libdi=
r)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g&#39=
; ${S}/tools/perf/Makefile.config<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 oe_runmake all<br>&gt;&gt; &gt; =C2=A0}<br>&gt;&gt; &gt;<br>&gt;&gt; &g=
t; @@ -364,7 +366,7 @@ RSUGGESTS_SCRIPTING =3D &quot;${@bb.utils.contains(&=
#39;PACKAGECONFIG&#39;, &#39;scripting&#39;, &#39;${PN}<br>&gt;&gt; &gt; =
=C2=A0RSUGGESTS:${PN} +=3D &quot;${PN}-archive ${PN}-tests ${RSUGGESTS_SCRI=
PTING}&quot;<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; =C2=A0FILES_SOLIBSDEV =3D &q=
uot;&quot;<br>&gt;&gt; &gt; -FILES:${PN} +=3D &quot;${libexecdir}/perf-core=
 ${exec_prefix}/libexec/perf-core ${libdir}/traceevent ${libdir}/libperf-jv=
mti.so&quot;<br>&gt;&gt; &gt; +FILES:${PN} +=3D &quot;${libexecdir}/perf-co=
re ${exec_prefix}/libexec/perf-core ${libdir}/traceevent* ${libdir}/libperf=
-jvmti.so&quot;<br>&gt;&gt; &gt; =C2=A0FILES:${PN}-archive =3D &quot;${libd=
ir}/perf/perf-core/perf-archive&quot;<br>&gt;&gt; &gt; =C2=A0FILES:${PN}-te=
sts =3D &quot;${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests&=
quot;<br>&gt;&gt; &gt; =C2=A0FILES:${PN}-python =3D &quot; \<br>&gt;&gt; &g=
t; --<br>&gt;&gt; &gt; 2.40.1<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;

--0000000000005b24e905fc91bcaf--

