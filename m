Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E458C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 17:15:29 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.548.1788887720632453973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 10:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E+tAo7TB;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-836c4474028so45977707b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 10:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788887720; cv=none;
        d=google.com; s=arc-20260327;
        b=bkxlfKBTohCwykCbXHCQd0pnSfeqRAZ7GogbrYIlDUrw606uxK7FCseyjFK8tTqQdC
         spGxC1SnvPjx9Eu80g2F9qjjs1NJ6/p7xv4MWUdFIs/vcW94NGvcfT/8HU24rTp7Y1Qr
         ld5FlgWlcWJ6VspnHGac7wy9RyTS8crTSMzSxTl8FNzBsZxYY7uZb3tPRi1C1oKmA4g9
         OWondt/f7nLP6IQvjFWAoWTPEECE7FEXYVh2AJvd3O0gHOACMqb+fa57+wtgB8BV804p
         aVYgCsPTkm5sqSa3SmDABfsY1LDQ3IaZK4+O/BNPm0Ghxrhfdg69t1bLdNHLDsCW7aVS
         MT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4lEbpVJ1OeTFDKQ6hDoqf9r4tq5SwoaqI+ADvp9aSWc=;
        fh=NZ86TOxn0SVSMO5sv4cIs/g0Q+bshcdeNmgNcdf38H0=;
        b=JOZFHahWmJAcMMifuAOHRSHAsUXmhRoKsdvEsEo/+VqGDiKNlSH4NmU+3D33nSmDLr
         Q8FkRzbI0ItONuNMtsZbEi1DYltubgmmDrakcON/eQEE4TPoz2Pr7WqxCs09Uzfw++Es
         B4tT0ut9ZmBXxZ+x4+gT6Mw1vOVwdI+V/aAJplHs7dOFjZ8ArcHBaFT/7B4GiGt29STB
         L1ypCev9sXBiOCGza1tk+//TgcM4WGb7zgrvUg357mEH48KbweMn3xpyPuX4ewfTQq9Y
         jdOiw4Ep1x51OikWEMft93Nb6+3LGbLWwlz7HGWENLURExmg6NlC4IR22CeDUkVwXAjj
         QK0Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887720; x=1789492520; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lEbpVJ1OeTFDKQ6hDoqf9r4tq5SwoaqI+ADvp9aSWc=;
        b=E+tAo7TB9nENULPgpKRo8mfUHa+h24QbBSKnFmx79fKcJ15B1pUJ+0FusuEYGIPMpC
         y1aqkP8SNttdJXB4nJ8CNLmnbYkpyZlaWOZ+4BAMv0vixCzif3y6sIH3lrRJb7PMBnpA
         fELySHnX6cAzmcSfUp42pVFjyZJc82JcqevoqjGoVSWjgwc1wA0nRDJipv5rgMuCs7uC
         TCHYYFGd6WIKMgKKRJx5M5IT6jM9DdQxAFPFDJMWOlmIy2VNVbhQwFm9LUep4uikKn6Z
         smWKgjMB/jDJub4KDJHTLQt7nYoYB2rWzHPvpY21aAZzaGvW2/OagyfxsaizpNfhDzyP
         jEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887720; x=1789492520;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lEbpVJ1OeTFDKQ6hDoqf9r4tq5SwoaqI+ADvp9aSWc=;
        b=CSD5rQTccXMx2siCpHGE6+0vIXxREbz+chmQo5kIRbAvH0VrodObpGEucpWrzTge3W
         2/949/xlHJqiaLSKnZI0LVrY2X1hoQH3iHfqeOuQIjeAlVRqqqsRjqKOx7KNfz+d6W3r
         q8698ucbyd49IJnCWVSPrfrqfWLhHzzZQpSK2iDK0Th/C/LYYpX62wH3MOXIWyInzH8b
         bxTb+lbc0ookIe52U/Q8JEuiZakgzzZFR8Kn301H2I0M4Sb3qmqrL+or1tdWEjEKItfA
         3cUeKuCsp9xZgw1pC+v9WepvVOlS82V5pUPh7Wl06DJbsXak0xp6luJ4wwL0IxdF1fbc
         W5NQ==
X-Gm-Message-State: AFuF++n6WfPIfRZgpm8Sep6lJhi4SBOdY3DbYNeEoQWEUWov1JxjJDk+
	sviX12dD3b/dv4VKyfV/8n6EWc9tJbbM+6Qnds1E1Yb1K3YwiRR9A/W1MFCA5L8HKN5PSoyZa3J
	yo8Z7DxlwSX1SpsAtCG5DHac1fcSe73nyzQ==
