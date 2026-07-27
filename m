Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD452C54F4C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25495.1785134527903008951
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XTKzgr3d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496b7622a83so8824205e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134526; x=1785739326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=foTT+S1TnBZp2SJpY4wDAribQwkv22ff8hyIWuSde8A=;
        b=XTKzgr3dt7CfP19fY6JfEuci08amprxxvp/vEgoecOcYyWOGVBFaQCjCuyqnlDrRYe
         GL4eCl4IS5Xo2lBuwk9+8XCUtWKRnwDUP3dIb3vXSPHVVJJsWbq/bUXQCPLsEaW47I0P
         yZqDTYY6212JczOmKNql1eBH8U3CtYeCyCFVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134526; x=1785739326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=foTT+S1TnBZp2SJpY4wDAribQwkv22ff8hyIWuSde8A=;
        b=VD1wC2uxMLSf7Oaw/7COteRmKF0v5CoLtOCnm2/sswLDtgabG2VVNxyDg+YZOXvMXh
         1toSHudm3GcIsC/u7iBMp9tiKFbA7vy6LMhwyGWFvnxl3HiU3rjf6aG4JKnwtGKaIkgI
         v2o+iNOuWSwl8kEZlMOOldKn6+P7sTqMimlTfQ4IQPGTZMKEabGYt8WDUTwL/X44uBpD
         TFquyRqmMu4hQ7zNoqUwscxKbtd3AeZ2aon+sZ6kGcY8D45dzbLBcel1KXSx++FTvjyy
         IX9KZqQ5MiDuFU0sR9Ypi74KCaFIOEJg5wmYxgrBVn5+O0jT+hUjYGmknWmPJN0wr87c
         TMGg==
X-Gm-Message-State: AOJu0Ywxb82UW3EG+O4xvLE9L2oQUxdilblr/yL4OJO+LevYwbNYhPQg
	WavZkgC0SyQ+HFkKY0R+16FBaNm47blNVrBrhmoYPqUgbS3wnz1e/5cN2pVvN0WPJmwVSK0cSpx
	M+6PA+zo=
X-Gm-Gg: AR+sD11RmkfoZjG+BrZ71DCaIjT6fxT7NhjxpL/660iIsNgCgG90heDNM+LpPk511RG
	RqfVjpR5FSgGyXvw+1RMOylHcDBaHlaq2wecdUfd5CPHy2hRJX8sge7IfoGZOdsUbPlyx7iRemW
	mA9Bxh9EhmmmYYPCO3teVYrC5/WkxMFRQl9AEBEn1CeeXI4IF6D6MerLK2tw4lT0ZAdfk4h9KZZ
	fznTJAkvwO0pN2kxXiXofzk4Iq0lzWQ59wLOi5FKibRc5ydBLdlb5WRvZs1CeFreMOeLBUr12uk
	7q7adB1/OPT21TE0Z4Za25Ho7E6y/2nHnVwyZSI7ZOv0Py7iLrkPyi7RuUMXlB6ApUSrBWBDrZy
	QN4o4BNYscUmzdxi8rpjDbnvC4PcADax4wT1zAgNdpBO+fnfoBmXg/5jnoiiEJbf2xCiNQuV57w
	tdVRm7Hq8AYpaatJNvg3U2sewdOTKfcw==
X-Received: by 2002:a05:600c:c177:b0:495:4056:9473 with SMTP id 5b1f17b1804b1-496b5754455mr95369115e9.28.1785134526145;
        Sun, 26 Jul 2026 23:42:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] dropbear: upgrade 2026.92 -> 2026.94
Date: Mon, 27 Jul 2026 07:41:54 +0100
Message-ID: <20260727064158.3784068-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242043

2026.94 - 23 July 2026

- Fix scp build failure regression from 2026.93
  The new ascii_isdigit() etc wasn't linked.

- Print square brackets around ipv6 addresses with ports, eg
  [2a00:f10:400:2:1c00:bcff:fe00:1c6]:22
  Patch from Seo Suchan

- Support longer paths in scp.

- Avoid some build warnings, add increase github action coverage of
  config options.

2026.93 - 21 July 2026

Note >> for compatibility/configuration changes

- Security: Fix a use-after-free in X11 forwarding that could possibly lead
  to memory corruption. This is vulnerable to authenticated users if X11
  forwarding is enabled. By default X11 forwarding is not built.
  In 2026.89 the server is running as the authenticated user for X11
  forwarding, in earlier versions it runs as root.
  This removes X11 "single connection" which has probably never been used.
  Reported by @peter-pe
  https://github.com/mkj/dropbear/commit/882f83806d5e133037cd28e954a878984ef7b9c4

- >> "permitlisten" authorized_keys lines will now be ignored if
  the port is invalid (>65535). From Basavaraj S Maneppagol.

- >> In 2026.92, the configure option --enable-plugin-deprecated
  wasn't correctly renamed. This is now implemented.
  Patch from Alexander Dahl

- Two factor auth "-t" is no longer deprecated, it will be kept.
  The "DEPRECATED_TWO_FACTOR" option is ignored, and no longer required.

- Fix out of bounds read during utmp/wtmp log file handling, reported by
  Basavaraj S Maneppagol.

- More robust handling of ascii inputs for some platforms.
  From Basavaraj S Maneppagol

- Convert manpages to mdoc format, from shrub

  [Updated 16 July: This is no longer planned to be removed, future releases
  will ignore DEPRECATED_TWO_FACTOR and always enable it, like previously]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../dropbear/{dropbear_2026.92.bb => dropbear_2026.94.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dropbear/{dropbear_2026.92.bb => dropbear_2026.94.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear_2026.92.bb b/meta/recipes-core/dropbear/dropbear_2026.94.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2026.92.bb
rename to meta/recipes-core/dropbear/dropbear_2026.94.bb
index 4d9a9e10ebc..dd9863d96d1 100644
--- a/meta/recipes-core/dropbear/dropbear_2026.92.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.94.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e"
+SRC_URI[sha256sum] = "e098034a843699200c8c977a991fff73159735bf795d5f72ef672c41a6b1ae81"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \

