Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id A331065D58
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 21:53:29 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 79so1103666ykr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=ADDkA2jNEFm3IK07zETaG0hbOcoAV3S0TkRS5qGT8t8=;
	b=OueS6YAT2+vpDqzDD0GYtRcT2qbVNoV1kuWKgv5VUxZAzWJWf58mjIDheM5o+1ZzP+
	C6JvRJBK5VhMtjQaZVzMA4Mqyi9xCmW5BEslbbVYQYVOLRxcqSluMqR/z/fNdQgXSyre
	Gi+hsSj6Z4G+PbfuyY3fBEdJsaogp55tTo1XDm/BsL/mvUMYCWOgaSwFy0bITp4u8er5
	3/GS7jhess8lXBu91Pzj6oddtP8wLHrcVZn5LZ/BBhQhK3XjCuCebQU42mdt6EI9c3EM
	1h+mvKchHotc2XwLOkhlpubdHrt+zDFL+6gmu2aEsk3kAj4X6rcVapkR6Ll3qJscERyq
	sTgQ==
X-Received: by 10.236.184.231 with SMTP id s67mr1094486yhm.97.1412891610950;
	Thu, 09 Oct 2014 14:53:30 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id h92sm2048431yhq.21.2014.10.09.14.53.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Oct 2014 14:53:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  9 Oct 2014 18:53:13 -0300
Message-Id: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] toolchain-scripts.bbclass: Allow sourcing of subscript for environment
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
X-List-Received-Date: Thu, 09 Oct 2014 21:53:34 -0000

Sometimes we require extra environment settings to be available on the
environment for proper SDK work. This were done, in past, using
'_append' tasks however with the split of the environment in a
canadian package this has been broken.

The easier and more flexible solution is to use environment subscripts
which are sources by the main script. These are now looked at:

 $OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh

and sourced.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/toolchain-scripts.bbclass |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 6cc8eba..11ffbe5 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -72,6 +72,16 @@ toolchain_shared_env_script () {
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
 	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
+
+    cat >> $script <<EOF
+
+# Append environment subscripts
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
+	    source \$envfile
+    done
+fi
+EOF
 }
 
 #we get the cached site config in the runtime
-- 
1.7.10.4


