Return-Path: <ptsneves@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 51D4C78A84
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 14:43:47 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h14-v6so9863874wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6G1F3VzDVDKnczaRA+Mr6M+7m8lMIPKyYAenuEzC4Pg=;
	b=AekZ05QMDLrIOumRPAo1g1xrXcXi06YVVyhM0lzVsp9szuITdgWQN/Vqsd96cHIaX4
	sJdbcEGWSM4OGZh/LnMDkzj8k2p0NGve8JFcN97+IdPHgXjAPBIXNTpZ1taT5xEo7avL
	dTkAjyIk/li/Kd9njKJvZeOKaECnT6BQIIcvdhEl/OGspHTLzrBer7n0QzaaXd9pLYqc
	7BuapjtdTgboXa5dLZLWjUY1rg8AHSQIJ1dNh1KEZSkT766OkiaaUm1vids79tbMeGlE
	mrVS7Q55yBNgQ98JHcoj/a7NXcbFwLkMEayrsbKlNNoRJq4cz7baHYXvP6VBEZ7rumVe
	k1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6G1F3VzDVDKnczaRA+Mr6M+7m8lMIPKyYAenuEzC4Pg=;
	b=IG2nZcFiBA3c6RPjN/FZgjLIr+IH1iOhdHOWI4/+MpCVrNicr/d87B2PaEKcL4iEIv
	4Q2cPUcxgMnH9j36Oad1g8x66qoyLHS9PxEu+Aw0e//JKbf5qDH/jVVytDyXdTl8M48+
	sv+TP/cqREayZphfS7eGon7YJs7/g5RUEb2pO7PznA8ssez8imsqsrBu5dAldhMLEjVW
	cOaR5VbfG+sYrQ8kSFWxYcho+tukU8WEsXW8zj0bYq4y4rTiAg3/ENOlG7F4BPHilhYQ
	P+XIKSOUS/MD86m6ARlJ92RvudmfFaih88cImEqv4XOx1eLYBgu97SRu874OJ6618z7w
	ZrZQ==
X-Gm-Message-State: AOUpUlHX5UIw5A+s+yg81/mgJ8MRMFwc6PAKNmNc7/noRlvaKI9oY/M3
	oFqiOmaDFqWsFr/SjW+K1v5hHH9k9g==
X-Google-Smtp-Source: AAOMgpd4YA2Ft4ccM+GbzajI0bpZib1onq+QrQ+snnRKDkBl3BKi8nf78yChChikl+T2KLgSCWT6JQ==
X-Received: by 2002:adf:eac8:: with SMTP id
	o8-v6mr6809041wrn.150.1533480227814; 
	Sun, 05 Aug 2018 07:43:47 -0700 (PDT)
Received: from localhost.localdomain (64.196.28.37.rev.vodafone.pt.
	[37.28.196.64]) by smtp.gmail.com with ESMTPSA id
	b13-v6sm11073701wrs.43.2018.08.05.07.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Aug 2018 07:43:47 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2018 16:40:40 +0200
Message-Id: <1533480041-6431-3-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533480041-6431-1-git-send-email-ptsneves@gmail.com>
References: <1533480041-6431-1-git-send-email-ptsneves@gmail.com>
Subject: [PATCH 3/4] testimage: target.start exceptions not masked.
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
X-List-Received-Date: Sun, 05 Aug 2018 14:43:47 -0000

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
index 1b33f72..8e42294 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -264,24 +264,30 @@ def testimage_main(d):
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


