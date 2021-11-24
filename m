Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394F7C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:15:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.941.1637774133189386143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9453F1FB
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C05C3F66F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oe/utils: by default cap cpu_count() to 64 cores
Date: Wed, 24 Nov 2021 17:15:29 +0000
Message-Id: <20211124171529.4107434-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124171529.4107434-1-ross.burton@arm.com>
References: <20211124171529.4107434-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:15:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158731

Larger systems may have large numbers of cores, but beyond a certain
point they can't all be used for compiling: whilst purely
compute-intensive jobs can be parallelised to hundreds of cores,
operations such as compressing (needs lots of RAM) or compiling (lots of
I/O) don't scale linearly.

For example, the Marvel ThunderX2 has 32 cores, each capable of
executing four threads, and can be configured with two sockets, making
256 CPUs according to Linux. Zstd using 256 threads has been seen to
fail to allocate memory during even small recipes such as iso-codes.

Add a default cap of 64 CPUs to the cpu_count() method so that extreme
parallisation is limited.  64 is high enough that meaningful gains
beyond it are unlikely, but high enough that most systems won't be
effected.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/utils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 7982b2b511..136650e6f7 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -248,9 +248,9 @@ def trim_version(version, num_parts=3D2):
     trimmed =3D ".".join(parts[:num_parts])
     return trimmed
=20
-def cpu_count(at_least=3D1):
+def cpu_count(at_least=3D1, at_most=3D64):
     cpus =3D len(os.sched_getaffinity(0))
-    return max(cpus, at_least)
+    return max(min(cpus, at_most), at_least)
=20
 def execute_pre_post_process(d, cmds):
     if cmds is None:
--=20
2.25.1


