Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD326C87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:06:03 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.43746.1753902355909264809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Za1RXj6G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23ffdea3575so1540665ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902355; x=1754507155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA1DHbjYrWPBW4Z4LIb5UUWsenLccOCm1MBTLIo41Lc=;
        b=Za1RXj6GvXXLAS6a3efyPvDdnjHThFXvxII/h+OuanM0lUPZnoaNzD013H4c0ogHOp
         f4N6731XA+Mb6fpeWZ3kreXnz0hbLcvhZZs4m6WbiAF96twnsSt4bgedehVq0v5Kd6Ks
         C6XBRz5h3opS+OzYllE6NDVW91cbpN4x38aFiv+cE7zwnX8Dx+iGTL/N8UPKp7WW2A8i
         caJLypXy2xrgpwvTKKaCZ3seO/ohes7DtVBpRNbuh16LmUiNcFMkfBmc9AoNVHdOtCTu
         4TS7HULfu6xXzb+Aux4+jrjVdfQXERWD6bCqB2sJUB6xW1VQ/nngrUV27DfBv/gQ8qns
         02ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902355; x=1754507155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA1DHbjYrWPBW4Z4LIb5UUWsenLccOCm1MBTLIo41Lc=;
        b=mQGrMm1tMM6mnKCk2N1SV0CP0FDvp3//XchHNWu3JgyE0oE2uLQrPw/rhBZTeCcCNQ
         HU+atdlyt06YZWWatpT5KrRqxRdCvxOrc9UxqOT0omrv+DZyYGwD/NQ1CZYz2TpebpTr
         z5ZMsf6TDeQr0+yN9vS33/PfAVpmYxgen/VCJ+yn3bfhNtj8xjYVkLb2InEA5PAT9b+v
         jPSg3ABN13UAe6ZK7cQOBIOIMRA9KN1YeUPRSdmhz5q+PHiMlPvH83Un/Fw3ajiBgTnS
         lvFpK4HbMVq4/BUxS+kvQamG0GTHYSjp1wF5T5MJkWWBabTfTvDBu4M1BwECzT/ID/PL
         qVvA==
X-Gm-Message-State: AOJu0Yz/pmgBiUcbQIY+gsbWad4qtqaLRkRqiqvTEcTPw6VIobNC5fUh
	nXhGlZkqI04Iyudwy5b3BHIwhda7UjGhn3Al2E8LK1KDzsGlB6GF/L88swWWRjU5/zTLWXH7rT6
	B+SYa
X-Gm-Gg: ASbGncsaZsaXj9ZiIQQZwdgFOt5g+ltDzAQ5FeqBPLE7Ajho3NPZCe3Zo0gqV4Zl3fJ
	vrcgxZb1e7UDHKsyiSNJAf+no0LXAp2s8d8KxdHXPvFopj+CvdP20NHO7B9JbjNBNgkcI0W5GZC
	fgR7ExLfYUxQTtvc+CQeltPGhDuEli7mSRb32j2/eqatne2ponnljOPAFajM786ag8C+OyXSVe9
	sNIj/wRO+epqMLIsIUWqnI/RSmo9TQxBrG4tcBj0EjC5pAr+OqbctNyBQVBRpVGXzlwH18OUe8W
	NdTpcf0SzH073fHDqvRD93hMnFUx4plKJZeliMc9zh5G7p3L+DQLlvc1uXSk4I1yfwr28oO7rr/
	XEjVUxqzZtN9p
X-Google-Smtp-Source: AGHT+IEg9oM2Dr+lbA/ouVdQayeAc1WGXD6PqOOk+n8w/dr0yEeiEGX5ZGvvjd6hHC3JmKnK5acS+A==
X-Received: by 2002:a17:903:2f05:b0:235:779:edfd with SMTP id d9443c01a7336-24096b24650mr61928245ad.39.1753902355073;
        Wed, 30 Jul 2025 12:05:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] libxml2: patch CVE-2025-6170
