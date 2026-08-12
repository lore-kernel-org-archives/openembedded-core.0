Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94FCC5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:31:10 +0000 (UTC)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1484.1786512667785297652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=ki1S7Bsn;
 spf=pass (domain: linux.dev, ip: 91.218.175.182, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uXm2Zfq1jroUKOSU13LxSSr7kqd4FwK3NEbkH7bvMas=;
	b=ki1S7BsnmKFmzcPYX7Oz0QTG/TCPI2Put00yPwJaBd1pf9pewfj2ImluzS3qTPsJOK17fP
	RANbbqlZlw7QVR70ZCIZSgLDfAXRZMA0VEAshvUevx/JGDWSQdWxDfyo1O/AYoxWcSu0Ad
	5D4TM8ayyNfZMPyqMU8onY7YXQ3HKM0=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 2/9] cve-exclusions: set status for CVE-2021-3714
Date: Wed, 12 Aug 2026 02:28:35 -0500
Message-ID: <20260812072842.1176341-3-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243227

KSM merges identical anonymous pages across processes. An attacker who
can place chosen page-sized content in a victim's memory can detect the
merge through the timing of the resulting copy-on-write fault, and so
leak memory contents.

There is no upstream fix; removing the side channel means removing
deduplication. Distribution trackers describe it the same way - Debian
marks src:linux unfixed with "Inherent design limitation, can be avoided
by not using KSM", Red Hat closed its bug WONTFIX, and Ubuntu records no
upstream fix as of 2024-06-17:

  https://security-tracker.debian.org/tracker/CVE-2021-3714
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1931327
  https://ubuntu.com/security/CVE-2021-3714

Exposure requires two runtime opt-ins: ksmd must be started by the
administrator (ksm_run defaults to KSM_RUN_STOP in mm/ksm.c) and memory
is only eligible when a process asks with madvise(MADV_MERGEABLE) or
prctl(PR_SET_MEMORY_MERGE). CONFIG_KSM=3Dy is set in yocto-kernel-cache
(bsp/intel-x86 and the paravirt_kvm fragments), so this is not a
configuration exclusion.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3:
- use "unpatched" instead of "upstream-wontfix": the WONTFIX is a
  distribution position, not an upstream one

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 5ed4a00..af3576d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -199,3 +199,10 @@ CVE_STATUS[CVE-2025-71145] =3D "cpe-stable-backport:=
 Fixed from v6.18.3"
 # https://ubuntu.com/security/CVE-2019-14899
 CVE_STATUS[CVE-2019-14899] =3D "unpatched: consequence of the default we=
ak \
 host model, no upstream kernel fix, mitigated by firewall configuration"
+
+# Timing side channel inherent to KSM page deduplication. Reachable only
+# when ksmd is started (/sys/kernel/mm/ksm/run defaults to 0) and the
+# workload opts in via MADV_MERGEABLE or prctl(PR_SET_MEMORY_MERGE).
+# https://security-tracker.debian.org/tracker/CVE-2021-3714
+CVE_STATUS[CVE-2021-3714] =3D "unpatched: timing side channel inherent t=
o \
+KSM page deduplication, only reachable when KSM is enabled and opted int=
o"
--=20
2.43.0


