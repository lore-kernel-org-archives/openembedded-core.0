Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACDFC77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 07:14:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.6437.1684998885367501783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 00:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qdTT7nrF;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f6dbe3c230so734615e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684998884; x=1687590884;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gMrkyud2B+LyEBvZ3fX7EBTFr5OqDBeNkdYUF/cf4Ww=;
        b=qdTT7nrFrHvUjWuj192QeCl86gq55nPqPLqJ/odCVz96XGwYpNaNfRJIoYVyeA39YH
         UhA4l3KSVlEvOPdVoQInbFrhRi0fSMJao856JhCozaZh9037uREPVBrcxE1RcjjDvxKL
         urDVOeCSih9xApejVRYE49f0ouPcuqfJilpIwdJENZvCCsyvhROLCXYH3l+TJ7ZWUZjb
         wcqMXfV+7czK2S8g60CICiFEcjJimOqZrZMZHBR9aqWsMiko4fpOLoG+y1A2a0NRRslv
         NTXfY7lzPu2xYDmigYbB7cCY0w559X2dtZAG4SJBATAkG/LFSS20wBIyupIF2nwHIcct
         I/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684998884; x=1687590884;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMrkyud2B+LyEBvZ3fX7EBTFr5OqDBeNkdYUF/cf4Ww=;
        b=YfNhZD1uA4oJ9z9qebXSeC0YaeiuvgHqd41ToJBxHPoRLO8KN98Ouww/4a0hcsGSVd
         5xYWYDEospR6Mu84RZPpUCLhkt4IJdMv2yh6TlgD83gmmi2nNL8ULxJ/PekzC48ZeiC8
         z+zERTZKL2BjfvqG8U1J7SZyNtt3cfwtag0xLq8PmvLLX8X8LnVwVWMNK3H/jAFd/fzN
         IDYwDzqK8eiUvUUWsmUkEwbDAgC1fWrw68T5JdUrq0Jny4idPYhh8TpHrkhclS8Ba3Im
         f4yNzTu+B3IosFx3MBKa0JXQl5gLyQIBJfyxKn0qC8f7/EZ/Io1m+OzyFqf3B0tC583t
         n1aA==
X-Gm-Message-State: AC+VfDwpPoJzypoMCNd9EJy0tbx5hNnN3xo+O/OT4vOhSvmm9JlpTt7n
	8rqyGBS8Yh3JOZndhfiw7/c52mxtPqkGrVuqzwY=
X-Google-Smtp-Source: ACHHUZ6SxsrsXcOf1jB72DWOtmYKTq8+g82OEuKUE6qXmIJ1WtDIWID44QPEKS4ehg1Rlymq0KgB/wsgShdrXr1grSI=
X-Received: by 2002:a7b:c7ce:0:b0:3f4:27db:d with SMTP id z14-20020a7bc7ce000000b003f427db000dmr1549999wmk.17.1684998883605;
 Thu, 25 May 2023 00:14:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:ec4e:0:b0:309:59d8:d065 with HTTP; Thu, 25 May 2023
 00:14:43 -0700 (PDT)
In-Reply-To: <CAMKF1sro1exZADTnwjuTPXsU8otXuk86ZThF4uU6DePFQ0AP6w@mail.gmail.com>
References: <20230511232214.993328-1-max.oss.09@gmail.com> <20230511232214.993328-2-max.oss.09@gmail.com>
 <CAMKF1sro1exZADTnwjuTPXsU8otXuk86ZThF4uU6DePFQ0AP6w@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 25 May 2023 09:14:43 +0200
Message-ID: <CAEHkU3X+sXAa-dgvDfgbS0ChSiQ74V8JG80ucX+xX-ft3hJKYw@mail.gmail.com>
Subject: Re: [OE-core][Patch v4 1/4] libtraceevent: import from meta-openembedded
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"quaresma.jose@gmail.com" <quaresma.jose@gmail.com>, Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000e7813405fc7f5fa3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 07:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181703

--000000000000e7813405fc7f5fa3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem

