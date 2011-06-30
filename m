Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcCLA-0001RO-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 10:11:13 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so1886628iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 01:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GoE5jN+jZxnDnJkoQ4YIGGq0CmjRnygcTlLW9HEXhu4=;
	b=JvqJD20bDKhIP1VIcSYnlOOiqJkGszBljXDeqsDCIaJjzZNDtpFeBMRVuUwlYOsvX4
	H7PmX5FT7TK6K0y8V60c2NRRWhcq/TV5sb+LwItXrrkbxMQ2Y2znl807bhCWY9tQdDuA
	7L5o+Hw2n5fCTzlNG3DbJ35loPoQ71UG4GE2s=
Received: by 10.231.112.224 with SMTP id x32mr1453826ibp.196.1309421250681;
	Thu, 30 Jun 2011 01:07:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s2sm1093925ibe.1.2011.06.30.01.07.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 01:07:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 01:07:12 -0700
Message-Id: <7f9143a9e32bbcc89e16ee1aa2d82c94bbf4918d.1309420894.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
References: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
In-Reply-To: <cover.1309420894.git.raj.khem@gmail.com>
References: <cover.1309420894.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] uclibc.inc: Use ARCH_WANTS_{LITTLE|BIG}_ENDIAN to denote endian
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

ARCH_{BIG|LITTLE}_ENDIAN is governed by ARCH_WANTS_{LITTLE|BIG}_ENDIAN
therefore we tame the superior

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 06c0f5d..ce13362 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -164,7 +164,7 @@ python () {
     "/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=y","# UCLIBC_HAS_FPU is not set"][bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]]), d)
   if "${UCLIBC_ENDIAN}":
     bb.data.setVar('configmangle_append',
-                   "/^### ABI$/a\\\nARCH_%s_ENDIAN=y\n\n" % ("${UCLIBC_ENDIAN}"),
+                   "/^### ABI$/a\\\nARCH_WANTS_%s_ENDIAN=y\n\n" % ("${UCLIBC_ENDIAN}"),
                    d)
   if "${UCLIBC_ABI}":
     bb.data.setVar('configmangle_append',
-- 
1.7.4.1



