Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 77CB2731AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:20 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q63so146455002pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QU7281lhoBO+qDlSTViMEuU8SvYF96B6/H2CLOPTkl4=;
	b=Fg/4lJ+1kesnh79dMkP60+zNBvK9KzUKfPh1eOKyvisHUxj2GJa2lWphxjFPkrFLTu
	uK5TN4n0xb+9H2FtXp7MbtA3tE0ZzVwhOqfQjYnZUOvB12waNEglM3xz3wf0ux1OxDBf
	PVANkcUDCNM49SZFQxYvXcRPjMZ8rlodaJko0cvztxZfSQb1XnlXZntPvl76K5lEcArE
	+LN701geaud4gPLZPk5edzCHbuJt5DpZ47OztplHX7VaD/EpJ6cNcUc9nQ7yFgP98M/9
	XcheDwKlbxPXydKvsPf+CyDsbSl8gE19JNt1n/0aU8cv1U4IPC074a5YzYII7zQHHZ95
	tAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=QU7281lhoBO+qDlSTViMEuU8SvYF96B6/H2CLOPTkl4=;
	b=nBhtF0EITS6u5kVOBTxNxM7IMaBlrffIShbQsngAt4mXOIeBSjuZKvNSp0rGUlOBq6
	gSNtUrc4Q6rl53DEQKKE/dqGy9ZhRPjEiu67D1RAqXJZYei5+5TtGhmlp3fJIGl8N5xH
	Wj8N0uMhfNjdEQ8uGqDTLHOJ93GsFEFPBctAtyqclH5H1DihWQvQAovHfU2nglSsd2UZ
	lFdyW4eo41NEKpTsh2ZnaSuyPJlJiHpw9J5n6Hl06cHRNA4bX8VuSA4QL4xNWKC8xysm
	UphaUIU0zJrqWBKQeWJJU21RdNjvRWUW7QCq/EtrCQ/6VEmfcN9lXVdSSCI29me7IM3d
	CCCg==
X-Gm-Message-State: ALoCoQldZN4pq+FnuEAfMUMGSo9ZYjRJd3mrdShVvNwhlzJHzEVuFH50d98/oi+mqONmYGhrpACAQwFIb2/BHOzUEpqoqlt0Ww==
X-Received: by 10.98.9.220 with SMTP id 89mr28576597pfj.17.1453030638991;
	Sun, 17 Jan 2016 03:37:18 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:53 -0800
Message-Id: <9d21dbc1ab71876c15f4d7e649ee4377c96355e8.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 20/73] parted: Fix build with uclibc
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:20 -0000

unlike glibc, uclibc does not have internal APIs implemented for
libiconv, so it needs to depend upon libiconv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/parted/parted_3.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index ff8ae09..30c00c8 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
-DEPENDS = "ncurses readline util-linux"
+DEPENDS = "ncurses readline util-linux virtual/libiconv"
 PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
@@ -21,6 +21,7 @@ SRC_URI[md5sum] = "0247b6a7b314f8edeb618159fa95f9cb"
 SRC_URI[sha256sum] = "858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4"
 
 EXTRA_OECONF = "--disable-device-mapper"
+LDFLAGS_append_libc-uclibc = " -liconv "
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-- 
2.7.0


