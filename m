Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B93C87FD5
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:44 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.46727.1753909717441758221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X7uGrckS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74931666cbcso227130b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909716; x=1754514516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew3B2EWu4afk6hZVcH3uXntRJiaytOKC436fHOs55kY=;
        b=X7uGrckS1I228l3/V9kt7vbuBvr2MDzL43zEEqUaC5K9UMAG1mdE5VdsILC3a1/R7j
         UpIoY9WFI0oIa7ZhA8/OmzfuKGclAmTmz2WvRPBEHWL3J9I7tbv25/6JxNN1f/VtG339
         Buh8ZYw+pTsI3CenkTXPUo5kdLdNK+d0e6jf8zEvx0vsEYkSqflycG8MlfWbMp+ErK9r
         19MB0cuqWh/F6hMEQgkNV2x+6Yy5rWNu+szLit3O4FZppxQEcbBzuFPYsk4zBWLr2nAP
         N+z1k5UsYU0HjWUf2TPxUP4QOQkG74BC+cp4DKmQSyNnjXVVK2pKvjfI31oydvzS8sth
         eLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909716; x=1754514516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ew3B2EWu4afk6hZVcH3uXntRJiaytOKC436fHOs55kY=;
        b=n7aUHirlgIHBpVQpJWR2jx/1ke+E4YFOs2K7m39Nawtz5DJOgW7TxVcZxGMK1cgdBn
         KlYkcLyW89NHSINzzCpmIaAtZNZSSUn+ayuik2PXGqvL91pNlD80bnC9YeNQCXzwXxRv
         +7NKliQO7pzmNIAwPgNpHMzkMhnjoS06PJ8CkZ/OOWwaDUYxXOh2YR9A+qboBkE0ex+z
         lECyXml/IisPvjLwyF62aDti0PJ5N1pjGyJUN9hwWKr1i3Kgna/YWpx95nzwfkbTEVaS
         fzuboNiqKBTyEgkVPmc8WNZAwkejH74V+08OS4UQNRRF1XHoZHnlHxR789T7LyN3768F
         jejQ==
X-Gm-Message-State: AOJu0YxbRXsCUlk7GXBGCKAoV3IOdBjeo3SqSMJqHJLBHE4ahiqBEtWy
	TkPFK9JALSDBBEjdRkgrxNaXd8rh6Dt6Yb9KWFUAXybcKW4LvR7CE5qI3LDJPDvONuHJdy3DKX+
	T4YCp
X-Gm-Gg: ASbGnctLsdhD0DQM3HuWl5IUdeXtsH2gPvksfOdbqgQzN2BnEqmOBdAmb9/T/3A74Mq
	yA0XbZ4oWE3WRSqdNhBK/HnrTbiEkZviWhPL0I8/iJHUJ7u2+tyH/mckFoSO2s6+j6kY/fjkupJ
	qoL0QOKdVaaLHCo7T5Ll2j39KoDAtxUJ1Or57tXY+Djd1lzDG47g66jSCVC0tWx0iwk5wqtTOrA
	a8QD7rzedin5R7JDf07+/cSBL1qEzUH7EkcSqjO1jH7Ni1JBpnNAj9y1hTIUUBS3BJqYKEynFWi
	58NgXfVgQkI3UnqdaffndhVpl23KOEUq7o554Urtd+wtEm9E+/4GvjUUvxldrwinJNR1IatfZ/h
	gJC1UwZnGkrEV
X-Google-Smtp-Source: AGHT+IG9GpYwtsIvHMtqqvVo3c1XbiI/EjofDSsef489TMyyrxnZt4zfcXNgOFC683B//28QBgbiYw==
X-Received: by 2002:a05:6a00:ad6:b0:749:ad1:ac8a with SMTP id d2e1a72fcca58-76ab2b55c8dmr6766129b3a.11.1753909716416;
        Wed, 30 Jul 2025 14:08:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 3/8] libxml2: patch CVE-2025-6170
Date: Wed, 30 Jul 2025 14:08:22 -0700
Message-ID: <1dab0ba31fd09911d4fa707c1318bb0e83f46cdd.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753909581.git.steve@sakoman.com>
References: <cover.1753909581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221153

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE from 2.13 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-6170.patch        | 103 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.13.8.bb    |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch
new file mode 100644
index 0000000000..29c82f8baf
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
+@@ -1033,6 +1033,10 @@ xmlCtxtDumpOneNode(xmlDebugCtxtPtr ctxt, xmlNodePtr node)
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
+@@ -2795,10 +2799,10 @@ void
+ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
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
+@@ -2856,7 +2860,8 @@ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
+             cur++;
+         i = 0;
+         while ((*cur != ' ') && (*cur != '\t') &&
+-               (*cur != '\n') && (*cur != '\r')) {
++               (*cur != '\n') && (*cur != '\r') &&
++               (i < (MAX_COMMAND_SIZE - 1))) {
+             if (*cur == 0)
+                 break;
+             command[i++] = *cur++;
+@@ -2871,7 +2876,7 @@ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
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
diff --git a/meta/recipes-core/libxml/libxml2_2.13.8.bb b/meta/recipes-core/libxml/libxml2_2.13.8.bb
index fd042c311d..4bd2a0d38f 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.8.bb
@@ -20,6 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            file://CVE-2025-49794_CVE-2025-49796.patch \
            file://CVE-2025-49795.patch \
+           file://CVE-2025-6170.patch \
            "
 
 SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
-- 
2.43.0


