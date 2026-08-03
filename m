Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31482C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:49:28 +0000 (UTC)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39073.1785746967123020401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=vPphBxsT;
 spf=pass (domain: linux.dev, ip: 91.218.175.183, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785746964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MtWIajyyFcxIT8xrpdsenwui+ADWAk0ntEAs7yee5Ds=;
	b=vPphBxsTGF/9K+A138CK3mX6wqeVgLGY69Ix8gpTED0qm/VI8w/sgLZTokhbnkwlMSG3QB
	NQ+7Wp/albL1cI1XITMfvJzrUNSkd87kVvzk2ZUuoAIKL3qrdGzGjV2mevFfKRHMCoxjPL
	smzqvRH1vuZbB1EdZa6ahIbmYcfN/w0=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 02/10] cve-exclusion: set status for CVE-2021-3714
Date: Mon,  3 Aug 2026 01:48:19 -0700
Message-ID: <20260803084827.1348810-3-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242628

KSM merges identical anonymous pages across processes. An attacker who
can place chosen page-sized content in a victim's memory can detect the
merge through the timing of the resulting copy-on-write fault, and so
leak memory contents remotely.

This cannot be fixed without removing deduplication, and the affected
projects have said so explicitly. Red Hat closed the issue WONTFIX:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1931327

Debian marks src:linux unfixed with the note "Inherent design
limitation, can be avoided by not using KSM":

  https://security-tracker.debian.org/tracker/CVE-2021-3714

Ubuntu records "there is no upstream fix available as of 2024-06-17" and
lists disabling KSM as the only mitigation:

  https://ubuntu.com/security/CVE-2021-3714

CONFIG_KSM=3Dy is set in yocto-kernel-cache (bsp/intel-x86 and the
paravirt_kvm fragments), so this is not a configuration exclusion.
It does however require two runtime opt-ins: ksm_run defaults to
KSM_RUN_STOP in mm/ksm.c, so ksmd must be started by the administrator,
and memory is only eligible if the process asks for it with
madvise(MADV_MERGEABLE) or prctl(PR_SET_MEMORY_MERGE).

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
changes in v2:
- split out of the single combined patch, one CVE per patch as requested
- added primary source links (disclosures, distribution trackers, mailing
  list threads, upstream commits) to every commit message
- added the three CVEs with no upstream fix as "unpatched" entries instea=
d
  of leaving them undocumented
- disclosed AI assistance per the contributor guide

v1: https://lore.kernel.org/openembedded-core/20260802143444.1178575-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index aaba26fe..9012d328 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -199,3 +199,10 @@ CVE_STATUS[CVE-2025-71145] =3D "cpe-stable-backport:=
 Fixed from v6.18.3"
 # https://www.openwall.com/lists/oss-security/2019/12/05/1
 CVE_STATUS[CVE-2019-14899] =3D "upstream-wontfix: consequence of the def=
ault weak \
 host model, no kernel fix exists or is planned, mitigated by firewall co=
nfiguration"
+
+# Inherent to KSM deduplication, closed WONTFIX by Red Hat. Exposure nee=
ds
+# ksmd started at runtime (/sys/kernel/mm/ksm/run defaults to 0) and the
+# workload to opt in via MADV_MERGEABLE or prctl(PR_SET_MEMORY_MERGE).
+# https://bugzilla.redhat.com/show_bug.cgi?id=3D1931327
+CVE_STATUS[CVE-2021-3714] =3D "upstream-wontfix: inherent design limitat=
ion of \
+KSM page deduplication, closed WONTFIX by Red Hat, no upstream fix plann=
ed"
--=20
2.43.0


