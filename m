Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcCLA-0001WZ-Va
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 10:11:13 +0200
Received: by iym10 with SMTP id 10so1896700iym.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+OvVSSLL/rC//sbRrrO/3xSAcpWZVeut7p/7TheZgRo=;
	b=A0Qe+LED0kz+jNnW01+1kdnxMRm6pAwMdFi03p0IyxL7cJZo9VbqDNUZDMSth/yNOd
	i5JJ9ln6GdfXc2Hr609ykk/iWhdU93gjLJ3poSkGwkb+W2DVRJnmvupIHevbHx3rUITn
	KgyC6eNxg8UxLnymQmBEveskhq0iUasXwmBNA=
Received: by 10.42.199.203 with SMTP id et11mr1909080icb.257.1309421249337;
	Thu, 30 Jun 2011 01:07:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s2sm1093925ibe.1.2011.06.30.01.07.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 01:07:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 01:07:11 -0700
Message-Id: <d44b4e89e96ac80202f3653ed0c890cac976cb0c.1309420894.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
References: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
In-Reply-To: <cover.1309420894.git.raj.khem@gmail.com>
References: <cover.1309420894.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] uclibc-config.inc: Fix regexp to determine big-endian arm
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
X-List-Received-Date: Thu, 30 Jun 2011 08:11:15 -0000

Without this even arm-*-* was being treated as big endian
but normal convention is the arm-*-* is little endian

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-config.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index 3679c10..697164c 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -75,7 +75,7 @@ def map_uclibc_endian(a, d):
 	if re.match('^(avr32|e1|frv|(parisc|hppa)|m68k|microblaze|powerpc.*|(sparc|sun).*)$', a):
 		return 'BIG'
 	# Possibly BE
-	elif re.match('^((arm|sa110|arm.*eb)|h8300.*eb|(parisc|hppa).*eb|mips|sh.*eb|xtensa.*eb)$', a):
+	elif re.match('^(((arm|sa110).*eb)|h8300.*eb|(parisc|hppa).*eb|mips|sh.*eb|xtensa.*eb)$', a):
 		return 'BIG'
 	return 'LITTLE'
 
-- 
1.7.4.1



