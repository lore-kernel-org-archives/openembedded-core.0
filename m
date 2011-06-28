Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbNMB-0001iW-K8
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 03:44:51 +0200
Received: by pwi1 with SMTP id 1so3517986pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 18:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=GoE5jN+jZxnDnJkoQ4YIGGq0CmjRnygcTlLW9HEXhu4=;
	b=R9K+fIKmZL7e0yEH6UCm7bgy+p95zEREidNJgSQpoDnY/j6R/9kfivImLryIUYmxCX
	nECz5DkueAa3RgFBUPNOCwsO6xTPh5qHZa4s4zKmEelyxZikgSVmUFKoBdEC7eMIfENi
	lBW4qlVODKDRSKknpvlNQfTn9wvgQttQWahVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nDDZxz1Yog1mIeX49aqzL6EWaKKtCbi3ZbwLnGedOURZRRddPw7HvVKTdDz5v2kKKD
	WoCmsT4Pm66B/olrDJL8X9hpAmMYsAcS7KRAF/Y7fBEIExedsnLpYQbd6baLwuG0kfyX
	OI6kSJ/GRGkilI8uZRllGc/MORCgzcaDNpd/c=
Received: by 10.68.2.134 with SMTP id 6mr3133226pbu.501.1309225270400;
	Mon, 27 Jun 2011 18:41:10 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o2sm4725057pbj.17.2011.06.27.18.41.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 18:41:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 18:40:51 -0700
Message-Id: <1309225253-25795-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1309225253-25795-1-git-send-email-raj.khem@gmail.com>
References: <1309225253-25795-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/5] uclibc.inc: Use ARCH_WANTS_{LITTLE|BIG}_ENDIAN to denote endian
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