On Thursday, May 25, 2023, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Max
>
> I am seeing
>
> The file /usr/lib/traceevent/plugins/plugin_cfg80211.so is installed
> by both perf and libtraceevent, aborting
>
> When building sdk with both libtraceevent and perf added to image.


I didn't test anything SDK with this patchset. Sorry.

I'm currently on vacation and not able to do real OE work.

I guess the quickest way out would be to remove in perf.bb libtraceevent
from the enabled packageconfigs.

I expect perf from kernels before 6.4 to work as before the patchset and
perf at 6.4 to not fail to build, albeit without traceevent support.

Does this sound like a plan?
Max
>
> On Thu, May 11, 2023 at 4:22=E2=80=AFPM Max Krummenacher <max.oss.09@gmai=
l.com>
wrote:
>>
>> From: Max Krummenacher <max.krummenacher@toradex.com>
>>
>> Import from meta-openembedded at commit d250a0dc0 ("libtraceevent:
>> upgrade 1.7.1 -> 1.7.2").
>> Starting with kernel 6.4 libtraceevent is a dependency of perf. While
>> one can still build perf without it by opting out one would loose its
>> functionality compared with building perf from kernels before 6.4
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc      |  1 +
>>  ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
>>  .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
>>  3 files changed, 66 insertions(+)
>>  create mode 100644
meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preser=
ve-ownership-in-cp-command.patch
>>  create mode 100644 meta/recipes-kernel/libtraceevent/
libtraceevent_1.7.2.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc
b/meta/conf/distro/include/maintainers.inc
>> index ec7ea90d16..3071671850 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -402,6 +402,7 @@ RECIPE_MAINTAINER:pn-libtirpc =3D "Anuj Mittal <
anuj.mittal@intel.com>"
>>  RECIPE_MAINTAINER:pn-libtool =3D "Robert Yang <liezhi.yang@windriver.co=
m>"
>>  RECIPE_MAINTAINER:pn-libtool-cross =3D "Robert Yang <
liezhi.yang@windriver.com>"
>>  RECIPE_MAINTAINER:pn-libtool-native =3D "Robert Yang <
liezhi.yang@windriver.com>"
>> +RECIPE_MAINTAINER:pn-libtraceevent =3D "Bruce Ashfield <
bruce.ashfield@gmail.com>"
>>  RECIPE_MAINTAINER:pn-libtry-tiny-perl =3D "Tim Orling <
tim.orling@konsulko.com>"
>>  RECIPE_MAINTAINER:pn-libucontext =3D "Khem Raj <raj.khem@gmail.com>"
>>  RECIPE_MAINTAINER:pn-libunistring =3D "Anuj Mittal <anuj.mittal@intel.c=
om
>"
>> diff --git
a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-pres=
erve-ownership-in-cp-command.patch
b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-pres=
erve-ownership-in-cp-command.patch
>> new file mode 100644
>> index 0000000000..5e88048817
>> --- /dev/null
>> +++
b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-pres=
erve-ownership-in-cp-command.patch
>> @@ -0,0 +1,40 @@
>> +From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 22 Dec 2022 18:32:17 -0800
>> +Subject: [PATCH] makefile: Do not preserve ownership in cp command
>> +
>> +Fixes
>> +
>> +ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent:
/usr/lib/libtraceevent.a is owned by uid 1000, which is the same as the
user running bitbake. This may be due to host contamination
[host-user-contaminated]
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + Makefile | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 965ff47..0e782cb 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force
>> +       $(Q)$(call build_prefix,$(prefix))
>> +
>> + define do_make_pkgconfig_file
>> +-      cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};    =
\
>> ++      install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template
${PKG_CONFIG_FILE};  \
>> +       sed -i "s|INSTALL_PREFIX|${1}|g" ${PKG_CONFIG_FILE};            =
\
>> +       sed -i "s|LIB_VERSION|${EVENT_PARSE_VERSION}|g"
${PKG_CONFIG_FILE}; \
>> +       sed -i "s|LIB_DIR|${libdir_relative}|g" ${PKG_CONFIG_FILE}; \
>> +@@ -335,7 +335,7 @@ install: install_libs install_plugins
>> +
>> + install_libs: libs install_headers install_pkgconfig
>> +       $(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \
>> +-              cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
>> ++              cp --no-preserve=3Downership --recursive $(LIB_INSTALL)
$(DESTDIR)$(libdir_SQ)
>> +       $(Q)$(call install_ld_config)
>> +
>> + install_pkgconfig: $(PKG_CONFIG_FILE)
>> +--
>> +2.39.0
>> +
>> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
>> new file mode 100644
>> index 0000000000..089b6814c7
>> --- /dev/null
>> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
>> @@ -0,0 +1,25 @@
>> +# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +SUMMARY =3D "API to access the kernel tracefs directory"
>> +HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.g=
it/
"
>> +LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
>> +LIC_FILES_CHKSUM =3D
"file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749254a51215d13f97 \
>> +
file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50909238dbd"
>> +SECTION =3D "libs"
>> +
>> +SRCREV =3D "1c6f0f3b2bb47571fc455dc565dc343152517d98"
>> +SRC_URI =3D "git://
git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=3D${BPN};prot=
ocol=3Dhttps
\
>> +
 file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit pkgconfig
>> +
>> +do_install() {
>> +    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconf=
ig
>> +}
>> +
>> +PACKAGES +=3D "${PN}-plugins"
>> +
>> +FILES:${PN}-plugins +=3D "${libdir}/traceevent/plugins"
>> --
>> 2.35.3
>>
>

--000000000000e7813405fc7f5fa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem<br><br>On Thursday, May 25, 2023, Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt; Hi Max<br>&gt;<=
br>&gt; I am seeing<br>&gt;<br>&gt; The file /usr/lib/traceevent/plugins/pl=
ugin_cfg80211.so is installed<br>&gt; by both perf and libtraceevent, abort=
ing<br>&gt;<br>&gt; When building sdk with both libtraceevent and perf adde=
d to image.<br><br><br>I didn&#39;t test anything SDK with this patchset. S=
orry.<br><br>I&#39;m currently on vacation and not able to do real OE work.=
 <br><br>I guess the quickest way out would be to remove in <a href=3D"http=
://perf.bb">perf.bb</a> libtraceevent from the enabled packageconfigs.<br><=
br>I expect perf from kernels before 6.4 to work as before the patchset and=
 perf at 6.4 to not fail to build, albeit without traceevent support.<br><b=
r>Does this sound like a plan? <br>Max<br>&gt;<br>&gt; On Thu, May 11, 2023=
 at 4:22=E2=80=AFPM Max Krummenacher &lt;<a href=3D"mailto:max.oss.09@gmail=
.com">max.oss.09@gmail.com</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; From: Max=
 Krummenacher &lt;<a href=3D"mailto:max.krummenacher@toradex.com">max.krumm=
enacher@toradex.com</a>&gt;<br>&gt;&gt;<br>&gt;&gt; Import from meta-openem=
bedded at commit d250a0dc0 (&quot;libtraceevent:<br>&gt;&gt; upgrade 1.7.1 =
-&gt; 1.7.2&quot;).<br>&gt;&gt; Starting with kernel 6.4 libtraceevent is a=
 dependency of perf. While<br>&gt;&gt; one can still build perf without it =
by opting out one would loose its<br>&gt;&gt; functionality compared with b=
uilding perf from kernels before 6.4<br>&gt;&gt;<br>&gt;&gt; Signed-off-by:=
 Max Krummenacher &lt;<a href=3D"mailto:max.krummenacher@toradex.com">max.k=
rummenacher@toradex.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt;=C2=A0 meta/conf=
/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>&gt;&gt;=
=C2=A0 ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++=
++<br>&gt;&gt;=C2=A0 .../libtraceevent/<a href=3D"http://libtraceevent_1.7.=
2.bb">libtraceevent_1.7.2.bb</a>=C2=A0 =C2=A0 =C2=A0 | 25 ++++++++++++<br>&=
gt;&gt;=C2=A0 3 files changed, 66 insertions(+)<br>&gt;&gt;=C2=A0 create mo=
de 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-=
not-preserve-ownership-in-cp-command.patch<br>&gt;&gt;=C2=A0 create mode 10=
0644 meta/recipes-kernel/libtraceevent/<a href=3D"http://libtraceevent_1.7.=
2.bb">libtraceevent_1.7.2.bb</a><br>&gt;&gt;<br>&gt;&gt; diff --git a/meta/=
conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.=
inc<br>&gt;&gt; index ec7ea90d16..3071671850 100644<br>&gt;&gt; --- a/meta/=
conf/distro/include/maintainers.inc<br>&gt;&gt; +++ b/meta/conf/distro/incl=
ude/maintainers.inc<br>&gt;&gt; @@ -402,6 +402,7 @@ RECIPE_MAINTAINER:pn-li=
btirpc =3D &quot;Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">a=
nuj.mittal@intel.com</a>&gt;&quot;<br>&gt;&gt;=C2=A0 RECIPE_MAINTAINER:pn-l=
ibtool =3D &quot;Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.co=
m">liezhi.yang@windriver.com</a>&gt;&quot;<br>&gt;&gt;=C2=A0 RECIPE_MAINTAI=
NER:pn-libtool-cross =3D &quot;Robert Yang &lt;<a href=3D"mailto:liezhi.yan=
g@windriver.com">liezhi.yang@windriver.com</a>&gt;&quot;<br>&gt;&gt;=C2=A0 =
RECIPE_MAINTAINER:pn-libtool-native =3D &quot;Robert Yang &lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt;&quot;<br>=
&gt;&gt; +RECIPE_MAINTAINER:pn-libtraceevent =3D &quot;Bruce Ashfield &lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;=
&quot;<br>&gt;&gt;=C2=A0 RECIPE_MAINTAINER:pn-libtry-tiny-perl =3D &quot;Ti=
m Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@konsulko=
.com</a>&gt;&quot;<br>&gt;&gt;=C2=A0 RECIPE_MAINTAINER:pn-libucontext =3D &=
quot;Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt;&quot;<br>&gt;&gt;=C2=A0 RECIPE_MAINTAINER:pn-libunistring =3D &quot=
;Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel=
.com</a>&gt;&quot;<br>&gt;&gt; diff --git a/meta/recipes-kernel/libtraceeve=
nt/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patc=
h b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-pr=
eserve-ownership-in-cp-command.patch<br>&gt;&gt; new file mode 100644<br>&g=
t;&gt; index 0000000000..5e88048817<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +=
++ b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-p=
reserve-ownership-in-cp-command.patch<br>&gt;&gt; @@ -0,0 +1,40 @@<br>&gt;&=
gt; +From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001=
<br>&gt;&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt;<br>&gt;&gt; +Date: Thu, 22 Dec 2022 18:32:17 -0800<b=
r>&gt;&gt; +Subject: [PATCH] makefile: Do not preserve ownership in cp comm=
and<br>&gt;&gt; +<br>&gt;&gt; +Fixes<br>&gt;&gt; +<br>&gt;&gt; +ERROR: libt=
raceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent: /usr/lib/libtrac=
eevent.a is owned by uid 1000, which is the same as the user running bitbak=
e. This may be due to host contamination [host-user-contaminated]<br>&gt;&g=
t; +<br>&gt;&gt; +Upstream-Status: Pending<br>&gt;&gt; +Signed-off-by: Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<b=
r>&gt;&gt; +---<br>&gt;&gt; + Makefile | 4 ++--<br>&gt;&gt; + 1 file change=
d, 2 insertions(+), 2 deletions(-)<br>&gt;&gt; +<br>&gt;&gt; +diff --git a/=
Makefile b/Makefile<br>&gt;&gt; +index 965ff47..0e782cb 100644<br>&gt;&gt; =
+--- a/Makefile<br>&gt;&gt; ++++ b/Makefile<br>&gt;&gt; +@@ -287,7 +287,7 @=
@ $(BUILD_PREFIX): force<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call=
 build_prefix,$(prefix))<br>&gt;&gt; +<br>&gt;&gt; + define do_make_pkgconf=
ig_file<br>&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 cp -f ${PKG_CONFIG_SOURCE_FILE}.=
template ${PKG_CONFIG_FILE};=C2=A0 =C2=A0 \<br>&gt;&gt; ++=C2=A0 =C2=A0 =C2=
=A0 install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};=
=C2=A0 \<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s|INSTALL_PRE=
FIX|${1}|g&quot; ${PKG_CONFIG_FILE};=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s|LIB_VERSION|${=
EVENT_PARSE_VERSION}|g&quot; ${PKG_CONFIG_FILE}; \<br>&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0sed -i &quot;s|LIB_DIR|${libdir_relative}|g&quot; ${PKG_CO=
NFIG_FILE}; \<br>&gt;&gt; +@@ -335,7 +335,7 @@ install: install_libs instal=
l_plugins<br>&gt;&gt; +<br>&gt;&gt; + install_libs: libs install_headers in=
stall_pkgconfig<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call do_insta=
ll,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \<br>&gt;&gt; +-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_S=
Q)<br>&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp --no-p=
reserve=3Downership --recursive $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)<br>&g=
t;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call install_ld_config)<br>&gt;&gt=
; +<br>&gt;&gt; + install_pkgconfig: $(PKG_CONFIG_FILE)<br>&gt;&gt; +--<br>=
&gt;&gt; +2.39.0<br>&gt;&gt; +<br>&gt;&gt; diff --git a/meta/recipes-kernel=
/libtraceevent/<a href=3D"http://libtraceevent_1.7.2.bb">libtraceevent_1.7.=
2.bb</a> b/meta/recipes-kernel/libtraceevent/<a href=3D"http://libtraceeven=
t_1.7.2.bb">libtraceevent_1.7.2.bb</a><br>&gt;&gt; new file mode 100644<br>=
&gt;&gt; index 0000000000..089b6814c7<br>&gt;&gt; --- /dev/null<br>&gt;&gt;=
 +++ b/meta/recipes-kernel/libtraceevent/<a href=3D"http://libtraceevent_1.=
