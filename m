Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 601CC60557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:29 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lj1so10808057pab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=h6QqKBELvkOBgIhM8lhkyozNPLJzUysKLaAgdPNljUQ=;
	b=r3ob2m3Nqsk3GylySEkZX+jGQYy2Iv/fbdzbZl0FbLaazPAQNxldq79fvWjQvIOUPP
	WemSnlHMnkGX6LvlKj4DfwVIbQ8px5p72gfKvC0l4QGYu7IUBTb3Iqq/I398sPgvyt9w
	vyqJzVdnLI1fPaJskPe8wRglc8XoI8V5Bwfa61ziD8VJECIlC0+6Gp7A5fR62qSrJHQ0
	Q3FDCfBRQ/rB130g/ion7aSPEbFbd3Bd5y6juHa26b7V/gbor+muPA7/dvtZQxpaJVpT
	CrONGLBl/XHRoN9SDWX6CU4oLxBqdykA3wvshgBZpdUaMKH0F47eF/WnHo2bPIU6Y5Oy
	7zcw==
X-Received: by 10.68.130.101 with SMTP id od5mr6892965pbb.108.1423152271268;
	Thu, 05 Feb 2015 08:04:31 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:17 -0800
Message-Id: <be5696a72a6aff61ab1a542305f67ff1e87192b3.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 09/61] bitbake: bitbake-worker: Use setsid() rather than setpgid()
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:30 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The bug has a long discussion of this. Basically, in some environments,
the exact details of which aren't understood, a Ctrl+C signal to the
UI is being transmitted to all the process children. Looking at the output
of "ps ax -O tpgid", its clear the main process is still the terminal
owner of these processes.

stty -a on a problematic system shows: "-ignbrk brkint"
and on a working system shows: "-ignbrk -brkint"

The description of brkint would suggest this is the problem, setting up
that terminal environment wasn't able to reproduce the problem though.
It was confirmed that using setsid() caused the problem to be resolved
and is probably the right thing to be doing anyway, so lets do it.

[YOCTO #6949]

(Bitbake rev: 461aa73fff0ab616032d28c4fd0322eb88838be6)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 bitbake/bin/bitbake-worker | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/bitbake/bin/bitbake-worker b/bitbake/bin/bitbake-worker
index 371c99a..8a24161 100755
--- a/bitbake/bin/bitbake-worker
+++ b/bitbake/bin/bitbake-worker
@@ -156,8 +156,11 @@ def fork_off_task(cfg, data, workerdata, fn, task, taskname, appends, taskdepdat
             bb.event.worker_fire = worker_child_fire
             worker_pipe = pipeout
 
-            # Make the child the process group leader
-            os.setpgid(0, 0)
+            # Make the child the process group leader and ensure no
+            # child process will be controlled by the current terminal
+            # This ensures signals sent to the controlling terminal like Ctrl+C
+            # don't stop the child processes.
+            os.setsid()
             # No stdin
             newsi = os.open(os.devnull, os.O_RDWR)
             os.dup2(newsi, sys.stdin.fileno())
-- 
1.9.1


