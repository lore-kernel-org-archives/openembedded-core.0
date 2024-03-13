Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D232C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:49:48 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.2506.1710352177064434538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VUq4jeo/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202403131749336c5b3fdd8504b80842-o76brx@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202403131749336c5b3fdd8504b80842
        for <openembedded-core@lists.openembedded.org>;
        Wed, 13 Mar 2024 18:49:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JLg1inEGar7Dx/gPghkj0cf2A6Yl5f/0PEA3nxc3R/I=;
 b=VUq4jeo/PL/gVctWD1mCpupGsw/gax2cjOiBSuA9GViv0KLNcbGA+yT62e6DoBNQrxjIMG
 Lnlpy3E9cVFncU712vDnNg41p0ZP4HNWdPykqOUeCI7+VFn3sB+LNannGAllDsAMBgdNsAxq
 quy8RbLwMHjsAZyPV9T427epL+wIA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] meta-ide-support: depend recursively on populate_sysroot
Date: Wed, 13 Mar 2024 18:48:44 +0100
Message-Id: <20240313174844.3580697-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197075

From: Peter Marko <peter.marko@siemens.com>

Following workflow is broken when built from sstate-cache:
https://docs.yoctoproject.org/singleindex.html#setting-up-the-extensible-sdk-environment-directly-in-a-yocto-build
This is already broken in kirkstone.

Reproducer:
$ bitbake meta-ide-support && bitbake build-sysroots -c build_native_sysroot
$ ls -1 build/tmp/sysroots/*/*gdb-cross* && echo OK || echo FAIL # succeeds from scratch
build/tmp/sysroots/x86_64/manifest-x86_64-gdb-cross-x86_64.populate_sysroot
OK
$ rm -rf build/tmp
$ bitbake meta-ide-support && bitbake build-sysroots -c build_native_sysroot
$ ls -1 build/tmp/sysroots/*/*gdb-cross* && echo OK || echo FAIL # fails from sstate-cache
ls: cannot access 'build/tmp/sysroots/*/*gdb-cross*': No such file or directory
FAIL

build-sysroot populates sysroot with recipes which run
populate_sysroot or populate_sysroot_setscene.
Dependency on its own populate_sysroot does not seem to work when
building from sstate-cache as this task is not executed.
This seem to becaused by inheriting nopackages class which deletes tasks
thus messing the setscene dependencies.

Depend explicitly recursively on prepare_recipe_sysroot.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/meta-ide-support.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index d85aa120c0..9aa87f3056 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -37,4 +37,4 @@ do_deploy () {
 
 addtask deploy before do_build
 
-do_build[deptask] += "do_prepare_recipe_sysroot"
+do_build[recrdeptask] += "do_populate_sysroot"
-- 
2.30.2


