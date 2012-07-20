Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss64b-0006Px-5m
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 07:48:21 +0200
Received: by yenl13 with SMTP id l13so3375525yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HnAxH+t8bu9Yl7LmWHVwqMVlqIhPnpOw84zFmgfuKWk=;
	b=EsBFP1MR/Hkfl71VTSGlKMLI0fkTYHWjRzQW7Q/cWXS1lUuBT2zGt/MckZPIHCvmao
	WISq3REcPzpy5tsFaxN/OP1Lh7pjzMlEQAZr3PIXWv1rq+tZNDysPNhGnFrdSuyFbCtY
	xdk6UNqURY4qOANMJMuDsTwCZbqM7Fr3yY56okY895pcl42D0jq99pXZSmdZDvD7Y1sw
	cAs71M6n0yxTfb0JZpKsotfPfFBHn63CnF7eZmgHt81Txq4NWOt2Vj5HQiGymUrJA6HN
	WVqfvKITwykgJB0oPqydKYu4hLENolcLMd9uQG+JMp+cw3exJSLK43tjREOSEVR4TsvJ
	6SQQ==
Received: by 10.66.79.8 with SMTP id f8mr8680831pax.81.1342762617819;
	Thu, 19 Jul 2012 22:36:57 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sy3sm3248824pbc.18.2012.07.19.22.36.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 22:36:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:36:10 -0700
Message-Id: <1342762570-29343-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] kernel.bbclass: fix external module building
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
X-List-Received-Date: Fri, 20 Jul 2012 05:48:21 -0000

From: Denis Carikli <GNUtoo@no-log.org>

Without that fix we have the following while compiling compat-wireless.
  include/linux/mmzone.h:18:30: fatal error: generated/bounds.h: No such file or directory

Note that the compat-wireless recipe will be added in another commit.

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



