Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TGIqk-0004pK-QQ
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 02:18:07 +0200
Received: by pbbro12 with SMTP id ro12so69975pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 17:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=Es+T/RDxruk0K0sfAiG4fFQxum8KFYPwLoY3V/IaQE4=;
	b=M6412twuVnaK3TfjhF6f6ObYfOJg/fQGrFyYnMmcvBLgvCebz3Tg2liWQOWe8oV1tE
	uiNrL6C1M+Bb/74N3byEdH9ynva6sqCrmjixqai8nYmR/CrsJrr71pqRvOquyGkBVKQu
	xXLu/xeco+EHyt+5m9545n+e0ry5aM5/R+TZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Es+T/RDxruk0K0sfAiG4fFQxum8KFYPwLoY3V/IaQE4=;
	b=j8xXgtCbxRQfRS+TtGGH7GwiqJZds7xU8FnJH3Z/y4hGhtY/rq1I/lXwGJBS9tsKaK
	IQK4HgxQ0J2EMxXXNEu6HERq4BzjpzQFhVlkhJmk8quQPe2TWCDaAapEBWCwTw29Z6+a
	tlqeryhaKfW0ITs5udXjNy3W5zTriXO3yotU4PFU6U3rK9Z6VGT4o0MDWKkiG3HsJNXg
	FZmgXoxNOKw4f131si4UCocM7vfrIkOf5tBtWAWweJ77OjAl2nxjuXmnbfE6fTRvf5sO
	XsfrHo0SnGV0uE7IchpvEvXXDbuF4++v2+qM/vGV/eNPyCkO53n6i8JJXEX+Z1S/rvyN
	c0Rw==
Received: by 10.68.240.66 with SMTP id vy2mr40666151pbc.73.1348531517581;
	Mon, 24 Sep 2012 17:05:17 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ky6sm5588168pbc.18.2012.09.24.17.05.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 17:05:15 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 17:04:55 -0700
Message-Id: <1348531495-25671-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkhB5/FCRXRRx8HiIZxMmaK0+/GAH93VEnGZZjTberCRB1wl3z6Rnvxh+1UtF7kYRSG6WS+
Subject: [PATCH] rpm: Add base-files as RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 00:18:07 -0000

This solves a problem when installing rpm using the ipk pkg-management
system where /var/cache was conflicting with the existing /var/cache from
base-files.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 3b00570..5435445 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r47"
+PR = "r48"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -294,6 +294,8 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/vpkg-provides2.sh \
 		${libdir}/rpm/perfile_rpmdeps.sh \
 		"
+RDEPENDS_${PN} = "base-files"
+RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}-build = "file"
 
 FILES_python-rpm-dbg = "${libdir}/python*/rpm/.debug/_*"
-- 
1.7.9.5



