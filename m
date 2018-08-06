Return-Path: <ptsneves@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3245F755A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 11:28:40 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c14-v6so13451296wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3x/880o2nTkQz69WEjwTu4GBHM/DMRoiQziRMZjG0TI=;
	b=EvXqPPfxeXzkQOMbThMwB0ULfYkRmMfUkR8VFduyrB+++D0qsR4EKc7sgJZHBL6aDt
	qPQc0eQzmrux9muPFyYh5iTIoi4Z0pgTjHKmQuQTWdmadgZTtYc1n4BtZ/5mlLCno1fx
	58fzYJgJF1dNBRa3MGHZmqg6wfhyD5GK7Mv8CxNYKWztC8jmqbhTpNnBaVp4aUIXtrNv
	ukMWm6Ld5QdXTXl2xuxeQVQGsozSEDF1bcNS9qE3aTYsqiYmv7ro7hwT2oCjdabCMYzq
	dRoMwKyvUMyqpnCnM9SqVxHqk+qceltGp+BuPyUp7+6mDhHGZZgBeF1ocI98Advrf84q
	+Nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3x/880o2nTkQz69WEjwTu4GBHM/DMRoiQziRMZjG0TI=;
	b=Xqofr/ojm65kw64h6rbTArvvqiNeVNKNrQQ8C5Hl2l8eCfSzznsZ3G+12Vbeh61QH1
	AO4vITGRWOX3vJF6yfoYu5yCqU8Cx+5uMIA48H4g9LWo2wHPRwBMUY23FJCEj54F0ZF/
	goQAvPJfNAq1hy29bsPqpsBjjyZbqNtif/AhCoDfjGioWW1vgrmMOdCdRojfn7z8FgvN
	51scOPOPDK8A9zdGKcO12MxYBtqGVCqZ5p8hMBKSRP71U7qhQufYapCbb4pkMr2VEXUq
	A8msPtqH2Wc/uv4AmbItUq5/ju8c3W9PH+sERfqUHQiJ4tlKs9x6Z0QeygeH5C7o5Bmr
	sXvw==
X-Gm-Message-State: AOUpUlGYktT/5bPqoZT8ur9Pz/9Ln2oEafDbrGVkIk+43Df0CZ7jxBR8
	qQwxWj1hUpqL+/Q/C8aT7gu9kTLDJw==
X-Google-Smtp-Source: AAOMgpdWS/65vcArqBsb5T76VT8xWYKZvY33TCKM+46e3iCBheaH7d4nkE8+qL8g/F5YXO1e9SvPvg==
X-Received: by 2002:a1c:c685:: with SMTP id
	w127-v6mr12099819wmf.133.1533554920817; 
	Mon, 06 Aug 2018 04:28:40 -0700 (PDT)
Received: from localhost.localdomain (64.196.28.37.rev.vodafone.pt.
	[37.28.196.64]) by smtp.gmail.com with ESMTPSA id
	k6-v6sm9336022wrv.92.2018.08.06.04.28.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 04:28:40 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 13:27:00 +0200
Message-Id: <1533554821-10772-3-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533554821-10772-1-git-send-email-ptsneves@gmail.com>
References: <1533554821-10772-1-git-send-email-ptsneves@gmail.com>
Subject: [meta-oe][PATCH v2 3/4] testimage: target.start exceptions not masked.
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
X-List-Received-Date: Mon, 06 Aug 2018 11:28:40 -0000

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


