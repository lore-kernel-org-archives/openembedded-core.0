Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4A99D60168
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 04:41:18 +0000 (UTC)
Received: by ieczm2 with SMTP id zm2so84656iec.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 21:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nogzDXHiTfU9IhbyawbXPaNf0fF5tGREWMWJNchqhTM=;
	b=meMQBnNY6MriqiV5vx2bU1vCXJfqxE+J1tkJWpG/fvHNVimtoLPqEnr/oVWFySL6lW
	4AgblM7YghBW6uqCpcJZ5tudE3pXiTuDlbNH+kazYZxuAEgDCRqR8jYeZbx0YNv2dn53
	BIQC+2uk+pI8YtfArmZZpoX+InA5yAP5H7QLosllea60iC6xNTDE4X7KqRXmsBkBRMsz
	s+MQjgSq9NmOBuVywxesrQnXDNPNYQaBpC7O9s6XZxIL978egtcfnhllBwv0WTqe/Lom
	dPXBZt/YmnrP4qpcqZ48t4ZgtqcKQ8P00OH4zbDumBEPRdfZwygmD1Ccm0igM2HHqbUK
	KpbQ==
X-Received: by 10.50.50.177 with SMTP id d17mr1511862igo.19.1432183279754;
	Wed, 20 May 2015 21:41:19 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id v14sm334561igd.12.2015.05.20.21.41.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 21:41:18 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 21:41:07 -0700
Message-Id: <1432183267-5952-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] toolchain-scripts.bbclass: fix quoting for CCACHE_PATH
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
X-List-Received-Date: Thu, 21 May 2015 04:41:19 -0000

Single quotes prevent expansion of $sdkpathnative$bindir.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---

fido needs the fix too.

 meta/classes/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 670e93b..9918e2e 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -22,7 +22,7 @@ toolchain_create_sdk_env_script () {
 		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
-	echo 'export CCACHE_PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/${TARGET_SYS}'$EXTRAPATH':$CCACHE_PATH' >> $script
+	echo "export CCACHE_PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$CCACHE_PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
-- 
1.9.1


