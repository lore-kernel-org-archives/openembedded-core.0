Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 463D371AA7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 19:51:56 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uB6JpskD031251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 6 Dec 2016 13:51:54 -0600
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 6 Dec 2016 13:51:54 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 6 Dec 2016 13:51:53 -0600
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 6 Dec 2016 13:51:54 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2016 13:51:52 -0600
Message-ID: <20161206195152.7493-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <CAJTo0La+W7qJikWqjHh6f90M_Cr_v2EUwegE+CGRLYCR5D6K8A@mail.gmail.com>
References: <CAJTo0La+W7qJikWqjHh6f90M_Cr_v2EUwegE+CGRLYCR5D6K8A@mail.gmail.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-06_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612060296
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [PATCH v2] run-postinsts: Print message before running deferred postinst scripts
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
X-List-Received-Date: Tue, 06 Dec 2016 19:51:57 -0000
Content-Type: text/plain

Package managers can defer running postinst scripts to first boot, which
can take a while on some systems. E.g. The output of `opkg configure`
(or whatever pm is used) is redirected to a file when logging is enabled
($POSTINST_LOGGING == 1), making the machine appear hung during this
process. This change simply prints a wait message on the console to
inform the user of this potentially long and silent operation so they do
not mistakenly reboot the machine.

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


