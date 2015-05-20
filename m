Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67E9872B33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 02:21:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4K2LbTb008548
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 19:21:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.153) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 19 May 2015 19:21:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 May 2015 10:21:48 +0800
Message-ID: <2ec9d6e9df15ecea7011cf1d9e9e452b56150846.1432088441.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1432088441.git.Qi.Chen@windriver.com>
References: <cover.1432088441.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] buildstats-summary: add eventmask
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
X-List-Received-Date: Wed, 20 May 2015 02:21:41 -0000
Content-Type: text/plain

Add eventmask 'bb.event.BuildCompleted' for buildstats_summary handler to avoid
running the codes in the handler everytime there's an event.

The codes in buildstats_summary only need to run for bb.event.BuildCompleted.
So add this event mask.

Also, we remove the redundant isinstance() statement in the handler.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/buildstats-summary.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
index c8fbb2f..05ead9f 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -1,8 +1,5 @@
 # Summarize sstate usage at the end of the build
 python buildstats_summary () {
-    if not isinstance(e, bb.event.BuildCompleted):
-        return
-
     import collections
     import os.path
 
@@ -37,3 +34,4 @@ python buildstats_summary () {
             bb.note("  {0}: {1}% sstate reuse ({2} setscene, {3} scratch)".format(t, 100*len(sstate)/(len(sstate)+len(no_sstate)), len(sstate), len(no_sstate)))
 }
 addhandler buildstats_summary
+buildstats_summary[eventmask] = "bb.event.BuildCompleted"
-- 
1.9.1


