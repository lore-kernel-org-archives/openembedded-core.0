Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbNMA-0001iV-Sc
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 03:44:51 +0200
Received: by pwi1 with SMTP id 1so3517982pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 18:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+OvVSSLL/rC//sbRrrO/3xSAcpWZVeut7p/7TheZgRo=;
	b=R85cHj6z5fbSbD0/C/Rol3EyZyNg4DcZVqAcm7rPkPptjoPh8h90mTWKI7CqPcIKJ/
	SfZfN3SoiWIsPsyRdFXr9S5V9egs+/2R3uo6eyz6AuSxqsQH/V+jBWPqZ9oMvwwob+ci
	5j9A12qGKYLFOr2bCWZ+3ch4jEjju7uyUmzKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=esue5CEbzgUh7K242cekeDIBVpYylq3V34KmH1qp3aLXJuudZKcmqq5nfVOAnoyKLo
	hzZRo2ORJZUTihAiMar3HqHmiNskn82VlRLjwTYjPmCHi1j9Qg06w+GJEC7pNVF4i4wI
	irSMxcBkaDoS3FzGiwJqstXCMTI52ZjhdDF5Q=
Received: by 10.142.120.1 with SMTP id s1mr1220685wfc.252.1309225269617;
	Mon, 27 Jun 2011 18:41:09 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o2sm4725057pbj.17.2011.06.27.18.41.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 18:41:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 18:40:50 -0700
Message-Id: <1309225253-25795-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1309225253-25795-1-git-send-email-raj.khem@gmail.com>
References: <1309225253-25795-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/5] uclibc-config.inc: Fix regexp to determine big-endian arm
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
X-List-Received-Date: Tue, 28 Jun 2011 01:44:51 -0000

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



