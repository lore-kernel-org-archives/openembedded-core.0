Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qra0q-0005nV-0R
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:29:48 +0200
Received: by yia28 with SMTP id 28so1528688yia.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=R3k3B0/J5OtTGcpLucW7u9ASuqDaeK+kwiJRTs+yFtA=;
	b=IK31QvQEAWDs3DF5KocLLLTPCJgcQwVdoAuq5OZLxrzVMg9JOqC3Qhxx84vhVLBHok
	QMQS7OormughdzQHL6w+NLJNi3Hm4Y74vYKrsxNJV0NC6jmVe707EkD6rZx8mehWSxth
	KOYQkKu5zKPIwq3ZRW3wtnYJJMAEI4AXm4NFg=
Received: by 10.150.2.5 with SMTP id 5mr925738ybb.375.1313087115648;
	Thu, 11 Aug 2011 11:25:15 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f5sm1281063ybd.13.2011.08.11.11.25.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 11:25:14 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 11:23:53 -0700
Message-Id: <642776595a038851117db831a1212c7d0111e979.1313086806.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 6/7] package: allow setting a section for locale packages
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
X-List-Received-Date: Thu, 11 Aug 2011 18:29:48 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/package.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0a954ef..100f465 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -44,6 +44,8 @@ inherit prserv
 PKGD    = "${WORKDIR}/package"
 PKGDEST = "${WORKDIR}/packages-split"
 
+LOCALE_SECTION ?= ''
+
 # rpm is used for the per-file dependency identification
 PACKAGE_DEPENDS += "rpm-native"
 
@@ -401,6 +403,7 @@ python package_do_split_locales() {
 
 	summary = bb.data.getVar('SUMMARY', d, True) or pn
 	description = bb.data.getVar('DESCRIPTION', d, True) or "" 
+        locale_section = bb.data.getVar('LOCALE_SECTION', d, True)
 	for l in locales:
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
@@ -410,6 +413,8 @@ python package_do_split_locales() {
 		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln), d)
 		bb.data.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l), d)
 		bb.data.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l), d)
+		if locale_section:
+			bb.data.setVar('SECTION_' + pkg, locale_section, d)
 
 	bb.data.setVar('PACKAGES', ' '.join(packages), d)
 
-- 
1.7.4.1



