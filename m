Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A102EFDEE27
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 16:31:44 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1753.1776961901253119038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 09:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1XlMRnhe;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43fe62837baso4199156f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776961900; x=1777566700; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7DOClsvOjLsCc6OsbkRnfgpWAOILp/z7mUvmRrlXE8=;
        b=1XlMRnheo2YSloJwf4slnnUmC/am6rzrgujA+CHroL8vsIFV20cZplKq0A016MSSeN
         ai7yBB4a2MgZfgsEpaZG5JzdvTJKswwXqEoDYowXJBqTaS9AUhQMx71CBByhTiUQM7TH
         qppOwwjSUAOO+tMw1HAck8n344m4gylvui2qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776961900; x=1777566700;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7DOClsvOjLsCc6OsbkRnfgpWAOILp/z7mUvmRrlXE8=;
        b=Wx9+ExefmbuK7S6y9Ij0EEKoqPLITcXffB6rOU1CZfVS/74eO9Rtn0OJjXsGPM9P9S
         ksg4c/rbXJ8BI4IoQg4qqv0gGfEsDFngF+ECxy/P9G2Bdh4vxCkJKM/mzSEc+/kASV16
         o9ZdqDfXKuwuY1VnGP0FurLK6ZeGJPjif0rcGnQyzi8aIRTFwszHNeLBCbKLcdNzFq+9
         ASabxdHkVVZIVBfpqgS+MkaAVd/Y2WYJiliNfTJAC+Jrz7PZf5prZU3m/8n4HPOfbV+y
         PKoeVIpx9++BRpXW5encKnkbbTjBPMNaoFRLtcRhL9oqvpRcoYfns3LDH0piaCHdfbc/
         dHIw==
X-Forwarded-Encrypted: i=1; AFNElJ9h1UFQbBsZ68XBc7M9Sow9ePaqIeRl2hulRCpdmhFfZGlaHpeCJ06BoXQ05GqHAPThICfG7oz+f2xEcJFzjljjFQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxczhBK44ErFuNjox100AGuAI6PTEWjVgqc47FLxBrx7HmLMWUc
	aRU42+gmmRFaEqRI0Enn5KvppC/Zx0Zi+yMtahhx5fa6cJrBQStTk35XKHKEOKJayNQ=
X-Gm-Gg: AeBDiesgoRT96VRm7kqSFSn1nHMz+oagIgseCtZGuszSToYMHcWWgGBqfHbiahXL1wS
	MN24F6oGGQf2Kbs2P9hjtWaZx724RLL1q2BuPD/aZeB/VYGbPTXHeSh0/hlAUVJCjJowmLZjpyg
	OgA9/OUiYbnvKupaQl8AqJ9X8O/Gf6Swaij0a9tvmd12Mscb23vUZ/0XJFXlBgM2E+2dbyny5JM
	L4vMeX8d70j2NLsN/T5PN0pwkp0hiqJ+TMqpB8V2O/sU2Vu7V1srpJHfe9zsN2oLxXemjE5moPe
	Y0aTzHzlI0xMgBT0fcoHOhBIbBGlIb9VhYWzgZmJHAgBPOfrAqCp+hJyNkAKoRwy07dfcjzFhE0
	Js2219Pek5RwH3Zw2pitj2C8Qs+bIvHgC4tDYM/b61JNhxi3ffNErsiz9RTIh2hPt8mjhnc+yAL
	CLLjyX+9qNrKu04C8E07GgdrdE6khGCEeMUKsVZoUvjWgaeybl5JzNQJxMHNxMdQvBKDmAZ3TUm
	r5Ea2ByD+0wEEfYbGtwCtHsFQ==
X-Received: by 2002:a05:6000:1785:b0:43c:fc5c:a9fe with SMTP id ffacd0b85a97d-43fe3dbf4e7mr42932948f8f.20.1776961899558;
        Thu, 23 Apr 2026 09:31:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a174sm59766174f8f.18.2026.04.23.09.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 09:31:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 18:31:38 +0200
