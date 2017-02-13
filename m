Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Feb 2017 12:56:50 UTC
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id EA4D971E5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:56:50 +0000 (UTC)
X-Note-AR-ScanTimeLocal: 02/13/2017 7:41:48 AM
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Note: SecureTide Build: 9/27/2016 9:09:05 PM UTC
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-48/SG:2 2/13/2017 7:41:32 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.389962 p=-1 Source Normal
X-Signature-Violations: 0-0-0-5170-c
X-Note-419: 46.8959 ms. Fail:0 Chk:1357 of 1357 total
X-Note: VSCH-CT/SI: 0-1357/SG:1 2/13/2017 7:41:30 AM
X-Note: Spam Tests Failed: 
X-Country-Path: ->PRIVATE->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G273 G274 G275 G276 G280 G281 G409 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [213.210.30.29] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 113499806; Mon, 13 Feb 2017 07:41:47 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cdFww-0003fw-Lp; Mon, 13 Feb 2017 12:41:46 +0000
Received: from mac by chuckie with local (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cdFww-0004SP-L4; Mon, 13 Feb 2017 12:41:46 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 12:41:42 +0000
Message-Id: <20170213124142.17081-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.12.0.rc0
MIME-Version: 1.0
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] image: Attempt to work around do_image_complete race
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
X-List-Received-Date: Mon, 13 Feb 2017 12:56:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If two do_image_complete tasks run in parallel they risk both trying to put
their image into ${DEPLOY_DIR_IMAGE} at the same time. Both will contain a
README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt file. In theory this
should be safe because "cp -alf" will just cause one to overwrite the
other. Unfortunately, coreutils cp also has a race which means that if one
copy creates the file at just the wrong point the other will fail with:

 cp: cannot create hard link ‘..../tmp-glibc/deploy/images/pantera/README_-_DO_NOT_DELETE_FILES_IN_THIS_D.txt’ to ‘..../tmp-glibc/work/rage_against-oe-linux-gnueabi/my-own-image/1.0-r0/deploy-my-own-image-complete/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt’: File exists

The coreutils bug has been reported and fixed upstream as
https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25680 , but it will take
a while for host distributions to catch up.

In the meantime, let's try and avoid the race altogether by causing
sstate.bbclass:sstate_install to take a lock file in
${DEPLOY_DIR_IMAGE} whilst writing. This lock is probably a bit broad,
but it's better than the build failing.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b5a4fb4a33..5c2f183446 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -298,6 +298,10 @@ SSTATE_SKIP_CREATION_task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] = "${MACHINE}"
+# Defend against copying two different images to ${DEPLOY_DIR_IMAGE}
+# at the same time because they risk both trying to create
+# README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt at the same time.
+do_image_complete[sstate-lockfile-shared] = "${DEPLOY_DIR_IMAGE}/image-complete-output.lock"
 addtask do_image_complete after do_image before do_build
 
 # Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
-- 
2.12.0.rc0


