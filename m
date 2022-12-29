Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949C9C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 17:37:43 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.209314.1672335459919743311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 09:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K1JhiO03;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id tz12so46548278ejc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 09:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIuo4lF5hFtOGI8bCTULfLjdmtQ2COa0i5XFJRwnx8Y=;
        b=K1JhiO03jl00QYOhZZpE+7Qv4Jxq7bBt74h+IJHt0cJhyaEL3JC5bRrbi7rV02qhZh
         VbsKELvvYNzliA2QKNycu01vfoKP5+qmErFS5aWOC8BODlJX0NSFoJb6yKOu0j4C80D7
         S6RvcEvEz0DNA3J1pXbz59gNOPjUr2+2rXymujYRLjVJR51r+jC8eImZtfgOQ/nV6tV+
         hK4RafvPwxfAty48Iqg179SMnTWspGPQVSgBO7+aJtGPru40frLac5tcpTDM8GWKwsVX
         qEa/dPSro11VlI0DNSPmfVxQ/AbLcYCJ03YNlu3oLcLsS6+/Lt2I67QHCVTPUGlUVxn0
         7xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIuo4lF5hFtOGI8bCTULfLjdmtQ2COa0i5XFJRwnx8Y=;
        b=F1DiVpIfh27xJ+HBatVDc01MENAdTKETKgXJrmM2flBCV1/AbD4IgWRpArTv1+T5sx
         xWeFH/6JppD8EgxdV8/iA+fKydH8krNS98bxVXENucWmhsWgEppAsqNrkLZqDrVKsgHb
         TAeJ1kIpvOoiKT4lWuQ3WYYNmQ9cbNv/NJao+rDAAJyQgXlkSA/cPoKBBVgtkU5g0sji
         dhLY6IE3B/tykGvSz4/nZWuTMa8l4xHI1L2dnxJBurOdknfbTcZ3jEept+aj7jeGrjnU
         eyY/COLO4l1El9MQ9nyJIB4QYmygp4qfE/LTukIoNTHSV89M3zbzHCupd5EAOcGHjzDd
         ooRQ==
X-Gm-Message-State: AFqh2ko0j/o+LelSRgcXglQr3cH19qwjlwV8JTZT+9U7eZcYhv9hb5Gm
	PGqQinIYDfnwKPlmlX6zfP26hkEy+/M=
X-Google-Smtp-Source: AMrXdXvbyPs07s6bFJcy7tAqH+VIfZOhKLyCteyuGWJqpC1CbUNwbtOTjaVZ7W5H6gedWr00i22h9w==
X-Received: by 2002:a17:907:c78e:b0:7c1:23f7:623a with SMTP id tz14-20020a170907c78e00b007c123f7623amr23712046ejc.66.1672335457835;
        Thu, 29 Dec 2022 09:37:37 -0800 (PST)
Received: from localhost.localdomain (ip5b423fb4.dynamic.kabel-deutschland.de. [91.66.63.180])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090631ca00b0084c4657120fsm5927090ejf.55.2022.12.29.09.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 09:37:37 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] ppp: fix CVE-2022-4603
Date: Thu, 29 Dec 2022 18:37:14 +0100
Message-Id: <20221229173714.18736-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 17:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175125

<CVE-2022-4603>
Avoid out-of-range access to packet buffer
Upstream-Status: Backport[https://github.com/ppp-project/ppp/commit/a75fb7b198eed50d769c80c36629f38346882cbf]

Signed-off-by:Minjae Kim <flowergom@gmail.com>
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


