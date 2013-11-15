Return-Path: <qhanbec@rnd.ericsson.se>
Received: from mailgw7.ericsson.se (mailgw7.ericsson.se [193.180.251.48])
	by mail.openembedded.org (Postfix) with ESMTP id A2AFF6D44A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 14:25:43 +0000 (UTC)
X-AuditID: c1b4fb30-b7f228e000003e6c-29-52862ee68b33
Received: from ESESSHC015.ericsson.se (Unknown_Domain [153.88.253.125])
	by mailgw7.ericsson.se (Symantec Mail Security) with SMTP id
	E1.08.15980.6EE26825; Fri, 15 Nov 2013 15:25:42 +0100 (CET)
Received: from esekilxxen355.rnd.ericsson.se (153.88.183.153) by
	smtp.internal.ericsson.com (153.88.183.65) with Microsoft SMTP Server
	id 14.2.328.9; Fri, 15 Nov 2013 15:25:41 +0100
Received: from esekilxxen1299.rnd.ericsson.se (esekilxxen1299.rnd.ericsson.se
	[147.214.14.86])	by esekilxxen355.rnd.ericsson.se (Postfix) with
	ESMTP id 9C41AA0161;	Fri, 15 Nov 2013 15:25:41 +0100 (CET)
Received: by esekilxxen1299.rnd.ericsson.se (Postfix, from userid 9759)	id
	A6B38D1CB8; Fri, 15 Nov 2013 15:25:41 +0100 (CET)
From: <hans.beckerus@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 15:25:33 +0100
Message-ID: <1384525538-2163-1-git-send-email-hans.beckerus@gmail.com>
X-Mailer: git-send-email 1.8.4
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJJMWRmVeSWpSXmKPExsUyM+Jvre4zvbYgg5ZrFhavzt9ht7jz8x27
	A5PHzll32T3ObVzBGMAUxWWTkpqTWZZapG+XwJXx4M1cloLr7BUf/gU2MG5i62Lk4JAQMJF4
	fJe3i5ETyBSTuHBvPVCYi0NI4BCjxMRHB1ggnJ2MEr8nfmYCqRISOMsosf+WF4RdJ/H/9Buw
	OJuAvMSzr7vBhooI6Elc/ScKEmYW0Ja4OmcXI4gtLOAocW/7KbByFgFViedvdzOD2LwCbhIv
	b79khLhHTuLht1iIsKDEyZlPWCDGSEgcfPGCGWKrisTx9YtZJzAKzEJSNgtJ2QJGplWM7LmJ
	mTnp5eabGIHBdXDLb4MdjJvuix1ilOZgURLn/fDWOUhIID2xJDU7NbUgtSi+qDQntfgQIxMH
	p1QDY3Lds8MhTYk9UYU+Ti7rMx9vr9OvPi5c3q7gcqkmTct6dvrfvJB03U+usj9KXuTZzPoT
	prqbe3H/wn3nReRWmfHfjkyZLsP6r/PXY7bGtflLJy/1UpuSx9+xtUaD/RGrTet9v7kXlyyu
	WCY5zaR40rLja0p4J4WxhLPwZSxKX7zIa81lGQ8bJZbijERDLeai4kQAWh3vv/wBAAA=
Subject: [PATCH] initscripts: add missing dmesg.sh to run-level S
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
X-List-Received-Date: Fri, 15 Nov 2013 14:25:44 -0000
Content-Type: text/plain

From: Hans Beckerus <hans.beckerus@gmail.com>

In commit faa8cc6c2a582a32c695f3f2b0d45b6892c769fd dmesg.sh was
added to the set of init.d scripts. But the script was never put
in any run-level. This patch will add dmesg.sh to run-level S.

Signed-off-by: Hans Beckerus <hans.beckerus AT gmail.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 2d58266..4bcc4ec 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -126,5 +126,7 @@ do_install () {
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 	        update-rc.d -r ${D} alignment.sh start 06 S .
 	fi
-
+	# We wish to have /var/log ready at this stage so execute this after
+	# populate-volatile.sh
+	update-rc.d -r ${D} dmesg.sh start 38 S .
 }
-- 
1.8.4


