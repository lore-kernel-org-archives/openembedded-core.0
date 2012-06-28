Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMZM-0005rp-M7
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:48:08 +0200
Received: by pbbrq2 with SMTP id rq2so3494282pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7DGvsr8nQaEvIy2QggW1EOWJTXQQDW81oKSKsnz9tuc=;
	b=f+OY3VVkOfVlnNelLoa64EZ4ZC7UykM/nnppeHVwqWL6PgbsKzuBCM4zu+eTyf7G0N
	SsMy40wM2fOhse2TjiwEVBDQicVKHXMULyTYq/FO9nf1kkFn4/xMEPYQPwnUhREMCCQE
	TVF6ob+690IysXWg/b/Qrgk5BEfPkCGKFupiq44IJesl8vwU+1AeX2HtKh2RR6lv/bxa
	UTUpqjpDY71svhFzMILbN7OW2q9ePWlDBUI62qYMPdWgXgEEcloLgVOvAXuzKTMD5WoM
	r3jojK8JKldEvYItlgZ8gP6s22iEefhEKpEccg6z2mwfZH3+FFEzKhCMKKkmCIAz/4Ff
	fbqQ==
Received: by 10.68.240.69 with SMTP id vy5mr11808653pbc.156.1340919432988;
	Thu, 28 Jun 2012 14:37:12 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os1sm3220209pbb.49.2012.06.28.14.37.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:37:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:36:47 -0700
Message-Id: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
Subject: [PATCH 01/11] bitbake.conf: Add weak definition for USE_NLS
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
X-List-Received-Date: Thu, 28 Jun 2012 21:48:08 -0000

USE_NLS is generally defined for uclibc based system builds
and generally its defined to 'no' there. However this variable
does not exist at all for eglibc/glibc distributions. This
patch adds a weak definition to 'yes' on eglibc based system
builds. This will ease out some of the cryptic contructs we
have to define certain options based on USE_NLS and also
checking got uclibc at the same time to avoid pythong exceptions
when its not defined.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf                     |    1 +
 meta/conf/distro/include/tclibc-eglibc.inc |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9b26580..9377ee6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -98,6 +98,7 @@ TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
+USE_NLS ??= "yes"
 
 TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 4f5607f..e2ca4e8 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -32,6 +32,8 @@ LIBC_LOCALE_DEPENDENCIES = "\
 	eglibc-gconv-iso8859-1 \
 	eglibc-gconv-iso8859-15"
 
+USE_NLS ?= "yes"
+
 def get_libc_locales_dependencies(d):
     if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
         return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''
-- 
1.7.9.5



