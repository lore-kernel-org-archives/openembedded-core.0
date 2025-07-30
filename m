Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAE1C87FD5
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.47219.1753910964173978347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JTfW6gg1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2403ca0313aso2881655ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910963; x=1754515763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pY8Yj3EhKfKk7POU4138Pa/8M6VG0N/B33lUAFXT+go=;
        b=JTfW6gg19KgJcRKkvd1phynCxjxyA4w0Re0kG7Qc0Mym2sZILATS9jYjzsSg+pzfrp
         lQl/T389x+pHznpJFyCa04g14c5kBirPjPJxMTC2X+47Fs/jk9ABEfHhDA3ReCYO+ZF5
         Ti053zTzBZpGbAma4IkpxxYBv7Tmndt3iVx/HpjNoq3qsC5e5x6ez1q9zFzM5A4LHDzd
         5v1jXw6kYaL96V5IEKJloxI5b7q9UHZvKan0Z0YXIdgPTYPoUSxTCSmdMX7VU+/nDZlN
         AmHrf5mhaDYfl6plmNP4tvmZnwpWM9PrYyUamKTNG4uyCr9b52uGue2a3uy8aC0YT5Fq
         EiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910963; x=1754515763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pY8Yj3EhKfKk7POU4138Pa/8M6VG0N/B33lUAFXT+go=;
        b=B+Ldw+WyOlr18NDUDi61qKNxS0pHLMSMAfNQEKez/TAuk2R2vCThFeI5muo9wDl7AU
         pq8W4TuReI/vom1gvc9UO+dFBLuIDINLhaxFT82QoreJAdoCuXMdcSWsjVM11POU2zh8
         Eab3wRRqtnjjvNPQ83YZS38ekRCuHoH7Gm66Q/FrdmLY3quoXVNdBwJ6FX+7pz7h6IoP
         b3ow6TdfwE9mzlHS5QH1qh4sqiseMSqUUNa/fk8RdlmOtGwj7nWd+OeP+FE54n6hERkF
         rTfcO4F58OPvIXJ5v/4Xx/zQ7fZYVByxQ4p33a0h8DyNMwg6BeeraoUTbH4qPK5SLtMV
         XbIA==
X-Gm-Message-State: AOJu0YzRq/kY8mkjqCGQuYLbJisIprvvIHPVkFRWybXGdkTXlUyChAn8
	u4r1fsMT/KzBq+rrON/db/s2ZWLXfvEpTTQ87HS3WRVSGUEdhYAjRDEt+fmXNuL7axTS6AMyab6
	TxPBO
X-Gm-Gg: ASbGncuuEJD1bRhOXsl5hZKApc14OG9brfrp5/ZrWQOvxVxPB8P7QZYQ8hpnLOU1Z4l
	6K/49Ty+UqHpL/IvEG0nCl+Y5votoG+lmt8PcKD64G7tlcA2R1Iw1gmHI0A/rJVTZ0kkRm6qH9L
	kU4aoVZ41bCx1pZZVGXZYnaHoFKH3A5xI/rqaNWp7VKPuvzz496GFGJYzHqEuncZEE1Ug55XJTY
	ERIWkACCrUmXeakdtkSkkhi1xI3yvu3+dOnT9upkjGwwp19BSQMiE9VtjmfzpE9JcVsCgeEK9sn
	jvmqATmhYYZmFFgFiVKio5o9YPjS1mrD9hkYfXaII3Xeh/MIZ2wDqTWIdH5TJGPCrNbodqxJ+Ix
	SVyQeve1hMG7x
X-Google-Smtp-Source: AGHT+IEJUWqSruaIifoDo+Nsuk53Xk0Q7NvMm2T3Z28gYbbtCRXmTELhPd9VXM0RoSpS/zPuYWJ/Dw==
X-Received: by 2002:a17:902:ef0c:b0:234:9092:9dda with SMTP id d9443c01a7336-24096b23907mr89032425ad.24.1753910963404;
        Wed, 30 Jul 2025 14:29:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] libxml2: patch CVE-2025-6170
Date: Wed, 30 Jul 2025 14:28:59 -0700
Message-ID: <061610dfca8a72b71e1baca3ad4aa2c9fb64449b.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221167

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE from 2.13 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-6170.patch        | 103 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch
new file mode 100644
index 0000000000..e2b5392c76
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
+@@ -1043,6 +1043,10 @@ xmlCtxtDumpOneNode(xmlDebugCtxtPtr ctxt, xmlNodePtr node)
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
+@@ -2794,10 +2798,10 @@ void
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
+@@ -2855,7 +2859,8 @@ xmlShell(xmlDocPtr doc, char *filename, xmlShellReadlineFunc input,
+             cur++;
+         i = 0;
+         while ((*cur != ' ') && (*cur != '\t') &&
+-               (*cur != '\n') && (*cur != '\r')) {
++               (*cur != '\n') && (*cur != '\r') &&
++               (i < (MAX_COMMAND_SIZE - 1))) {
+             if (*cur == 0)
+                 break;
+             command[i++] = *cur++;
+@@ -2870,7 +2875,7 @@ xmlShell(xmlDocPtr doc, char *filename, xmlShellReadlineFunc input,
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
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index c289de6f73..078988286a 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -23,6 +23,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            file://CVE-2025-49794-CVE-2025-49796.patch \
            file://CVE-2025-49795.patch \
+           file://CVE-2025-6170.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.43.0


