Return-Path: <adrian.ratiu@ni.com>
X-Greylist: delayed 815 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Aug 2016 15:19:00 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id E50B97725D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:19:00 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7CF5P5R028773 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 10:05:25 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016081210052511-292784 ;
	Fri, 12 Aug 2016 10:05:25 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 18:04:12 +0300
Message-Id: <20160812150412.3445-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.9.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/12/2016 10:05:25 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/12/2016 10:05:25 AM,
	Serialize complete at 08/12/2016 10:05:25 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-12_06:, , signatures=0
Subject: [PATCH] initscripts: Check for logrotate in dmesg.sh
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
X-List-Received-Date: Fri, 12 Aug 2016 15:19:01 -0000

From: Ovidiu Vancea <ovidiu.vancea@ni.com>

Autodetect previously hardcoded logrotate location because it can be
installed in multiple places like /usr/bin/logrotate which is very
common besides /usr/sbin

Signed-off-by: Ovidiu Vancea <ovidiu.vancea@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh b/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
old mode 100644
new mode 100755
index a97b068..2b9eba6
--- a/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
@@ -8,8 +8,8 @@
 ### END INIT INFO
 
 if [ -f /var/log/dmesg ]; then
-	if [ -f /usr/sbin/logrotate ]; then
-		logrotate -f /etc/logrotate-dmesg.conf
+	if LOGPATH=$(which logrotate); then
+		$LOGPATH -f /etc/logrotate-dmesg.conf
 	else
 		mv -f /var/log/dmesg /var/log/dmesg.old
 	fi
-- 
2.9.2


