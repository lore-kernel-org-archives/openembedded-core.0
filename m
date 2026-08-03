Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44779C5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:49:48 +0000 (UTC)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39075.1785746982737878156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=qZNqjnnG;
 spf=pass (domain: linux.dev, ip: 95.215.58.179, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785746980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6tC56JaTaqp694AfIZDTd5uvFh+NRiIFoIiR3V8b4D8=;
	b=qZNqjnnG4/Mq09Wyp2cGNk3sNGHi/ldMYfnKZ4Jr6RPDgiy8Dex11g87abJeBSh1xfd3qv
	K5l/M+prjTMuEXnmku10ugzBWVp0hdckqVkQCmWHblJntdz8leBJql16p3DkmoYvHu4YxE
	LYRk7/lbmjVfkeMaK3Xf5NpGlww9CBo=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 03/10] cve-exclusion: set status for CVE-2021-3864
Date: Mon,  3 Aug 2026 01:48:20 -0700
Message-ID: <20260803084827.1348810-4-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242629

begin_new_exec() resets dumpability to owner-dumpable whenever the real
and effective ids match at exec time. A binary exec'd by a setuid
program that has already called setuid(0) therefore becomes dumpable as
root, and with a relative core_pattern plus an attacker-controlled
working directory the resulting core file can be dropped into a
privileged directory such as /etc/logrotate.d.

Full report with proof of concept:

  https://www.openwall.com/lists/oss-security/2021/10/20/2

Two fixes were proposed and neither was merged. Waiman Long's patch was
NAKed by Eric W. Biederman as an ineffective mitigation:

  https://lore.kernel.org/all/20211221021744.864115-1-longman@redhat.com/

Wander Lairson Costa's RFC v2 received design feedback and no v3 ever
followed:

  https://lore.kernel.org/all/20211228170910.623156-1-wander@redhat.com/

The flagged logic is unchanged today: fs/exec.c still selects
TASK_DUMPABLE_OWNER in that case, and fs/coredump.c only rejects
relative core paths when dumpable is 2, so the dumpable=3D=3D1 case this =
CVE
describes is not covered.

Ubuntu records "no fix upstream as of 2022-01-27" and defers it for all
releases; Debian lists src:linux as unfixed:

  https://ubuntu.com/security/CVE-2021-3864
  https://security-tracker.debian.org/tracker/CVE-2021-3864

Red Hat rates RHEL 8 and later "Not affected" purely because their
default core_pattern does not write relative to the current directory:

  https://access.redhat.com/security/cve/CVE-2021-3864

Images that set an absolute path, a pipe or a socket core_pattern (for
example systemd-coredump) are not exploitable for the same reason.

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

 meta/recipes-kernel/linux/cve-exclusion.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 9012d328..d7ae3b03 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -206,3 +206,9 @@ host model, no kernel fix exists or is planned, mitig=
ated by firewall configurat
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D1931327
 CVE_STATUS[CVE-2021-3714] =3D "upstream-wontfix: inherent design limitat=
ion of \
 KSM page deduplication, closed WONTFIX by Red Hat, no upstream fix plann=
ed"
+
+# Two fix attempts, neither merged; the fs/exec.c logic is unchanged.
+# An absolute, piped or socket kernel.core_pattern prevents exploitation=
.
+# https://www.openwall.com/lists/oss-security/2021/10/20/2
+CVE_STATUS[CVE-2021-3864] =3D "upstream-wontfix: no accepted mainline fi=
x after \
+several attempts, exploitation requires a relative kernel.core_pattern"
--=20
2.43.0


