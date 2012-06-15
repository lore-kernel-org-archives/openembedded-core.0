Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPxU-0001XI-U8
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:37 +0200
Received: by dalh21 with SMTP id h21so3477332dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=isD1tizrD7AnVMtyH0hduY2udRf8NMxXL7/VSS9Ur+o=;
	b=m1kyxTorvBKkVjNwB/lSvnXCEN6nmGNp2RoOASbQjBEJdwMO1uckObPQnhKhhtAC5R
	y900lLtXScUMs9KtNSb0Prov159j9TBtgunqfLerTcJ4QD64jTGs0whR3Hd4+xTQrcpw
	/bEgo9tBLSPwI9SRH/TZG+Gdrf/jy9V9JFLNP9CkU/c3GjyoRodXQ2hEbh335K4k9Mqa
	QBbalTL+aGzF5TRQqRP5krgRMfGv9h5NRpBt0cww7OcbGN8ELDAu+qHnTUynMOsvE0xx
	WwOpUSaxoMgG+ccVgZZJyduy9GcCrDT5aocKDDCbiuiRwOtRYESDykDuBtSqCd/FcUFk
	VK9A==
Received: by 10.68.226.73 with SMTP id rq9mr16118239pbc.145.1339740838281;
	Thu, 14 Jun 2012 23:13:58 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tm2sm12117280pbc.69.2012.06.14.23.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:13:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:34 -0700
Message-Id: <46f08e4f7c13b7c2a8233f2554378dcc2b9651ec.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
Subject: [PATCH 7/9] rpm: pass lrt and lpthread to link step explicitly for uclibc
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
X-List-Received-Date: Fri, 15 Jun 2012 06:24:37 -0000

These need to appear in DT_NEEDED for librpmio.so
for uclibc somehow it does not get added to link
cmdline so we do it explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index ccf015a..8e892a8 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -182,6 +182,8 @@ EXTRA_OECONF += "--verbose \
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
+LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
+
 PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
-- 
1.7.5.4



