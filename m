Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 806C16DA81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 316AF25B0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iXiVCUI+nNKm
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id C79AF25B0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B2A53BEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id A23F7A5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id A11673E06F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH98uY014832
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH98nS014831
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:08:53 +0100
Message-Id: <4716e871f2669b9460081862f77fe4625641d8cf.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
Subject: [PATCH 04/14] pybootchartgui: Correct the X offset for the chart
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:09 -0000

This will make the first bar actually start within the graph. It will
also move the graph to the right so the names of the first tasks are
more likely to be visible.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index c3492c7..9cbcbc1 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -280,7 +280,7 @@ bar_h = 55
 meminfo_bar_h = 2 * bar_h
 header_h = 110 + 2 * (30 + bar_h) + 1 * (30 + meminfo_bar_h)
 # offsets
-off_x, off_y = 10, 10
+off_x, off_y = 220, 10
 sec_w_base = 1 # the width of a second
 proc_h = 16 # the height of a process
 leg_s = 10
@@ -416,7 +416,7 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
                 #print val
                 #print trace.processes[val][1]
                 #print s
-                x = (s - offset) * sec_w
+                x = chart_rect[0] + (s - offset) * sec_w
                 w = ((trace.processes[val][1] - s) * sec_w)
 
                 #print "proc at %s %s %s %s" % (x, y, w, proc_h)
-- 
1.8.4


