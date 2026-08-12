Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8074C5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:31:20 +0000 (UTC)
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1485.1786512676406312614
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=GLSbJOpq;
 spf=pass (domain: linux.dev, ip: 91.218.175.184, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBigX+C9Xl0TSpeUaiP/o1MlVCCpMycITKrQwl9RVb8=;
	b=GLSbJOpqRtJsEBJTkedd7y5T6gsey6PAtA3HoDXTFQmpWYPvCuPBvV/WlhLtkMomoVG21O
	rGuW/OF8/yjDuucQkWeW2kXHNKyRHnFXMiTCL6gZlSPrFMn1kiaqP5GdFiW2oGvTcjmn/V
	EF5EbwMv13P2yUSoX+ONxQL3ACWn92c=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 3/9] cve-exclusions: set status for CVE-2021-3864
Date: Wed, 12 Aug 2026 02:28:36 -0500
Message-ID: <20260812072842.1176341-4-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243228

begin_new_exec() resets dumpability to owner-dumpable whenever the real
and effective ids match at exec time. A binary exec'd by a setuid
program that has already called setuid(0) therefore becomes dumpable as
root, and with a relative core_pattern plus an attacker-controlled
working directory the resulting core file can be dropped into a
privileged directory such as /etc/logrotate.d.

Full report with proof of concept:

  https://www.openwall.com/lists/oss-security/2021/10/20/2

Two fixes were proposed and neither was merged. Waiman Long's patch was
judged an ineffective mitigation by Eric W. Biederman and the discussion
went quiet in early 2022; Wander Lairson Costa's RFC v2 received design
feedback and no v3 followed:

  https://lore.kernel.org/all/20211221021744.864115-1-longman@redhat.com/
  https://lore.kernel.org/all/20211228170910.623156-1-wander@redhat.com/

The flagged logic is unchanged: fs/exec.c still selects
TASK_DUMPABLE_OWNER in that case, and fs/coredump.c only applies the
suid-safe restriction when dumpable is TASK_DUMPABLE_ROOT, so the
dumpable=3D=3D1 case this CVE describes is not covered. Images that set a=
n
absolute path, a pipe or a socket core_pattern are not exploitable.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3:
- use "unpatched" instead of "upstream-wontfix"; a NAK of one
  mitigation is not an upstream wontfix of the issue
- drop the "NAKed" wording: the discussion went quiet, it was not
  formally rejected

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index af3576d..ba8e467 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -206,3 +206,11 @@ host model, no upstream kernel fix, mitigated by fir=
ewall configuration"
 # https://security-tracker.debian.org/tracker/CVE-2021-3714
 CVE_STATUS[CVE-2021-3714] =3D "unpatched: timing side channel inherent t=
o \
 KSM page deduplication, only reachable when KSM is enabled and opted int=
o"
+
+# Two mitigation attempts, neither merged; the fs/exec.c logic is
+# unchanged. An absolute, piped or socket kernel.core_pattern (for
+# example systemd-coredump) prevents exploitation.
+# https://www.openwall.com/lists/oss-security/2021/10/20/2
+# https://ubuntu.com/security/CVE-2021-3864
+CVE_STATUS[CVE-2021-3864] =3D "unpatched: no accepted mainline fix, \
+exploitation requires a relative kernel.core_pattern"
--=20
2.43.0


