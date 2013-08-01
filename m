Return-Path: <joe@deserted.net>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id E895B61883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 14:29:27 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id o19so1128169qap.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 07:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=zVKxgNdqUo7MPpufHBsG5xgbuFOWAJQ8qrt8F6gpwUE=;
	b=OaG4Xht1/d3PmliIdj+OSH9f+llnKpYTznfskYlXa/9dXAopz25vaWaypSJgBaFiTm
	En0vHIDG0PI+Uk5UocUcqSISva+OvVOcOtkaHsZ7cRemyUPbDMJwC4xqXv6yHK6fjnMM
	ezPeNMS0dN2fHkJTQ9K30plUG8Ah++VbiR12WYMvgNGI/XDY6Xb5syTP+FUYiLGfbpU8
	9XeFFv2GbfFW2BMrhJULmcg9m7mbTgPLih75Qngjl5lHb1FPHRmjF8/iwh4xAss5Nz75
	kAF504e8xGJE1Z2LvttHaHiFg/GiBXjUsfwJorqR+QNgy4A/ZRaLR9F2In2KXZDfwA3m
	xMkQ==
X-Received: by 10.229.205.68 with SMTP id fp4mr598111qcb.16.1375367368159;
	Thu, 01 Aug 2013 07:29:28 -0700 (PDT)
Received: from burninator.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id d1sm5386854qag.6.2013.08.01.07.29.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 07:29:27 -0700 (PDT)
From: joe@deserted.net
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 10:29:19 -0400
Message-Id: <1375367359-17205-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnDFr9iXVdyTiPt7OpLuup05ixOIoRu6DM/t9s87NSW2qkBoFTaGrj4g+HGpW1qMOSowOav
Subject: [PATCH] oe-find-native-sysroot: minor optimization
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2013 14:29:28 -0000

From: Joe MacDonald <joe.macdonald@windriver.com>

The middle 'cut' in OECORE_NATIVE_SYSROOT isn't doing anything useful, so
remove it from the pipeline.

Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---

Really a trivial optimization, I noticed this when I was looking for
something else.  It's possible the middle 'cut' is necessary in some
environments, but I wasn't able to reproduce a scenario where removing it
changed the results.

 -J.

 scripts/oe-find-native-sysroot |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 9df9b44..81d62b8 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -40,10 +40,10 @@ if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
                 exit 1
             fi
             touch conf/sanity.conf
-            OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '=' -f2 | cut -d '"' -f2`
+            OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`
             rm -f conf/sanity.conf
         else
-            OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '=' -f2 | cut -d '"' -f2`
+            OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`
         fi
     else
         echo "Error: Unable to locate bitbake command."
-- 
1.7.10.4


