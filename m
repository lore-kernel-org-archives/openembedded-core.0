Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A35CC05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:12 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.24348.1675260847512144419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7S/FwERu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id k13so18628719plg.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5/MYm2XBHkCjCgBBVXlDx/bp6zu1EzeuSx3AmJo/z0=;
        b=7S/FwERuenxMewmwXW8YHvIotsvxFL2UAvweaKAzE+/7v9HZB4M7wNHU1CiLWgf1sd
         ygk5kb2K9SguKg4ixMai1ISbQ+0gO5Rf826ckLDSIEvOxMTgtPSlE0Wg47PrmOo5mVZY
         THinWWtZjnK+cZy/YqnEutw/XUkXFJ7CpApdTX7yspVq1L/lwWlJJR/4dIDfeH/eX7l1
         svXhxnhM0Be9ALqspDQVwJbY4+nvNs5RzMELHJ1J8jHZQ13LPUdGHbqTXm8ODycdqcU7
         prez6nITJuT6Cdf8QMq0wBSzS883gkedsc5WV4dFY1TvRefyh5a3HvKDO/0TkM4jUtOE
         Lk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5/MYm2XBHkCjCgBBVXlDx/bp6zu1EzeuSx3AmJo/z0=;
        b=Mm1ECZMYMEktfJw/Yd6TjdjCxzX6hi4pDE6MfA0ykhcVktMXf8VDjjgf8XUc3gaM94
         xSIDvCXM6AKm7IoaP3nK56ZqePv8L2BKaOwf6l7LwPdoQzgLW47K5A7hJovfftXu1/RD
         NDbHsad7LnndUx/OF8lKF4M7w6H4vgEeDnOVPhXtA4JGyZihZQhJ1gp2LmeHdBC2m/kp
         coqicrAB0cxTnBUY8ZGBPTenvT6xVF3UXAhsNkKE78u1iFnP2ji813UcitvIqf4j+aue
         ITUxG4rjnzB3+hAvpyoaRh9xK/IQgCpyzmXtir2jI35Uj/xFnvsZkXayw/HDqIjic9kh
         BeFg==
X-Gm-Message-State: AO0yUKU1cpICOOHKIzLyOKEPTvaXyCUZeulaExZ8EBCrdvUMKKF8fC1X
	gp6VKTnvtqYBHLdJ+zjEaO9Q31kSPXql6QjJzA8=
X-Google-Smtp-Source: AK7set9MF8Bygslf9XEXvuMWH2ERtLzblmvPZnbIud+IFI6g8m/8rJ6hxIrQJqXeCgf/KTEJMFnJ+A==
X-Received: by 2002:a17:902:ea11:b0:196:1f80:106d with SMTP id s17-20020a170902ea1100b001961f80106dmr3246473plg.9.1675260846526;
        Wed, 01 Feb 2023 06:14:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/17] ppp: backport fix for CVE-2022-4603
Date: Wed,  1 Feb 2023 04:13:40 -1000
Message-Id: <4af92cb7c94a26fae56ae3915ce5b3070a5eadfd.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176537

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5d787b44b102e3a69e28948326e39f83fc1d98d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ppp/ppp/CVE-2022-4603.patch               | 48 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch b/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
new file mode 100644
index 0000000000..4325b1d6b0
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
@@ -0,0 +1,48 @@
+From a75fb7b198eed50d769c80c36629f38346882cbf Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@ozlabs.org>
+Date: Thu, 4 Aug 2022 12:23:08 +1000
+Subject: [PATCH] pppdump: Avoid out-of-range access to packet buffer
+
+This fixes a potential vulnerability where data is written to spkt.buf
+and rpkt.buf without a check on the array index.  To fix this, we
+check the array index (pkt->cnt) before storing the byte or
+incrementing the count.  This also means we no longer have a potential
+signed integer overflow on the increment of pkt->cnt.
+
+Fortunately, pppdump is not used in the normal process of setting up a
+PPP connection, is not installed setuid-root, and is not invoked
+automatically in any scenario that I am aware of.
+
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ pppdump/pppdump.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
+index 2b815fc9..b85a8627 100644
+--- a/pppdump/pppdump.c
++++ b/pppdump/pppdump.c
+@@ -297,6 +297,10 @@ dumpppp(f)
+ 			    printf("%s aborted packet:\n     ", dir);
+ 			    q = "    ";
+ 			}
++			if (pkt->cnt >= sizeof(pkt->buf)) {
++			    printf("%s over-long packet truncated:\n     ", dir);
++			    q = "    ";
++			}
+ 			nb = pkt->cnt;
+ 			p = pkt->buf;
+ 			pkt->cnt = 0;
+@@ -400,7 +404,8 @@ dumpppp(f)
+ 			c ^= 0x20;
+ 			pkt->esc = 0;
+ 		    }
+-		    pkt->buf[pkt->cnt++] = c;
++		    if (pkt->cnt < sizeof(pkt->buf))
++			pkt->buf[pkt->cnt++] = c;
+ 		    break;
+ 		}
+ 	    }
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index 700ece61dc..7e3ae43b58 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-ppp-fix-build-against-5.15-headers.patch \
+           file://CVE-2022-4603.patch \
            "
 
 SRC_URI[sha256sum] = "f938b35eccde533ea800b15a7445b2f1137da7f88e32a16898d02dee8adc058d"
-- 
2.25.1


