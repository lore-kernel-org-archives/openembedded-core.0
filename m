Return-Path: <joaohf@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id A134865CED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 23:09:05 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id l6so10369318qcy.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Y8cIPR+M0AJ4RtAoRxwUH1TanqeokVcvyunPiA+Hv64=;
	b=FN5T7prKrH7WNv5Lw8G8/5VSLvwGEe0zBnDpzk/40x4Wu7gTtimax1/3xM/VlWz5a6
	oMnnveLHUo6zTA3lfwTEr4uUATkg7zoXuuJ9MjdlgkS3jfZCm17IVMghdURGKnaqST/V
	+1FqfO1/Y72zxxVrOJviX0Vr+RcOCpndOWiH30ygFVPaX+9NTZI8YxTxcNAOyIJG3IMM
	vdV/429tb0QSq6IHN8z2O1bTCf3erLEmFH67VQxfCjegmC8Bi6dkgG9ofitRZCNt38u1
	Z8xUvk8q1WaT761rxshaI7SFFYutu9qpcJfUSX6Xvbf1HOZn1GR0UJA0jUWjfJPneDro
	PEWw==
X-Received: by 10.140.16.46 with SMTP id 43mr61769545qga.53.1415833746094;
	Wed, 12 Nov 2014 15:09:06 -0800 (PST)
Received: from localhost.localdomain ([201.53.206.66])
	by mx.google.com with ESMTPSA id
	v37sm22251506qge.29.2014.11.12.15.09.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Nov 2014 15:09:05 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Nov 2014 21:08:38 -0200
Message-Id: <1415833719-6255-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415833719-6255-1-git-send-email-joaohf@gmail.com>
References: <1415833719-6255-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] report-error: sending error report to server without user intervention
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
X-List-Received-Date: Wed, 12 Nov 2014 23:09:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If ERR_REPORT_SERVER is set to a server which has a running instance of
Error Reporting Tool, then that server will be used to send error
reports.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/report-error.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 5fe2355..f9e821f 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -7,6 +7,7 @@
 # Licensed under the MIT license, see COPYING.MIT for details
 
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
+ERR_REPORT_SERVER ?= ""
 
 def errorreport_getdata(e):
     logpath = e.data.getVar('ERR_REPORT_DIR', True)
@@ -24,6 +25,16 @@ def errorreport_savedata(e, newdata, file):
         json.dump(newdata, f, indent=4, sort_keys=True)
     return datafile
 
+def errorreport_senddata(e, datafile):
+    import subprocess
+    server = e.data.getVar('ERR_REPORT_SERVER', True)
+    if server:
+        cmd = 'send-error-report %s %s' % (datafile, server)
+        subprocess.call(cmd, shell=True)
+    else:
+        bb.note("The errors for this build are stored in %s\nYou can send the errors to an upstream server by running:\n  send-error-report %s [server]" % (datafile, datafile))
+        bb.note("The contents of these logs will be posted in public if you use the above command with the default server. If you need to do so, please ensure you remove any identifying or proprietary information before sending.")
+    
 python errorreport_handler () {
         import json
 
-- 
1.9.1


