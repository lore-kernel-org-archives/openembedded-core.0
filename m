Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB497F37F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 21:06:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7GL5isv024670
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 14:06:20 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 16 Aug 2019 14:06:07 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 88C84AA34AA;
	Fri, 16 Aug 2019 14:06:07 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2019 14:06:05 -0700
Message-ID: <20190816210605.62377-2-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816210605.62377-1-jason.wessel@windriver.com>
References: <20190816210605.62377-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 2/2] libc-package.bbclass: Split locale hard link processing into two parts
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
X-List-Received-Date: Fri, 16 Aug 2019 21:06:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The locale-processing in cross-localedef was proven to be unsafe to
run in parallel due to the way it tried to make hard links to files
that could disappear before the link operation was completed.

To avoid corruption of the pseudo database, and create a
deterministically generated link tree, the operation of the locale
generation and the hard link resolution have been split into two
separate parts.  A side effect of this change is that the do_package()
rule for glibc-locale will be slightly smaller because some of the
hard links were missed in the past, particularly if you had a lot of
cpus free to perform the work.

Before the patch:
% du -sk locale-tree
312524  locale-tree

With the patch:
% du -sk locale-tree
290772 locale-tree

A number of comparisons were performed such as diffing the output,
cross checking the link references using tar's listing output, and
comparing against the results with out a parallel build to ensure the
locale-tree is correct in its final form.

[YOCTO #11299]
[YOCTO #12434]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/libc-package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 8859dad566..a66e540884 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -82,6 +82,9 @@ do_collect_bins_from_locale_tree() {
 	parent=$(dirname ${localedir})
 	mkdir -p ${PKGD}/$parent
 	tar -cf - -C $treedir/$parent -p $(basename ${localedir}) | tar -xf - -C ${PKGD}$parent
+
+	# Finalize tree by chaning all duplicate files into hard links
+	cross-localedef-hardlink -c -v ${WORKDIR}/locale-tree
 }
 
 inherit qemu
@@ -265,7 +268,7 @@ python package_do_split_gconvs () {
                 bb.error("locale_arch_options not found for target_arch=" + target_arch)
                 bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
 
-            localedef_opts += " --force  --no-archive --prefix=%s \
+            localedef_opts += " --force --no-hard-links --no-archive --prefix=%s \
                 --inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s" \
                 % (treedir, treedir, datadir, locale, encoding, outputpath, name)
 
@@ -273,7 +276,7 @@ python package_do_split_gconvs () {
                 (path, i18npath, gconvpath, localedef_opts)
         else: # earlier slower qemu way 
             qemu = qemu_target_binary(d) 
-            localedef_opts = "--force --no-archive --prefix=%s \
+            localedef_opts = "--force --no-hard-links --no-archive --prefix=%s \
                 --inputfile=%s/i18n/locales/%s --charmap=%s %s" \
                 % (treedir, datadir, locale, encoding, name)
 
-- 
2.21.0


