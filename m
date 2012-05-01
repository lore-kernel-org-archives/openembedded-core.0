Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFc8-0000in-Cn
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:07:44 +0200
Received: by qady23 with SMTP id y23so2546606qad.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YSzL9Opw6Am5EnxXQe+WpVvLFL4NdBpkrqbiHnZ99hg=;
	b=SsP6zPC1FXlTeKBSiLJw5ueUO2YEI5c1XJrY8U0035BYr+bRqC+WeJplVIMkqGiyD5
	Kkot4viTUDZZxmn/DlnyqLaONDR5rMIdu7HHzP/XTnz2WSmsnEtvl3v7NN0ZdJlp5b+h
	rsxbq/ELt/fhNC/0pKaUvt3uGOKuBOIkFdIsBa1Qz7KoISEEwSqqTmAYQDjZrEB2kl+v
	uE7CnRdNz2gfAukprr7mCkBlooFBZdM56/wLN0x6e3znTC7NFO7dHIwIF4mprLWvEsna
	npSXDHZM80mlJvr2po0nVt9VuJAkZAmwOWiXR5vBEsFiZuhoPCXPR2qt464znjqgAEJE
	lx/w==
Received: by 10.60.28.137 with SMTP id b9mr7662492oeh.57.1335887880759;
	Tue, 01 May 2012 08:58:00 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h7sm16733267oeh.9.2012.05.01.08.57.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 08:57:59 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 10:58:19 -0500
Message-Id: <5980121c3ada9719a0286fce9f0a4c9c68734eae.1335887732.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
Subject: [PATCH 1/8] csl-versions.inc: capture version in signatures
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
X-List-Received-Date: Tue, 01 May 2012 16:07:44 -0000

We want to ensure that changing external toolchain version will change the
metadata checksums of target recipes. This will do so via ensuring that any
variable which references TOOLCHAIN_OPTIONS also pulls in the toolchain
version variables.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/csl-versions.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
index 6b8b2c5..ec7a6ba 100644
--- a/meta/conf/distro/include/csl-versions.inc
+++ b/meta/conf/distro/include/csl-versions.inc
@@ -103,3 +103,7 @@ python csl_version_handler () {
     d.setVar('CSL_VER_GDB', csl_get_gdb_version(ld))
 }
 addhandler csl_version_handler
+
+# Ensure that any variable which includes the --sysroot (CC, CXX, etc) also
+# depends on the toolchain version
+TOOLCHAIN_OPTIONS[vardeps] += "CSL_VER_MAIN CSL_VER_GCC"
-- 
1.7.7



