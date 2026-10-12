Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366E7CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:33:27 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13236.1791811999858527844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JvCsZK7D;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917a64f28d0so53565606d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 06:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791811999; cv=none;
        d=google.com; s=arc-20260327;
        b=dwjRd5uaK0yx0Xfv7L0R1zJwbk5XrGgaMHBD9K9omFHdWRluCddEBsCZ5XoouFRcjS
         dT2C8uDSS9y8Lu4DumLihOYp/DofSI0ceftJ9NCAoruLQ1MMYEo5FBcCh5OOt3n89lnq
         X4gKayLRqH3uX/W7MglSwSf/LE8aUryJideVrVXY2kE2g0Or1YPvpSbH0KboDFQk9KlE
         YdGSzxnNzYqDLCEyYktrsybhvGhch1Pq5fkAjpVXDf2J2n3sceCLbWC/5q0Ii0BjGxUb
         U+GNpmTAccxmAslwFX7AVJnN+uRJJib43toXh1eY0ay8JLgM+U5H0hig4Dd5PCR8QLVb
         WADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+q9oGBkzS41ncs7Ao/HOgObV3o+vZeDZ8C/Hd/pFzpc=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=MQf3Ado1VTpyqfp2B20rlPOvquJNILk6yCp9LuldUlbMbcUKroKv6e8s00zjjYl1fS
         wIkpiG8r3BATp6Sfg6sH0gC96qF15wTG7HcldJZZbBl1SfOZD958aCLZXI/9yscxgMv0
         JM0rYzRj94Y1xjfKHK0RdYRV2cmHMdtWGDY7OJfHiywTjwKM/3j9gzeiEnf7Tlo4h/pz
         Cmz7eTIt0xu6YByE6JyUv/0j+WFzVqy7cTf9Xp0RSV4tvGHxTe+p7IRgsUU/vHlKMbr2
         kUODWGLlFDp8lQiwgCYdNIe5iRKQjIKTmg16pQ4kK9drJXMO663E0ycAPEK7oPLRpsTD
         +cLg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811999; x=1792416799; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+q9oGBkzS41ncs7Ao/HOgObV3o+vZeDZ8C/Hd/pFzpc=;
        b=JvCsZK7DINKXEDgti6w4e83i74xtn06VlSPhm4EMTdL0I1/TX6WmunFKdV+TGyKEBk
         17EG5TpPwfFZx6zXaxYmCHkmjtJlxAbZx+RN7K3hWDYFCVD4POOGSXwRyZf9boMIMLJ5
         ldbCNOmumN6Hl0WT2Mz8yCHTgXCvaL7J7Aa6r+zxI2l3vDxzF98sDPuV4GzBFMY2SIlM
         WRinTZDitaedt/LXXUCWDOEGyh4XRH/nwTy79ymyT6iJksuDaJvH0XbIAB3G+8WbD7/2
         BPkuvlu1VCXRpjrllIVJL0Tk+eCUDBrmCTglmarJ3rISXKZZmSr/nVbIkHw9zIT7JNDW
         Wp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811999; x=1792416799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+q9oGBkzS41ncs7Ao/HOgObV3o+vZeDZ8C/Hd/pFzpc=;
        b=mIip2/0wpF/z8gU17J18wBwUNrXEY2DvYbj8mflyZPLfuG0jh7MwCwrRD5jvPlfJWl
         U5I+TThxrMW0LgaGdHsKvp8GC/AfY5GkflOZXww5DhPCTPwblMqr1NIaCPHDKcqRMjLE
         EH5KYFGUUw1EndfkAcCtTJGOX0bPh7paG6Y7QxZdw/R67NMLiy6LIw2C2W3TyKTjfCJg
         cp51Szt0crd6hNU5lsm3zFYYNgL6PUZzdsePI5isTGRYkMUq4lBDl7A0Lw4Mxug7vcKc
         duuWxxW/0ubYt6HfwMOHOvKh0F+pYDF2cygyAp/GvCQfCW9yakNDNU9bGE/QjY6JQhMn
         pn+g==
X-Gm-Message-State: AFq9FYKVflwgttPD7Y+WJI9blTUNJPgTmbYY1UIM4tV30l7JuE8zxlSO
	MCDhgn24Wxz418kffizGDQWBWiMIqSpVR9bRtiB2/wSk59iqajk3mtRu1VL/QktZiTxEALVAO6p
	v98vmJy15G5xL8gnCedvEsbVP8+v0c5hdnQ==
