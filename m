Return-Path: <stefan@agner.ch>
X-Greylist: delayed 370 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Jan 2019 12:37:27 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E6E4B6D749
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 12:37:27 +0000 (UTC)
Received: from trochilidae.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 5F4425C0843;
	Tue, 15 Jan 2019 13:31:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547555477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=IWh+SeoPnaM+gtjEXCAe8uzcdqOSQknIrjLZ6jgkUEQ=;
	b=NjNoryaryT8KRlHPwY44pk70sZK4rQNtdg0zHgxUcjtdz+5xdWDfn5Z91nD4rkbzpYbO8h
	y5WlV8f8+J4zYLHgms9HR4jvoG1wQ6JfYoY9dpni9TtRdJx/HV946qe4r1Nx26cjoy10oJ
	SV9xIZET/fbQuoPm+eLwcrFFw78MONM=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org,
	seebs@seebs.net
Date: Tue, 15 Jan 2019 13:31:13 +0100
Message-Id: <20190115123113.23071-1-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] Handle OFD lock flags
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
X-List-Received-Date: Tue, 15 Jan 2019 12:37:28 -0000
Content-Transfer-Encoding: 8bit

Linux 3.15 and newer introduced new open file description locks.
Currently pseudo prints a warning if fcntl is used with OFD locks:
  unknown fcntl argument 37, assuming long argument.

However, calls to fcntl with a OFC lock set need a struct flock
pointer. Treat F_OFD_GETLK (and friends) like F_GETLK (and friends).

This issue has been observed with ostree. Comparing strace output
between two runs with/without this patch shows the same fcntl calls,
hence it seems not to matter in practice.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Hi,

I noticed this when using meta-updater which uses ostree to commit
the root file system. We observe this warnings on every build, but
the last error message only rather seldom:

...
unknown fcntl argument 37, assuming long argument.
unknown fcntl argument 37, assuming long argument.
unknown fcntl argument 37, assuming long argument.
error: Locking repo exclusive failed: Resource temporarily unavailable

Looking at a strace it seems that with pseudo in place the fcntl
seems to pass the argument properly nontheless:
fcntl(7, F_OFD_SETLK, {l_type=F_WRLCK, l_whence=SEEK_SET, l_start=0, l_len=0}) = 0
fcntl(7, F_OFD_SETLK, {l_type=F_UNLCK, l_whence=SEEK_SET, l_start=0, l_len=0}) = 0

So this effectively just gets rid of the warnings.

--
Stefan

 ports/linux/guts/fcntl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
index 639fd24..3991e25 100644
--- a/ports/linux/guts/fcntl.c
+++ b/ports/linux/guts/fcntl.c
@@ -50,6 +50,9 @@
 	case F_GETLK:
 	case F_SETLK:
 	case F_SETLKW:
+	case F_OFD_GETLK:
+	case F_OFD_SETLK:
+	case F_OFD_SETLKW:
 		rc = real_fcntl(fd, cmd, lock);
 		break;
 #if defined(F_GETLK64) && (F_GETLK64 != F_GETLK)
-- 
2.20.1


