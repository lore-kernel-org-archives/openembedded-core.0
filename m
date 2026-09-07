Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767DEC79FB2
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34920.1788788157634500821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DlFncPio;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441a2ba14so3128682f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788156; x=1789392956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbJEenHJTgzjq8aKyuDVIPlbcVrK0u2r7YzPX8IT8+k=;
        b=DlFncPioMpMZWR2lNQF0fCISPPheNZg6lqdEh/gmCyiUESsWE74Gb/HqLWwpxiRaTJ
         gW91FuNESLWzLOxAoogHZ00vnbx0rvB4lyXFDG+7pcnkGnNlVfXzSu2BorkUw1CgBhX+
         reGOwfqQRBpOHGPS1ZkSbycYd/QEZmMbzJS1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788156; x=1789392956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbJEenHJTgzjq8aKyuDVIPlbcVrK0u2r7YzPX8IT8+k=;
        b=HiJrrNGbqmihgR1lNkY8O6pA6f2Jml3ZKJUljFwMeHEm4rUn8Ecv6nDsampAcynn5m
         UTW6m4aIze/e++QmNNjawxcPmlF+K1EaC54i5hXbMd/YPNRa7xsUYQPRGvsczV0tcYff
         A4pNVxN0m7hIKKzVdyPp8fTul3z5n+X/dp5Kx4wrtDRhbUuz+H4c4FK6PO2RrrR2nSoE
         Be7OypixzhA9NmSXHl+jEaf/dfsy7Naio5bc/C5vcDyytoKIHTWAyYXPlLv2X7IjXRcm
         IU8lKGINoIEJKiR21jBUCU+GD7O9Loty2Y89p8jr16a9N47KFRwJnM+WHyNEzEF2JhNc
         B5uQ==
X-Gm-Message-State: AFuF++lvKsAr8ANBHYprRZJ9jviGz24rkNalt038fpfCxphW7uUTvssJ
	EPfIq4kMqpiyI9lfGznyw+ScFqTu21qUjR0gwbinaYBf8WPctxtCn0RyA6MjRJub50/fQhGuCDl
	e0X8Mh0o=
X-Gm-Gg: AYBFou0U70zpZCoNSm7B8sKAx7MO+7ij9jQTgNMcHYbLC/63ryVzECUigq9+t0HKuOt
	Cs4ZRK9ekvEUgdwPbGlsucEUtrwvQzZgk48hJMR7veD488jk76s3fxt3VDA0f9y6fHw9ybtSRVl
	x6MGzmdLZMWyWFNjfDqNzsQjO2Dwc+wJbk79yUJyYnVSjk2w3PtqlpiM6MAjjtG9o5/xXLKPzL5
	LYm+0KTAlyFsYTLZsEcefgJZekEG85DOaKwDKpYAjuLFsXgQunvWAJ2EzJYNrC7YU2VoahWKB2f
	BcvW1eaQeh4rhbeZFZIVD40xK0/e0nwvNt8k+WF/GHU+Ft6hWzh6Oif5BMeUXaECWklWdM5klCS
	yeThuFTWru5G/BPp//REZTEK6GG+ptjC+B23RGFNJODj9HqmysbBsBbvFZX07ogbD0QQfg4Z09v
	xYHpXfneeemTBiQxQoApCY8AOMaD6OTlMg3bOscMLimErYzA7yLUUNeFtgcbcuFjD0UFNTvCGsh
	F4rOdGPdAaqHm6x7iyDhtLEr5sSfv+0Q+lSlItMhvsDRJAGSSOXVBSZJfMfhRxX
X-Received: by 2002:a05:6000:46c8:b0:485:847f:fd8b with SMTP id ffacd0b85a97d-48587091978mr18364235f8f.5.1788788155886;
        Mon, 07 Sep 2026 06:35:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/35] libevent: merge inherit statements
Date: Mon,  7 Sep 2026 15:35:05 +0200
Message-ID: <d7da98bea1a60b2f31806c9f2dd4f499737b22ad.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245267

From: Pratik Farkase <pratik.farkase@est.tech>

Merge the separate inherit statements into a single one for
improved readability and consistency with OE style.

No functional change intended.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 99792ab6ba188a7623804e587edf8de23690ad3f)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index be690fe94e9..32c61768d93 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -28,13 +28,11 @@ S = "${WORKDIR}/${BPN}-${PV}-stable"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
-inherit autotools github-releases
+inherit autotools github-releases ptest multilib_header
 
 # Needed for Debian packaging
 LEAD_SONAME = "libevent-2.1.so"
 
-inherit ptest multilib_header
-
 DEPENDS = "zlib"
 
 PACKAGES_DYNAMIC = "^${PN}-.*$"