Date: Wed, 30 Jul 2025 12:05:32 -0700
Message-ID: <9418c88c964dffc21abe6a056db72c3c81e25137.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221146

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE from 2.13 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-6170.patch        | 103 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch
new file mode 100644
index 0000000000..a63ae1cff7
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch
@@ -0,0 +1,103 @@
+From 5e9ec5c107d3f5b5179c3dbc19df43df041cd55b Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Fri, 20 Jun 2025 23:05:00 -0400
+Subject: [PATCH] [CVE-2025-6170] Fix potential buffer overflows of interactive
+ shell
+
+Fixes #941
+
+CVE: CVE-2025-6170
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/5e9ec5c107d3f5b5179c3dbc19df43df041cd55b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ debugXML.c                       | 15 ++++++++++-----
+ result/scripts/long_command      |  8 ++++++++
+ test/scripts/long_command.script |  6 ++++++
+ test/scripts/long_command.xml    |  1 +
+ 4 files changed, 25 insertions(+), 5 deletions(-)
+ create mode 100644 result/scripts/long_command
+ create mode 100644 test/scripts/long_command.script
+ create mode 100644 test/scripts/long_command.xml
+
+diff --git a/debugXML.c b/debugXML.c
+index ed56b0f8..452b9573 100644
+--- a/debugXML.c
++++ b/debugXML.c
+@@ -1050,6 +1050,10 @@ xmlCtxtDumpOneNode(xmlDebugCtxtPtr ctxt, xmlNodePtr node)
+     xmlCtxtGenericNodeCheck(ctxt, node);
+ }
+ 
++#define MAX_PROMPT_SIZE     500
++#define MAX_ARG_SIZE        400
++#define MAX_COMMAND_SIZE    100
++
+ /**
+  * xmlCtxtDumpNode:
+  * @output:  the FILE * for the output
+@@ -2802,10 +2806,10 @@ void
+ xmlShell(xmlDocPtr doc, char *filename, xmlShellReadlineFunc input,
+          FILE * output)
+ {
+-    char prompt[500] = "/ > ";
++    char prompt[MAX_PROMPT_SIZE] = "/ > ";
+     char *cmdline = NULL, *cur;
+-    char command[100];
+-    char arg[400];
++    char command[MAX_COMMAND_SIZE];
++    char arg[MAX_ARG_SIZE];
+     int i;
+     xmlShellCtxtPtr ctxt;
+     xmlXPathObjectPtr list;
+@@ -2863,7 +2867,8 @@ xmlShell(xmlDocPtr doc, char *filename, xmlShellReadlineFunc input,
+             cur++;
+         i = 0;
+         while ((*cur != ' ') && (*cur != '\t') &&
+-               (*cur != '\n') && (*cur != '\r')) {
++               (*cur != '\n') && (*cur != '\r') &&
++               (i < (MAX_COMMAND_SIZE - 1))) {
+             if (*cur == 0)
+                 break;
+             command[i++] = *cur++;
+@@ -2878,7 +2883,7 @@ xmlShell(xmlDocPtr doc, char *filename, xmlShellReadlineFunc input,
+         while ((*cur == ' ') || (*cur == '\t'))
+             cur++;
+         i = 0;
+-        while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
++        while ((*cur != '\n') && (*cur != '\r') && (*cur != 0) && (i < (MAX_ARG_SIZE-1))) {
+             if (*cur == 0)
+                 break;
+             arg[i++] = *cur++;
+diff --git a/result/scripts/long_command b/result/scripts/long_command
+new file mode 100644
+index 00000000..e6f00708
+--- /dev/null
++++ b/result/scripts/long_command
+@@ -0,0 +1,8 @@
++/ > b > b > Object is a Node Set :
++Set contains 1 nodes:
++1  ELEMENT a:c
++b > Unknown command This_is_a_really_long_command_string_designed_to_test_the_limits_of_the_memory_that_stores_the_comm
++b > b > Unknown command ess_currents_of_time_and_existence
++b > <?xml version="1.0"?>
++<a xmlns:a="bar"><b xmlns:a="foo">Navigating_the_labyrinthine_corridors_of_human_cognition_one_often_encounters_the_perplexing_paradox_that_the_more_we_delve_into_the_intricate_dance_of_neural_pathways_and_synaptic_firings_the_further_we_seem_to_stray_from_a_truly_holistic_understanding_of_consciousness_a_phenomenon_that_remains_as_elusive_as_a_moonbeam_caught_in_a_spiderweb_yet_undeniably_shapes_every_fleeting_thought_every_prof</b></a>
++b > 
+\ No newline at end of file
+diff --git a/test/scripts/long_command.script b/test/scripts/long_command.script
+new file mode 100644
+index 00000000..00f6df09
+--- /dev/null
++++ b/test/scripts/long_command.script
+@@ -0,0 +1,6 @@
++cd a/b
++set <a:c/>
++xpath //*[namespace-uri()="foo"]
++This_is_a_really_long_command_string_designed_to_test_the_limits_of_the_memory_that_stores_the_command_please_dont_crash foo
++set Navigating_the_labyrinthine_corridors_of_human_cognition_one_often_encounters_the_perplexing_paradox_that_the_more_we_delve_into_the_intricate_dance_of_neural_pathways_and_synaptic_firings_the_further_we_seem_to_stray_from_a_truly_holistic_understanding_of_consciousness_a_phenomenon_that_remains_as_elusive_as_a_moonbeam_caught_in_a_spiderweb_yet_undeniably_shapes_every_fleeting_thought_every_profound_emotion_and_every_grand_aspiration_that_propels_our_species_ever_onward_through_the_relentless_currents_of_time_and_existence
++save -
+diff --git a/test/scripts/long_command.xml b/test/scripts/long_command.xml
+new file mode 100644
+index 00000000..1ba44016
+--- /dev/null
++++ b/test/scripts/long_command.xml
+@@ -0,0 +1 @@
++<a xmlns:a="bar"><b xmlns:a="foo"/></a>
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index baac155270..f34b0c25ca 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -41,6 +41,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-32415.patch \
            file://CVE-2025-6021.patch \
            file://CVE-2025-49794-CVE-2025-49796.patch \
+           file://CVE-2025-6170.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