Message-Id: <DI0OF6SCE4JM.18FLPYAGD4YIQ@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <ashissh7@cisco.com>
To: <pahaditechie@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libsoup: Fix CVE-2026-5119
X-Mailer: aerc 0.20.0
References: <20260406153247.660851-1-pahaditechie@gmail.com>
In-Reply-To: <20260406153247.660851-1-pahaditechie@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 16:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235826

On Mon Apr 6, 2026 at 5:32 PM CEST, Ashish Sharma via lists.openembedded.or=
g wrote:
> The msg_starting_cb() function in libsoup/soup-cookie-jar.c added
> cookies to all outgoing messages unconditionally, including HTTP
> CONNECT requests used for proxy tunnel establishment. Since CONNECT
> messages are sent in cleartext to the proxy, this exposed session
> cookies (including Secure-flagged cookies) to the proxy, enabling
> potential session hijacking.
>
> Fix by adding an early return in msg_starting_cb() when the request
> method is SOUP_METHOD_CONNECT, preventing cookies from being sent
> to an HTTP proxy during HTTPS tunnel setup.
>
> Backport of commit 781b08c1b9093626dda077450c46d07d7220984e from
> libsoup 3.x.

Hello,

Please add a justification in the commit message as to why you think
this is the proper patch to handle this CVE (In this case, it look like
upstream says so and we can use that)

> Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commi=
t/781b08c1b9093626dda077450c46d07d7220984e]
> CVE: CVE-2026-5119
^ These 2 lines are not used here. While the CVE: line don't bother me,
the Upstream-Status: one should only be applied to the added patch so
please remove it from here.

> Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2026-5119.patch   | 37 +++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-511=
9.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch
> new file mode 100644
> index 0000000000..311380bfff
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch
> @@ -0,0 +1,37 @@
> +From 781b08c1b9093626dda077450c46d07d7220984e Mon Sep 17 00:00:00 2001
> +From: Carlos Garcia Campos <carlosgc@gnome.org>
> +Date: Thu, 27 Feb 2026 11:05:00 +0000
> +Subject: [PATCH] cookies: do not send cookies to a HTTP proxy for a HTTP=
S request
> +
> +When tunneling HTTPS through an HTTP proxy, libsoup's cookie jar
> +attaches cookies to the initial HTTP CONNECT request sent to the proxy.
> +This leaks session cookies (including Secure-flagged cookies) in
> +cleartext to the proxy, enabling session hijacking.
> +
> +The fix skips cookie injection for CONNECT-method messages, which are
> +only used for proxy tunnel establishment to HTTPS destinations.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/781b08c1b9093626dda077450c46d07d7220984e]
That commit was not merged in a branch? Maybe it was rebased during
merge. In this case, please use the merged commit URL.

Thanks!

> +CVE: CVE-2026-5119
> +Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> +---
> + libsoup/soup-cookie-jar.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/libsoup/soup-cookie-jar.c b/libsoup/soup-cookie-jar.c
> +--- a/libsoup/soup-cookie-jar.c
> ++++ b/libsoup/soup-cookie-jar.c
> +@@ -824,6 +824,10 @@
> + 	SoupCookieJar *jar =3D SOUP_COOKIE_JAR (feature);
> + 	GSList *cookies;
> +=20
> ++	/* Do not send cookies to a HTTP proxy for a HTTPS request */
> ++	if (msg->method =3D=3D SOUP_METHOD_CONNECT)
> ++		return;
> ++
> + 	cookies =3D soup_cookie_jar_get_cookie_list_with_same_site_info (jar, =
soup_message_get_uri (msg),
> + 	                                                               soup_me=
ssage_get_first_party (msg),
> +							               soup_message_get_site_for_cookies (msg),
> +								       TRUE,
> +--=20
> +2.25.1
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 7e00cd678a..364e8ec391 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -41,6 +41,7 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsou=
p-${PV}.tar.xz \
>             file://CVE-2025-4476.patch \
>             file://CVE-2025-2784.patch \
>             file://CVE-2025-4945.patch \
> +           file://CVE-2026-5119.patch \
>  "
>  SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03415=
3df1413fa1d92f13"
> =20


--=20
Yoann Congal
Smile ECS


