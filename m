Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B28C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 20:20:19 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.91662.1753734015948656923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 13:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ONn1Zmsx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250728202010ada1711f6bb48ef76f-othcdu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250728202010ada1711f6bb48ef76f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 28 Jul 2025 22:20:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oJ7n320Lq/mU46E/OTQUe/JtCJ0fU++VQFSl9ItG33E=;
 b=ONn1Zmsx4Dg/ap11Ubq7N0NCF1FyYIduzrpytXUf+4g7E6tlUrqngi42RmLD14ct9KcsgY
 iBFS9vMr8sy9mRfseoneC0LQtMyQv2x4HRq1+S3ucqAncVRwfSNTxKrb/SW0fU2KmcAOfyN5
 0qQvpQ+RIvxhpJU/Bhoyioaw5uREdcK4khTqxmqgdy1i3jVORxo6B4kcYx4OnEIJyZvmVaRX
 7qRNL2oScUO5b+MHrqt3VaGI+pN21IWkcgxHgWPQlguATqRJghYI7xn7rL91h0F3GbShaZFb
 skjp6rR7vW7L0DJvNm8QW2IPA/Lai+eLgV2VujtFbsDKN/3l/dtxhKrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libxml2: patch CVE-2025-6170
Date: Mon, 28 Jul 2025 22:19:19 +0200
Message-Id: <20250728201919.4112821-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 20:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221021

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE from 2.13 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

