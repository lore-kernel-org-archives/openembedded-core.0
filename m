Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4867CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 11:38:03 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.35648.1712230681767332035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 04:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=YKmEoPcT;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=WFyloxHVuoFRIX+jHTohDkFNYXGn7AVDs+Gg7KqRgcw=; b=YKmEoPcT58b5pGZgMXpf/cEcd/
	hJDQzMYqzJoXzttetAHzxqEkIG50dFQcwPI2q7bm6OPY8V0Oo/T1+akjSKwxODj7QfyqRQbclKi+m
	exY6j1b3h3qd3GI5fcT9HlNPURi/PkJnX7ouHfBU9KdNoDhHKBo3B6h0tC1sisAUqObmMKdPN2G9p
	8ypqCcojDk7X2xrIMNwMyQMtRvr1onCQgGlQazkwsioQbGW4xwuiRlELKisuMBqJ1cYuDqNM79DYs
	EY4OcmGbFURdPo1+1Jo9PMXuhX+ulLW3Ub6uRDqmJJ1JAu3BvMpEMAMnhdrs9cDyqrW1JhOO8HX5y
	ObcZj4sQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rsL52-000FYy-8A; Thu, 04 Apr 2024 13:16:28 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rsL51-000Wu6-2J;
	Thu, 04 Apr 2024 13:16:27 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v2 0/5] Jobserver support
Date: Thu,  4 Apr 2024 13:16:08 +0200
Message-ID: <20240404111613.2574424-1-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27235/Thu Apr  4 10:24:59 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 11:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197955

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

Changes since v1[2]:
 * Fixed typos in various places
 * Added JOBSERVER_IGNORE variable to jobserver.bbclass in patch 1
 * Changed ninja to use kitware fork with only two patches added in
   patch 3
 * Updated upstream patch submission link in qemu in patch 4

Changes since the RFC[3]:
 * The ninja src uri change in patch 3 is converted to a set of patches
 * The qemu fix in patch 4 is converted to a submitted patch

[1] https://lore.kernel.org/openembedded-core/1423223184.20217.15.camel@linuxfoundation.org/
[2] https://lore.kernel.org/openembedded-core/20240403070204.367470-1-martin@geanix.com/
[3] https://lore.kernel.org/openembedded-core/20230828124834.376779-1-martin@geanix.com/

Martin Hundebøll (5):
  classes: jobserver: support gnu make fifo jobserver
  scripts: build-env: allow passing JOBSERVER_FIFO from environment
  ninja: build modified version with GNU Make jobserver support
  qemu: enable parallel builds when using the jobserver class
  contrib: add python service and systemd unit to run shared jobserver

 contrib/jobserver/jobserver.py                |  78 +++++
 contrib/jobserver/jobserver.service           |  10 +
 meta/classes-global/jobserver.bbclass         |  87 ++++++
 meta/conf/bitbake.conf                        |   2 +-
 ...ename-TokenPool-Setup-to-SetupClient.patch | 113 ++++++++
 ...-jobserver-fifo-style-client-support.patch | 271 ++++++++++++++++++
 meta/recipes-devtools/ninja/ninja_1.11.1.bb   |   8 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...e-jobserver-auth-argument-when-calli.patch |  37 +++
 scripts/oe-buildenv-internal                  |   2 +-
 10 files changed, 605 insertions(+), 4 deletions(-)
 create mode 100644 contrib/jobserver/jobserver.py
 create mode 100644 contrib/jobserver/jobserver.service
 create mode 100644 meta/classes-global/jobserver.bbclass
 create mode 100644 meta/recipes-devtools/ninja/files/0001-Rename-TokenPool-Setup-to-SetupClient.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0002-Add-GNU-make-jobserver-fifo-style-client-support.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013-Makefile-preserve-jobserver-auth-argument-when-calli.patch

-- 
2.44.0


