Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5tlL-0003GK-0Q
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 07:57:15 +0100
Received: by wibhj13 with SMTP id hj13so135513wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Mar 2012 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zd5WSu2ZK2yDoLYm6S27ajnD4TMMt3iynqWI11fh/eY=;
	b=Gd/MacPah5zSdR5CChl41bLJqTXwJDmjtUaOJcDgy9IdjJmHpJBkHJqV0Yp4eBqKe6
	tojMxGQORvALrTk5jsHO31xjR8ac1SVB1g/OeThSdTUSe6U/Z2jSVs3bC6dn4YWeHutP
	lUd0WypcfUA+MB8y6irv7vqtiMQGtpJqGJA29fkPbts3ZCdMYN2KYlttknVe0NDGd0M4
	n3I0pyHvdnQOYdFJ6FaM9eEB8Gs4vWU7kfRyliAM7HxEnv/g9iwUk5hyC19vZ/luRCGH
	aqJMo4nJS2j6OE5NlSc/x36TTgXXAK0X0fXF5ULhemRT34HfYmMTMbgZqVulTby7LEVR
	zmAQ==
Received: by 10.180.95.34 with SMTP id dh2mr1875250wib.15.1331275716073;
	Thu, 08 Mar 2012 22:48:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id be4sm5385976wib.8.2012.03.08.22.48.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 22:48:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 07:48:26 +0100
Message-Id: <1331275706-6917-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <20120301094052.GB3831@jama.jama.net>
References: <20120301094052.GB3831@jama.jama.net>
Subject: [PATCH] bitbake.conf: use PACKAGE_ARCH instead of TARGET_ARCH in SDK_NAME
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2012 06:57:15 -0000

* also use weak assignment for SDK_NAME_PREFIX as suggested by khem
* PACKAGE_ARCH is not 100% right too, because such SDK image usually has few
  machine specific packages included (e.g. base-files, securetty, opkg configs)
  but those are not important for SDK users so it's better to have one SDK for
  whole e.g. armv7a-vfp-neon then 6 SDK for each machine which would work the
  same.
  You can see diff between crespo and om-gta04 SDK here:
  http://build.shr-project.org/shr-core-staging/031/sdk/oecore-i686-armv7a-vfp-neon-toolchain-efl-crespo-om-gta04.diff

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 87bb71c..91f8397 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -364,8 +364,8 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 # SDK variables, 
 ##################################################################
 
-SDK_NAME_PREFIX = "oecore"
-SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME_PREFIX ?= "oecore"
+SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${PACKAGE_ARCH}"
 SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
-- 
1.7.8.5



