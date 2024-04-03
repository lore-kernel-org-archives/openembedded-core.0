Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4289DCD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 07:02:55 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.5478.1712127766051483965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=XGneR4/j;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Ht3AJQqzdKzjYhzAAKH6rXnGVdY2CbBglo484alqiUo=; b=XGneR4/j1GRBqqgUJxdBtS6zOc
	wh0HSdXSz9BEFP3P0vCpFcpzx7PFpJmlFIpJUq7l6w1k8kMkQeFWymQKV+oz6eihtOFXeVFt3N9Uu
	be/lVXPJb9Pum9mEP9wO2zGqtekMbKGUcq/yTehTJV2xyI+gtB2mn2EGxZzrKK91Tv/4vXUU5Mvc/
	oaQxpXvoh3xksNDzXo5Yk1KTOIB3GoBdg9GzQlCAJA5vrKyRSc88lzL/dyfsTTh9EZ7G/mHeooniK
	l1N2QsrU0emn61th3bsB6ABjWVtaTd+VOoEM3+yStswpsrGgLYNknI25AqR7xvxrLqXYF3RIRj+PK
	cViZSx2Q==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rrudu-0007UO-6Q; Wed, 03 Apr 2024 09:02:42 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rrudu-000NUU-1j;
	Wed, 03 Apr 2024 09:02:41 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 0/5] Jobserver support
Date: Wed,  3 Apr 2024 09:01:59 +0200
Message-ID: <20240403070204.367470-1-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27233/Tue Apr  2 10:26:21 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 07:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197905

The parallelism of bitbake easily uses every available core on the build
host. But since every task is run with the same number of parallel
threads/processes, multiple tasks might load the CPU excessively, which
in turn slows down the build due to scheduling overhead.

This patch series adds a class that creates a fifo filled with
PARALLEL_MAKE tokens. The path to the created fifo is then configured in
the MAKEFLAGS environment variable, which is read by make and a patched
ninja (and gcc if doing lto).

The benefits from using the jobserver depends on the set of executed
tasks: running multiple large do_compile tasks simultaneously benefits
more than multiple do_fetch tasks. A simple test building the following
tasks (and all their dependencies) yields a ~5% improvement in build
time (20:20 -> 19:20):

  nodejs-native
  rust-llvm-native
  rust-native
  linux-yocto
  qemu-native

On build machines shared by multiple users, a single jobserver can be
shared between multiple builds (using the JOBSERVER_FIFO variable).
Running the above build in two different build directories at the same
time gives a ~12% improvement (43:17 -> 37:55).

Finally, the memory pressure from e.g. compiling multiple c++ based
projects is also reduced. In our case, a cloud based build machine (with
32 cores and 32GB RAM) fails to compile llvm-rust-native (in parallel to
nodejs) without the jobserver due to a lack of memory.

This patch set is roughly based on previous work by Richard[1]. That
patch lists three TODO items, which are all addressed by these patches:
 * The fifo path defaults to TMPDIR/jobserver_fifo, but can be
   configured using JOBSERVER_FIFO.
 * The number of make threads defaults to the value from PARALLEL_MAKE
   (which is then redundant).
 * If PARALLEL_MAKE is unset, the jobserver functionality is skipped.

Further work in addition to this patch set could be to make bitbake
tasks jobserver aware.

Changes since the RFC[2]:
 * The ninja src uri change in patch 3 is converted to a set of patches
 * The qemu fix in patch 4 is converted to a submitted patch

[1] https://lore.kernel.org/openembedded-core/1423223184.20217.15.camel@linuxfoundation.org/
[2] https://lore.kernel.org/openembedded-core/20230828124834.376779-1-martin@geanix.com/

