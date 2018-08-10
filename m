Return-Path: <ptsneves@gmail.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9C778EF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 19:38:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id f135-v6so7336004lfg.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 12:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3x/880o2nTkQz69WEjwTu4GBHM/DMRoiQziRMZjG0TI=;
	b=ODgD9PwEIKP8Z5HX9IJ81at+rlGJUnd7KEA1jmSeIRdur3GSJ7xnkXh8ZK3evBIPQo
	4VfBHIClblbedimRkktfVl+ma5yEw0jh57bPvFVNxWoCNTZytdosMsDY3jhA+z37aAGB
	nZn8lnWQ5faVHwwbdN5p/yrDXy6jVy9XKYb+5OZ7/twxftaqpR20hOB3e0OmIZadl60U
	uC7s/+WTWxGFSlZItzomTrvdGCJ657UY4qtThJjFCadIkGd+TscOmR7hWh5EoqGvWMsZ
	oXBEndcbicA5DNQ8pgJBsr/ooN4Sy279NcW3EXcKvlrcPm7r4ENViTGM69CcWX0m2qA5
	8pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3x/880o2nTkQz69WEjwTu4GBHM/DMRoiQziRMZjG0TI=;
	b=neTr29YP1+SW29kadZpMTmiPpDVCN3i6v2oYN7VH1TEIyulCFVbdqjKSXPujalVBab
	T/fuTelc9+A5/vVPrFej8tL7UI2pEGPrjNZyaAqfxrrkjzgXDCVXs2Tgz9CIeAJG/lwA
	e23tUaX5iwb/x0DrownI9iTd9WWiTHNIGSYd4ZFbG+CotcdbpcetURv74jHhnXUEq13V
	0skIP1SSX/PyY4+JYrt9VBluPfN8wRizmtvibBLzPx1E4OJPyvvry+vdY1XS6anlkltc
	JHd54zOdhA2K89oa85pOHvZUNCC/elBqJlEKAe6i3hXR4oJZfmQsxcf4iAjLnJ3DA4kH
	roUw==
X-Gm-Message-State: AOUpUlHph8j0RD4qzRaXjo4BRTCBNpgrMoyN2LwZ7fXG2lmKj1dSjuFG
	IA6S7ipEAnQ5m7Fu4vwzbB1MJnRCXqwY
X-Google-Smtp-Source: AA+uWPxutbNohIZdX3sl5o4w2mpoObjeF0BGkwzV3pw+JmiFKlVbqwybUVaxQIqwOSq1CFJoWVRD8g==
X-Received: by 2002:a19:5911:: with SMTP id
	n17-v6mr5601533lfb.102.1533929888831; 
	Fri, 10 Aug 2018 12:38:08 -0700 (PDT)
Received: from pneves-XPS-15-9550.home ([78.8.180.157])
	by smtp.gmail.com with ESMTPSA id
	z7-v6sm1972460lfg.89.2018.08.10.12.38.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Aug 2018 12:38:07 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 21:37:58 +0200
Message-Id: <1533929879-22972-2-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
References: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
Subject: [meta-oe][PATCH 2/3] testimage: target.start exceptions not masked.
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
X-List-Received-Date: Fri, 10 Aug 2018 19:38:08 -0000

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


