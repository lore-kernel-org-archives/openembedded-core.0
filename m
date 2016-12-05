Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 2172 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Dec 2016 22:24:31 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0216FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 22:24:31 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uB5LmLwB021960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2016 15:48:21 -0600
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 5 Dec 2016 15:48:21 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 5 Dec 2016 15:48:20 -0600
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 5 Dec 2016 15:48:20 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2016 15:48:18 -0600
Message-ID: <20161205214818.13342-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-05_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612050320
Cc: haris.okanovic@ni.com
Subject: [PATCH] run-postinsts: Print message before running deferred postinst scripts
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
X-List-Received-Date: Mon, 05 Dec 2016 22:24:31 -0000
Content-Type: text/plain

Opkg can defer running postinst scripts to first boot, which can take
a while on some systems. The output of `opkg configure` (or whatever pm
is used) is redirected to a file when logging is enabled
(I.e. $POSTINST_LOGGING == 1), making the machine appear hung during
this process. This change simply prints a wait message on the console
to inform the user of this potentially long and silent operation so
that they do not mistakenly reboot their machine.

Why not simply `tee` the output instead?
Tee might be provided by BusyBox in some distros, which may need to run
update-alternatives in the very postinst scripts being executed by this
process. It's therefore not safe to assume Tee (or any other packaged
util) is available until the configure process finishes.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 04ba394..660ddc2 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -46,6 +46,9 @@ if [ -z "$pi_dir" ]; then
 	exit 0
 fi
 
+echo "Configuring packages on first boot...."
+echo " (This may take several minutes. Please do not power off the machine.)"
+
 [ -e #SYSCONFDIR#/default/postinst ] && . #SYSCONFDIR#/default/postinst
 
 if [ "$POSTINST_LOGGING" = "1" ]; then
-- 
2.10.1


