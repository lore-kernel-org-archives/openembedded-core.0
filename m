Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 73B9E74F55
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 11:02:38 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/09/2018 7:02:38 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.2.1)
	with PIPE id 377211253; Wed, 09 May 2018 07:02:38 -0400
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.2.1)
	with ESMTPS id 377211243; Wed, 09 May 2018 07:02:37 -0400
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1fGMrm-000CgV-8v; Wed, 09 May 2018 12:02:38 +0100
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1fGMrm-0004mu-80; Wed, 09 May 2018 12:02:38 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 12:02:35 +0100
Message-Id: <20180509110235.18361-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180504182120.7783-1-mac@mcrowe.com>
References: <20180504182120.7783-1-mac@mcrowe.com>
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/09/2018 7:02:37 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-20/SG:1 5/9/2018 7:01:54 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.517712 p=-1 Source White
X-Signature-Violations: 0-0-0-4237-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G339 G340 G341 G342 G346 G347 G479 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCHv2] rm_work: Stop appending _setscene to do_image_complete_setscene stamps
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
X-List-Received-Date: Wed, 09 May 2018 11:02:39 -0000

Each time I build my image after the first, I end up with a
do_image_complete_setscene stamp file with an extra _setscene appended to
the name. Eventually, the filenames end up being so long that mv complains
and the build fails.

It looks like this behaviour was introduced when the special handling was
added for do_image_complete in 2ff9d40dc88d43567472218cf3d3faf414398c71.

So, let's ensure that the *_setscene* pattern is matched before anything
else so that any do_image_complete_setscene stamp file is always ignored
and the do_image_complete non-setscene stamp file is moved only once.

It's not straightforward to just move *do_image_complete* after the
*_setscene* pattern because do_image_complete stamps would then match
do_image*.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/rm_work.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

(diff unchanged, commit message updated so that paragraph three
actually makes sense.)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 31d99e4554..318d121d2b 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -53,6 +53,10 @@ do_rm_work () {
             *do_setscene*)
                 break
                 ;;
+            *_setscene*)
+                i=dummy
+                break
+                ;;
             *sigdata*|*sigbasedata*)
                 i=dummy
                 break
@@ -89,10 +93,6 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
-            *_setscene*)
-                i=dummy
-                break
-                ;;
             *$j|*$j.*)
                 mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
                 i=dummy
-- 
2.11.0



