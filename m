Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4BB77131
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id EADED600F52
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:43 +0100
Message-Id: <80e2dfbfef2d40c3ab074142deac73317f89e3a2.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 22/52] libc-package: Fix localedef multilib dependency issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2015 15:22:22 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Building nativesdk-glibc-locale results in many messages like:

QA Issue: nativesdk-locale-base-en-sg rdepends on localedef, but it isn't a build dependency? [build-deps]

It should depend on ${MLPREFIX}localedef, not just localedef
to fix these warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/libc-package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 47be691..adb4230 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -236,8 +236,8 @@ python package_do_split_gconvs () {
                 supported[locale] = charset
 
     def output_locale_source(name, pkgname, locale, encoding):
-        d.setVar('RDEPENDS_%s' % pkgname, 'localedef %s-localedata-%s %s-charmap-%s' % \
-        (mlprefix+bpn, legitimize_package_name(locale), mlprefix+bpn, legitimize_package_name(encoding)))
+        d.setVar('RDEPENDS_%s' % pkgname, '%slocaledef %s-localedata-%s %s-charmap-%s' % \
+        (mlprefix, mlprefix+bpn, legitimize_package_name(locale), mlprefix+bpn, legitimize_package_name(encoding)))
         d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_postinst', True) \
         % (locale, encoding, locale))
         d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm', True) % \
-- 
2.1.4


