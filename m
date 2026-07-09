Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A0AC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5800.1783591622486099696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SBS2bflc;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so12971905e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591621; x=1784196421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nunWGqkYZGtZ8pHrMPrwjawo5ti5Ws4QWQyt8QyccU4=;
        b=SBS2bflcVjl5oPiXBM5zoisN7dJhgSS1hV0/wwP1R64KgZ86a6FVz7FuwnKeitO4eD
         B65wPAcevWfA9htTn/zPJNyY1ZwnYCfPz2q9RA6HK6Wcs6Vp++fdu2AywT2U/lQMCsj9
         QrG19PXjx37I2vf0eRxl127E/eUAAs6Y7Y/Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591621; x=1784196421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nunWGqkYZGtZ8pHrMPrwjawo5ti5Ws4QWQyt8QyccU4=;
        b=DerFM7CTgWRdBXe0SLbTgknFMG2tJYMWpXiP+oRkpOWN+zJGQPIHnIqjseyTPAJGOx
         IPLVAQ0MNiGSzwzUfxyBvEk62tvrL2JrBHnrFzofrDKRae2monS+luq/8+ca0nag/on1
         IX3EvpkYYj6HBOlUBKlXbU6l8Xe0cgcx6rv/08UKHgCbPMegQ0aTVcrDnuawavqJ2PuX
         +MTo6Cp5tS2Zx2yrmH+Vvf9lvRf/9cCUKH57NyfZVDrbLF+XyzU9YH/ed8K6FE/3BKgA
         OmKBUQKfYvalQgezlwMghEKdG9zDCYs4M/UstG4J+h7ZzTlSrdB7Ay8gcA2c5wbiTbNP
         PCiw==
X-Gm-Message-State: AOJu0YyWRS+ER7i8di8R1okWJPnpAk5nnEZdV5vY7yMa6L1vY+Li2TXM
	NowbHooYZw9TwWjlmrTwihIhz9lUOueDRkXrYkSMJ+ku9pReifnbSucDAUDy/hz5Nynh5i6NTvO
	Pu6WkGB8=
X-Gm-Gg: AfdE7cmaVfeGloBaZxmu0Ssfhktz8FuaQyZx7sBZrM+rM5LL4E+S0+TVOCMlu5DonLC
	n2YZQ40nJyFzc5pHuyM0UVOQgc5pJJWnq9fC3A7KV8ysUJsT+mYRlv2CrvePRP7krxGXh77qfVN
	uyI8mAqGVal+F8aPQKoQ2LlNZVLC//aNuK6qsIxbD5ykIvNEPWyKXoUpww5Gn48EQJfJ6690ZrR
	CWFRebag3eb2N3FoKpRc2418WkSeNQ1h6ltReFA6t0Eqw+79HcOH+iQh6XITzZyOwdM/fm4d8Lh
	RT3hm02zteQI9DFnmD7dj9/Llkg2mt60PfZ9rU5X+YGuFkiUOBfCz+XT9HNsDhBOaedize3l4lf
	oPFvDN6XaHrkdeTwWN1dtMg94VTutE5x769s5xg1oJ+GYjx2QCIZQo3nzqRlpgIrhpm9+1UImzS
	+zcQ8tnyczG1Ln6XX0hlRaPBwsplO30B6M6TkOAarWzmJ1ChWVq9f8Z2I9UWTQ+osl9lJLW4lGW
	lGNDTDl+qQ0Lpvkua3f1eJFgsX7
X-Received: by 2002:a05:600c:83c6:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-493e6853dbfmr67081165e9.0.1783591620511;
        Thu, 09 Jul 2026 03:07:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/25] libssh2: fix CVE-2026-55199
Date: Thu,  9 Jul 2026 12:06:18 +0200
Message-ID: <2da74d75a8719db63979f132b456afdbd80395ef.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240549

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-55199.
https://nvd.nist.gov/vuln/detail/CVE-2026-55199

Upstream fix:
  https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4

Tested with ptest:
Before: PASSED: 3, FAILED: 0, SKIPPED: 0
After: PASSED: 3, FAILED: 0, SKIPPED: 0

Reviewed-by: Anders Heimer <anders.heimer@est.tech>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
(cherry picked from commit 5b52af4a02849c1ce74491056a2d13e4e3b6ad2d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-55199.patch      | 44 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
new file mode 100644
index 00000000000..81815486ada
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
@@ -0,0 +1,44 @@
+From b5cb1c1781ba5f275485f65855d61faaba6542b2 Mon Sep 17 00:00:00 2001
+From: TristanInSec <tristan.mtn@gmail.com>
+Date: Wed, 15 Apr 2026 14:51:08 -0400
+Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_INFO`
+ handler
+
+The `SSH_MSG_EXT_INFO` handler discards the return values from
+`_libssh2_get_string()` when parsing extension name/value pairs. When
+the buffer is exhausted before all claimed extensions are parsed,
+the loop continues with no-op iterations until `nr_extensions` reaches
+zero.
+
+The `nr_extensions >= 1024` cap limits the worst case, but the loop
+should still break on parse failure for correctness and consistency
+with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
+`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
+
+Closes #1864
+
+CVE: CVE-2026-55199
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/packet.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index 6da14e9f..ebaddae5 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+ 
+                     nr_extensions -= 1;
+ 
+-                    _libssh2_get_string(&buf, &name, &name_len);
+-                    _libssh2_get_string(&buf, &value, &value_len);
++                    if(_libssh2_get_string(&buf, &name, &name_len))
++                        break;
++                    if(_libssh2_get_string(&buf, &value, &value_len))
++                        break;
+ 
+                     if(name && value) {
+                         _libssh2_debug((session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index d6ee97f7ed0..960ff71df2f 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
+           file://CVE-2026-55199.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

