Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6331BC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3052.1787945900538561596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2mloxG4O;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so12301245e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945899; x=1788550699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rwpye9lUAaENdc+WcpCh4MvzamfLFQMxPfzpeZKW9Zc=;
        b=2mloxG4Ov2OyC74x/29dFO9b5NcXGNjJaX0mz4jXFEc7HEjeTmE743BNUNhvhJm7DR
         NAy08OF8XeSamwO7/Dn/SKShJVU3d3bo4sH2+APXaZ1g+1hQC0zCFV5jmRrGIWaG3h0/
         NJc90JNb+UFVwnOmp/h37GEp8xgdNJGzRXJwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945899; x=1788550699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rwpye9lUAaENdc+WcpCh4MvzamfLFQMxPfzpeZKW9Zc=;
        b=WP2pTD5P+6a9HbsKjEw+i1+TuwYBRLfKl0xi/aIyMbnLXFj938AHiADjKoXP5/5oAp
         dhjf41KGoEqBAgrctnDhbdUPKnYW37fBjtxxeIoc43Hw4JoREB/M90ADCzwxW9msZRFw
         4SCYCzo7X6jPmcORREzkhH5hg4qsd0COhqGeGuCA2DI/H8HWXKM4ZlL/aZQkP2edjMR+
         s5kwVb9K7OOLAclLDUCBmX8bq2D/Gv0HSX4Soi6VkVHtOioIB/1mkL2MDQD8MttATuZr
         ZdaiFoHufwIGW8m5SrZyDgW3mN/GFmpF4LfM3Ih18GNagzItNGjkNcywyNs3m7OwZNBV
         xvqw==
X-Gm-Message-State: AFuF++kblpC5fdkbtxV9CuTbnMp3roipXS2GYHzdxY50lO3FlcYL2LfE
	J7LPhtrPZET4Abk8+brm6lTgtjHPFwnpdo3cAqTf8bpgF3DOlrtPaHVK5jlLFbsUBM6DoquMdw0
	VLjQpn2c=
X-Gm-Gg: AR+sD12VTVtJ5RyzBDltUpTOHKbXmafpGTylFtlEsIN8AUtMTPLL8vNZ5DnYu0LGss6
	ts5yoaW5ugDFXUNUPBQyltWo6g/IUoqU/ludwjBa8d7U70B/1WIoFvBrW7s9oAF2MS8CXTaJbbZ
	nqk7J6ML5Is6FJaTT1tI+IpmioeE0JZEwM3RK+5IHZm9glGdAMB6YkpTIYnmV/VQK6Xidj4zyEb
	LNf2ltiT2IUUdsmjSuzaxxNCyz6Ux1xnv66DMkEyx1b05qYunGToGbanl8ur7exssPPTHd57drX
	xmFWQE2P8HUMEMTUZtZHr14qGPrTTYLz9q9WUU1SECG6vEszKDLHvv0rw6KNMF1JBN9UN0U7tDM
	MFvc4b3rH0AVoXYkpYraQP2Inijhfm5KC1eceOfiGTSpugTJFAw0sSt04BgQ6STclohuE13TkjG
	1St6FPOzS/9nDcJKyCjjWyecDDR3CKPBaCWT5Ab/MjJ+UdXrEZlmI/ZMfgj14Xo6jBJ7ukY1j4/
	db0ynAm4QFcVZ0JK0lzKTAdYLrrIBOPdYRAIcGPaMsn43A4XjNfgtbSAWPshgfl
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr154272605e9.10.1787945898774;
        Fri, 28 Aug 2026 12:38:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/56] gstreamer1.0-python: upgrade 1.28.2 -> 1.28.4
Date: Fri, 28 Aug 2026 21:35:35 +0200
Message-ID: <d74ddaec2c26dd6f752af285c8ae8c67f8ad0929.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244586

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 097965cc4e9bdeeb270a8f0540feb980996da357)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...reamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
index 181e3d8ea45..555b3105942 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "12fdd8e19af97d797a6b2c195228e6c9edc4cddfa68274912b78ef66068ad822"
+SRC_URI[sha256sum] = "c4eb382720b4443fb801a53418dff0bd4cd7478716d5ced493504a675b4d09fd"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"

