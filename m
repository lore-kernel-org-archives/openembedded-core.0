Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0258671A36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:19 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a14so1654850plm.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6l3IklyZ9EpYlcL1pbB+Iz1lY2cqeWV3GRtlc8v0TrQ=;
	b=ZOwLqUNJqTj1a0ayXL1fMXqPXCqSy7aV2F/YPMK0VCoDLd08EcyGmMjcODv92+/QrJ
	Qn5gyfmfFBh2ic4cf7MgxlPrmkeZpm3qcw0mi3FRD0FsdcCDUJd+wzh/3lMx/McdO1G4
	pUdS0TBAWywD8EYTF/vepGg6Vv0EwfIBSak+Jl/QTksJJaSKilzCF4mTvmg8DaYZWOJA
	bRN2VN0SJyo3AlpqVGHS+QT0W3MuOHgBnTthbsF+DJeWUktmLV0fFjQYt64w+bqYKlhR
	LPPDW/X62DB1poimKunY3wEeT8aoe089JvoZnumj1kDubH03Hj+xZtVheET/MP8fn4lM
	Y8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6l3IklyZ9EpYlcL1pbB+Iz1lY2cqeWV3GRtlc8v0TrQ=;
	b=roxC1+QNO1aRlaU31HVhiCc4iWddah66/rXPV/4BgNPrBpIvMsNHMFKaG1erOhToK5
	WIepqm6DBN4lPJH24x2qynFxiPeYriNlVu9VGbAuh54Rk5boPowG+i/gjTFLhPXzRRI/
	QDPkXYQ6p4q294NjvK/TO0VnMsiimQ24Mr7UI5gpcQoJIfCMb2KJ+L4HE1UlenuMRIOS
	6hX6+63KW3TZZ3oQC8PAfRovzJfFMn3o0vyWlnQhZ6s8AE7U4grUXf6S4uajeVHaLcpS
	y6ud/7ArqBkkp5QCXBzyPQjc2J6tGKv4TOSVAyMWr08oar1lcr9lgFhtfGNeo6b5sYeP
	f7pw==
X-Gm-Message-State: AA+aEWZFUVE3C9pDP1fWnkgP+ybDYMUImyTMg69Uz9WmidJONm1ZLjzp
	mO3X2yt76hpRBwctS+Eq3Wi1qxOd
X-Google-Smtp-Source: AFSGD/UGYda6J97e2VhQp4e3bpMHjggUXYWijfce4MMouKO2ZppzjD7b7rKf5jufKS8zhMQWICDCfg==
X-Received: by 2002:a17:902:4324:: with SMTP id
	i33mr402941pld.227.1544737160984; 
	Thu, 13 Dec 2018 13:39:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:25 -0800
Message-Id: <e614aa3cf4b7b452c6bf336838ad309d1c7d9af0.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 17/45] oeqa/utils/qemurunner: Avoid tracebacks on closed files
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Reorder the shutdown/teardown to avoid:

  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/qemurunner.py", line 224, in launch
    op = self.getOutput(output)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/qemurunner.py", line 90, in getOutput
    fl = fcntl.fcntl(o, fcntl.F_GETFL)
ValueError: I/O operation on closed file

(From OE-Core rev: 8e7d756862d2a8d62f3c87497d6d65ddb3c1b962)

(From OE-Core rev: 48979ffbe25351f92179021a973207a71bbe7a4e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0f1c5a5..4f6f1d0 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -203,8 +203,8 @@ class QemuRunner:
                     # No point waiting any longer
                     self.logger.debug('runqemu exited with code %d' % self.runqemu.returncode)
                     self._dump_host()
-                    self.stop()
                     self.logger.debug("Output from runqemu:\n%s" % self.getOutput(output))
+                    self.stop()
                     return False
             time.sleep(0.5)
 
@@ -216,8 +216,8 @@ class QemuRunner:
             processes = ps.decode("utf-8")
             self.logger.debug("Running processes:\n%s" % processes)
             self._dump_host()
-            self.stop()
             op = self.getOutput(output)
+            self.stop()
             if op:
                 self.logger.error("Output from runqemu:\n%s" % op)
             else:
-- 
2.7.4


