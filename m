Received: from mail-ie0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvDHJ-0000GV-Qa
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:38:39 +0100
Received: by mail-ie0-f174.google.com with SMTP id c11so1003099ieb.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9t5ZEZxf17CISBCTn8dHLpRIVXUM/sIw4y6PzkDfdiQ=;
	b=f1jrEpsK3uWsufElncn395jB4AW0jqbyn8mgViWYarqO7/5wtYXlnnrcZQma5TrTx7
	9zIxyXPp448cqPAvvX9yvCOfA3OmCDcp9YAFXZG7bn857hO3z8/WO14ixSM/Aj3pcuAW
	fVtP7DlM1pCUmisb0kEa7Gly1LiQkV2D7BHw8IbVLb522oZ9Y2eduxXLY8R95b/l271k
	iozyFYhsrTJzAYN+2u5wGjwG3hQ9sMvFHVAcdUwvdH+5weLTOXevbZ423KrypLSNzvPz
	AgHkkfQveO2rwKIgaNGhH0+g2n/cXZOXr89L1l/3Ahgm4Yr4IqGPUXpZvsuj3iUdvV5z
	SDGQ==
X-Received: by 10.50.161.130 with SMTP id xs2mr2889204igb.34.1358281396755;
	Tue, 15 Jan 2013 12:23:16 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qn10sm2655187igc.15.2013.01.15.12.23.13
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:23:15 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 13:22:51 -0700
Message-Id: <5cb12f38b2ac74ea118b58888a0c37f63917fbfa.1358281118.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0.3
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/6] base.bbclass: improve the incompatible license logic a bit
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
X-List-Received-Date: Tue, 15 Jan 2013 20:38:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

Handle the potential case where the recipe level LICENSE contains an
incompatible license, but all of its emitted packages are in fact compatible.
Without this adjustment, it would skip such a recipe.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 627b943..b427a5e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -552,9 +552,8 @@ python () {
                         skipped_pkgs.append(pkg)
                     else:
                         unskipped_pkgs.append(pkg)
-                some_skipped = skipped_pkgs and unskipped_pkgs
                 all_skipped = skipped_pkgs and not unskipped_pkgs
-                if some_skipped:
+                if unskipped_pkgs:
                     for pkg in skipped_pkgs:
                         bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + recipe_license)
                         d.setVar('LICENSE_EXCLUSION-' + pkg, 1)
-- 
1.8.0.3



