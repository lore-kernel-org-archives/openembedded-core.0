Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC0ACED604
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.9229.1728452977818848407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=prLq+l0g;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452979; x=1759988979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Kd+c63FenVIHM02UYHMgNy4rhipbKCJwyAKqEIlOr1k=;
  b=prLq+l0g6PasDJedb0lXfd8XNEDTy65FyLZfR55oJv282HQDotkXcXkn
   basbYOnjQkDpm7FmGTQKMBohUy/mf/3pyxEon6SA5hQNC/SSVbkSbKWUn
   yVka1K0w9aJL0o7RKa+aqaNDwMQFuyi7uyZGibj+T2eYMe0kfZaeaKnK1
   hGsWBTr8kaUHvc3SB5Tlr0Ja4rQseHCx98U9HIiLA4eCuOeJjaLwAewdU
   ReUyfpzvaXjdNBRWh40s+yo0MKN4BKcJgm0Qv9L77RNYNV9CV3HrLCc9C
   igiW51t/0B/ZdGqfy0uo46Ca0+9Qx0PNO83FwRiHXeG4O4xxaaKn1fs9O
   A==;
X-CSE-ConnectionGUID: trPvYgoOTfqOxg1PJyA2Uw==
X-CSE-MsgGUID: x69U5jrSQhKk/LKf/mRLJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="155133478"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="155133478"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:37 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 90F50DB3C2
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7B90D9748
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6763E2007AA9F
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 131E61A000A;
	Wed,  9 Oct 2024 13:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/26] libuv: upgrade 1.48.0 -> 1.49.0
Date: Wed,  9 Oct 2024 13:48:59 +0800
Message-Id: <1728452955-25051-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--8.323400-10.000000
X-TMASE-MatchedRID: 6PNPrMbrkhSjz0nOeth/yXzmmMD/HXF+a9qiaDSLgo14YeSlHZYFolhM
	X/mq5pIvIJcLfZeUug+RoepQgi+s8kCwax7Kf3TznJ5tL+LbGOO6hgVvSdGKo6e5eq8TDqhwkVP
	duqUkU5atWpOMHa12vl1/2hvXh9OKRvd/dZHVDcmVd49c0zgWM9q1p6neH75UsMZG2pUzAfN5OB
	WjN0oinjP7mgZhtfHtyVVi40omcW7/on44+biJPBHdIZ6edcbrsBSA1tuZVSbhA4WtAM986RR5a
	+OvvOq9Rzc2gIdmzpAhMsbW3HSkzFqzeP+fKaZieXXhejkivZcpA2ExuipmWv/+izUVq/7GKpi9
	XFTnNcAv1NZ3CSB0aUxu9cRiGydKk6cJ+nF8ms7TCZHfjFFBz2Iw13TP8dlTatCpvVFEynroFKy
	gcaLrBUGcVFfDCDkwMTii0wFdgxpp5GkIQCcEIaroI6f8dzsJTGFQWCtl6cpWMCdm0AKkdn3Yvt
	P37IU4raob308tFzf9aekO9PHoiToGIAjujgJmA9lly13c/gE3l2plwgrtWCD1HdXyqDnEvwUev
	Dt+uW5tMXimGWsZZAYUFsN5WfiFGVy5wYhj/XhoMLOoNHsM9p3ZbPRfc5otmyiLZetSf8mfop0y
	tGwvXiq2rl3dzGQ1sS/MVWpzisMIFbUlLBo4bhPhMvT8ZrAHbCAATZq1ulmty6tQDGrxeg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205320

From: Wang Mingyu <wangmy@fujitsu.com>

