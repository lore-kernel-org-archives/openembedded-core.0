Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFgX-000134-2n
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:12:18 +0200
Received: by obhx4 with SMTP id x4so5080168obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7fACpPIVl/J4BUwMACW5V3ny8VF924s0ejMebdf1e3k=;
	b=c7Uo39fgRtlLXARTCIUfBDFkzuWk7JfykjyTnMchD8CCgUm3sASfB6+c7tnic88Wu4
	dpPtoyhnD3Ynu66c/6ng/rOMJtXjo/MZt0J17I0jISUKJ7P6Uz/+CGX/B/d67b6AQGDQ
	jE2mzTGiOSzmc7XVCSBnjnAxiUPGmb8lIxzqP2sCOpgtlCQTQRADZQ/VUzywmvJFNz6O
	v5u9jrzGCBZNB18xHsvTSxqWgsRP0V4aHyYZ0iAnush1R1ZIj/W8J7buZgZlgFYjK7xU
	sqzI/J5N7HsTY/v9QYrno5+6Egxbsp5PoJZ9q+J/RdeF7QRgLHMCzvlK7NX00I69Eg27
	z8uA==
Received: by 10.182.85.39 with SMTP id e7mr8352796obz.51.1335888136947;
	Tue, 01 May 2012 09:02:16 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h2sm20758865obn.20.2012.05.01.09.02.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 09:02:16 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 11:02:43 -0500
Message-Id: <8d64b1e220439ccd341dbde70bc8a17829cb39d8.1335888041.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
Subject: [PATCH 4/6] libsndfile1: use PACKAGECONFIG for alsa distro feature
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
X-List-Received-Date: Tue, 01 May 2012 16:12:18 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../libsndfile/libsndfile1_1.0.25.bb               |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
index bbe2f1d..0c91fe3 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
@@ -4,7 +4,7 @@ AUTHOR = "Erik de Castro Lopo"
 DEPENDS = "sqlite3"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
 
@@ -15,6 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
 S = "${WORKDIR}/libsndfile-${PV}"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+
 EXTRA_OECONF = "--disable-external-libs"
 
 inherit autotools lib_package pkgconfig
-- 
1.7.7



