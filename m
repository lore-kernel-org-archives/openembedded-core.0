Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 518907731D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:27:01 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id w20so139457518qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=ztBRnaeddmVvMhV0gLfvJbGXyawMwOI0ZflmIDAponE=;
	b=G9aog6QhwBujpb63rvvMc/KN31YMqBqagr9B5YTUev73PvCuLaaVAXsUQDu4po8iuF
	teDAOBPWqskrQjR5Sj+4mNF9P8iyZMpLeVsJqvyBMSIgZBl7tjMFWdHnXKf/WaX6fBw4
	DUGPmBlzAsCV6McZhCr4cXYoP2bxKLPh4/BubrAA+BKPM7Jr8zQz5vSG3103LlXUmxDy
	kN3CHcPbz/bZrfdxhAM7tzDrKfXqi4V6HgWPStVY7+0a/yQ73KieKNtgD3g8pt65xnft
	2bdJQy23YffIpgBeA8yTlz7zlIKgNrH5mluCXsllDe6Ty4Fr7M1eR+9Oge496KAcW7SN
	IU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ztBRnaeddmVvMhV0gLfvJbGXyawMwOI0ZflmIDAponE=;
	b=t6fqryqBN7KumFI0Ma8tEFTRvpybJpkJQ3sDJ+RSyoWkknx3uOeReR1WU7jWFkpUi8
	RrH4+J0XIoYi3VSWyHmogWlCmNsfghBA8G6fyLNTkuSyJWUTyapjjno51Fj5rLHuGUFu
	65xufuGIK0ULE1TYHzpNFGyFR5t0vUZl3pgy6/74eCgLxGrpzFG5i3ApFP3NvPpw+NRD
	1nr/7JOmzrNobFzRh9u7RnN3ebBlbD3msg/ToDO21ztNQ3rIxTke2Qa16T4GzfPR2bHH
	ah9ilgUZSYknHT2eRL9KFxZrCYUAAR2P6MVAI3Up4JFvZ94Nz67m6HLTPC30gQm46OAW
	5xhw==
X-Gm-Message-State: AIkVDXJnoFc9Ywzc5qK6pQZLb3iWk2Ermq7sAToYq+yOfYbTxDWdHuKZm1EivCrESe0HPA==
X-Received: by 10.200.54.40 with SMTP id m37mr20568689qtb.211.1485793621450;
	Mon, 30 Jan 2017 08:27:01 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	l20sm12662067qtc.5.2017.01.30.08.26.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jan 2017 08:27:00 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 14:27:00 -0200
Message-Id: <20170130162700.27969-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] libbsd: libbsd-overlay.pc: Set Cflags to use -I instead of -isystem
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
X-List-Received-Date: Mon, 30 Jan 2017 16:27:02 -0000

pkg-config currently only handles -I and -L correctly, but misses
-isystem, so we need to do this workaround to fix this issue.

There's a open bug in:
https://bugzilla.freedesktop.org/show_bug.cgi?id=99516

This appears when building lldpd and shows error:

ERROR: lldpd-0.9.6-r0 do_configure: This autoconf log indicates
errors, it looked at host include and/or library paths while
determining system capabilities.
Rerun configure task after fixing this.
ERROR: lldpd-0.9.6-r0 do_configure: Function failed: do_qa_configure

Change-Id: I83255b5952e19bb2f516b1186276cd03eb67eed3
Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...overlay.pc.in-Set-Cflags-to-use-I-instead.patch | 33 ++++++++++++++++++++++
 meta/recipes-support/libbsd/libbsd_0.8.3.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch

diff --git a/meta/recipes-support/libbsd/libbsd/0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch b/meta/recipes-support/libbsd/libbsd/0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch
new file mode 100644
index 0000000000..7e3a5b3be4
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd/0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch
@@ -0,0 +1,33 @@
+From b6972f1c29ebf073cbe19a4a669ee093259792a0 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Mon, 30 Jan 2017 12:00:33 -0200
+Subject: [PATCH] src/libbsd-overlay.pc.in: Set Cflags to use -I instead of
+ -isystem
+Organization: O.S. Systems Software LTDA.
+
+pkg-config currently only handles -I and -L correctly, but misses
+-isystem, so we need to do this workaround to fix this issue.
+
+There's a open bug in:
+https://bugzilla.freedesktop.org/show_bug.cgi?id=99516
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ src/libbsd-overlay.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libbsd-overlay.pc.in b/src/libbsd-overlay.pc.in
+index ac8bf89..65dc3ae 100644
+--- a/src/libbsd-overlay.pc.in
++++ b/src/libbsd-overlay.pc.in
+@@ -8,4 +8,4 @@ Description: Utility functions from BSD systems (overlay)
+ Version: @VERSION@
+ URL: https://libbsd.freedesktop.org/
+ Libs: -L${libdir} -lbsd
+-Cflags: -isystem ${includedir}/bsd -DLIBBSD_OVERLAY
++Cflags: -I${includedir}/bsd -DLIBBSD_OVERLAY
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/libbsd/libbsd_0.8.3.bb b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
index fadd7886a2..e85ee2153d 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.3.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
@@ -35,6 +35,7 @@ SECTION = "libs"
 
 SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+    file://0001-src-libbsd-overlay.pc.in-Set-Cflags-to-use-I-instead.patch \
 "
 SRC_URI_append_libc-musl  = " \
     file://0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch \
-- 
2.11.0