Changes since version 1.48.0:
==============================
* test: fix -Wpointer-to-int-cast on 32 bits systems
* build: add alias for libuv to CMakeLists.txt
* linux: create io_uring sqpoll ring lazily
* misc: run sample CI when code changes
* linux: fix uv_available_parallelism using cgroup
* doc: fix tty example segfault
* udp,unix: fix sendmsg use-after-free
* cygwin: implement uv_resident_set_memory
* win: almost fix race detecting ESRCH in uv_kill
* test: disable env var test under win32+asan
* unix,fs: fix realpath calls that use the system allocator
* linux: fix /proc/self/stat executable name parsing
* test,ci: fix [AM]San, disable ASLR
* win: remove _alloca usage
* unix: reinstate preadv/pwritev fallback code
* linux: don't delay EPOLL_CTL_DEL operations
* doc: fix typos in ChangeLog
* unix,win: error on zero delay tcp keepalive
* win: simplify uv_once implementation
* doc: correct udp socket options documentation
* linux: don't use sendmmsg() for single datagrams
* unix: fix fd leaks in SCM_RIGHTS error path
* win: robustify uv_os_getenv() error checking
* test: use newer ASSERT_MEM_EQ macro
* unix: de-duplicate conditions for using kqueue
* darwin: simplify uv_hrtime
* mailmap: update saghul's main email address
* win: remove no longer needed define
* doc: fix some typos
* linux,darwin: make `uv_fs_copyfile` behaves like `cp -r`
* dragonfly: disable SO_REUSEPORT for UDP socket bindings
* test: remove the obsolete HAVE_KQUEUE macro
* unix: use the presence of SOCK_* instead of OS macros for socketpair
* bsd: support pipe2() on *BSD
* unix: support SO_REUSEPORT with load balancing for TCP
* doc: add entries for extended getpw
* test: fix the flaky test-tcp-reuseport
* aix,ibmi: fix compilation errors in fs_copyfile
* unix: support SO_REUSEPORT with load balancing for UDP
* tcpkeepalive: distinguish OS versions and use proper time units
* win: map ERROR_BAD_EXE_FORMAT to UV_EFTYPE
* doc: add instruction how to install with Conan
* unix,win: remove unused req parameter from macros
* build: fix android ci build
* unix,win: export wtf8 functions properly
* hurd: add includes and macro prerequisites
* hurd: stub uv_thread_setpriority()
* ci: use macOS 12 for macOS and iOS builds
* darwin: fix crash on iOS(arm64)
* Create dependabot.yml for updating github-actions
* doc: correct names of Win32 APIs in fs.rst
* ci: bump upload and download-artifact versions
* ci: bump actions/setup-python from 4 to 5
* ci: bump KyleMayes/install-llvm-action from 1 to 2
* win,error: remap ERROR_NO_DATA to EAGAIN
* test: handle zero-length udp datagram
* misc: remove splay trees macros
* test,openbsd: remove superfluous ifdef guard
* win,fs: use posix delete semantics, if supported
* win: fix env var in uv_os_homedir and uv_os_tmpdir
* fsevents: detect watched directory removal
* ci: bump actions/checkout to 4
* linux: eliminate a read on eventfd per wakeup
* test: pipe_overlong_path handle ENAMETOOLONG
* win,fs: use the new Windows fast stat API
* win,pipe: fix race with concurrent readers
* win,signal: fix data race dispatching SIGWINCH
* build: ubsan fixes
* linux: disable SQPOLL io_uring by default
* win: fix fs.c ubsan failure
* test: rmdir can return `EEXIST` or `ENOTEMPTY`
* test: check for `UV_CHANGE` or `UV_RENAME` event
* unix,fs: silence -Wunused-result warning
* linux: support abstract unix socket autobinding
* kqueue: use EVFILT_USER for async if available
* win: remove deprecated GetVersionExW call
* doc: document uv_loop_option
* doc: fix the `uv_*_set_data` series of functions
* doc: properly label enumerations and types
* doc: document specific macOS fs_event behavior
* win,pipe: restore fallback handling for blocking pipes
* unix,win: remove unused rb-tree macro parameters
* win: compute parallelism from process cpu affinity
* win: use NtQueryInformationProcess in uv_os_getppid
* win,pipe: fix missing assignment to success
* win: fix uv_available_parallelism on win32
* win,pipe: fix another missing assignment to success
* kqueue: disallow ill-suited file descriptor kinds
* unix: restore tty attributes on handle close
* test: delete test with invalid assumption
* dragonflybsd: fix compilation failure
* test: run android tests on ci
* darwin: add udp mmsg support
* unix: work around arm-linux-gnueabihf-gcc bug
* unix: expand uv_available_parallelism() to support more platforms
* doc: add known issue in armv7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.48.0.bb => libuv_1.49.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.48.0.bb => libuv_1.49.0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.48.0.bb b/meta/recipes-connectivity/libuv/libuv_1.49.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.48.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.49.0.bb
index 87a2c22a7c..1dd73f2f8c 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.48.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.49.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "e9f29cb984231524e3931aa0ae2c5dae1a32884e"
+SRCREV = "d2e56a5e8d3e39947b78405ca6e4727c70f5568a"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


