Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvDHG-0000GL-O5
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:38:35 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so1009979ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=xNRNHu6jZbpsZOOXW01+/gRHvm4NmakoqmrtnDZCGGg=;
	b=ZruM8zaq6qgxbTcvbTDDxWhKgpF7XE10shL/E5TUWVyy+mHptQ+Ll+wedbMil8N87d
	6m/OQqyfW6k5HgQ1UEJuCMACSWm5WbXDYx/0VfrCISDe88TKKMmuPhWaojA+N+OMDDKP
	UH4ZH+yiV7M3wSF4p6wd7Z4GUcuPcEFnSfG0wvWssiaj9iPEOZTIQYIJOoZ8w8B6FReI
	BPSVsCSJ5Lhk3KOTxliUtfuJay89dRpwv/nI59PkILre+4BqRD+CFpfnUBp45OFxR24R
	MAqq2stz6Onr/QduvyottzHE4MejW1KPS4uzQFKdVxhllsxU7lz6FcSzUwEt3wJtLDzz
	fN6g==
X-Received: by 10.50.185.196 with SMTP id fe4mr2836162igc.17.1358281393624;
	Tue, 15 Jan 2013 12:23:13 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qn10sm2655187igc.15.2013.01.15.12.23.09
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:23:11 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 13:22:50 -0700
Message-Id: <52224cc927ca9a96a19d6104fc857ee505973dab.1358281118.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0.3
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/6] base.bbclass: use debug messages for INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 15 Jan 2013 20:38:36 -0000

From: Christopher Larson <chris_larson@mentor.com>

Spamming potentially over a screenful of messages due to their
INCOMPATIBLE_LICENSE selection seems a bit unnecessary. If the distro was
configured that way, the user likely won't care, and if the user set it, they
likely know the implications, so make the messages debug instead.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f7b6fb8..627b943 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -556,12 +556,12 @@ python () {
                 all_skipped = skipped_pkgs and not unskipped_pkgs
                 if some_skipped:
                     for pkg in skipped_pkgs:
-                        bb.note("SKIPPING the package " + pkg + " at do_rootfs because it's " + recipe_license)
+                        bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + recipe_license)
                         d.setVar('LICENSE_EXCLUSION-' + pkg, 1)
                     for pkg in unskipped_pkgs:
-                        bb.note("INCLUDING the package " + pkg)
+                        bb.debug(1, "INCLUDING the package " + pkg)
                 elif all_skipped or incompatible_license(d, bad_licenses):
-                    bb.note("SKIPPING recipe %s because it's %s" % (pn, recipe_license))
+                    bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, recipe_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % recipe_license)
 
     srcuri = d.getVar('SRC_URI', True)
-- 
1.8.0.3



