Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Stgqv-00064c-Pk
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:16:49 +0200
Received: by yhjj56 with SMTP id j56so6244858yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=01sHS+rDafYOppDV5csRojj3LgSlrkKj8EqDy/2Vhhk=;
	b=iZlZ3vzcELClY6ItSpyerUmlF4i+N1xLWJwVQdrpaAIJwNvvrpY4/WMQIA+I131PgC
	7lly4CVRTCV66aBcJcToAVEKFV9zsPoFsyZxm4wchFR88qIYg8eivYWX5Gtv7wnDC2kb
	HAjFDcCzuODR+2e74WlFXtq85DUBLc1qDY9+jn0nWK3Tkpw+9PCfof2hq90UI4AAFDrj
	ibmc7jnOPkU1ED5YbxGVHDD9Q6P4MgFgQNrY60IG4TnLniXak0I0f/KgSdv0D7ZVgYYu
	pmEjXAF0x8yyJWQQdffzZqlNNq6DQIAOsgrqFyIdwtexe8FKuru9GEwL7CKk2hfNDWEA
	6TUw==
Received: by 10.68.116.203 with SMTP id jy11mr45078734pbb.129.1343142320835;
	Tue, 24 Jul 2012 08:05:20 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sh3sm12332139pbc.16.2012.07.24.08.05.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 08:05:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:04:20 -0700
Message-Id: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343142062.git.raj.khem@gmail.com>
References: <cover.1343142062.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] kernel.bbclass: fix external module building
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
X-List-Received-Date: Tue, 24 Jul 2012 15:16:50 -0000

From: Denis Carikli <GNUtoo@no-log.org>

Without that fix we have the following while compiling compat-wireless.
  include/linux/mmzone.h:18:30: fatal error: generated/bounds.h: No such file or directory

Note that the compat-wireless recipe will be added in another commit.

make -C $kerneldir _mrproper_scripts deleted this file along with
other things so we resurrect it with this patch.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/kernel.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 08b5e61..ce4d7de 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -187,6 +187,9 @@ kernel_do_install() {
 		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
 
+	# Necessary for building modules like compat-wireless.
+	cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
+
 	# Remove the following binaries which cause strip or arch QA errors
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-- 
1.7.9.5



