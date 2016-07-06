Return-Path: <joe@deserted.net>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 37A5060119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 13:45:16 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id y93so14708324ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=TtzjZj3P0lZi4qgP8fXcVJ7JuTKbgY/VDsZgucdKWoY=;
	b=1vtghmE/okd5TIgw1fOqYkhz+JexgTg450g64hIsnhdduZ6IiGwq9ZqGWaEJO/nqhO
	Sw60rsl/mDh3xY4fMMSHqmy7bGdQw5nMp1oPaSZdNicGcnRP8LPUgM7Jq6bEJICZMY/K
	zj4dqs0IDaJ8ygD43mtk9B0Pt6TtHscdIdOcZnbgDlpQ2FwDUik0BmKUp/alXJ6PG7qu
	tOugw5fEsfUVbfwS3eDgNRVjEcqn8wdRh2qoS4sEaU6PWGIYOrvFaKZ5fk6kEW4VYzM2
	Xmo02WLqD53hThvF6wasXX7lIbp11C/Y1AzfYD2cZcW3CpI+R+H4I9zYAzlnA7yHTpw4
	GE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=TtzjZj3P0lZi4qgP8fXcVJ7JuTKbgY/VDsZgucdKWoY=;
	b=YQPLtil9Ov2EHz/EacsOgUAiztCRyst4ljW0bBBv741gjlVtST/zevv2BjxWMIB2UH
	/aIswMCFVO4Zo1PhMHxg6Qsy+6s/VHWosWwOje6nr+H9JJztzqgG2rZz8I5FgXJ8WTLk
	5qJjtmfmOBBCN7L8a0M1QBEtBdh2sZ0REHna5PigZT+mTgqzakY/Q61cStWWAN9M3Bok
	C8VTrNdWCTwOLX4MuO/yCBt450VJKuGNpvglHqZltYsLP+CKeTPSQ3B6DX9tLsTWXo0e
	bbrtOXoyonYTyG8xwkZwpNRtopH8k7ugAwv/rU+qJRXid5LVhWlf5x91TN/kdA51+R2H
	HwRg==
X-Gm-Message-State: ALyK8tL1OO+5uirrQVTuGAjtlMyYtM9FSy91EInQJRwDQUQRquHQoiHYgwNsxqWoM62Hhw==
X-Received: by 10.36.33.22 with SMTP id e22mr19755549ita.42.1467812716806;
	Wed, 06 Jul 2016 06:45:16 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	v138sm588187ita.13.2016.07.06.06.45.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jul 2016 06:45:15 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2016 09:45:17 -0400
Message-Id: <1467812717-26591-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] dpkg-deb: strip virtual/ package prefix in control files
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
X-List-Received-Date: Wed, 06 Jul 2016 13:45:22 -0000

If a recipe provides a 'virtual/foo', dpkg-deb will fail as '/' characters
are not allowed in any of the Depends, Recommends, Suggests, etc. fields.
The intent of these in the Debian package system and the few cases where
they are used in Yocto layers seems like throwing away the 'virtual/'
prefix preserves the intent, while not requiring it to be removed for
package systems that allow it (eg. opkg and rpm).

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta/classes/package_deb.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8f9b09a..1e8afa1 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -253,17 +253,17 @@ python do_package_deb () {
         rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
         debian_cmp_remap(rconflicts)
         if rdepends:
-            ctrlfile.write("Depends: %s\n" % bb.utils.join_deps(rdepends))
+            ctrlfile.write("Depends: %s\n" % re.sub(r'virtual/', '', bb.utils.join_deps(rdepends)))
         if rsuggests:
-            ctrlfile.write("Suggests: %s\n" % bb.utils.join_deps(rsuggests))
+            ctrlfile.write("Suggests: %s\n" % re.sub(r'virtual/', '', bb.utils.join_deps(rsuggests)))
         if rrecommends:
-            ctrlfile.write("Recommends: %s\n" % bb.utils.join_deps(rrecommends))
+            ctrlfile.write("Recommends: %s\n" % re.sub(r'virtual/', '', bb.utils.join_deps(rrecommends)))
         if rprovides:
-            ctrlfile.write("Provides: %s\n" % bb.utils.join_deps(rprovides))
+            ctrlfile.write("Provides: %s\n" % re.sub(r'virtual/', '', bb.utils.join_deps(rprovides)))
         if rreplaces:
-            ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
+            ctrlfile.write("Replaces: %s\n" % re.sub(r'virtual/', '', bb.utils.join_deps(rreplaces)))
         if rconflicts:
-            ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
+            ctrlfile.write("Conflicts: %s\n" % re.sub(r'virtual/', '', bb.utils.join_deps(rconflicts)))
         ctrlfile.close()
 
         for script in ["preinst", "postinst", "prerm", "postrm"]:
-- 
1.9.1


