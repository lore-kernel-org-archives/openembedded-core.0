Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id C3DA9719A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 16:38:19 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t4Xd913Tdz3hjcS;
	Thu, 27 Oct 2016 18:38:21 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t4Xd90wh9zvl75;
	Thu, 27 Oct 2016 18:38:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id a0CAdcGNcuvW; Thu, 27 Oct 2016 18:38:20 +0200 (CEST)
X-Auth-Info: k2ljJM5EKau1hL8Wb64e2IbIATa8VKC9Bs45Tngq4xSZB1XQTwvxMdQbRmjq4bgN
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 27 Oct 2016 18:38:20 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Oct 2016 16:37:43 +0000
Message-Id: <1477586263-29453-1-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH] toaster: fix if USER_CLASSES is missing buildstats
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
X-List-Received-Date: Thu, 27 Oct 2016 16:38:20 -0000

buildstats not being in USER_CLASSES is no reason to fail every
single task in toaster_collect_task_stats: using a non-existing
variable results in a None argument to os.path.join().

Check the variable availability before trying to use it.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 meta/classes/toaster.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 4bddf34..638bb39 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -157,11 +157,11 @@ python toaster_collect_task_stats() {
     import bb.utils
     import os
 
-    toaster_statlist_file = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist")
-
     if not e.data.getVar('BUILDSTATS_BASE', True):
         return  # if we don't have buildstats, we cannot collect stats
 
+    toaster_statlist_file = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist")
+
     def stat_to_float(value):
         return float(value.strip('% \n\r'))
 
-- 
2.1.4


