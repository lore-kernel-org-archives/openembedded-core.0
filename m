Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5937B6FFA6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:34:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u19FYidO014120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 07:34:44 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 07:34:44 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Feb 2016 09:34:41 -0600
Message-ID: <1455032081-212934-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455032081-212934-1-git-send-email-mark.hatle@windriver.com>
References: <1455032081-212934-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [RFC][PATCH] buildhistory.bbclass: Break up the find to catch failures
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
X-List-Received-Date: Tue, 09 Feb 2016 15:34:49 -0000
Content-Type: text/plain

If for some reason the 'find' operation were to fail, the buildhistory would
not fail, but instead store invalid history!

[YOCTO #9031]

Note this fixes the symptom, but not the cause of 9031.  That is a separate
issue, see the defect for more details on the work being done to resolve the
cause of the failure.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/buildhistory.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 5e2581f..189881e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -439,10 +439,12 @@ buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
 	if [ "$3" = "fakeroot" ] ; then
-		( cd $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+		( cd $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" > $2.tmp )
 	else
-		( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+		( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" > $2.tmp )
 	fi
+	cat $2.tmp | sort -k5 | sed 's/ * -> $//' > $2
+	rm $2.tmp
 }
 
 buildhistory_list_pkg_files() {
-- 
2.5.0


