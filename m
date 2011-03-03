Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pv9oe-0002h8-A9
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:47:44 +0100
Received: by fxm8 with SMTP id 8so1159308fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 06:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=e8mS1dNTAMkeUsTpk/oI/Aa2zabC3U+GaKvs3qZgGYs=;
	b=tcTKVNbJhplhri22pbIDvkq0+HdR/pl1SHKqsVLTzuIqnqXQm99LaFnmo+dzo8ZDNy
	/rXrX9bA/J4VINcajxOnrTQMRGOcu78u2NNOOM/9H66H+CRkJD/MVfAh/qXkN8Anc+i4
	Xdp8+wi9muqomOjrOZhHYiHAhH83MZi4kNvhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=k4g1blK+aZWRfn+PUqIZ+KNR5M2UBHliv+FPetrJJO1jOLeV6lVeTOFeTFyrm1/sl1
	8ftV1fy6FZAqU7GUMu+dNWG5TwQ1n21nQCB2/Jgwxph1xIDC0rGojfqVJ2yeRi8d6ozP
	FAPE5+92vCXv5B5jI/3XNVur0PWleyEHXN4Ko=
Received: by 10.223.29.217 with SMTP id r25mr1568474fac.87.1299163572901;
	Thu, 03 Mar 2011 06:46:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm605081faa.42.2011.03.03.06.46.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 06:46:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2011 15:46:09 +0100
Message-Id: <1299163569-22016-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] debian.bbclass: call auto_libname in reverse sorted AUTO_LIBNAME_PKGS
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
X-List-Received-Date: Thu, 03 Mar 2011 14:47:44 -0000

* see comment for reason why we need this
* more info:
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-February/029877.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/debian.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index d35882f..46a9d08 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -107,7 +107,13 @@ python debian_package_name_hook () {
 					if newpkg != pkg:
 						bb.data.setVar('PKG_' + pkg, newpkg, d)
 
-	for pkg in (bb.data.getVar('AUTO_LIBNAME_PKGS', d, 1) or "").split():
+	# reversed sort is needed when some package is substring of another
+	# ie in ncurses we get without reverse sort: 
+	# DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libtic orig_pkg ncurses-libtic debian_pn None newpkg libtic5
+	# and later
+	# DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libticw orig_pkg ncurses-libtic debian_pn None newpkg libticw
+	# so we need to handle ncurses-libticw->libticw5 before ncurses-libtic->libtic5
+	for pkg in sorted((bb.data.getVar('AUTO_LIBNAME_PKGS', d, 1) or "").split(), reverse=True):
 		auto_libname(packages, pkg)
 }
 
-- 
1.7.4.1



