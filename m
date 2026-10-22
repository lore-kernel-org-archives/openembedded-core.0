Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2362.1792709343926508290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RX5cx5jn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026102222490295e88cb23d000207fb-rpc1wk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026102222490295e88cb23d000207fb
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:49:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=XAw7Gv3GbpODWFXSo+hl/13YFBSx2+RpjTpCQxjfMbI=;
 b=RX5cx5jnZIsdI0dbipzkkNepufOqkz+FWoEN3X9VZCPC63XnwAImYW8vfs8xOJdaePlUDp
 8Dz9Xo5gq1Yc4faH/H+JgiOtZOwQ3qs4Fh8CFbP9MeALsYKObA5AWBh3oC/adjMdjWKhrsUh
 X6BCk1esu+w+24tXK2VmtdSKYsGu3avivp/LpehkeXmqpQIazqmH52jNPvWbpvZ/QD9dosBn
 7c1Tbwo9v4AvazD/VwoRXoVmTEIdYstLQ5RgU31JHRuxyb7z2QJ6tVXHwP+mXZCG98UlQ/on
 Y9DauPIPpo3M9HuZcqOtZBQBiffyzMHJlUDF9euSnWrEWqhNY5gNXesQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 15/15] glibc: stable 2.39 branch updates to b7a0de2c8f
Date: Fri, 23 Oct 2026 00:47:08 +0200
Message-ID: <20261022224711.3783258-15-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248470
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.44/master branch. This branch does not seem to receive
security fixes anymore, but still got two new commits during last
months.

Commits between the old SRCREV (be1e627cd7) and the new SRCREV (b7a0de2c8f):

b7a0de2c8f powerpc: Fix off-by-one in AT_HWCAP4 loop in _dl_procinfo
d9eaad3515 rtld: cache cpuid results on the stack for intel

Testing Results:
(note that the comparison is done against yocto-20.0.21, so includes
testing of last 14 CVE patches)

+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 4933   | 4941   | +8   |
| FAIL         | 221    | 223    | +2   |
| XFAIL        | 16     | 16     |  0   |
| XPASS        | 4      | 4      |  0   |
| UNSUPPORTED  | 227    | 227    |  0   |
+--------------+--------+--------+------+

Changes in testcases:                   Before  After  Source
(no change in already existing tests, flaky test filtered by 3 runs)
elf/tst-dl-path-normalize                ---    PASS   CVE-2026-86805/CVE-2026-95818
elf/tst-tunables-enable_secure           ---    PASS   CVE-2026-86805/CVE-2026-95818 test harness
iconvdata/tst-jisx0213-progress          ---    PASS   CVE-2026-77117/CVE-2026-80489
libio/bug-wgenops-bz33998.test-result    ---    PASS   CVE-2026-5928
libio/tst-fopen-ccs-empty                ---    PASS   CVE-2026-18374
posix/tst-wordexp-append                 ---    PASS   CVE-2026-6368
stdio-common/tst-vfscanf-bz34008         ---    PASS   CVE-2026-5450
stdlib/tst-strfmon-bug34510              ---    PASS   CVE-2026-19499
elf/tst-origin-secure                    ---    FAIL   CVE-2026-86805/CVE-2026-95818
posix/tst-wordexp-tilde                  ---    FAIL   CVE-2026-6791

The two new tests which do not pass when running glibc-testsuite will
pass under following conditions:
* FAIL -> UNSUPPORTED: removing patch 0022 fixes these tests
  this fixes 41 FAIL -> 6 PASS + 35 UNSUPPORTED and can be sent as
  separate patch if requested
  see OE-Core rev: 5eb80f3c562f6e395562c52df67fab60ae0ff32b
* UNSUPPORTED -> PASS: running natively
  qemu-user doesn't support the call test-container makes to create its
  isolated environment (unshare(CLONE_NEWUSER))
  running natively is possible when target arch equals to host arch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 5d57dafed0a..1f4f372c13b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "be1e627cd72db31161a3b4ce1c8114674f0895eb"
+SRCREV_glibc ?= "b7a0de2c8f68722cfdfc735b8358a3a6559ec0eb"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
