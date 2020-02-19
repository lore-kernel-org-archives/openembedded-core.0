Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id CB14B613C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 18:38:18 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k11so1719125wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+SHZyMHnn4benNll0ld1GigEPVxLtO0EbQjDdPUxRRU=;
	b=afU75g+JJvFPsiFkJpD+pqz1JCOdaBCwmt/RyXe86dnZUrgPPvjyJtQA1qKJ3xDoeP
	dEPoM+hA0bkg8jBb2YAQy6KgKd5Ftewqns7LiZt89C8I2L7LjENtEpMm8/QHxE3gjaKC
	qJuKZWdOvs7QjcPQoc6NXhonUEKmzFrus55Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+SHZyMHnn4benNll0ld1GigEPVxLtO0EbQjDdPUxRRU=;
	b=FwKvEruS+QAy0opNuMkyw+PUap9l5KnRUyEiDONWcjlB0d5Ri7xYsq0AlatFxZ2MhT
	qua6VIXVkGwNojK3cyE9zwN0V1Ck7wUnd7dUo8LHC8g37AAtxeNMxIM/gruMY3lvsyOH
	Xl3W34uEnO8KbgmCA0po9WT5yV7sMMhWxcqy9lDwnZ2L4wtPAoFNn7olAi1fZwvq4dBN
	CCy9Pki0O2+VMGrORp7taOGeJb2/4njJjq2OmUjrmYorJSXFRPmUdg3BEzvkxTtwNoRb
	Q+eOfTH/e/9/xjWdD0QUWEv4bTZVSRhLh0BcTe/vNoZ20pyWy5Wz+8193HDp20Syd+Rg
	51uQ==
X-Gm-Message-State: APjAAAVPR4P6NQbw629EucH+3IyJlE2UDP1Ok/+5bjdkbhPruUFa6vZI
	wC4F/UxOYnodb0sHz1gPNV8VvD3vUPw=
X-Google-Smtp-Source: APXvYqxT90jNVDilTfZgDYbFpEpHZckomo/9MbybZrZzGaCjq+wNhUBuFNaj+cTFRBJyZeSLe0JMew==
X-Received: by 2002:adf:8442:: with SMTP id 60mr37920451wrf.416.1582137499174; 
	Wed, 19 Feb 2020 10:38:19 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b21sm856697wmd.37.2020.02.19.10.38.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 10:38:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 18:38:15 +0000
Message-Id: <20200219183817.130495-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/3] selftest/context: Avoid tracebacks from tests using multiprocessing
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
X-List-Received-Date: Wed, 19 Feb 2020 18:38:19 -0000
Content-Transfer-Encoding: 8bit

We can see tracebacks where the SIGTERM handler catches things
it shouldn't. Avoid exit(1) unless we're the process that
it was intended for.

[YOCTO #13664]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c4eb5d614eb..3d3b19c6e80 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -280,11 +280,15 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         return rc
 
     def _signal_clean_handler(self, signum, frame):
-        sys.exit(1)
+        if self.ourpid == os.getpid():
+            sys.exit(1)
     
     def run(self, logger, args):
         self._process_args(logger, args)
 
+        # Setup a SIGTERM handler to allow restoration of files like local.conf and bblayers.conf
+        # but don't interfer with other processes
+        self.ourpid = os.getpid()
         signal.signal(signal.SIGTERM, self._signal_clean_handler)
 
         rc = None
-- 
2.25.0


