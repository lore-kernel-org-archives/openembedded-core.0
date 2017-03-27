Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id ED04572FE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:03:42 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id e75so19842812itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BpQaXcv1jabj6geRL5oOPdfNr51d4a/yr9tvK+MuOB8=;
	b=n5VdZVosFluSHg/cCRV6k7S7PXIwawnQH5O6KbnQTFQW4z8iGwu/6BIgTFtR3CxPTx
	eGog4Q5/h703CFPiRK8aTxExBv+EYuoU/+Nm6sXsTaR/HxKCARwUxpugRvXoCX/sFoAL
	N0UOS+RyG8iOGQE7MDGLCHlbC0ieF9DKtId2AO4tSsrvHi4ZQnwZel5+3VAuXAaUp7/4
	UahQoZDeiwTcNAtSXumd1zGqRW5su/tCm+Mx17xxQEP7hui2iUiS/dSp+ooSmfFNEMSq
	p5RGn1eD9zl1EeE0TJ5qGVQvdKM8l5OXqudVJDQcf8qVt2C0qbiil/wDrNGAHw7/XpHt
	645A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BpQaXcv1jabj6geRL5oOPdfNr51d4a/yr9tvK+MuOB8=;
	b=iw92aBGEUDi09aZPtMdsOlpb1mm4nB2Uk4TL3RmTIfmmGKAvFuHNV6BIMcpISAvfOt
	XI4yIOWQd4vCwvP2vX/RFzPrthYU06gYBgOWEi0h6ucTx0K+CG15jVoU+B4hFBdSFoGY
	MlejTsLZYWpfOoiqhsc5rQe574ciL5/ncZfwW6gwdrz4ls1V4kzHaIDxI3QHZDapxeNs
	SFY45xM8htUgsPJ5NeqPS5Z6EY3U4cio1jw/Yc8OwqTy5PByI6j1MFs9bolmVWytKljc
	75Tvt5a+qkEbiOfxGZtJqZmvsheWC8kS4Oxx+RB6siQ413GRY0j34HPKoFUPZvyDa8n5
	X4kg==
X-Gm-Message-State: AFeK/H04bTWLcPsASfQe7AunWyQ2LPbZl6ImPmRFGsIbX96pJNVHAooA6bJWQGu+7e41iqZi
X-Received: by 10.107.172.134 with SMTP id v128mr23430103ioe.49.1490619811226; 
	Mon, 27 Mar 2017 06:03:31 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181]) by smtp.gmail.com with ESMTPSA id
	y203sm217251iod.11.2017.03.27.06.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 06:03:30 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 15:03:22 +0200
Message-Id: <9336db5b8ce1f383a0e22b9bec99755a3a8c6e93.1490619742.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.4189796e0dbea7cfc888587157135c9fb8477ab8.1490619742.git-series.patrick.ohly@intel.com>
References: <cover.4189796e0dbea7cfc888587157135c9fb8477ab8.1490619742.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] oeqa: tolerate interrupted select() while waiting for qemu
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
X-List-Received-Date: Mon, 27 Mar 2017 13:03:43 -0000

Sometimes, the OEQA utility code aborts with:

   ...
   File ".../meta/lib/oeqa/utils/qemurunner.py", line 131, in start
     return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams)
   File ".../meta/lib/oeqa/utils/qemurunner.py", line 259, in launch
     sread, swrite, serror = select.select(socklist, [], [], 5)
  InterruptedError: [Errno 4] Interrupted system call

strace shows that this is because of a SIGWINCH:

   Connection from 127.0.0.1:52668
   select(21, [20], [], [], {5, 0})        = ? ERESTARTNOHAND (To be restarted if no handler)
   --- SIGWINCH {si_signo=SIGWINCH, si_code=SI_KERNEL} ---

This is related to some special conditions:
 * whether qemu opens a graphical console window (enabled in Poky by default)
 * where that window gets opened
 * whether the window manager changes the size of the shell window (mine
   is a tiling window manager and reorders and resizes windows automatically)

Ignoring the interrupted system calls avoids the problem. Code elsewhere (for example,
run() in ssh.py) already does the same thing.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py     | 10 ++++++++--
 meta/lib/oeqa/utils/qemutinyrunner.py |  5 ++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cd79f21..ba44b96 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -256,7 +256,10 @@ class QemuRunner:
             bootlog = ''
             data = b''
             while time.time() < endtime and not stopread:
-                sread, swrite, serror = select.select(socklist, [], [], 5)
+                try:
+                    sread, swrite, serror = select.select(socklist, [], [], 5)
+                except InterruptedError:
+                    continue
                 for sock in sread:
                     if sock is self.server_socket:
                         qemusock, addr = self.server_socket.accept()
@@ -437,7 +440,10 @@ class QemuRunner:
             if now >= end:
                 data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
                 break
-            sread, _, _ = select.select([self.server_socket],[],[], end - now)
+            try:
+                sread, _, _ = select.select([self.server_socket],[],[], end - now)
+            except InterruptedError:
+                continue
             if sread:
                 answer = self.server_socket.recv(1024)
                 if answer:
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index b1009a0..df5f9dd 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -114,7 +114,10 @@ class QemuTinyRunner(QemuRunner):
         stopread = False
         endtime = time.time()+timeout
         while time.time()<endtime and not stopread:
-                sread, _, _ = select.select([self.server_socket],[],[],1)
+                try:
+                        sread, _, _ = select.select([self.server_socket],[],[],1)
+                except InterruptedError:
+                        continue
                 for sock in sread:
                         answer = sock.recv(1024)
                         if answer:
-- 
git-series 0.9.1

