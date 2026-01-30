Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DCCD49C6F
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:53:58 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5994.1769759629653883826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=NqUVPDsM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260130075347538c58cede000207a0-sl4bmj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260130075347538c58cede000207a0
        for <openembedded-core@lists.openembedded.org>;
        Fri, 30 Jan 2026 08:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=I6W4BjMzVnEfe+o8VkMROFQkzc/oPOgyjMhRjXU5yPk=;
 b=NqUVPDsMuNSUrg+CRMlISi3Tz7VO6xz3hLc0CAJStCGOa+q9z69bieT8BSI19yaB0+fK9P
 VsD1v8TqsRJzY0tCkk9KcSmQhgP+J4twEWcHUOJVfjwlWuWDRWFMhkg3CBbOVObI+HmnXKEM
 zr8oksi/1VZs7ClMVWyHQHhePIlY7ig5ZASg5jVQR+SIcoaz9NymwBiJmvxgeyAhNo3sNoic
 YYWwZWnJfIz8+bYorGQ53m+unn2WhZZRnamce08ouZfXdNBvSXkNuPQHuykCe/BzVOv9Iy4u
 Z874ISfK1xMu5+i10Itg3H2azm3xEVvNvwRNxiBtpwRMlh+CiizuHrnw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] build-sysroots: Add sysroot tasks to default build and remove warning
Date: Fri, 30 Jan 2026 08:52:32 +0100
Message-ID: <20260130075333.940897-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260130075333.940897-1-adrian.freihofer@siemens.com>
References: <20260130075333.940897-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 07:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230183

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add both do_build_native_sysroot and do_build_target_sysroot to the
do_build dependency chain, allowing "bitbake build-sysroots" to populate
both sysroots automatically.

This is now safe to do since the previous commit added lockfiles to
serialize these tasks, preventing the race condition where they could
interfere with each other when run concurrently.

Remove the do_build_warn task which instructed users to call the tasks
explicitly, as this is no longer necessary. The warning was not clear.
For somebody who knwos about the race condition, it was obvious that
they should call the tasks explicitly, but for all other users this
was just confusing.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/meta/build-sysroots.bb | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index 3ee9565862..c094b8ae53 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -19,14 +19,6 @@ deltask install
 deltask populate_sysroot
 deltask recipe_qa
 
-do_build_warn () {
-    bbwarn "Native or target sysroot population needs to be explicitly selected; please use
-bitbake -c build_native_sysroot build-sysroots
-bitbake -c build_target_sysroot build-sysroots
-or both."
-}
-addtask do_build_warn before do_build
-
 python do_build_native_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
     nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
@@ -37,7 +29,7 @@ python do_build_native_sysroot () {
 do_build_native_sysroot[cleandirs] = "${STANDALONE_SYSROOT_NATIVE}"
 do_build_native_sysroot[nostamp] = "1"
 do_build_native_sysroot[lockfiles] = "${WORKDIR}/build-sysroots.lock"
-addtask do_build_native_sysroot
+addtask do_build_native_sysroot before do_build
 
 python do_build_target_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
@@ -49,6 +41,6 @@ python do_build_target_sysroot () {
 do_build_target_sysroot[cleandirs] = "${STANDALONE_SYSROOT}"
 do_build_target_sysroot[nostamp] = "1"
 do_build_target_sysroot[lockfiles] = "${WORKDIR}/build-sysroots.lock"
-addtask do_build_target_sysroot
+addtask do_build_target_sysroot before do_build
 
 do_clean[cleandirs] += "${STANDALONE_SYSROOT} ${STANDALONE_SYSROOT_NATIVE}"
-- 
2.52.0


