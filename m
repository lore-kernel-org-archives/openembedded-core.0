Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1Qt9qs-0004dy-OD
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 04:58:02 +0200
Received: by qwh5 with SMTP id 5so2951629qwh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 19:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=COiDvFviOzDrEvPEovcRltcDcor+iCa9dECHCMCBXcs=;
	b=bUnDdYUdwdCqIMHLOhX/if+1QQZ5QNEyofET/n3OBb7JTZBh/7WKgwVvP5h5axnGGF
	On6I1ZF8TBX7IipOT0eUfyP3CthB8zWSJtNtXsAwwSwdGcgq0ICs0PDb62mhG8TCFQi7
	IpSuugbwoL8EJqz7Mp9ujfppxd7IsKXw4DUP8=
Received: by 10.224.212.74 with SMTP id gr10mr3074474qab.302.1313463205459;
	Mon, 15 Aug 2011 19:53:25 -0700 (PDT)
Received: from localhost.localdomain ([187.133.159.42])
	by mx.google.com with ESMTPS id b3sm4600543qcu.16.2011.08.15.19.53.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 19:53:24 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 21:53:12 -0500
Message-Id: <1313463192-1911-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH] rpm: configure with staging native path for magic file
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
X-List-Received-Date: Tue, 16 Aug 2011 02:58:02 -0000

* Remove hardcoded system path for path-magic file in order
  to avoid potential mistmatch between host and yocto native
  tools as reported in yocto mailing list:
  ----
  error: magic_load(ms, /usr/share/misc/magic) failed: File 5.4
  supports only version 7 magic files. `/usr/share/misc/magic.mgc' is version 8
  ----
* Another solution is to update meta/recipes-devtools/file/file_5.04.bb to a
  newer version ie. file_5.07.bb

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index c0e3208..948ed84 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = ""
-PR = "r19"
+PR = "r20"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -120,7 +120,7 @@ EXTRA_OECONF = "--verbose \
 		${WITH_DB} \
 		${WITH_Z} \
 		--with-file \
-		--with-path-magic=/usr/share/misc/magic \
+		--with-path-magic=${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc \
 		--without-lua \
 		--without-tcl \
 		--with-syck=internal \
-- 
1.7.6



