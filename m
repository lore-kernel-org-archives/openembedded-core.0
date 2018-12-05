Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9657307F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 12:33:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y1so13010577wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 04:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YTRnEmRnmIbrKYcYaznjiPx2TSBkQNfpHCZo58jJuOY=;
	b=Nf3HmVrryzjqnrFXuhtfYrFZvFGvlQ75zIx6TCC43oMYzvwm5TI0HPEIJWTPKRkXkk
	Q5o8fRxpT7yloSkpSUy4sEKepp7NHhhAVIMMy1y5JB4NwjOuoCScEvHDUyLoGy0zuiz3
	YIYhSLFdnZ6htwzoAGuMCdijLIVHZTrUraOfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YTRnEmRnmIbrKYcYaznjiPx2TSBkQNfpHCZo58jJuOY=;
	b=NoVkgoj1jrmqG5alfxPMbkESruG23EUnbsvjvKqWlDzPVRgBXsJFPlB/oApdTUynCT
	4Fu3peBp0cGYEiLmisrG01bpBtE3ulHEqSJrH3FJCXcnWT10hBGGCb0u265jPFzmejpj
	N4hqMpnrAucuJo1Bsmla3dztW9hNoVtEdtss9y5lsnEDWqDVCsAn7wufGSuUVbzmI8Er
	NNubVwol6JxJxOoWnjkEt1tdDidyYn55gLgn0R9oyZFPat2revLTlJas7yEH/rb8OuFG
	kI/TJ3BRxO8eFrOp4f9rDwLNlFB/uHg4ep0imDksXslG3VSTtyGL+mT8j5mCKRfe9OsE
	Xmfg==
X-Gm-Message-State: AA+aEWbhkdW6a+tVGR/AMu8I3uwrcD9NRyunlXDO59hpTyXWHZGI+brg
	EvgpaeusYC1CaZIZPrAI1yFH91dUAaM=
X-Google-Smtp-Source: AFSGD/VDq8aAcBxYQVZtknFJI2xTOYVeI6xOiILJcnPWrj2ubPm6O9A9xBAx1G9KSEIF/M6FPgsLKQ==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr16026576wma.68.1544013203655; 
	Wed, 05 Dec 2018 04:33:23 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r77sm18048674wmd.22.2018.12.05.04.33.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 04:33:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2018 12:33:19 +0000
Message-Id: <20181205123319.10452-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181205123319.10452-1-richard.purdie@linuxfoundation.org>
References: <20181205123319.10452-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] oeqa/utils/qemurunner: Avoid tracebacks on closed files
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
X-List-Received-Date: Wed, 05 Dec 2018 12:33:23 -0000
Content-Transfer-Encoding: 8bit

Reorder the shutdown/teardown to avoid:

  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/qemurunner.py", line 224, in launch
    op = self.getOutput(output)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/qemurunner.py", line 90, in getOutput
    fl = fcntl.fcntl(o, fcntl.F_GETFL)
ValueError: I/O operation on closed file

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 409e86d4bcb..3a9ba024a98 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -207,8 +207,8 @@ class QemuRunner:
                     # No point waiting any longer
                     self.logger.debug('runqemu exited with code %d' % self.runqemu.returncode)
                     self._dump_host()
-                    self.stop()
                     self.logger.debug("Output from runqemu:\n%s" % self.getOutput(output))
+                    self.stop()
                     return False
             time.sleep(0.5)
 
@@ -220,8 +220,8 @@ class QemuRunner:
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
2.19.1


