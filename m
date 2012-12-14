Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWsC-0001An-FK
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:08:31 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:19 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so2422993bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=lEEsgZHEHqnTJ/ynBq/qoXB9NgK8TDMJ/k//9dNa3fs=;
	b=JckcR0JhxbklnTkUVdFkIfyvIYY8jcS7+JlWxjlUZj2alK4vwV8TUCiK/Qlp9BlKp1
	W9qjvX8fAOfZo187hfHDJKEM5784xXZo6qZS/sFM8abDHPAWfNQEuVwH8DCT8OjBvMP2
	SFXt+QwRMTYnBcFNLq0ZW3JH5k4v1TLhrlD6BEjVoFXcN4PxkHGd770pKCRgGT6SERTd
	v5TMgrueGlZ1fb4KaTdJI+UCssgEwjjqizk3va5gn/9efrhtyfVI6sGaaF2b5HrQf0V2
	Lgx4X4SZMD9v+ApL7q6DkZH6IWnC/nTMuQwWoypowYex5y38l+YF85CyD9HGz6GFyLQA
	rwPw==
Received: by 10.194.85.168 with SMTP id i8mr4038920wjz.18.1355496797196;
	Fri, 14 Dec 2012 06:53:17 -0800 (PST)
Received: by 10.194.85.168 with SMTP id i8mr4038912wjz.18.1355496797141;
	Fri, 14 Dec 2012 06:53:17 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:22 +0000
Message-Id: <1355496684-1498-8-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkpZKpLKIfH6TNyb614icTle9/fZC3nstAEURzLI8E+V31Y7vm1RfhH+3qTu9MdFR0ozDLkaw9owf8NTN8v7raZt+NJSCXldTHxgyzNyYkAykxKjjyEpoSyjuH8MIn2cFjA/V2koOarXeszIkiCwoa+hRGSu8DDZ3Fh7LnAbXCKlVPYDJOYCx2do1qg4WVKa+g8SjtK
Subject: [PATCH 7/9] base-passwd: fix out-of-tree builds
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
X-List-Received-Date: Fri, 14 Dec 2012 15:08:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/base-passwd/base-passwd_3.5.26.bb |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
index 2073b3f..3eae214 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
@@ -20,19 +20,19 @@ do_install () {
 	install -d -m 755 ${D}${sbindir}
 	install -o root -g root -p -m 755 update-passwd ${D}${sbindir}/
 	install -d -m 755 ${D}${mandir}/man8 ${D}${mandir}/pl/man8
-	install -p -m 644 man/update-passwd.8 ${D}${mandir}/man8/
-	install -p -m 644 man/update-passwd.pl.8 \
+	install -p -m 644 ${S}/man/update-passwd.8 ${D}${mandir}/man8/
+	install -p -m 644 ${S}/man/update-passwd.pl.8 \
 		${D}${mandir}/pl/man8/update-passwd.8
 	gzip -9 ${D}${mandir}/man8/* ${D}${mandir}/pl/man8/*
 	install -d -m 755 ${D}${datadir}/base-passwd
-	install -o root -g root -p -m 644 passwd.master ${D}${datadir}/base-passwd/
-	install -o root -g root -p -m 644 group.master ${D}${datadir}/base-passwd/
+	install -o root -g root -p -m 644 ${S}/passwd.master ${D}${datadir}/base-passwd/
+	install -o root -g root -p -m 644 ${S}/group.master ${D}${datadir}/base-passwd/
 
 	install -d -m 755 ${D}${docdir}/${BPN}
-	install -p -m 644 debian/changelog ${D}${docdir}/${BPN}/
+	install -p -m 644 ${S}/debian/changelog ${D}${docdir}/${BPN}/
 	gzip -9 ${D}${docdir}/${BPN}/*
-	install -p -m 644 README ${D}${docdir}/${BPN}/
-	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
+	install -p -m 644 ${S}/README ${D}${docdir}/${BPN}/
+	install -p -m 644 ${S}/debian/copyright ${D}${docdir}/${BPN}/
 }
 
 base_passwd_sstate_postinst() {
-- 
1.7.10



