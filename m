Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489A0C79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 15:37:17 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15569.1788968230592202613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 08:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JhKyomRZ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso2851495e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788968229; x=1789573029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNDdpYj9mJc7UFQFAyvWJoGaYe58BeUdEAKsaNsSu7c=;
        b=JhKyomRZFlCYZkDtNG+lnobngf0FsiN248QPhfrb3Zfhi6wDebgyBvVG8iclLNOSiJ
         NK/HQ+r/rVaUgtK47Wo4sOnkPkfeLj2rJW9jX2h+xoY4RoDLHyyIz6PF66SpIqJIBDPL
         0MBgjS1MTPgXXLKAmtqg2Uij8oQGSlseXJfkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968229; x=1789573029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JNDdpYj9mJc7UFQFAyvWJoGaYe58BeUdEAKsaNsSu7c=;
        b=fyJGpBHTkb6b3oBYn2qDPiP4k1wBPAxZWfWbNGGdEf2bkEwG5ULbtPsSeNF13PoMlX
         DhOcsQR8NMF7FJjDZ/wrSj4xL8m+3vtD0Xf/2EQsoK50p7J+MWFkGbFaVOXSHPJDKo8Z
         t8r9rkDQvV+DtozeZSiOjGLnisdYC6/DPB2oCQYe9TLZepJMuB//W7eZL7XQBp8Jl/P1
         3P7aSMSGfaMmZTBMLlqpK9GB7nmUYNELPvziCv6KSgewUO6Wxu29SvhGZthdc1cfCzjP
         Uee+8e2EJJtVm3zTJ+KTeVFsDPgZEtn7fP4LSm2ejVwpy6OEZjPaU0yZKScuIV/Rb6H3
         3i2w==
X-Gm-Message-State: AFuF++lPTs/iZKVX3GnDFFQwZLFNMrurzIYe+JzBAaRmOuaT3Jwed6SZ
	fQ3WSVEC1vctoFmHaVCXNkgtNBv5Lvt6Zbjy2raDmstUrQI/cWz+N91SkUMExTkk8XB5ztIDSSg
	7yoB7Y2U=
X-Gm-Gg: AYBFou2zQKm0AW0tUCWiUeEINPqB0Me9++YQDyplsSseVuoCpA7wJpdEM9Dpghp4xw5
	XPKu3ZANvanSInxqiKzR41UM5BO5dqWQMoOCG9hs6uMXQcwomYydoPMdWcObGHS77laNfc8ZvbB
	LBFFyCoEiQ+KKk/HNoWOAe0ItpfSnZBQH4WGZtdZyzkjfMmZkOWjUABWCgI1rlQhUEhst+AvEVP
	Y0uTFlcraEQOX3zD0QVCfEQqnrD41GS4Edavzy66x2uDyGJhFSDK12XV4YWo9qshT1mrEJnqek1
	SNOgCyxYWW8YdzHjiEPayzd3hChdjDSlSi5R1ogg/wwoMWCOPh318j9BMu9YpLSCad/gRh0CxYc
	qZWII8ysM1pYQ54WI5nTxocYDAw8B80HF39H9Flqq0j8Lw0mAuD2jfnylpx0veY29knoINmzenV
	pri7W0baDqGNH3skdtT5sfyTlQ0LmfGTwa5XuqiRrW6G5nwulDz7/w+g1txURmW6sRyXbQsx64H
	tMivwXpy3qb8D7sdwDY+F21GYk=
X-Received: by 2002:a05:600c:630a:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49d2592c540mr38787215e9.12.1788968228677;
        Wed, 09 Sep 2026 08:37:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a320:8b5c:de4:61f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm591796395e9.6.2026.09.09.08.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:37:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: Backport fix for python3-lxml 6.1.3
Date: Wed,  9 Sep 2026 16:37:00 +0100
Message-ID: <20260909153700.553520-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 15:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245480

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

