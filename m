Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1276FC53210
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:06 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.16161.1672594966040515092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zA2Yztpq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id u4-20020a17090a518400b00223f7eba2c4so26300511pjh.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ErfZtTWLGQZ3liRau4NfU0GBevBj3UKDD3IZmaIhsQ=;
        b=zA2YztpqQI8xJZ1q119q8DPyiPlwkg9L1MzLy87W07qilVjnJCWJMQtjXbd6dn5sAN
         uuQasMDBSvvNnQNHB8xs/o2rPk2AjSpODh3th3eIopwYr3rcG1cUAeUhDjh5Rbnv7lYt
         EqvacqBRnKZRFS1O5gTBYvSAS9wxKogQICNifIqC+wxPbbEsJ7GoIsccrwl7gEe63uE/
         8e3Y4/FX5baL01fF7/2Uxq9M1vJHODynxrGYpA48jixWBvLD5tS1K4gDwN5Oemvly5PA
         IaalGgvnB5mosM4/curUIoufKO3WSN5siNgaG2eXx/V6PqzLxEXMgi1zEDbszuSmc/31
         WIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ErfZtTWLGQZ3liRau4NfU0GBevBj3UKDD3IZmaIhsQ=;
        b=pJUZeqQMde/AgqhbKq57qo6O78zmLQ6xC1kApZ29nXIhTpaQlhw4y5XlWzurf8eSrZ
         ZFSC7aU9iAUbnMF5S5Mk9kdLp50um8Px4Ib18fyAR6MUMyL/6nZEa2z46XJIeKMQZrw9
         6LHtmMWoFv1DdBjL1J4GLxEYIl4LSnLYxD/MX63wnwmIUW/etWo+JLxsZ9Chf7FW5WTS
         dPSOxeCiAgiM6T35WQco3qBTj8vrhTGswXsOJRoTEYumaHLuNjgvqxMhiGjX5GtHmuMc
         dvJxpMMXwCpeMtcQBWBl5ud366Zl/akKThKKbUua7y4ecdh2BeQUPq1Jo7GJpSFRKcOF
         olWg==
X-Gm-Message-State: AFqh2kqiiOoZE50urv52ID0pkqzITaW1nOWr/N9O3NKQ3TKq1PWFWhRc
	OtuhVfgw+Eli4KI+p7/xe82QNHCxVJens+2mUzM=
X-Google-Smtp-Source: AMrXdXujK72e1iB2yT1Fa3aBsUNjZW9L2T814CCWDDQT7OMQq8kk2dPKaQBeJ/ZkZK+t49tHS3BKzQ==
X-Received: by 2002:a17:902:ce09:b0:189:f7c2:7245 with SMTP id k9-20020a170902ce0900b00189f7c27245mr47798514plg.45.1672594977296;
        Sun, 01 Jan 2023 09:42:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.42.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:42:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/18] ppp: fix CVE-2022-4603
Date: Sun,  1 Jan 2023 07:42:22 -1000
Message-Id: <57e3ee40799614463480437f6abf082a49b75334.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175224

From: Minjae Kim <flowergom@gmail.com>

<CVE-2022-4603>
Avoid out-of-range access to packet buffer
Upstream-Status: Backport[https://github.com/ppp-project/ppp/commit/a75fb7b198eed50d769c80c36629f38346882cbf]

Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ppp/ppp/CVE-2022-4603.patch               | 50 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch b/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
new file mode 100644
index 0000000000..27b8863a4e
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
@@ -0,0 +1,50 @@
+From 2aeb41a9a3a43b11b1e46628d0bf98197ff9f141 Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@ozlabs.org>
+Date: Thu, 29 Dec 2022 18:00:20 +0100
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
+Ustream-Status: Backport [https://github.com/ppp-project/ppp/commit/a75fb7b198eed50d769c80c36629f38346882cbf]
+CVE: CVE-2022-4603
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
+---
+ pppdump/pppdump.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
+index 87c2e8f..dec4def 100644
+--- a/pppdump/pppdump.c
++++ b/pppdump/pppdump.c
+@@ -296,6 +296,10 @@ dumpppp(f)
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
+@@ -399,7 +403,8 @@ dumpppp(f)
+ 			c ^= 0x20;
+ 			pkt->esc = 0;
+ 		    }
+-		    pkt->buf[pkt->cnt++] = c;
++		    if (pkt->cnt < sizeof(pkt->buf))
++			    pkt->buf[pkt->cnt++] = c;
+ 		    break;
+ 		}
+ 	    }
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 76c1cc62a7..51ec25e660 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://0001-ppp-Remove-unneeded-include.patch \
            file://ppp-2.4.7-DES-openssl.patch \
            file://0001-pppd-Fix-bounds-check-in-EAP-code.patch \
+           file://CVE-2022-4603.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.25.1


