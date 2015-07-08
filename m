Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2578075D64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:59:11 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so213594283wid.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 03:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0TuIDYu1TSiHJ/zwhm32Qju9/cECam5ik0sNWCD7oKw=;
	b=VrWw/XcHFDxAT0lRwUwSM0ZLvyKHD6KqG0rqAVetZJFFDcWv8ietdP/XE7+vviiAOg
	xWajYLqamQYJgfFEUpmymCu0HFDLS4hd6CyxIGncOHip51+MCIdOnyC+Ay4gASNauC9c
	MzJdR8EvxJocy6jAuvJiNLCGzRqgQCwNH985iTuMNuEESGFIsf+9YUoMp18NIEw1x9tt
	oxfntpulExz3JyEPNL0aXgNQrTFJEIpQ5KVa7lNv7JCkLbdr63xILcplUuNjeaSeSsRx
	RTaD72DqPOjBpJI9jK320IKEZteZ6b3jRCSNWj6eHRaarEbyi3MrMJAA8jGgAH1ns2A0
	AzIw==
X-Gm-Message-State: ALoCoQkQMQw4QWyP7jWFff96DuXJ/RWXCu/vznINw+0ltoVCYHx8XNBvdQf8vyBkQVdWUAqPcf6R
X-Received: by 10.181.25.234 with SMTP id it10mr76113642wid.0.1436353151091;
	Wed, 08 Jul 2015 03:59:11 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id eu2sm2310516wic.8.2015.07.08.03.59.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jul 2015 03:59:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 11:53:44 +0100
Message-Id: <1436352824-10663-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] report-error: expand all variables
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
X-List-Received-Date: Wed, 08 Jul 2015 10:59:14 -0000

BUILDNAME is now composed from ${DATE} and ${TIME} so needs to be expanded to
useful.  Whilst fixing this some other variables were explicitly not expanded
for no clear reason, so expand those too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/report-error.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 11eee9b..cabd98c 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -32,11 +32,11 @@ python errorreport_handler () {
         if isinstance(e, bb.event.BuildStarted):
             bb.utils.mkdirhier(logpath)
             data = {}
-            machine = e.data.getVar("MACHINE", False)
+            machine = e.data.getVar("MACHINE", True)
             data['machine'] = machine
             data['build_sys'] = e.data.getVar("BUILD_SYS", True)
-            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING", False)
-            data['distro'] = e.data.getVar("DISTRO", False)
+            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING", True)
+            data['distro'] = e.data.getVar("DISTRO", True)
             data['target_sys'] = e.data.getVar("TARGET_SYS", True)
             data['failures'] = []
             data['component'] = e.getPkgs()[0]
@@ -73,7 +73,7 @@ python errorreport_handler () {
             bb.utils.unlockfile(lock)
             failures = jsondata['failures']
             if(len(failures) > 0):
-                filename = "error_report_" + e.data.getVar("BUILDNAME", False)+".txt"
+                filename = "error_report_" + e.data.getVar("BUILDNAME", True)+".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
                 bb.note("The errors for this build are stored in %s\nYou can send the errors to a reports server by running:\n  send-error-report %s [-s server]" % (datafile, datafile))
                 bb.note("The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.")
-- 
2.1.4


