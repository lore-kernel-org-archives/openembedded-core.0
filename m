Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A305785A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 23:53:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1KNrVAh013399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:53:31 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 20 Feb 2018 15:53:12 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Feb 2018 15:53:29 -0800
Message-ID: <20180220235329.91253-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] logging.bbclass: Enclose the tr string in quotes
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
X-List-Received-Date: Tue, 20 Feb 2018 23:53:30 -0000
Content-Type: text/plain

On some linux hosts image recipes will fail to build as follows:

ERROR: build-essential-0.3-r0 do_image_ext3: Usage: bbdebug [123] "message"
ERROR: build-essential-0.3-r0 do_image_ext3: Function failed: do_image_ext3 (log file is located at /opt/build/tmp/work/intel_corei7_64-wrs-linux/build-essential/0.3-r0/temp/log.do_image_ext3.43744)
ERROR: Logfile of failure stored in: /opt/build/tmp/work/intel_corei7_64-wrs-linux/build-essential/0.3-r0/temp/log.do_image_ext3.43744
ERROR: Task (/opt/layers/meta-overc/meta-build/recipes-core/images/build-essential_0.3.bb:do_image_ext3) failed with exit code '1'

Running with bitbake -v -v -v -D we get in the log file:
+ bbdebug 1 Executing 'dd if=/dev/zero of=/opt/build/tmp/work/intel_corei7_64-wrs-linux/build-essential/0.3-r0/deploy-build-essential-image-complete/build-essential-intel-corei7-64-20180220190510.rootfs.ext3 seek=484486 count=0 bs=1024'
+ USAGE='Usage: bbdebug [123] "message"'
+ '[' 3 -lt 2 ']'
+ DBGLVL=1
+ shift
++ echo 1

++ echo 1
++ tr -d t

++ tr -d t
+ NONDIGITS=1
+ '[' 1 ']'
+ bbfatal 'Usage: bbdebug [123] "message"'

The debug output tells us that the NONDIGITS check failed to remove
the digits using the tr expression.  Enclosing the expression in
quotes causes it to work properly.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/logging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/logging.bbclass b/meta/classes/logging.bbclass
index 06c7c31c3e..a0c94e98c7 100644
--- a/meta/classes/logging.bbclass
+++ b/meta/classes/logging.bbclass
@@ -86,7 +86,7 @@ bbdebug() {
 	
 	# Strip off the debug level and ensure it is an integer
 	DBGLVL=$1; shift
-	NONDIGITS=$(echo "$DBGLVL" | tr -d [:digit:])
+	NONDIGITS=$(echo "$DBGLVL" | tr -d "[:digit:]")
 	if [ "$NONDIGITS" ]; then
 		bbfatal "$USAGE"
 	fi
-- 
2.11.0


