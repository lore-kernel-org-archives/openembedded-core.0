Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973B7CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:28 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8236.1778224347529930109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xUgbcpsM;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1462457f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224346; x=1778829146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TzJmZ8K6jIbzEZWR8y2IDNrG5pJxo7Ge+iSF1RNnLE=;
        b=xUgbcpsMVqBwaaOSOpQCeaH5vaMgh48gBI6GckJs/9FnNoSmzm7nbhRRpEhtNNMvCY
         oSjPpe9RlPxaRM4YkrQq5bU0GoJNKa0caQz4/epPfCk0tfGKhFmwmfn7G+p4wpvsbkG8
         IhxeRUfGefBzt1sTOze+HzOkkuMAWZ/0pJVr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224346; x=1778829146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/TzJmZ8K6jIbzEZWR8y2IDNrG5pJxo7Ge+iSF1RNnLE=;
        b=Q0BEAzfuhvsVmFzSwIa0eMp7sVOxUxhPfAIwx+YboN0t918PjIHLNvsC0rK0aNnNyz
         jm5Dp+1a4xM317/sQRrURnvM2CpJndhVs9ZSS50l0UBuuxntyiXGHBsR0hip/SB5bqp6
         kB9pHtdo0/r+nV5a5bq8fv7017PMlHlgiVNW1/7YLVhDhbDVdtFEhVgCvaJkIik0JYs3
         tSQ60lvXqy7I+48zxqoXF3FNLwFQxX5M0yH7/rjVBTi6FM0KQQ9X33Xd8otzlmoSHpi+
         P2cBwQX97eLFo8Q10sbGLX15OkrBFzkorbNjeFbQKVcUr5vxuOPnO2J2cuE0rw6wwtKP
         /hwA==
X-Gm-Message-State: AOJu0Yw7g4GFY7zKkNrOIiDqJQ0odbPe+9duVG9TAGoLmrJ15IdGv/2k
	IDr1h1zJEnG0vn7HYRsWiPoasVTxQFhigUwm0csxqdiZXTQTMxa0Jri3OzwR7nuEM8OhWerSQKc
	fZFzTXw0=
X-Gm-Gg: Acq92OEGBqZgs31ES+rntc/iZ+KfTLrF/hxfDnYmr5d2WlpXzIjScb8Mzb+RdMiyqyX
	XSr3N3L1cLD4eRtZ+arcNARnJAxHBitpDo8AjupXT5SbG9XfLAenixKcUgi8E+k9U4r0bsSGB4v
	sjI8r5F+JjzNttxAef56GkChOA2N9fD+ejmOyUYLP9OOP0en8xtbQc4GorfZJvTeaL6NMxhPdtM
	AyoNH9NgZwDYE7p/wpfwX2lXaOSOq495Q3Ndu7po0wFyxTIwEBPXXdDMVbufrf9EXkzbeWcP6Ti
	WHMxevFTlbp0gxb3bhM9h2cLzBGPbidkvYRDbrX4CQyfJVoPFAPP0u4PAkK1MJ5koLOORmtWcTv
	Y7FeyQcTozSQkX0oabHEitovd7dDm3FmdhN854q2RzUkDmq8PAxoDCPbuK3VtUTRtMRNWwpW2f/
	DVoOFpUwNHDSK75DV0MogP06+FX9VCptKhXoTfOfKu1jffieN18wXMhkkJhJHvWabbPb+ftJGab
	G0UfhhO/8vH2Rw6Z+DroTC5JaZxKB7GT6tMaw==
X-Received: by 2002:a05:6000:2c01:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-4515ce1c515mr17041563f8f.20.1778224345370;
        Fri, 08 May 2026 00:12:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/52] dhcpcd: upgrade 10.3.0 -> 10.3.1
Date: Fri,  8 May 2026 09:11:14 +0200
Message-ID: <e9ee4f9aec12e383043c5784eb617b43ace3510e.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236663

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- BSD: don't send uninitialised memory using ps_root_indirectioctl
- Fix fallback_time option
- IPv4: Ignore DHCP state when building routes
- options: Ensure ldop is not NULL dereferenced
- route: Routes may not have an
- options: Ensure that an overly long bitflag string does not crash
- options: Don't assume vsio options have an argument
- common: Cast via uintptr_t rather than unsigned long
- privsep: Ensure we recv for real after a successful recv MSG_PEEK
- DHCP: Add parentheses to macro definitions
- ipv6nd: empty IPV6RA_EXPIRE eloop queue when dropping

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6b19f10275be502a9602f51b6227e4a51d6c8fda)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/{dhcpcd_10.3.0.bb => dhcpcd_10.3.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.0.bb => dhcpcd_10.3.1.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index fca7d8b11d9..c940d6806a6 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "385ff246cbdbd1627582999f7705bf9ef2ad0d7d"
+SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd

