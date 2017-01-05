Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id CCAF071AE6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:42 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id u143so3178777oif.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3Ay+64v6+HurquA4Z9gv/QCDtRlugrFMDMjbpn9CkkM=;
	b=AOlVsqqYQU6N2LsTJTHfkCXlakXATIGxJTxd91gR+uPlg4lCzPppoeC0/p4T/RO07X
	gNPQFGFS00n3yZYum8KXYRqmo4n2MhOb99kFeukeVjrBYxtOeUUzkbiazk9UjapLqfAd
	OKFNyqvVF4bLJ3+Ga3ZFcrB90rqmw5NkYaMfQpXGYnIEk7yGYxvFZmiGJFZ9npPa8Zss
	QdZiqnKoDPzamwajy6J1gE6GqObqL85VN/Iz/p5Q9PA3w9p7pj5dyidIYSavQIxmeAKO
	ZZYSzPymeLRV51vOZQMeE7X4mCqHkfhADGPeuuCvx5zpM/5UPGdRtRqCOmX5hzzVNXMX
	wM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3Ay+64v6+HurquA4Z9gv/QCDtRlugrFMDMjbpn9CkkM=;
	b=Zc2BBE49n2Ha7OMTx0D6fW8NhZvIeslxtYXj0A5rnzkOWVc0iOEif6duml5i0IglLy
	qO1gSv00U6RB39+iq5SyUDsuu3NDtH+lOC7fH8EhHUmIxmX9H6qgS+XMzsVKuKYROPyu
	R52Pn4b1betBbuV5+i+//MeWujZLBfmICxW7Ff8K9AAt64D/otqRAKZT7xKs61NJeKuU
	MNIWxM22cKIlCMhTzeP/il1XNQE75ypk2O5ysnqYMeZ4aItyXmQ/DfnSy+1vAH48Zo43
	4PBHKH2dkKf6g+Hd7HulILBa4Shxv7/KVesaH9KbVHRJr2k1zfFwF2DkkxDkxkeFh8WR
	G2Jw==
X-Gm-Message-State: AIkVDXILotsXINnea8ncnDfbwV64zFC4HBFqG4k+UoPXtS07Ix4dZxyIFp6CCwf2fLYKdQ==
X-Received: by 10.202.80.149 with SMTP id e143mr31196473oib.93.1483645603003; 
	Thu, 05 Jan 2017 11:46:43 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:41 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:20 -0700
Message-Id: <c78c3af4956740f2d7874c9ec1336d1995a2462d.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 08/16] ltp: fix build for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:44 -0000

From: Christopher Larson <chris_larson@mentor.com>

We need to use the correct time() definition with time_t rather than a long,
since long is 32-bit on x32.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../ltp/fcntl-fix-the-time-def-to-use-time_t.patch | 28 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch

diff --git a/meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch b/meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch
new file mode 100644
index 0000000..f7e805a
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch
@@ -0,0 +1,28 @@
+From 9590d073d3abe02fe0783ef8c530aef2e873ba9b Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 12:48:29 -0700
+Subject: [PATCH] fcntl: fix the time() def to use time_t
+
+This fixes the build on X32, where long is 32-bit rather than 64-bit.
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ testcases/kernel/syscalls/fcntl/fcntl14.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl14.c b/testcases/kernel/syscalls/fcntl/fcntl14.c
+index 3b36572..65ac8fa 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl14.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl14.c
+@@ -789,7 +789,7 @@ void dochild(void)
+ 
+ void run_test(int file_flag, int file_mode, int seek, int start, int end)
+ {
+-	extern long time();
++	extern time_t time();
+ 
+ 	/* reset fail to 0 for each run_test call */
+ 	fail = 0;
+-- 
+2.8.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 6e2ceac..72d465b 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -65,6 +65,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0037-containers-netns_netlink-Avoid-segmentation-fault.patch \
            file://0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch \
+           file://fcntl-fix-the-time-def-to-use-time_t.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.0


