Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0819FD2ED12
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6473.1768916293357401099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=c9JwgxXl;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so34406535e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916291; x=1769521091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eU+frBv4hwSWyQeyaKK/tEbxFfFPCfcGdQ/EnuEpGY=;
        b=c9JwgxXlthUsWzjab1/g3pDB9tRPE4b/g7qRO6Jvo22qERbBF2S5YFPq1p8Cfe+GQo
         wSD8I+xLgakmEXL6Ayiom24GCMNWqJcqGsILsJS2yFs2STuXNKqxW5xYsuIrCuSi8Y8d
         zvLERxiMQd5NpIM8b63x4E2KP0urFKygWlBGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916291; x=1769521091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/eU+frBv4hwSWyQeyaKK/tEbxFfFPCfcGdQ/EnuEpGY=;
        b=aKGJCfI3BmNkobl1/lKrC/ZQmqd7ytnuW8Y8g0wbR8K8bzTQOc/anCRCOawWdoNzIz
         M7hUaKZVl0UtXwaFdJVyDlG1kcL/Uik9kLkJ7M6JR0DSCB9tl5hmcFWodyqgh7PD/KUH
         wrcgTYrXAm9+Jzbc/qfs40UdS6xIMHYSSmRGZYiam5koQIdjjxH3NFLLMIviLhTuBUoT
         lmecSexx8hi2l1NGpvPAwPIMg1grAIfbEe2plpQEDGOrrqyCCFyRiiHbfXBIE8P2Kzsg
         H6JRY3bzRy3zADS4Ks8SS7UuQseGpYdYNtrJh0D4n1eerFGe4Sa6gzqSkXsnXeQ0Bn2z
         JRZQ==
X-Gm-Message-State: AOJu0YyUJOCTU+xparDzNvwLKg21JLNTeFT9Ejl68E4BVuPIpH6QUXvG
	gWR4VZKk2INqAKKYgIIhi4hi7XVuAyt+wuB8XNx52aByUAR8ia3/O1JoMxt8kaQyNRy6yc/dF07
	9mh8I
X-Gm-Gg: AY/fxX63gk+MKoZ1erQM0XDT0Y78H4d+uqipUoXkTuvLTk68aLVFxo99QdTmNHyu5vy
	NvTndz1038troS2y0LIRlnbAXQ5II9vsO6uvxbmB8KqrCZK9LQea7SdaMkhwE0FTGNAKD3uEE/y
	Hk9evRf+fEkSo98nc4aHT5JDaNwy6rJpBLD4DvtpCpwYDlpDL4971AQ2FSMMd6NfVGRvu7Uqtzu
	A9R9xUbSnIxxEM+V435rzWD0gQ77VXI5FBU738c839bW2YTavZveUf594zQYes3Yfz49TYI3+WH
	qUQxLb3JlNxFMBI/aXdFrgtvFXsmjSuXJVGdXuGiMiHef5Iq+LTf6pSrL6zDbiHgUc8qzJc4vZG
	3E6DCa55xKghRwVBT0Zz6tAS/JwajW7EXtgAo69PJYcF8SZAvEEWzq3o8AWcvdqxuIB5dfv+TSH
	5ld3Jy/+AaAtxQTeOYVqiWogDRb3WoY2VRbS2Zj9bkBekuNIbXbGjpIQEMqT6WV6z0SoUnRD6HZ
	PSnTysKrsR9qp6MUsOLrg==
X-Received: by 2002:a05:600c:3555:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-4801e2fe352mr199423425e9.12.1768916291440;
        Tue, 20 Jan 2026 05:38:11 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:11 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/26] libpcap: patch CVE-2025-11964
Date: Tue, 20 Jan 2026 14:37:34 +0100
Message-ID: <674dda9170cf471010fc1cbaae52e6054a91c7f8.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229718

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11964

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/CVE-2025-11964.patch      | 33 +++++++++++++++++++
 .../libpcap/libpcap_1.10.1.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
new file mode 100644
index 0000000000..003d21fb1f
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
@@ -0,0 +1,33 @@
+From 7fabf607f2319a36a0bd78444247180acb838e69 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Sun, 7 Sep 2025 12:51:56 -0700
+Subject: [PATCH] Fix a copy-and-pasteo in utf_16le_to_utf_8_truncated().
+
+For the four octets of UTF-8 case, it was decrementing the remaining
+buffer length by 3, not 4.
+
+Thanks to a team of developers from the Univesity of Waterloo for
+reporting this.
+
+(cherry picked from commit aebfca1aea2fc8c177760a26e8f4de27b51d1b3b)
+
+CVE: CVE-2025-11964
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/7fabf607f2319a36a0bd78444247180acb838e69]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ fmtutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fmtutils.c b/fmtutils.c
+index a5a4fe62..78a0f8b7 100644
+--- a/fmtutils.c
++++ b/fmtutils.c
+@@ -235,7 +235,7 @@ utf_16le_to_utf_8_truncated(const wchar_t *utf_16, char *utf_8,
+ 			*utf_8++ = ((uc >> 12) & 0x3F) | 0x80;
+ 			*utf_8++ = ((uc >> 6) & 0x3F) | 0x80;
+ 			*utf_8++ = ((uc >> 0) & 0x3F) | 0x80;
+-			utf_8_len -= 3;
++			utf_8_len -= 4;
+ 		}
+ 	}
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
index b3bd4f669a..5e136e3b1a 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://CVE-2024-8006.patch \
            file://CVE-2025-11961-01.patch \
            file://CVE-2025-11961-02.patch \
+           file://CVE-2025-11964.patch \
           "
 
 SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"

