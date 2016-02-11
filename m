Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id F173270101
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 06:59:59 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id xg9so29644899igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 23:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cI1HCS7A5EkThl/f9/CYMF6P3KH32u3OXRf9pcwdgiY=;
	b=m7Cmf5tf8m4sO+gd2X6Rxw+Ittz8nlimIDqogYoVTBln/5D/0SmKKUb/3+9KsmNuSi
	FykcGw1r8DP9BhgR227VC63n3t0dxYl/LqZjbgDwtLYasW8IeGqzuZpws0DEVclGSc07
	e5xx+BNFi832HhKu7dmm3T2aSmFdXFi3bwKJWDcXg2nqPsOj2MCPjixQBuobtN3rjGDQ
	loun5u2Um0eqSMkd/RdqVimi0x71ie0kd1koi2MmosQTrrOSe7LZruoQ3y6GAXQiQCjL
	Q2ixcU4nOvacsYk8iLGCR/SkpZOlX0FCAuKY2p9Is3XUBbhV9mrfzuiw3MpaOSNWg/63
	d90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cI1HCS7A5EkThl/f9/CYMF6P3KH32u3OXRf9pcwdgiY=;
	b=HC6zoaXW5qlCmQEapUTx4FBwxsE22Hl50L81XM8R72IfMGPcSM+AFepLb5yfz3b6X2
	mRYcwaVyScsM3YylmFnAIiohsQrxZij3SPsvDyIEvkHa0EhvzTqQRP4KYqE8uzi2WHlk
	ORUfe8GRjE/zs6Cr8+xOggckJI1EZZj2b5OlaBgjWp4FsIcvgAHujEIQwYMLTFZ4fvir
	BW3bQZlBJhTMBjCQ3f2sxMtNaHwd7sjTwencRCXz9D0CQdiLH715fXHrwP+m+QuNLYzL
	Mf2YG2bcahBazG2C9mMBJF/zsftwLR9pFZYv8BKA1Q5RRcqcItnvxk2wt2flxOVkPzG5
	uWmA==
X-Gm-Message-State: AG10YOShul5/3IKgBp1+k5iJZhWEokIqaE3wfRAhAyNCbXcqXaG4Onor4OHAitn7mrIPOxwx
X-Received: by 10.50.50.201 with SMTP id e9mr15328482igo.10.1455174000057;
	Wed, 10 Feb 2016 23:00:00 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8D2D2.dip0.t-ipconnect.de.
	[93.232.210.210])
	by smtp.gmail.com with ESMTPSA id a5sm11488385iga.7.2016.02.10.22.59.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 22:59:59 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 07:59:42 +0100
Message-Id: <1455173982-4362-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] uninative.bbclass: capture stdout/err from patchelf-uninative
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
X-List-Received-Date: Thu, 11 Feb 2016 07:00:01 -0000

When patchelf-uninative fails, reporting only the exit code
as done by subprocess.check_call() is not enough to understand
the problem. We also need to capture and report the output
of the command.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/uninative.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 580917b..0448cf6 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -84,5 +84,11 @@ python uninative_changeinterp () {
                 continue
 
             #bb.warn("patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f))
-            subprocess.check_call("patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f), shell=True)
+            cmd = "patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f)
+            p = subprocess.Popen(cmd, shell=True,
+                                 stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+            stdout, stderr = p.communicate()
+            if p.returncode:
+                bb.fatal("'%s' failed with exit code %d and the following output:\n%s" %
+                         (cmd, p.returncode, stdout))
 }
-- 
2.1.4


