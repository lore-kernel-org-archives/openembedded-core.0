Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnQ-0006Ry-EA
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:28 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so4179694bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=44s2EhjQm9asqZnzQWw7ZT8nERx4Gy58FHc+se9eDgE=;
	b=i05OXjc/1sagp8LOFaCoiiSpcnfzneAEl3TJ/ha2quwgpPF5VUqhBP/qCy52xlic+R
	/Mfe8YMtoc4WpdZmQ9000eR2+QXREUOozV1CtzcVTZ6c67YA0RUcyEfBd1BwIOoG8BKP
	l0teaA/J2y2V3zk9Q0KsubvneuBV257Fh6bRk=
Received: by 10.204.145.89 with SMTP id c25mr2778507bkv.280.1316807229632;
	Fri, 23 Sep 2011 12:47:09 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.47.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:47:08 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:41 +0400
Message-Id: <1316807201-22623-10-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 10/10] libffi: really populate -dev package
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
X-List-Received-Date: Fri, 23 Sep 2011 19:52:29 -0000

As per gcc PR 11147, libffi installs headers into a target dependent
place (/usr/lib/....). Include a rule to include those files into
libffi-dev package.

Reference: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=11147

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-gnome/libffi/libffi_3.0.9.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/libffi/libffi_3.0.9.bb b/meta/recipes-gnome/libffi/libffi_3.0.9.bb
index b6c7c13..0ea2284 100644
--- a/meta/recipes-gnome/libffi/libffi_3.0.9.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.0.9.bb
@@ -7,10 +7,13 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 SRC_URI = "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz"
 
+PR = "r1"
+
 SRC_URI[md5sum] = "1f300a7a7f975d4046f51c3022fa5ff1"
 SRC_URI[sha256sum] = "589d25152318bc780cd8919b14670793f4971d9838dab46ed38c32b3ee92c452"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa09cb778aaba64dc9eac37ab7e4e5d8"
 inherit autotools
 
+FILES_${PN}-dev += "${libdir}/libffi-${PV}"
 BBCLASSEXTEND = "native"
-- 
1.7.2.5



