Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6664176243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:03:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S93Zlm000626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:03:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 02:03:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 02:03:33 -0700
Message-ID: <aa05de93e6a3e525fa642bad6aa5d1acfcb35db4.1438074152.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438074152.git.liezhi.yang@windriver.com>
References: <cover.1438074152.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] useradd_base.bbclass: do not warn when the user exists
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
X-List-Received-Date: Tue, 28 Jul 2015 09:03:38 -0000
Content-Type: text/plain

Use bbnote rather than bbwarn when the user exists, otherwise we would
always get the warnings when rebuild the recipe or build with mulitlib,
everything is OK if the user exists, so it should not be a warning.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/useradd_base.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 7fe83a7..802f3a1 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -34,7 +34,7 @@ perform_groupadd () {
                         sleep $count
 		done
 	else
-		bbwarn "${PN}: group $groupname already exists, not re-creating it"
+		bbnote "${PN}: group $groupname already exists, not re-creating it"
 	fi
 }
 
@@ -62,7 +62,7 @@ perform_useradd () {
 		       sleep $count
 	       done
 	else
-		bbwarn "${PN}: user $username already exists, not re-creating it"
+		bbnote "${PN}: user $username already exists, not re-creating it"
 	fi
 }
 
-- 
1.7.9.5


