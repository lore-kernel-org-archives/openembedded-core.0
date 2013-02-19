Received: from mail-we0-f181.google.com ([74.125.82.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7v4u-0008P3-Qp
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 22:50:21 +0100
Received: by mail-we0-f181.google.com with SMTP id t44so5988189wey.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 13:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=tA6i+tK8os64y7SeY40Q4Mg8MOgTLYwUKD0m6m+LGmE=;
	b=GoeKnQLRRmUpLEkzHuIbks13RwHYGjRhm34PvFshvhd0q2Z8AzGxIb1Ne5+TT97gOT
	hqisT3dUfpZ3/ZK12LGD1AGsYcxw6cu7kDMFf1k9ATM8+tQkITMkNhC1LQvZL8QE2QGp
	N+72R/HBPkabuIHxNVtrBATAV8s9B4rRAT1vBsjX4bW9ilNlysPtuFDgkE/8oTeIxZ6+
	Gnu6Aobw+uJu+zBC90NwaBA//haEaqtpPBchAZpR9InQEhEvMlFnleMdNOZCTY03TDGE
	4er/vbXpDpS6+yEB3UR/+USygLRXRZak8cbwE2ZrMCNApKJqeQkRK2ykJ7EXxb5ziDLr
	9kQA==
X-Received: by 10.180.107.70 with SMTP id ha6mr15530716wib.10.1361309650907;
	Tue, 19 Feb 2013 13:34:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gy2sm30347306wib.3.2013.02.19.13.34.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Feb 2013 13:34:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2013 21:31:52 +0000
Message-Id: <1361309512-4367-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnUSyIpU75u5mBF3uVc8z//x/K0x85d3OgSle+hOkcgArE5ULPFwUZBn1nARDFlAnifV/di
Subject: [PATCH] rootfs_ipkg: fix BAD_RECOMMENDATIONS handling
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
X-List-Received-Date: Tue, 19 Feb 2013 21:50:22 -0000

If multiple versions of the same package are in the package feed then the
generate status file would only contains a "deinstall" status for the last one,
which meant that BAD_RECOMMENDATIONS wouldn't actually work.

Use awk instead of grep and stop reading when we reach a newline, so we only
ever output a single stanza.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/rootfs_ipk.bbclass |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 135bb60..a609944 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -46,9 +46,13 @@ fakeroot rootfs_ipk_do_rootfs () {
 	for i in ${BAD_RECOMMENDATIONS}; do
 		pkginfo="`opkg-cl ${OPKG_ARGS} info $i`"
 		if [ ! -z "$pkginfo" ]; then
-			echo "$pkginfo" | grep -e '^Package:' -e '^Architecture:' -e '^Version:' >> $STATUS
-			echo "Status: deinstall hold not-installed" >> $STATUS
-			echo >> $STATUS
+			# Take just the first package stanza as otherwise only
+			# the last one will have the right Status line.
+			echo "$pkginfo" | awk "/^Package:/ { print } \
+                        		       /^Architecture:/ { print } \
+                        		       /^Version:/ { print } \
+                        		       /^$/ { exit } \
+                        		       END { print \"Status: deinstall hold not-installed\n\" }" - >> $STATUS
 		else
 			echo "Requested ignored recommendation $i is not a package"
 		fi
-- 
1.7.10.4



