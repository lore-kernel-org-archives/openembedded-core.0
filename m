Return-Path: <ptsneves@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 59F347949C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 17:49:54 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id x207-v6so2201025lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3x/880o2nTkQz69WEjwTu4GBHM/DMRoiQziRMZjG0TI=;
	b=Mwhjg2vCi5EAKCFyOOIgpsKjX/2saWLBBl1hZT6jsspRzGEzokDJYXNbhTJM0zwx7S
	lAKZ4I8tnEv7nG0GkseBFdbiakjQdHESjRe5lj+TMwjGWYoX7T8QLfrkHldnXL+5j/7y
	Y/Q5LAaprvtODoFYtVms6Omd2MxEsoJ4dLTmk+WXSf5gMU1lfLFpv8DPLc6pxLINJiU3
	fWJrHvkbJLZ32A/DhmkhFFJzTx0IFqFjrPofK3OqHRkCK7ln1nuDPLxfftCYIllUAV4t
	JB84blIub5cywo0CXjpfcKYY1L+P2jG62FsvkZl8dgLRwwTld1T9IDi6CIr0VB3W+Nb/
	MWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3x/880o2nTkQz69WEjwTu4GBHM/DMRoiQziRMZjG0TI=;
	b=Uu+AgWMtOjixWI+Y8i3eBpxC4ewuSfHJj2LoMSJRwq+0pkuDK9G0sjz4O5s1vG+HtL
	wIrYSU0yIi0q4641XnZuhX4nEnZQrra488ItEUwFBAMsCgRXfllTy74gWZohcNH9m7/v
	ftfjy2yulCNfnB5P/d85SP+6+sDXYMaNGVoBH87KSRPe8jrWaFz7O5gsanlT1Ds0Yx7D
	xFo/tXBkkGvVcJe7Hklc3vWlkdaVzxYiB6PfN9qQbmlh8ulyrsOurtwl17X7UmI6d7Uv
	0rmjvsK0O99sRJwte4G8Mju8SGxfADf1EZa78FYhmxrGiqNKImKFRL1Jsoguyn77dF8+
	GTBw==
X-Gm-Message-State: APzg51DefsXF7IbxqaLWqJsgF8xF2rlzV23KDDLdshh1A8EYOE3dUbdm
	g/ZrL1cJurxkscndJ8ljVD8/oCw=
X-Google-Smtp-Source: ANB0VdZEyz6tsH33RnzjyKiXmQRFYOiqxIttwm49PpnaUiyrHKrjhDB47gB7D3Q50aPuaNcz1HOuXw==
X-Received: by 2002:a19:655d:: with SMTP id
	c29-v6mr1758012lfj.138.1535651394772; 
	Thu, 30 Aug 2018 10:49:54 -0700 (PDT)
Received: from pneves-XPS-15-9550.home
	(dynamic-62-87-243-12.ssp.dialog.net.pl. [62.87.243.12])
	by smtp.gmail.com with ESMTPSA id
	t25-v6sm1368907ljb.89.2018.08.30.10.49.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Aug 2018 10:49:54 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 19:49:34 +0200
Message-Id: <1535651376-25467-2-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
References: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
Subject: [meta-oe][PATCH v2 2/4] testimage: target.start exceptions not masked.
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
X-List-Received-Date: Thu, 30 Aug 2018 17:49:54 -0000

Previously the target.start exceptions were being
masked by the catch clause of RuntimeError and
BlockingIOError which are very broad. We decoupled
the start method try clause from the runTests try
clause which requires catching the BlockingIOError and
RuntimeError.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/testimage.bbclass | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2aa59b0..f58d11d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -269,24 +269,30 @@ def testimage_main(d):
         # Add systemd.log_level=debug to enable systemd debug logging
         bootparams = 'systemd.log_target=console'
 
+
     tc.target.deploy()
-    results = None
-    orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
+
+    #We do not want the runTests to mask exeptions of target.start but we want a failed start
+    #to trigger a stop.
     try:
-        # We need to check if runqemu ends unexpectedly
-        # or if the worker send us a SIGTERM
-        tc.target.start(extra_bootparams=bootparams)
-        results = tc.runTests()
-    except (RuntimeError, BlockingIOError) as err:
-        if isinstance(err, RuntimeError):
-            bb.error('testimage received SIGTERM, shutting down...')
-        else:
-            bb.error('runqemu failed, shutting down...')
-        if results:
-            results.stop()
-            results = None
+        tc.target.start(extra_bootparams=bootparams) 
+        results = None
+        orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
+        try:
+            # We need to check if runqemu ends unexpectedly
+            # or if the worker send us a SIGTERM
+            results = tc.runTests()
+        except (RuntimeError, BlockingIOError) as err:
+            if isinstance(err, RuntimeError):
+                bb.error('testimage received SIGTERM, shutting down...')
+            else:
+                bb.error('runqemu failed, shutting down...')
+            if results:
+                results.stop()
+                results = None
+        finally:
+            signal.signal(signal.SIGTERM, orig_sigterm_handler)
     finally:
-        signal.signal(signal.SIGTERM, orig_sigterm_handler)
         tc.target.stop()
 
     # Show results (if we have them)
-- 
2.7.4


