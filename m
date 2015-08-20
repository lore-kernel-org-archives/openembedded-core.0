Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E802A65CCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:19:16 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so19159497wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ggw4zDt6LE4nsk/Kg/He7WFvqohXFx8KqyOvTZ+ekfI=;
	b=dW7ML+MzSuRuQLBchTjOb/0I2srDzgSquJqxqXBGz9WjX3R+XF3tumqezHSh7Lopwt
	6MOhaKtB8OJ7+3vQCycZTmu3tgxxI1d+/Itkpc26188Hu8KswwO1GBVw1K71jsE13Brn
	87A7Fab+Gizboq2PDH0xCiV8mIIDf8UwGzB4iQg4QrNiZL1uSaSsNxafiOomY06ttrz1
	hCISwlT6BpmhOpn/E4Mo5bR0tu2EZxM2PYn8FauqxgJ735FExaVrVOWwDvb44xxiEh9K
	39NQykA6ep+EMcaoVoLBgau3/x8+UMMrr9tZIs697FOrE+GjFaBRkyck8QD9UgGjLni/
	5ypA==
X-Gm-Message-State: ALoCoQnSfp6E9YeBCLYzv8oklwBj6kVxbf945v16LN/8gP3U0DNhjpcYxCfrPt0DLxQ2MDTnMx/t
X-Received: by 10.180.83.227 with SMTP id t3mr67260895wiy.55.1440083956201;
	Thu, 20 Aug 2015 08:19:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id s1sm6575671wix.13.2015.08.20.08.19.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 08:19:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 16:12:52 +0100
Message-Id: <1440083572-22706-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] multilib: let pkg-config find architecture-independent .pc files
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
X-List-Received-Date: Thu, 20 Aug 2015 15:19:21 -0000

If a multilib package depends on an allarch recipe that installs an
architecture-independent .pc file it will not be able to find the .pc file as
the recipe gets installed into the MACHINE sysroot but pkg-config looks in the
MLPREFIX-prefixed sysroot.

Solve this by extending PKG_CONFIG_PATH in multilib environments to include the
architecture-independent path in the MACHINE sysroot
(sysroots/MACHINE/usr/share/pkgconfig/).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/multilib.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 37e8481..89a8e90 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -17,3 +17,10 @@ BBCLASSEXTEND_append = " ${MULTILIBS}"
 MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
 
 OPKG_ARGS_append = " --force-maintainer --force-overwrite"
+
+# When multilib is enabled, allarch recipes will be installed into the MACHINE
+# sysroot, not MLPREFIXMACHINE.  This means that anything using pkg-config to
+# find an allarch pkgconfig file will fail as the PKG_CONFIG_PATH only looks
+# inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
+# architecture-independent pkgconfig location to PKG_CONFIG_PATH.
+PKG_CONFIG_PATH .= ":${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig"
-- 
2.1.4


