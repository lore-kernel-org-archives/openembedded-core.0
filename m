Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1S8IrF-0006MW-Go
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 23:09:18 +0100
Received: by dado14 with SMTP id o14so5656165dad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 15:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=cu/c4Ehhx4TDUZ1qcXUYZVhctCV+au6mmK8VLPl/UWE=;
	b=KYdo0+AUZjGPhD+3OjX4jxJ4wKXiCp50rfKHdweASljzFBv/+7Lpizgm/JpvWoC7FT
	jsjT5vjYu3VRQ3KS6vZnVz8NFd20pxWZXdZoy/V5nQeOyc0DGsiXRcBzNvsYBNoTizCd
	rN33PYdELkogOhrGpZklDtxYAvT6ckHMpr4xRvKqvKrqduIGq8/A+u2EFc7/Dgbtw9bs
	cqaDITq4CpzIs7VFMyts4I0BKKZmoF/IYe+S3MiR0mBWmU2znzsbRTIXlYt0vtoCj+c8
	Icsicmo9j/dflGh4d4RtaxRywxCAEVKerJFTGxC6Qi4ut7ptSiDlttaXLtx8EMFiCNT0
	JBjA==
Received: by 10.68.237.1 with SMTP id uy1mr8121628pbc.151.1331848829915;
	Thu, 15 Mar 2012 15:00:29 -0700 (PDT)
Received: from localhost (static-50-53-102-193.bvtn.or.frontiernet.net.
	[50.53.102.193])
	by mx.google.com with ESMTPS id q8sm2736929pbi.1.2012.03.15.15.00.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 15:00:29 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 15:00:17 -0700
Message-Id: <5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b.1331848750.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331848750.git.dvhart@linux.intel.com>
References: <cover.1331848750.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1331848750.git.dvhart@linux.intel.com>
References: <cover.1331848750.git.dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQk30fcjqQkcX7dtFDh40lKvtCgsWsbktMC2DnZezZaiPrnb6mGUx7om7YNcxdv3aBv5qEhz
Subject: [PATCH 1/1] rt-tests: Add src/backfire to FILES_${PN}
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
X-List-Received-Date: Thu, 15 Mar 2012 22:09:19 -0000

Fixes [YOCTO #2114]

The rt-tests recipe was issuing the following WARNINGs:

WARNING: For recipe rt-tests, the following files/directories were installed
but not shipped in any package:
WARNING:   /usr/src
WARNING:   /usr/src/backfire
WARNING:   /usr/src/backfire/backfire.c
WARNING:   /usr/src/backfire/Makefile

Add ${prefix}/src/backfire to FILES_${PN} to include these files in the package.
These depend on the target kernel and are meant to be able to be rebuilt as
needed.  Ideally we would also build this module and include it with rt-tests or
the linux-yocto-rt kernel. For now, conform with the intent of the rt-tests
Makefile and avoid the WARNINGs.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
index 78d51b3..6425027 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
@@ -11,6 +11,7 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
 
 # git -> 0.83 needs a PE bump
 PE = "1"
+PR = "r1"
 
 SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
 
@@ -25,3 +26,5 @@ do_install() {
         oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
                            INCLUDEDIR=${includedir}
 }
+
+FILES_${PN} += "${prefix}/src/backfire"
-- 
1.7.5.4



