Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C5A446121F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 17:05:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s34H5pIF024972 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 18:05:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id thmIjzgG7Pep
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 18:05:51 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s34H5m52024950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 18:05:50 +0100
Message-ID: <1396631143.13862.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Apr 2014 18:05:43 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Fix an error handling the taskname
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
X-List-Received-Date: Fri, 04 Apr 2014 17:05:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Looking at the code, its clear 'task' is meant not to have the do_ prefix,
however its also clear it can be left in through some code paths.

One result of this can be files not being cleaned from the sysroot correctly.

Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f761909..f371fda 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -98,6 +98,7 @@ def sstate_state_fromvars(d, task = None):
     name = task
     if task.startswith("do_"):
         name = task[3:]
+        task = name
     inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs', True) or "").split()
     outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs', True) or "").split()
     plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs', True) or "").split()



