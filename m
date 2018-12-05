Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8C1744AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 12:33:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id m22so12747635wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 04:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JAectOv7zuskZ9M2F6DY5Rta6d8MCqeKKbamqzIXRVg=;
	b=OeHufJHj6GXd16+Lf4C++YJ1a4URdkoeoZjyCVZxtCiFVLa8/o3J5zgKvX/JXHVcH/
	LY+yGsc1EkmmRfDff4eUfqflOSwnePLIG+V+G29oXADQfQc3UlwRJ5Jbw5FHdi64EEnU
	QWBkDyov1noeKlR2T9m5IKaOhj4LDJo3hJPwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JAectOv7zuskZ9M2F6DY5Rta6d8MCqeKKbamqzIXRVg=;
	b=Rr/c8ev/aOL3i856JlDDP2rBPrV9C3HEy3cdYUGvOTVkBgYEUYRjugamib5SkcZ+BI
	t0f6MShf3kKbm3G/xPWPlW7DK4MWmtPYI+ddCfQZtDdI0+00Evh1QqrBmUfU8pyOexVf
	pxjSZkno1o1m8p2erQofokioCYd9gpFBQyPlEEwc7VSUz2EYwcyuMK+B+zH1ekpDHiD+
	bmpKGbu+GN0zpVnXLG7FTJW0uSvnagDQ5kerUlseJu5H3uCFKf5iIHXjHEuAv0pi4DQA
	In/j2q37WWaolUJ4qxEiUKY/m1FziacHdaJR873HidbZ8V8NLfb+sY1U8uvm6HaDw/0v
	rA6w==
X-Gm-Message-State: AA+aEWaeRg9nqDggrFGBky9B6wPEmT8BOt42S7O8Qfgs7axxB++/Se0V
	nt3G14HMTrA3KpnFPdOA00YraTSoo/A=
X-Google-Smtp-Source: AFSGD/VIp55wpClye4qG51FRn2dQoycuthxIfoZISxFMUOwhcYPkT1NhzAQqQCzTvhTMgSWKZggKIg==
X-Received: by 2002:a1c:7f92:: with SMTP id a140mr15524163wmd.34.1544013200940;
	Wed, 05 Dec 2018 04:33:20 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r77sm18048674wmd.22.2018.12.05.04.33.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 04:33:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2018 12:33:17 +0000
Message-Id: <20181205123319.10452-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/3] lib/oe/utils: Improve multiprocess_lauch exception handling
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
X-List-Received-Date: Wed, 05 Dec 2018 12:33:21 -0000
Content-Transfer-Encoding: 8bit

We've seen a cryptic:

"ERROR: Fatal errors occurred in subprocesses, tracebacks printed above"

message from oe-selftest with no other traceback information. Improve the
traceback logging to try and give a better indication of any errors that is
ocurring.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py                        | 5 +++--
 meta/lib/oeqa/selftest/cases/oelib/utils.py | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d05f517a702..8a584d6ddd5 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -318,9 +318,10 @@ def multiprocess_launch(target, items, d, extraargs=None):
     for p in launched:
         p.join()
     if errors:
+        msg = ""
         for (e, tb) in errors:
-            bb.error(str(tb))
-        bb.fatal("Fatal errors occurred in subprocesses, tracebacks printed above")
+            msg = msg + str(e) + ": " + str(tb) + "\n"
+        bb.fatal("Fatal errors occurred in subprocesses:\n%s" % msg)
     return results
 
 def squashspaces(string):
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index 275aeda74eb..789c6f78d2d 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -66,6 +66,9 @@ class TestMultiprocessLaunch(TestCase):
 
         def dummyerror(msg):
             print("ERROR: %s" % msg)
+        def dummyfatal(msg):
+            print("ERROR: %s" % msg)
+            raise bb.BBHandledException()
 
         @contextmanager
         def captured_output():
@@ -79,6 +82,7 @@ class TestMultiprocessLaunch(TestCase):
 
         d = bb.data_smart.DataSmart()
         bb.error = dummyerror
+        bb.fatal = dummyfatal
 
         # Assert the function returns the right results
         result = multiprocess_launch(testfunction, ["3", "4", "5", "6"], d, extraargs=(d,))
-- 
2.19.1


