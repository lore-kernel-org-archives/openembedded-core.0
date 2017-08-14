Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7B61C77BF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 10:27:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7EARImi025632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 Aug 2017 11:27:20 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dhCac-0001PR-Un; Mon, 14 Aug 2017 11:27:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 11:27:15 +0100
Message-Id: <1502706437-5377-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 14 Aug 2017 11:27:20 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/3] site/ix86-common: Drop ac_cv_sizeof_ino_t as it can be incorrect with large file support
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
X-List-Received-Date: Mon, 14 Aug 2017 10:27:20 -0000

Depending on whether large file support is enabled, the size of ino_t can
be 4 or 8 on 32 bit x86. Drop the value from the site cache and allow the
system to vary it depending on configuration. Very few other arches actually set
this so its likely obsolete and doesn't need to be hardcoded anymore.

Also drop the 64 bit and x32 variants since autodetection of this value appears
to work fine and this avoids any confusion or sizing errors depending on large
file support.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/site/ix86-common  | 1 -
 meta/site/x32-linux    | 1 -
 meta/site/x86_64-linux | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index f4cf0b8..4fbf58c 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -19,7 +19,6 @@ ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
 ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
 ac_cv_sizeof_uid_t=${ac_cv_sizeof_uid_t=4}
 ac_cv_sizeof_gid_t=${ac_cv_sizeof_gid_t=4}
-ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=4}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
diff --git a/meta/site/x32-linux b/meta/site/x32-linux
index 308d6e2..4b70422 100644
--- a/meta/site/x32-linux
+++ b/meta/site/x32-linux
@@ -1,6 +1,5 @@
 # general
 ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
-ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=8}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
 ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
 ac_cv_alignof_double=8
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index ebdcf69..778e2c5 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -24,7 +24,6 @@ ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
 ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=8}
 ac_cv_sizeof_uid_t=${ac_cv_sizeof_uid_t=4}
 ac_cv_sizeof_gid_t=${ac_cv_sizeof_gid_t=4}
-ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=8}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
 ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-- 
2.7.4


