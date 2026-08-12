Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A6EC5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:33:00 +0000 (UTC)
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1542.1786512772891509297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=dqsh7Kra;
 spf=pass (domain: linux.dev, ip: 95.215.58.172, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uk8kE8hCP4h/8U9BHqGYaHv/NB2VwE7wOHv3ES/NABc=;
	b=dqsh7KraVH3E8JiZiMB+c9uvthxOD8M4P1U+xwQcwd+DZ+OUNbGtMi7e/hpsFzth2BPvRp
	SocHctek4+uyjPPGequ1WfBnBJS7BdCx9K75l8SFf6V8piHHkavDaayk1p6TNhVVU2UWjE
	hjO0UnJgIFndC1m2wS9Yqzljur9OVkA=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 8/9] cve-exclusions: set status for CVE-2023-6238
Date: Wed, 12 Aug 2026 02:28:41 -0500
Message-ID: <20260812072842.1176341-9-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243233

NVME_IOCTL_IO_CMD and the io_uring passthrough path accept a
metadata length from userspace without checking it against the number of
blocks and the namespace metadata size that the device uses to size the
transfer, so the device can DMA past the end of the buffer.

Kanchan Joshi posted a stopgap removing unprivileged passthrough,
reviewed by Christoph Hellwig and applied for nvme-6.6:

  https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sams=
ung.com/

It was then backed out. Keith Busch wrote "I believe this large change
is a bit too late for 6.6 ... It's backed out now", to which Christoph
Hellwig replied "We leave an exploitable hole in, so I don't think
waiting any longer is an option". No replacement has been merged: the
commits the patch would have reverted are all still present, and
nvme_map_user_request() still passes the user-supplied metadata length
straight to blk_rq_integrity_map_user() with no cross-check.

The exposure was introduced by
855b7717f44b ("nvme: fine-granular CAP_SYS_ADMIN for nvme io commands")
in v6.2, so branches carrying older kernels are not affected. Debian
reached the same conclusion independently, marking the older suites
"Vulnerable code not present":

  https://security-tracker.debian.org/tracker/CVE-2023-6238

Red Hat rates it Low because the device node is root-only by default:

  https://access.redhat.com/security/cve/CVE-2023-6238

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3: no functional change since v2

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index c4a9dea..35e0a66 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -244,3 +244,11 @@ treated as a defence against local attackers"
 # https://syzkaller.appspot.com/bug?extid=3Dea7ed3bb2f444cb4dfeb
 CVE_STATUS[CVE-2023-3397] =3D "unpatched: no upstream fix merged, the \
 affected fs/jfs txEnd()/lmLogClose() unmount race is unchanged"
+
+# The user metadata length is not checked against the length the device
+# derives from the command. The fix was applied to nvme-6.6 and then bac=
ked
+# out; nothing has landed since. Kernels before v6.2 predate unprivilege=
d
+# passthrough (855b7717f44b) and are not affected.
+# https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sam=
sung.com/
+CVE_STATUS[CVE-2023-6238] =3D "unpatched: the proposed fix was applied t=
o \
+nvme-6.6 and then reverted, no upstream fix has landed since"
--=20
2.43.0


