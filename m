Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SsMiT-0004Lb-Mq
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:34:37 +0200
Received: by pbbrq2 with SMTP id rq2so6171085pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=01sHS+rDafYOppDV5csRojj3LgSlrkKj8EqDy/2Vhhk=;
	b=wE9nuqkIt3P1zoSmvEukZUD+XuD+2YxCIi7noYw5RtIbnRj8KDO44nQ6VjcxNBx7IV
	QkBTr6bSGZKm8GoL10RiFKYv+pcqUweUHsDyBwxGlYgU422Dz6ZoQwJ+0El1wEKfOcRP
	pJ59I0x/yJ9MkrxiWAVa2VZTloClJ/Z04UeQ6ricWS5zP/4RzMBul/uQk3c+WZpz5PmJ
	AUOl/FvOlH0a4C3+RQAMycLauXoDjEuInByhUiPtidLzzNblcgB9+qkVZs3qrM6W1Brv
	W2iT18jh3z50Kx9wUNARdnuXI1Vbzo3p2XfBgg2LkFvoaMZPqCLDSypEy8qkI0Wg99pL
	mqAQ==
Received: by 10.68.227.195 with SMTP id sc3mr17369317pbc.104.1342826593345;
	Fri, 20 Jul 2012 16:23:13 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hz10sm4822794pbc.32.2012.07.20.16.23.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 16:23:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 16:22:22 -0700
Message-Id: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH V2 1/2] kernel.bbclass: fix external module building
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
X-List-Received-Date: Fri, 20 Jul 2012 23:34:37 -0000

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



