Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8162C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:31:40 +0000 (UTC)
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1487.1786512692838663411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=EwG4Z++Y;
 spf=pass (domain: linux.dev, ip: 95.215.58.174, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKfKBCv3o9Oto7IZ7zpliOaqBAa5+DMucV6rSkbsGAY=;
	b=EwG4Z++Y6FWLssQjffgkJBIoSI9Lw1Y1K6VnHh0rmUGCRqn/ve57HSV7w4kRt2CQvZL0TO
	n51CBzEPegE7dQOJalxaCGIxL1C6aenMFzcIWSUSpOz+8cnr5lYaeEEwuBqi1yMIQKtY0J
	sQXtxKIhvyfRoI97S6WA/VmFUePccgI=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 4/9] cve-exclusions: set status for CVE-2022-0400
Date: Wed, 12 Aug 2026 02:28:37 -0500
Message-ID: <20260812072842.1176341-5-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243229

The CVE describes an out-of-bounds read in the SMC protocol stack, but
no vulnerable code was ever identified. The MITRE record lists the
affected version as "Not Known" and references only two Red Hat
bugzillas, the originating one of which was never made public.

The public bugzilla is closed as NOTABUG, with the statement "There was
no shipped kernel version that was seen affected by this problem":

  https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
  https://access.redhat.com/security/cve/CVE-2022-0400

SUSE reached the same conclusion independently, closing bsc#1195329 as
RESOLVED / INVALID:

  https://www.suse.com/security/cve/CVE-2022-0400.html

So did Debian, which marks it unimportant with the note "non issue, no
security impact":

  https://security-tracker.debian.org/tracker/CVE-2022-0400

There is no commit in mainline referencing this CVE. The net/smc
out-of-bounds fixes that landed in v5.18 (b1871fd48efc, 0558226cebee)
are in local, privileged paths and are not linked to this CVE by any
tracker.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3: no functional change since v2

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index ba8e467..be74672 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -214,3 +214,10 @@ KSM page deduplication, only reachable when KSM is e=
nabled and opted into"
 # https://ubuntu.com/security/CVE-2021-3864
 CVE_STATUS[CVE-2021-3864] =3D "unpatched: no accepted mainline fix, \
 exploitation requires a relative kernel.core_pattern"
+
+# Never substantiated: no affected version, reproducer or commit was eve=
r
+# identified. Closed NOTABUG by Red Hat, INVALID by SUSE (bsc#1195329) a=
nd
+# "non issue, no security impact" by Debian.
+# https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
+CVE_STATUS[CVE-2022-0400] =3D "disputed: the reported net/smc out-of-bou=
nds read \
+was never substantiated and was closed as not-a-bug by Red Hat, SUSE and=
 Debian"
--=20
2.43.0