X-Gm-Gg: AYBFou0IiieDFZhLjm2lYEzIlVEkR3OXjO2oB5GxJpn7PRNV+ib6r4udmAn2JOOn+X0
	id7lNw0OTAIg4RtShfzD5SFlkIpzffZq70r4ts2yKMtggH1kJCRJIcdsVQZ9CtNd2/53sswlj7d
	k+WBLMhNmltIb9XM/GuyhJd+AKsAe+f4Q4DLwvtO3zRaHbQcg8dy+kBuH7XOozmOe7Zhwq1K2m9
	uot2GYIljw6AfBYwVCXKYzWW3Qt7b3G02JJ/09hc2c3kjZ6mrsOoRlhRLxGMX1qDEha4wXQJVBD
	STRn9vr656hcucI8onlhWPywKj2+Uc+rbF5vP0MURSaSIvP3MoUy4ciIjVe78aG//4MUP9gBDO9
	sd9F/H15VWXqzCA==
X-Received: by 2002:a05:6214:5411:b0:919:56b1:48fa with SMTP id
 6a1803df08f44-91b5d595aadmr139663976d6.20.1791811998768; Mon, 12 Oct 2026
 06:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech> <20261012132005.23909-5-jaipaul.cheernam@est.tech>
In-Reply-To: <20261012132005.23909-5-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2026 15:33:06 +0200
X-Gm-Features: AclHuK8Cd-nNKk7KJ_-VE80_WlqFIO5wtfjQ9M39ssZ-uVA4Q2lgpiL9KVMGytk
Message-ID: <CANNYZj-8Gy+K9MsndHf_BzKh4kZdp9Qsa3aucGQNG+EP=Vb9Bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/18] gstreamer1.0: upgrade 1.28.7 -> 1.28.8
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b0e1c1065da4bd5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247663

--000000000000b0e1c1065da4bd5c
Content-Type: text/plain; charset="UTF-8"

You need to update all gstreamer recipes (including plugins) in lockstep,
not just the core parts.

Alex

On Mon, 12 Oct 2026 at 15:20, Jaipaul Cheernam via lists.openembedded.org
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:

> ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
>  .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
>  .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
>  ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
>  .../{gstreamer1.0_1.28.7.bb => gstreamer1.0_1.28.8.bb}        | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.7.bb =>
> gstreamer1.0_1.28.8.bb} (97%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
> index 61844d793a..aa5db13237 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
> @@ -1,4 +1,4 @@
> -From 27bae0561a09f06375c6c6d1d3fec2a142a1ca20 Mon Sep 17 00:00:00 2001
> +From a4d5aef324bc7e66d293cb500d077b18fdd7545c Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 11 Apr 2021 19:48:13 +0100
>  Subject: [PATCH] tests: respect the idententaion used in meson
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
> index 9752ebe921..7b555352c9 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
> @@ -1,4 +1,4 @@
> -From 00dad437c119cd23883cbef35d2a620ccdf3816b Mon Sep 17 00:00:00 2001
> +From 59403a0c5d2bbd3e00cdf4855f0a2d9761395e1e Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 11 Apr 2021 19:48:13 +0100
>  Subject: [PATCH] tests: add support for install the tests
> @@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>   create mode 100644 tests/check/template.test.in
>
>  diff --git a/meson.build b/meson.build
> -index bffea3b..a51b1af 100644
> +index 4abaad7..b08d43e 100644
>  --- a/meson.build
>  +++ b/meson.build
>  @@ -665,6 +665,10 @@ if bashcomp_dep.found()
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
> index 5637eff7a5..246292332b 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
> @@ -1,4 +1,4 @@
> -From a686b15bf7ec5ca99467f138c57ebb17aa25c24f Mon Sep 17 00:00:00 2001
> +From 9e728516ce60c128cb6666820e5449efc7bcfb64 Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sat, 24 Apr 2021 10:34:47 +0100
>  Subject: [PATCH] tests: use a dictionaries for environment
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
> index eb14d519fe..bb08b116f2 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
> @@ -1,4 +1,4 @@
> -From e0290fc20f52ad7dfc21e8a572587ad826e5b32e Mon Sep 17 00:00:00 2001
> +From 42225b4709aefdd3250be30d79b5646b2c0da926 Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 2 May 2021 01:58:01 +0100
>  Subject: [PATCH] tests: add helper script to run the installed_tests
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
> index 0d1a931ced..01829ad778 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
> @@ -22,7 +22,7 @@ SRC_URI = "
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>             file://0003-tests-use-a-dictionaries-for-environment.patch \
>
> file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
>             "
> -SRC_URI[sha256sum] =
> "787329b2c5758e228a71d926a6dcf960bceaacca3cadd63874ba665dfcda013e"
> +SRC_URI[sha256sum] =
> "baa8e86985ad6417cc0ad6e7b79ff2884c6779c8b1c7a6240e7121822c86e524"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)} \
>                     check \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#247648):
> https://lists.openembedded.org/g/openembedded-core/message/247648
> Mute This Topic: https://lists.openembedded.org/mt/121714557/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b0e1c1065da4bd5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to update all gstreamer recipes (including p=
lugins) in lockstep, not just the core parts.</div><div><br></div><div>Alex=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 12 Oct 2026 at 15:20, Jaipaul Cheerna=
m via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> =
&lt;jaipaul.cheernam=3D<a href=3D"mailto:est.tech@lists.openembedded.org">e=
st.tech@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">ReleaseNotes: <a href=3D"https://gstreamer.fr=
eedesktop.org/releases/1.28/#1.28.8" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gstreamer.freedesktop.org/releases/1.28/#1.28.8</a><br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
=C2=A0.../0001-tests-respect-the-idententaion-used-in-meson.patch=C2=A0 =C2=
=A0| 2 +-<br>
=C2=A0.../0002-tests-add-support-for-install-the-tests.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0.../0003-tests-use-a-dictionaries-for-environment.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
=C2=A0...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-<=
br>
=C2=A0.../{<a href=3D"http://gstreamer1.0_1.28.7.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gstreamer1.0_1.28.7.bb</a> =3D&gt; <a href=3D"http://gstream=
er1.0_1.28.8.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.8.b=
b</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A05 files changed, 6 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0_1.28.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.7.bb<=
/a> =3D&gt; <a href=3D"http://gstreamer1.0_1.28.8.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gstreamer1.0_1.28.8.bb</a>} (97%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-resp=
ect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch<br>
index 61844d793a..aa5db13237 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch<br>
@@ -1,4 +1,4 @@<br>
-From 27bae0561a09f06375c6c6d1d3fec2a142a1ca20 Mon Sep 17 00:00:00 2001<br>
+From a4d5aef324bc7e66d293cb500d077b18fdd7545c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 11 Apr 2021 19:48:13 +0100<br>
=C2=A0Subject: [PATCH] tests: respect the idententaion used in meson<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-=
support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0/0002-tests-add-support-for-install-the-tests.patch<br>
index 9752ebe921..7b555352c9 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch<br>
@@ -1,4 +1,4 @@<br>
-From 00dad437c119cd23883cbef35d2a620ccdf3816b Mon Sep 17 00:00:00 2001<br>
+From 59403a0c5d2bbd3e00cdf4855f0a2d9761395e1e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 11 Apr 2021 19:48:13 +0100<br>
=C2=A0Subject: [PATCH] tests: add support for install the tests<br>
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quares=
ma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0 create mode 100644 tests/check/<a href=3D"http://template.test.in" r=
el=3D"noreferrer" target=3D"_blank">template.test.in</a><br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index bffea3b..a51b1af 100644<br>
+index 4abaad7..b08d43e 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
=C2=A0@@ -665,6 +665,10 @@ if bashcomp_dep.found()<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-=
a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gs=
treamer1.0/0003-tests-use-a-dictionaries-for-environment.patch<br>
index 5637eff7a5..246292332b 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch<br>
@@ -1,4 +1,4 @@<br>
-From a686b15bf7ec5ca99467f138c57ebb17aa25c24f Mon Sep 17 00:00:00 2001<br>
+From 9e728516ce60c128cb6666820e5449efc7bcfb64 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 24 Apr 2021 10:34:47 +0100<br>
=C2=A0Subject: [PATCH] tests: use a dictionaries for environment<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-=
helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_test=
s.patch<br>
index eb14d519fe..bb08b116f2 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch<br>
@@ -1,4 +1,4 @@<br>
-From e0290fc20f52ad7dfc21e8a572587ad826e5b32e Mon Sep 17 00:00:00 2001<br>
+From 42225b4709aefdd3250be30d79b5646b2c0da926 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 2 May 2021 01:58:01 +0100<br>
=C2=A0Subject: [PATCH] tests: add helper script to run the installed_tests<=
br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0_1.28.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.7.bb</=
a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.28.=
8.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.8.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0_1.28.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.7.bb</a=
><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_=
1.28.8.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.8.bb</a><=
br>
index 0d1a931ced..01829ad778 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.28=
.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.7.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.28=
.8.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.8.bb</a><br>
@@ -22,7 +22,7 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.x" rel=3D"noreferrer" target=3D=
"_blank">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.ta=
r.x</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-tests-use-a-dictionar=
ies-for-environment.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-tests-add-helper-scri=
pt-to-run-the-installed_tests.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;787329b2c5758e228a71d926a6dcf960bceaacca3cadd=
63874ba665dfcda013e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;baa8e86985ad6417cc0ad6e7b79ff2884c6779c8b1c7a=
6240e7121822c86e524&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39=
;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check=
 \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#247648): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/247648" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/247648</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121714557/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121714557/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b0e1c1065da4bd5c--

