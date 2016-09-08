Return-Path: <pidge@toganlabs.com>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Sep 2016 09:34:31 UTC
Received: from bongo.birch.relay.mailchannels.net
	(bongo.birch.relay.mailchannels.net [23.83.209.21])
	by mail.openembedded.org (Postfix) with ESMTP id D8DD077324
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 09:34:31 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id AE0411BCBE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 09:24:32 +0000 (UTC)
Received: from hp181.hostpapa.com (ip-10-220-3-24.us-west-2.compute.internal
	[10.220.3.24])
	by relay.mailchannels.net (Postfix) with ESMTPA id B5B761BCFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 09:24:31 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [10.107.128.240])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.8); Thu, 08 Sep 2016 09:24:32 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-MC-Loop-Signature: 1473326672121:90850090
X-MC-Ingress-Time: 1473326672121
Received: from ns304116.ip-94-23-210.eu ([94.23.210.13]:38338
	helo=ns304116.ovh.net) by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>)
	id 1bhvZN-003XmY-BL; Thu, 08 Sep 2016 11:24:30 +0200
From: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 11:26:01 +0200
Message-Id: <20160908092601.7588-1-pidge@toganlabs.com>
X-Mailer: git-send-email 2.9.3
X-OutGoing-Spam-Status: No, score=-1.0
X-AuthUser: pidge@toganlabs.com
Subject: [RFC][PATCH] report-error.bbclass: Add support for autosending
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
X-List-Received-Date: Thu, 08 Sep 2016 09:34:32 -0000

This commit pulls and extends the functionality of .oe-error-report into
local.conf. It maintains the functionality of .oe-error-report.

It also enables report-error to automatically send error reports to a 
specified error report server. This patch enables infrastructure ppl to
set development teams up so that we can gather error metrics automatically.

This relies on a new set of variables:

REPORTERROR[autosend]="yes|no|ask"
REPORTERROR[user]=username
REPORTERROR[email]=email
REPORTERROR[server]=error-report-web instance

For autosend yes and no are pretty self explainatory. ask does not pass
the -y flag to send-error-report, thus enabling the end user to review
the report prior to submission.

Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
---
 meta/classes/report-error.bbclass | 41 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 82b5bcd..909adf0 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -85,10 +85,47 @@ python errorreport_handler () {
             bb.utils.unlockfile(lock)
             failures = jsondata['failures']
             if(len(failures) > 0):
+
                 filename = "error_report_" + e.data.getVar("BUILDNAME", True)+".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
-                bb.note("The errors for this build are stored in %s\nYou can send the errors to a reports server by running:\n  send-error-report %s [-s server]" % (datafile, datafile))
-                bb.note("The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.")
+
+                cmd_s = "send-error-report %s" % datafile
+                response_s = "The errors for this build are stored in %s\n" % datafile
+                sendit = False
+
+                autosend = e.data.getVarFlag("REPORTERROR","autosend")
+                user = e.data.getVarFlag("REPORTERROR","user")
+                email = e.data.getVarFlag("REPORTERROR","email")
+                server = e.data.getVarFlag("REPORTERROR","server")
+
+                if user is not None:
+                    cmd_s += " -n %s" % user
+                if email is not None:
+                    cmd_s += " -e %s" % email
+                if server is not None:
+                    cmd_s += " -s %s" % server
+
+                if autosend is not None:
+                    if autosend == "yes":
+                        response_s += "The errors for this build are set to automatically be sent.\n"
+                        cmd_s += " -y"
+                        sendit = True
+                    elif autosend == "ask":
+                        response_s += "The errors for this build are set to automatically be sent.\n"
+                        sendit = True
+                elif autosend is None:
+                        response_s += "You can send the errors to a reports server by running:\n  %s\n" % cmd_s
+                elif e.data.getVarFlags('REPORTERROR') is None:
+                        response_s += "You can send the errors to a reports server by running:\n  %s [-s server]\n" % cmd_s
+                        response_s += "The contents of these logs will be posted in public if you use the above command with the default server.\n \
+                             Please ensure you remove any identifying or proprietary information when prompted before sending.\n"
+
+                bb.note(response_s)
+
+                if sendit == True:
+                    import shlex, subprocess
+                    args = shlex.split(cmd_s)
+                    subprocess.call(args)
 }
 
 addhandler errorreport_handler
-- 
2.9.3


