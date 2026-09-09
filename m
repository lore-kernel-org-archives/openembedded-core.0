Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D8EC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 15:37:47 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15344.1788968263538224867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 08:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hQdTfbQj;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so211302f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788968261; x=1789573061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNDdpYj9mJc7UFQFAyvWJoGaYe58BeUdEAKsaNsSu7c=;
        b=hQdTfbQjKZqSnBc5pdjjzVF0ixQp10hXK80D5m/mZioD7R1C6NhmjEcPMl8sVIsM7N
         jKPHnEORvNE1X1eGGvX4yOoQS2JB/DRsaWDFQR2h7iFIkSK2g4iWy7jje48WGG2eVzwA
         44XVRiU/bUDRPdSQ0af/6heXQQzjcxgrNVMFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968261; x=1789573061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JNDdpYj9mJc7UFQFAyvWJoGaYe58BeUdEAKsaNsSu7c=;
        b=Kxk80A6614ix8HWw/V/CRZGgA3hTQImp4q9OKB0Vi257v3oU7s2HIr1EIqfdn6UStD
         +zonRMulY9TgoMqoLkUOeBBIVoW1S5qsgapRj7a98OQqA3jNoQCoepPRz57WJYdyeXDm
         h7flCgzYeJWvc9I7QW4bfNPWnKfkWeh501YIZbz8zmyuCA5s1r9dld+R1TvydV1+x9lm
         WuaOtAUbh3L/VXPNyxIxHpJO+4s1yoT9d3JJ2AALpGrBPycCCADtSwjafrVE4e0s3o8E
         dUMLV3w6lN9/SB+cSNvv2a5xGSG+t7nGNBl7QKnXW1DJhX9dnfwk282PtIr+GI1mdqK8
         reqw==
X-Gm-Message-State: AFuF++ld452l7PKtDU6UvZ4Bo9Zn2hUsxWXeet368CHlClFvEX5QH5zs
	DAuCRhaX2L165iwF1b2fNQi4g9/qXwkyEMi/MiUMhj6ryEd2PpOoAjMsFu5fOerovY9Jr9T80EJ
	PefPFQ1E=
X-Gm-Gg: AYBFou12h27Oo6RFKBFbw+mXe6QIaXrGQF1PvmqeIyCZZNZdC3g4c8K8b/v9j+1H5yo
	2JieT0S2ram6QYDl70NnsWdm4cCVHzDlABwlk+G24DSjNlKN+FpN5/lF/NIWcIw4K7fTVUzCHyw
	9nEis+mtBM8r9QjnDIzZNPlnc4Z1Uu/ypOdsDV0tQoznTV1cZgXMKagKnHhxzadXS+A9kza1X/s
	BWXNfPvy1afEVbYCyu5jaYyJiGleOYrIZk6lJalwjflRMLdmaq6z9yiB3bM1tFNXfB5boRk3mVg
	r5GUO2pjzkvfyJLEi3KsWqgz10qb0wWeGeSCiAcF4Ej9mOAIuZvgOkxVpuGAKtxwpuLOPgQ1PSM
	muyhWmxEERjrONxUrMm4B+7cKhqDad5kNCPPQDiFU5lcY5Xh1erZRO7JkmBhT2AAlMVlCPdJRK2
	zYYkn8kOFZtglcoqCI70ioDFFEszSIXt48mz/vaFmEAzCWFxFId+a6ce6+MC70h97iy45JNVWzu
	iYlVE1F8GFYbwyruR2kACgaeBk=
X-Received: by 2002:a05:6000:240b:b0:485:b0bb:aea0 with SMTP id ffacd0b85a97d-485ba5ae88bmr2159598f8f.8.1788968261184;
        Wed, 09 Sep 2026 08:37:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a320:8b5c:de4:61f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm34648099f8f.11.2026.09.09.08.35.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:35:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: Backport fix for python3-lxml 6.1.3
Date: Wed,  9 Sep 2026 16:35:55 +0100
Message-ID: <20260909153555.551520-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 15:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245481

Backport a fix so that we can upgrade python3-lxml.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...396d2c5bc1adb6b044e7784a30b7187f6fbd.patch | 59 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_261.2.bb    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch

diff --git a/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch b/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch
new file mode 100644
index 00000000000..8eb9f5c1641
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch
@@ -0,0 +1,59 @@
+From a019396d2c5bc1adb6b044e7784a30b7187f6fbd Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Wed, 2 Sep 2026 20:32:51 +0100
+Subject: [PATCH] tools: fix building manpages with lxml 6.1.3
+
+manpages build fails on Arch with new lxml:
+
+Traceback (most recent call last):
+  File "/work/src/tools/make-directive-index.py", line 169, in make_page
+    _extract_directives(directive_groups, formatting, page)
+    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+  File "/work/src/tools/make-directive-index.py", line 18, in _extract_directives
+    t = xml_parse(page)
+  File "/work/src/tools/xml_helper.py", line 25, in xml_parse
+    doc = tree.parse(page, _parser)
+  File "src/lxml/etree.pyx", line 3717, in lxml.etree.parse
+  File "src/lxml/parser.pxi", line 2045, in lxml.etree._parseDocument
+  File "src/lxml/parser.pxi", line 2071, in lxml.etree._parseDocumentFromURL
+  File "src/lxml/parser.pxi", line 1962, in lxml.etree._parseDocFromFile
+  File "src/lxml/parser.pxi", line 1231, in lxml.etree._BaseParser._parseDocFromFile
+  File "src/lxml/parser.pxi", line 647, in lxml.etree._ParserContext._handleParseResultDoc
+  File "src/lxml/parser.pxi", line 765, in lxml.etree._handleParseResult
+  File "src/lxml/parser.pxi", line 689, in lxml.etree._raiseParseError
+  File "../src/man/hostname.xml", line 5
+lxml.etree.XMLSyntaxError: Entity 'entities' not defined, line 5, column 11
+
+The above exception was the direct cause of the following exception:
+
+Traceback (most recent call last):
+  File "/work/src/tools/make-directive-index.py", line 180, in <module>
+    _xml = make_page(_template_path, _xml_files)
+  File "/work/src/tools/make-directive-index.py", line 171, in make_page
+    raise ValueError('failed to process ' + page) from e
+ValueError: failed to process ../src/man/hostname.xml
+
+Relying on XMLParser() defaults leaves the external parameter entity
+used to load custom-entities.ent unresolved. Request entity resolution explicitly.
+
+Follow-up for 1a13e31d275430ffba713c8a68ee7f22093c29e0
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/a019396d2c5bc1adb6b044e7784a30b7187f6fbd]
+
+---
+ tools/xml_helper.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/xml_helper.py b/tools/xml_helper.py
+index 87c24ab02a0f..e26ca92d9454 100755
+--- a/tools/xml_helper.py
++++ b/tools/xml_helper.py
+@@ -16,7 +16,7 @@ def resolve(self, url, _id, context):
+         return None
+ 
+ 
+-_parser = tree.XMLParser()
++_parser = tree.XMLParser(resolve_entities=True)
+ # pylint: disable=no-member
+ _parser.resolvers.add(CustomResolver())
+ 
diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-core/systemd/systemd_261.2.bb
index 80e1aa07d17..68b894be9a3 100644
--- a/meta/recipes-core/systemd/systemd_261.2.bb
+++ b/meta/recipes-core/systemd/systemd_261.2.bb
@@ -37,6 +37,7 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch \
            "
 
 PAM_PLUGINS = " \

