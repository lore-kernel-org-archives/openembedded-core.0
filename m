Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E345DC636D4
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:31 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.103.1675289784136665074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4c0emtMt;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id a23so573517pga.13
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5/MYm2XBHkCjCgBBVXlDx/bp6zu1EzeuSx3AmJo/z0=;
        b=4c0emtMtrGqqzPUN75iizlmi9ACbsnVJiadABXla2YTR1GEk/uhb7MEwpfMxR7KF8d
         RhQ9qqdd8sJNOFTXmbfbYrMgmz9dj/pdLYkDpeMrv0RRrDsR+HGPvaABu2CCMfI7REZr
         Nv0DxUvS3qjv9pC4hGFXyUvrAbv2w5JRG23BTABgNV4knr/5nilBQEvTH8FaBmHBRnhK
         bXMv5Al14hqf24OPP3iFxRifXMqa7OnaLcpuN53qEURXhB6nf1tb2RCEzAxu8mPlLeBD
         G5M+tVCy2wsRsRHTEwTWlAZFTd6s+8YwEDMBSFUOA+esFCKXWtgaenMbDaNcW7H2TTip
         H8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5/MYm2XBHkCjCgBBVXlDx/bp6zu1EzeuSx3AmJo/z0=;
        b=iBRHfb1j7U7RKf+biKKh/x7ImkxCKD7PI8IDY8Q86FJVUG511UyCAfNGxJI0VRptuL
         6HSwoRjWdyguZsydyRdhT7RNob+T+Xu5V/iI7pbFA2hw/fwnO8aqtd686FPj8uPUNgUm
         BR3v8qHPo2awX/0y4yYQdNttW2soAUA/aaAui8g9ebabCfC8khSWsORg3XwzqnuAddDo
         NITLxiVHXTV3Xb3GHsZylgGaZUaoV2KV3YtRyQDQM/bgR9t+UgymtqyX7FN/qu89iHG5
         FtgayIw5SlaDrGBpc2RQ4NP4iuD2swwDdpOdmolAdJcih0q9UrLSxclt8SASY1o/QipY
         qoQA==
X-Gm-Message-State: AO0yUKVoVNbi856mk4gQW5VobGk2rTfJ3AZRZKULrT1Q4Rq1IldRT9PF
	61Gj3BaCCXFA6BF+6frQiQQdZVSSdoWHL5j6YbY=
X-Google-Smtp-Source: AK7set+MROk5lrKu8KLUtKi01FTucPF2lW4YiH2p60N3jc7R+bKtCcJBa76rSjdkNO61GptoTrKh7Q==
X-Received: by 2002:a62:1c88:0:b0:593:b115:e2ca with SMTP id c130-20020a621c88000000b00593b115e2camr3218953pfc.9.1675289783221;
        Wed, 01 Feb 2023 14:16:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/13] ppp: backport fix for CVE-2022-4603
Date: Wed,  1 Feb 2023 12:15:57 -1000
Message-Id: <3ce605e701c516ee46b25fe5bdb0b8de9fc2a29d.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176663

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