X-Gm-Gg: AYBFou18EO+A+/figaoKAXKfChucjk4oF3h/W2Pu9ruBffhebaOH3S0+DZAdCqd1COI
	PpIyq59GfZ0kMnM8M2Z/UUs//jSrSBi6d0I+IQZps6w47KRJjyFrvNbj9QT7g1yfLz7h0LDB0ST
	uQz0ZSM0Gsn3vFBMlGaPKhfzaZjDgETInXpUZ+oF8MbxCM7QEYxGAKKauy0GiAv3RuW7baleal5
	udn/swVlH4nWekh0CdcKLsnDFC/6o8aunAhM1trqPtYQCXFyraA3i5R4Z8XZ80V6ErECTHKNaoT
	JBt+639j5a4Le4fao7PKPyFebSol7kLn5rqAb81NncmZ3yZDotVi873UcA8mv3oxcIXEdIvxaFb
	NPEnpSmcrbKjVwvZS7B6j5uVpYr/FV66xQC9fR/uhF42NZ/huXOozvT8UQFbfS8kDdhlWI2hiFj
	6EnE/ds0TRiSJ29SoV72cAd7dRkf29lYSaxWQ6KW8cGY0nNoPGCU35Pvmj935rPBnapZOXhCZwG
	lrdIp8Hsk+3q5A=
X-Received: by 2002:a05:690c:ec4:b0:873:5bb2:6c06 with SMTP id
 00721157ae682-8735bb26df0mr76168777b3.48.1788887719346; Tue, 08 Sep 2026
 10:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-mathieu-reproducible-faketime-v3-0-03a856c33239@bootlin.com>
 <20260908-mathieu-reproducible-faketime-v3-1-03a856c33239@bootlin.com>
In-Reply-To: <20260908-mathieu-reproducible-faketime-v3-1-03a856c33239@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Sep 2026 10:14:52 -0700
X-Gm-Features: AcwNN1VvjfnuzYHvMYcmQMVNE2eB-RaW9i4DJ-Ng2Kh0hCmfNuby5ceJUASH_4A
Message-ID: <CAMKF1spk2s1h7yA5F8YfDQpKn_ho_cDgPj0cM2E49Q__0A2yyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/4] libfaketime: Import recipe from meta-oe
To: mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000000e08e3065afbe169"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 17:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245386

--0000000000000e08e3065afbe169
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have sent another patch to meta-oe to upgrade and also fix the build with
clang23, please consider the change in that as well before you bring
this to core.

On Tue, Sep 8, 2026 at 10:06=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> wrote:

> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  meta/conf/distro/include/maintainers.inc           |  1 +
>  ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 35
> ++++++++++++++++++++++
>  .../libfaketime/libfaketime_0.9.12.bb              | 31
> +++++++++++++++++++
>  3 files changed, 67 insertions(+)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 2966cddc0569..fc57eb1395a1 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -342,6 +342,7 @@ RECIPE_MAINTAINER:pn-libevdev =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libevent =3D "Unassigned <unassigned@yoctoproject.o=
rg
> >"
>  RECIPE_MAINTAINER:pn-libexif =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libfakekey =3D "Unassigned <
> unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-libfaketime =3D "Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com>"
>  RECIPE_MAINTAINER:pn-libffi =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-libfm =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-libfm-extra =3D "Unassigned <
> unassigned@yoctoproject.org>"
> diff --git
> a/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-=
to-fix-build-with-ISO-C23.patch
> b/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-=
to-fix-build-with-ISO-C23.patch
> new file mode 100644
> index 000000000000..29c250c95308
> --- /dev/null
> +++
> b/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-=
to-fix-build-with-ISO-C23.patch
> @@ -0,0 +1,35 @@
> +From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
> +From: Tomas Korbar <tkorbar@redhat.com>
> +Date: Mon, 15 Dec 2025 11:03:21 +0100
> +Subject: [PATCH] Add const qualifiers to fix build with ISO C23
> +
> +Fix https://github.com/wolfcw/libfaketime/issues/524
> +
> +Upstream-Status: Backport [https://github.com/wolfcw/libfaketime/pull/52=
5
> ]
> +Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> +---
> + src/libfaketime.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libfaketime.c b/src/libfaketime.c
> +index ef1dca9..02839c8 100644
> +--- a/src/libfaketime.c
> ++++ b/src/libfaketime.c
> +@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
> + static void parse_ft_string(const char *user_faked_time)
> + {
> +   struct tm user_faked_time_tm;
> +-  char * tmp_time_fmt;
> ++  const char * tmp_time_fmt;
> +   char * nstime_str;
> +
> +   if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
> +@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents=
)
> + bool str_array_contains(const char *haystack, const char *needle)
> + {
> +   size_t needle_len =3D strlen(needle);
> +-  char *pos =3D strstr(haystack, needle);
> ++  const char *pos =3D strstr(haystack, needle);
> +   while (pos) {
> +     if (pos =3D=3D haystack || *(pos - 1) =3D=3D ',') {
> +       char nextc =3D *(pos + needle_len);
> diff --git a/meta/recipes-support/libfaketime/libfaketime_0.9.12.bb
> b/meta/recipes-support/libfaketime/libfaketime_0.9.12.bb
> new file mode 100644
> index 000000000000..89e4eebeaa46
> --- /dev/null
> +++ b/meta/recipes-support/libfaketime/libfaketime_0.9.12.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "A library for faking the system time in user-space programs=
"
> +SECTION =3D "libs"
> +HOMEPAGE =3D "https://github.com/wolfcw/libfaketime"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRCREV =3D "3ccdd344aadf1e317156fa5fb7c881f2c4404778"
> +
> +SRC_URI =3D "git://
> github.com/wolfcw/libfaketime.git;branch=3Dmaster;tag=3Dv${PV};protocol=
=3Dhttps
> <http://github.com/wolfcw/libfaketime.git;branch=3Dmaster;tag=3Dv$%7BPV%7=
D;protocol=3Dhttps>
> \
> +
>  file://0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch \
> +"
> +
> +CFLAGS:append:libc-musl =3D " -D_LARGEFILE64_SOURCE"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile () {
> +    oe_runmake
> +}
> +
> +do_install () {
> +    install -d ${D}${libdir}/faketime
> +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
> +    install -d ${D}${bindir}
> +    install -m 0755 src/faketime ${D}${bindir}
> +}
> +
> +FILES:${PN} =3D "${bindir}/faketime ${libdir}/faketime/lib*${SOLIBS}"
> +FILES:${PN}-dev +=3D "${libdir}/faketime/lib*${SOLIBSDEV}"
> +
> +BBCLASSEXTEND =3D "native"
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245385):
> https://lists.openembedded.org/g/openembedded-core/message/245385
> Mute This Topic: https://lists.openembedded.org/mt/121148363/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000e08e3065afbe169
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have sent another patch to meta-oe to upgrade and also f=
ix the build with clang23, please consider the change in that as well befor=
e you=C2=A0bring this=C2=A0to core.</div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 8, 202=
6 at 10:06=E2=80=AFAM Mathieu Dubois-Briand via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;mathieu.dubois-briand=3D<a hr=
ef=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.=
dubois-briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.=
com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 35 +++++++++++++=
+++++++++<br>
=C2=A0.../libfaketime/<a href=3D"http://libfaketime_0.9.12.bb" rel=3D"noref=
errer" target=3D"_blank">libfaketime_0.9.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 31 +++++++++++++++++++<br>
=C2=A03 files changed, 67 insertions(+)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 2966cddc0569..fc57eb1395a1 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -342,6 +342,7 @@ RECIPE_MAINTAINER:pn-libevdev =3D &quot;Unassigned &lt;=
<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned=
@yoctoproject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libevent =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libexif =3D &quot;Unassigned &lt;<a href=3D"mail=
to:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.o=
rg</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libfakekey =3D &quot;Unassigned &lt;<a href=3D"m=
ailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoprojec=
t.org</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-libfaketime =3D &quot;Mathieu Dubois-Briand &lt;<a hr=
ef=3D"mailto:mathieu.dubois-briand@bootlin.com" target=3D"_blank">mathieu.d=
ubois-briand@bootlin.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libffi =3D &quot;Unassigned &lt;<a href=3D"mailt=
o:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.or=
g</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libfm =3D &quot;Unassigned &lt;<a href=3D"mailto=
:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.org=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libfm-extra =3D &quot;Unassigned &lt;<a href=3D"=
mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproje=
ct.org</a>&gt;&quot;<br>
diff --git a/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qu=
alifiers-to-fix-build-with-ISO-C23.patch b/meta/recipes-support/libfaketime=
/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch<br>
new file mode 100644<br>
index 000000000000..29c250c95308<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifier=
s-to-fix-build-with-ISO-C23.patch<br>
@@ -0,0 +1,35 @@<br>
+From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001<br>
+From: Tomas Korbar &lt;<a href=3D"mailto:tkorbar@redhat.com" target=3D"_bl=
ank">tkorbar@redhat.com</a>&gt;<br>
+Date: Mon, 15 Dec 2025 11:03:21 +0100<br>
+Subject: [PATCH] Add const qualifiers to fix build with ISO C23<br>
+<br>
+Fix <a href=3D"https://github.com/wolfcw/libfaketime/issues/524" rel=3D"no=
referrer" target=3D"_blank">https://github.com/wolfcw/libfaketime/issues/52=
4</a><br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/wolfcw/libfaketim=
e/pull/525" rel=3D"noreferrer" target=3D"_blank">https://github.com/wolfcw/=
libfaketime/pull/525</a>]<br>
+Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-=
briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>=
&gt;<br>
+---<br>
+ src/libfaketime.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/libfaketime.c b/src/libfaketime.c<br>
+index ef1dca9..02839c8 100644<br>
+--- a/src/libfaketime.c<br>
++++ b/src/libfaketime.c<br>
+@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)<br>
+ static void parse_ft_string(const char *user_faked_time)<br>
+ {<br>
+=C2=A0 =C2=A0struct tm user_faked_time_tm;<br>
+-=C2=A0 char * tmp_time_fmt;<br>
++=C2=A0 const char * tmp_time_fmt;<br>
+=C2=A0 =C2=A0char * nstime_str;<br>
+<br>
+=C2=A0 =C2=A0if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLE=
N))<br>
+@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)<=
br>
+ bool str_array_contains(const char *haystack, const char *needle)<br>
+ {<br>
+=C2=A0 =C2=A0size_t needle_len =3D strlen(needle);<br>
+-=C2=A0 char *pos =3D strstr(haystack, needle);<br>
++=C2=A0 const char *pos =3D strstr(haystack, needle);<br>
+=C2=A0 =C2=A0while (pos) {<br>
+=C2=A0 =C2=A0 =C2=A0if (pos =3D=3D haystack || *(pos - 1) =3D=3D &#39;,&#3=
9;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char nextc =3D *(pos + needle_len);<br>
diff --git a/meta/recipes-support/libfaketime/<a href=3D"http://libfaketime=
_0.9.12.bb" rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.12.bb</a> =
b/meta/recipes-support/libfaketime/<a href=3D"http://libfaketime_0.9.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.12.bb</a><br>
new file mode 100644<br>
index 000000000000..89e4eebeaa46<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libfaketime/<a href=3D"http://libfaketime_0.9.12=
.bb" rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.12.bb</a><br>
@@ -0,0 +1,31 @@<br>
+SUMMARY =3D &quot;A library for faking the system time in user-space progr=
ams&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/wolfcw/libfaketime" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/wolfcw/libfaketime</a>=
&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
+<br>
+SRCREV =3D &quot;3ccdd344aadf1e317156fa5fb7c881f2c4404778&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/wolfcw/libfaketime.gi=
t;branch=3Dmaster;tag=3Dv$%7BPV%7D;protocol=3Dhttps" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/wolfcw/libfaketime.git;branch=3Dmaster;tag=3Dv${P=
V};protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-const-qualifiers-=
to-fix-build-with-ISO-C23.patch \<br>
+&quot;<br>
+<br>
+CFLAGS:append:libc-musl =3D &quot; -D_LARGEFILE64_SOURCE&quot;<br>
+<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+<br>
+do_compile () {<br>
+=C2=A0 =C2=A0 oe_runmake<br>
+}<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 install -d ${D}${libdir}/faketime<br>
+=C2=A0 =C2=A0 oe_libinstall -C src libfaketime ${D}${libdir}/faketime<br>
+=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 install -m 0755 src/faketime ${D}${bindir}<br>
+}<br>
+<br>
+FILES:${PN} =3D &quot;${bindir}/faketime ${libdir}/faketime/lib*${SOLIBS}&=
quot;<br>
+FILES:${PN}-dev +=3D &quot;${libdir}/faketime/lib*${SOLIBSDEV}&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245385): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245385" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245385</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121148363/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121148363/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000e08e3065afbe169--