Martin Hundebøll (5):
  classes: jobserver: support gnu make fifo jobserver
  scripts: build-env: allow passing JOBSERVER_FIFO from environment
  ninja: build modified version with GNU Make jobserver support
  qemu: enable parallel builds when using the jobserver class
  contrib: add python service and systemd unit to run shared jobserver

 contrib/jobserver/jobserver.py                |   78 +
 contrib/jobserver/jobserver.service           |   10 +
 meta/classes-global/jobserver.bbclass         |   80 +
 meta/conf/bitbake.conf                        |    2 +-
 ...dd-GNU-make-jobserver-client-support.patch |  494 +++++++
 ...l-monitoring-to-SubprocessSet-DoWork.patch |  560 +++++++
 ...er-when-jN-is-forced-on-command-line.patch |  198 +++
 .../files/0004-Honor-lN-from-MAKEFLAGS.patch  |  134 ++
 ...e-LinePrinter-for-TokenPool-messages.patch |  128 ++
 .../files/0006-Prepare-PR-for-merging.patch   |  156 ++
 .../files/0007-Add-tests-for-TokenPool.patch  |  237 +++
 ...0008-Add-tests-for-subprocess-module.patch |  121 ++
 .../0009-Add-tests-for-build-module.patch     |  397 +++++
 ...-implementation-for-GNUmakeTokenPool.patch | 1283 +++++++++++++++++
 .../0011-Prepare-PR-for-merging-part-II.patch |  744 ++++++++++
 ...ename-TokenPool-Setup-to-SetupClient.patch |  109 ++
 ...013-Add-TokenPool-SetupMaster-method.patch |   78 +
 ...mmand-line-option-m-tokenpool-master.patch |  101 ++
 ...plement-GNUmakeTokenPool-SetupMaster.patch |  152 ++
 ...mplement-GNUmakeTokenPool-CreatePool.patch |   87 ++
 ...-Add-tests-for-TokenPool-SetupMaster.patch |  145 ++
 ...-jobserver-fifo-style-client-support.patch |  265 ++++
 ...ional-argument-to-m-tokenpool-master.patch |  368 +++++
 ...-jobserver-fifo-style-master-support.patch |  287 ++++
 meta/recipes-devtools/ninja/ninja_1.11.1.bb   |   33 -
 meta/recipes-devtools/ninja/ninja_1.12.0.bb   |   55 +
 meta/recipes-devtools/qemu/qemu.inc           |    1 +
 ...e-jobserver-auth-argument-when-calli.patch |   37 +
 scripts/oe-buildenv-internal                  |    2 +-
 29 files changed, 6307 insertions(+), 35 deletions(-)
 create mode 100644 contrib/jobserver/jobserver.py
 create mode 100644 contrib/jobserver/jobserver.service
 create mode 100644 meta/classes-global/jobserver.bbclass
 create mode 100644 meta/recipes-devtools/ninja/files/0001-Add-GNU-make-jobserver-client-support.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0002-Add-TokenPool-monitoring-to-SubprocessSet-DoWork.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0003-Ignore-jobserver-when-jN-is-forced-on-command-line.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0004-Honor-lN-from-MAKEFLAGS.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0005-Use-LinePrinter-for-TokenPool-messages.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0006-Prepare-PR-for-merging.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0007-Add-tests-for-TokenPool.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0008-Add-tests-for-subprocess-module.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0009-Add-tests-for-build-module.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0010-Add-Win32-implementation-for-GNUmakeTokenPool.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0011-Prepare-PR-for-merging-part-II.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0012-Rename-TokenPool-Setup-to-SetupClient.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0013-Add-TokenPool-SetupMaster-method.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0014-Add-command-line-option-m-tokenpool-master.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0015-Implement-GNUmakeTokenPool-SetupMaster.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0016-Implement-GNUmakeTokenPool-CreatePool.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0017-Add-tests-for-TokenPool-SetupMaster.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0018-Add-GNU-make-jobserver-fifo-style-client-support.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0019-Add-optional-argument-to-m-tokenpool-master.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0020-Add-GNU-make-jobserver-fifo-style-master-support.patch
 delete mode 100644 meta/recipes-devtools/ninja/ninja_1.11.1.bb
 create mode 100644 meta/recipes-devtools/ninja/ninja_1.12.0.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013-Makefile-preserve-jobserver-auth-argument-when-calli.patch

-- 
2.44.0


