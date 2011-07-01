Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcWHh-0006Z9-KV
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 07:28:57 +0200
Received: by iym10 with SMTP id 10so2779948iym.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 22:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=AjOM3h1HXCDmmh2uMLhZQB2wZyasTANQcEyE1TrAqY4=;
	b=FLPfE0zk0wQQMBIsCwZ7+RVNg/PnOLl02uqAkDfjxTn0WNNy2t4IqzsZf4iw8DRWCh
	AgAv1EFxdH2fiLC2is8yx+OxasVw8uu4+Up3MygqBjHKb4VWQhgQDyJPxSw2B7z4JOQh
	5h+ONUYSev1nXGMqs+eNouHDDu/u2kIqU540U=
Received: by 10.231.16.3 with SMTP id m3mr2380528iba.195.1309497912935;
	Thu, 30 Jun 2011 22:25:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w11sm1651700ibw.7.2011.06.30.22.25.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 22:25:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 22:25:00 -0700
Message-Id: <1309497900-26079-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1309497900-26079-1-git-send-email-raj.khem@gmail.com>
References: <1309497900-26079-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] uclibc: Fix compilation in thumb mode
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
X-List-Received-Date: Fri, 01 Jul 2011 05:28:58 -0000

It was not setting COMPILE_IN_THUMB_MODE in .config
when ARM_INSTRUCTION_MODE = thumb. Reason was that
this entry has to exist in merged defconfig
so we add it disabled which means no harm to other
architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 72cbff9..ece7ddc 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -173,3 +173,11 @@ UCLIBC_HAS_EPOLL=y
 UCLIBC_HAS_FLOATS=y
 # needed by systemd
 UCLIBC_HAS_UTMPX=y
+
+# The below option is needed for ARM since depending
+# upong what intruction set is chosen this will be
+# enabled. As such it is harmless and will be punted
+# by menuconfig for other arches.
+
+# COMPILE_IN_THUMB_MODE is not set
+
-- 
1.7.4.1



