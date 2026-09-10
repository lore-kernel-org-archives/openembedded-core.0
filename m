Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD3DC88E46
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:05:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24017.1789070757832536805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 13:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hfHokb1p;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2dd020a2e44so920665ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789070757; x=1789675557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IIkH1K0tEFvgxyp5qco6ihUlviFhr74aWqT3GK7LF5E=;
        b=hfHokb1pUcSLRHFfz8wouBbHaqUUtGiDUiLbhH+sddqb72mebOXqjtPg2e6xEx/RlY
         9ZFTbIY6cO5CJStN+rSRcXWjO7nhCsoO4iVmL/vEBZVcteZ98oylJ6iwcmn3kreck2ot
         q6/2reYznqGvl7qS9Pfi73VuVXH5R4NM31BH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070757; x=1789675557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IIkH1K0tEFvgxyp5qco6ihUlviFhr74aWqT3GK7LF5E=;
        b=VhN9RmA2ahGSbsAtq5cpT+QdioRb5wUuGYN30MSL+jf+nz+NArTGZ3ix5H7T0TTl5Z
         s1bvaAOWMe2qt4g1IuH+64y5XyvXNPpyFXaeFO/X43k5VAHsroIW6jDsJABmtSdVg3mL
         fyn5UVmyvW0Kl+tX0j33ylpecCKG7ncvNyPxd8rr2mWQxZrvhDhIP7o6VzQeJfRa+Da4
         JpK8K+fIR2kpSiRClK/1i32q3pliKjZO3kRDFay2U+AKfwe6PYHbrWF7AdHsb0OCum+y
         fiWFEgEPwxbp85qGlnDTdblE4zh5CXYR+ubGP9HMie1DPJ/DPkzlPwxuYO8B5d3YBCws
         Jalg==
X-Gm-Message-State: AFuF++l5p5xziMMOQX2Z6Bfy0vrD4sqgc6arVVYgjWJNJTvvSIBVR5d/
	bHQHDCmu66sP3E564cLEKZlN99H4uGtvxf0w/VxTlSuVjVyvW1mz+ij87ZwzB8hC6YSrBqwO9oV
	H+GR6
X-Gm-Gg: AYBFou3r1CMIwPygmSYUZlly8J9x28b+jgmAF8Oe2E1Ki0qr7oOCwtTkiA4K1QDZ/m5
	nJHZb5yh8c5jaswH3SOoHngA2RckbFJMOS/8uh8PpOYLGAVL/dqlDHoy5U2dk6d5wtbkXecHnB3
	p3qtbFdYN5A1k/P/Knm1Nl2xCp3boqoSM0YuHPJ9Z07zQSwnR0YpCPk9gB5Fefh5ZS/huKH8ILF
	74mdf8yZY3K6O+xo5LH8zBenlUOYZtFw5bC1FvkdlKFWr5L8Q/Q1Gqd4RuXkSuYA9eLtbWHyryN
	MUTbEK8E69eiBe98euEEoVZXynx4Nd4QRfd635vaiFhqkGzNhG1WZt/J//ggotGXp+Z7K4Xl/oq
	CZnVhTk74seew1Yb6szjL3FFd+6fYwSx23D7G2pT0rbh5k8TfLf/UZUfET71MD5JRLkDt/FiEv+
	aJZ//iPNcQZahOAoB6zKPnZi8XcmYaV5N6igIXR0CrDW8Yf/ar8D7i/w8oRoZ/C/Z7b5s6YzqE9
	GPoCre8P4mO9TNP1Avx
X-Received: by 2002:a17:90a:da8f:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39d9bd6976amr522095a91.9.1789070757113;
        Thu, 10 Sep 2026 13:05:57 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm527974eec.3.2026.09.10.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:05:56 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 4/6] libxml2: Security Fix for CVE-2026-86140
Date: Fri, 11 Sep 2026 01:33:27 +0530
Message-Id: <20260910200329.842463-4-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910200329.842463-1-sdoshi@mvista.com>
References: <20260910200329.842463-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 20:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245596

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-86140
[2] https://security-tracker.debian.org/tracker/CVE-2026-86140

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libxml/libxml2/CVE-2026-86140.patch       | 57 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
new file mode 100644
index 0000000000..c7b6ace560
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
@@ -0,0 +1,57 @@
+From 9a21b9dbb096f9e612f37ba72df6a2fb6a60c60c Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Thu, 16 Apr 2026 02:54:37 +0200
+Subject: [PATCH 3/6] fix: add bounds checks to xmlSnprintfElements in valid.c
+
+CVE-2025-24928 fixed xmlSnprintfElementContent for unchecked strcat()
+writes, but the sibling function xmlSnprintfElements has the identical
+unfixed pattern. The strcat(buf, "(") before the while loop and
+strcat(buf, ")") after the loop exit have no bounds checks.
+
+Add remaining-space checks before both strcat calls, with early return
+and ellipsis when space is insufficient.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/d1686f91dbda141a752200419d35639fd6b38340]
+CVE: CVE-2026-86140
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ valid.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/valid.c b/valid.c
+index ae4bb82..718e6d8 100644
+--- a/valid.c
++++ b/valid.c
+@@ -5047,7 +5047,15 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+     int len;
+ 
+     if (node == NULL) return;
+-    if (glob) strcat(buf, "(");
++    len = strlen(buf);
++    if (glob) {
++        if (size - len < 50) {
++            if ((size - len > 4) && (buf[len - 1] != '.'))
++                strcat(buf, " ...");
++            return;
++        }
++        strcat(buf, "(");
++    }
+     cur = node;
+     while (cur != NULL) {
+ 	len = strlen(buf);
+@@ -5111,7 +5119,11 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+ 	}
+ 	cur = cur->next;
+     }
+-    if (glob) strcat(buf, ")");
++    if (glob) {
++        len = strlen(buf);
++        if (size - len > 1)
++            strcat(buf, ")");
++    }
+ }
+ 
+ /**
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 581f38197f..b3f6a482d2 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-11979.patch \
            file://CVE-2026-86137.patch \
            file://CVE-2026-86138.patch \
+           file://CVE-2026-86140.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.34.1