7.2.bb">libtraceevent_1.7.2.bb</a><br>&gt;&gt; @@ -0,0 +1,25 @@<br>&gt;&gt;=
 +# Copyright (C) 2022 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">r=
aj.khem@gmail.com</a>&gt;<br>&gt;&gt; +# Released under the MIT license (se=
e COPYING.MIT for the terms)<br>&gt;&gt; +<br>&gt;&gt; +SUMMARY =3D &quot;A=
PI to access the kernel tracefs directory&quot;<br>&gt;&gt; +HOMEPAGE =3D &=
quot;<a href=3D"https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git=
/">https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/</a>&quot;<b=
r>&gt;&gt; +LICENSE =3D &quot;GPL-2.0-or-later &amp; LGPL-2.1-or-later&quot=
;<br>&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSES/GPL-2.0;md5=3De6a=
75371ba4d16749254a51215d13f97 \<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://LICENSES/LGPL-2.1;md5=3Db3=
70887980db5dd40659b50909238dbd&quot;<br>&gt;&gt; +SECTION =3D &quot;libs&qu=
ot;<br>&gt;&gt; +<br>&gt;&gt; +SRCREV =3D &quot;1c6f0f3b2bb47571fc455dc565d=
c343152517d98&quot;<br>&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://=
git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=3D${BPN};prot=
ocol=3Dhttps">git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=
=3D${BPN};protocol=3Dhttps</a> \<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file://0001-makefile-Do-not-preserve-ownership-in-cp-command.p=
atch&quot;<br>&gt;&gt; +<br>&gt;&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>&=
gt;&gt; +<br>&gt;&gt; +inherit pkgconfig<br>&gt;&gt; +<br>&gt;&gt; +do_inst=
all() {<br>&gt;&gt; +=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} pkgcon=
fig_dir=3D${libdir}/pkgconfig<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +PAC=
KAGES +=3D &quot;${PN}-plugins&quot;<br>&gt;&gt; +<br>&gt;&gt; +FILES:${PN}=
-plugins +=3D &quot;${libdir}/traceevent/plugins&quot;<br>&gt;&gt; --<br>&g=
t;&gt; 2.35.3<br>&gt;&gt;<br>&gt;

--000000000000e7813405fc7f5fa3--

