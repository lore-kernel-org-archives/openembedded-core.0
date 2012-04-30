Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqO-0002bu-Lb
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:57:04 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3372519pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IIzj2iMQxnVJNwoVow+S0e0L44VaIJVl+/dz6j9wZjg=;
	b=A/3s4vMcJ29LSSIrVi+HiBD+9+fRrSEQzikX77q/tJl3Wz7YDC8YEmZgKLQOSPYiCI
	1UM3kOBroeDzcccmnn+TiGgCDNI9VKg2ZYgGsLpz61/p1KMrD1DfGIXznObvRGFWMHiw
	AzQdG2xh4tup4A3KV8DBFNyY7S/xlS4e3QwhVPpmvhPmTkijHoer+kF/0YfDQ9kjzDPD
	oyUiPI/TRaxzeu8N28OegH387PU+aAjndy3XpHdTyG8ks2fJ5Pw0g6XNNOFRINQddKs4
	vHspoDk/s7dhmbHCSsFfMd3XJRLb3ukcT+hyyjEh8nd/8yznQfmZ0ecLCn2OLiO4Zo5f
	Imog==
Received: by 10.68.219.162 with SMTP id pp2mr21856827pbc.85.1335808044505;
	Mon, 30 Apr 2012 10:47:24 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:20 -0700
Message-Id: <2f920eeb4683e2472c4e60d063612fc140175d03.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
References: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 05/10] musicbrainz: Specify libpthread on cmdline for uclibc
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
X-List-Received-Date: Mon, 30 Apr 2012 17:57:04 -0000

uclibc librt needs some functionality from libpthread

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musicbrainz/libmusicbrainz_3.0.3.bb            |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
index 4814b6d..913c463 100644
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
@@ -6,12 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24 \
                     file://include/musicbrainz3/includes.h;beginline=1;endline=21;md5=9ab2846573f560cea7561da472803a72"
 DEPENDS = "expat neon"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://ftp.musicbrainz.org/pub/musicbrainz/${BPN}-${PV}.tar.gz \
            file://fix_build_issue_for_gcc_4.5.0.patch \
            file://allow-libdir-override.patch "
 
+LDFLAGS_prepend_libc-uclibc = " -lpthread "
+
 SRC_URI[md5sum] = "f4824d0a75bdeeef1e45cc88de7bb58a"
 SRC_URI[sha256sum] = "7fd459a9fd05be9faec60a9a21caa9a1e9fda03147d58d8c7c95f33582a738c5"
 
-- 
1.7.5.4



