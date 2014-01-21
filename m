Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id E45F1615AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 5FCB319E95
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T-8-ZwLkcI5a
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:43 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 464B91A04F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 2D7B6AAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 1C5999AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 1418A3E070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s0LFMcPX015074
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s0LFMc4J015073
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jan 2014 16:22:38 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 16:22:34 +0100
Message-Id: <fe20103fab5dac7a6711f435db5088bd221de2bb.1390317718.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
Subject: [PATCH 4/5] pybootchartgui: Adopt the width of the index in split output files
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
X-List-Received-Date: Tue, 21 Jan 2014 15:23:45 -0000

Add minimum width zero-padding to the index used in split output files
with -s and -o. I.e., if -s 200 is used, then the index will be
zero-padded to three digits width.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/main.py.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index cc9c40b..e9d2c74 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -155,11 +155,13 @@ def main(argv=None):
 			filename = _get_filename(options.output)
 			res_list = parsing.split_res(res, options.num)
 			n = 1
+			width = len(str(len(res_list)))
+			s = "_%%0%dd." % width
 			for r in res_list:
 				if len(res_list) == 1:
 					f = filename + "." + options.format
 				else:
-					f = filename + "_" + str(n) + "." + options.format
+					f = filename + s % n + options.format
 					n = n + 1
 				def render():
 					batch.render(writer, r, options, f)
-- 
1.8.4


