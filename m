Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD56C35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:11:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.17470.1741716690569201244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mCIMFiFR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025031118112827d3e734a0c4c8ca0e-irtqcf@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025031118112827d3e734a0c4c8ca0e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:11:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vT+hY7UrjJGGN70V+rZ2pjELQaUTgT8GPswm28JEIsE=;
 b=mCIMFiFRvwW0V1lZDd2JFMviSIrvhJ26X9LWMLj6cTKuj9vls0feB+9v1RpxoGJJOi0olF
 yND1Yt7ID3BpDZrvXlDjvc2reH9FQq95KkN6rxfSOKtwP0xlK3y6I0qMaS/KtACx/s4x+/BJ
 tk43jRG2I8nxgjsS9niGGaKgNFBSZI1K1cbopsRJbuQPm04OO2t0JGJXIGIUq7fYEpIYSGJ7
 VqH0Kxz/D0Ixa7XkDC8XUqIEX6mn0b70Y8Fg6kCpJ3Ei14wW5pP00VBIUCbJoxy4fEtTVPaq
 38QlDVXgiwqBHZofBXr5YqZnyZdOq2kjKbh7ckQ42l7k71t+UbnDjmcg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 09/17] grub: patch CVE-2024-45775
Date: Tue, 11 Mar 2025 19:09:52 +0100
Message-Id: <20250311181000.8582-9-peter.marko@siemens.com>
In-Reply-To: <20250311181000.8582-1-peter.marko@siemens.com>
References: <20250311181000.8582-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212586

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2024-45775.patch           | 38 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45775.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45775.patch b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
new file mode 100644
index 0000000000..70492b8c2e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
@@ -0,0 +1,38 @@
+From 05be856a8c3aae41f5df90cab7796ab7ee34b872 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:55 +0000
+Subject: [PATCH] commands/extcmd: Missing check for failed allocation
+
+The grub_extcmd_dispatcher() calls grub_arg_list_alloc() to allocate
+a grub_arg_list struct but it does not verify the allocation was successful.
+In case of failed allocation the NULL state pointer can be accessed in
+parse_option() through grub_arg_parse() which may lead to a security issue.
+
+Fixes: CVE-2024-45775
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45775
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=05be856a8c3aae41f5df90cab7796ab7ee34b872]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/extcmd.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/grub-core/commands/extcmd.c b/grub-core/commands/extcmd.c
+index 90a5ca24a..c236be13a 100644
+--- a/grub-core/commands/extcmd.c
++++ b/grub-core/commands/extcmd.c
+@@ -49,6 +49,9 @@ grub_extcmd_dispatcher (struct grub_command *cmd, int argc, char **args,
+     }
+ 
+   state = grub_arg_list_alloc (ext, argc, args);
++  if (state == NULL)
++    return grub_errno;
++
+   if (grub_arg_parse (ext, argc, args, state, &new_args, &new_argc))
+     {
+       context.state = state;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ee841b3de6..0ad5ba7fc0 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45783.patch \
            file://CVE-2025-0624.patch \
            file://CVE-2024-45774.patch \
+           file://CVE-2024-45775.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

