Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D93C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 14:35:11 +0000 (UTC)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24340.1785681309115204392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 07:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=JrVqtXr8;
 spf=pass (domain: linux.dev, ip: 95.215.58.173, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785681306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aHxH6RrD0VqEsVX3mQfRY7Wl8AGz61elMC78lUJG9aU=;
	b=JrVqtXr8nDTcgtIDINBqEksxxzlEvjnyL3VvQfTjLrXv5GTK+RjkplWUixblAFc6Hi6NCU
	3m8d6Sv7K8dmeaWHRyniQsCQrOwEPEpOwo+0JTTAFwPIWP7yvFUweO/oBKjzuGXC77zfcX
	jtylYXCs/KTYbnBQV4WaX8hOP0SH6g8=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH] cve-exclusion: set status for 7 kernel CVEs lacking upstream fix data
Date: Sun,  2 Aug 2026 07:34:44 -0700
Message-ID: <20260802143444.1178575-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 14:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242561

Triage results for seven of the CVEs listed in the "linux-yocto CVEs
in need of triage" request [1]. All of these predate the kernel.org
CNA, so no upstream fix version will ever be backfilled automatically;
each verdict was established from distro security trackers, mailing
list history and inspection of current mainline source (linux-next
20260727).

* CVE-2019-14899: VPN tunnel TCP inference. No kernel fix exists or is
  planned; mitigations are firewall configuration only. Ubuntu has
  deferred it since 2019-12-13; Debian does not track it against the
  kernel; Red Hat tracks it against openvpn.

* CVE-2021-3714: KSM dedup side channel. Red Hat closed it WONTFIX
  (bz#1931327); Debian marks it "Inherent design limitation". Only
  reachable when ksmd is started and the workload opts in via
  MADV_MERGEABLE / PR_SET_MEMORY_MERGE.

* CVE-2021-3864: setuid coredump privilege escalation. Both proposed
  fixes were rejected or abandoned (links in the file); the flagged
  fs/exec.c logic is unchanged in current mainline. Exploitation
  requires a relative kernel.core_pattern, which piped/absolute
  patterns (e.g. systemd-coredump) prevent.

* CVE-2022-0400: net/smc out-of-bounds read. Closed NOTABUG by Red Hat
  (bz#2044575), INVALID by SUSE (bsc#1195329), "non issue" by Debian;
  no affected version or upstream commit was ever identified.

* CVE-2022-1247: rose_connect() refcount race. Fixed in v6.17 by
  d860d1faa6b2 + da9c9c877597 ("net: rose: convert 'use' field to
  refcount_t"), whose commit message matches the CVE description and
  which removes the exact rose->neighbour->use++ increment the CVE
  describes; backported to 6.1.y/6.6.y/6.12.y/6.16.y. The rose/
  hamradio subsystem was subsequently removed in v7.1 (dd8d4bc28ad7).
  Distro trackers have not yet connected the fix to this CVE.

* CVE-2022-4543: "EntryBleed" KASLR bypass. No fix; upstream position
  is that KASLR does not defend against local attackers. Explicitly
  not fixed by 97e3d26b5e5f, which randomizes the separate
  cpu_entry_area (that is CVE-2023-3640).

* CVE-2023-4010: the function named by the CVE, usb_giveback_urb(),
  does not exist in the kernel; the reporter's PoC exercises the
  unthrottled URB resubmit loop in drivers/media/rc/imon.c, stopped by
  eecd203ada43 ("media: imon: make send_packet() more robust") in
  v6.18. The commit carries no CVE reference, so this tie is inferred
  from the commit content and the reporter's PoC output - flagging for
  review.

Of the remaining CVEs in [1], CVE-2023-3397 (JFS txEnd UAF, still
reproduced by syzbot in 2026-06), CVE-2023-6238 (NVMe passthrough
metadata DMA overflow, fix was merged to nvme-6.6 then backed out and
never re-landed; kernels < v6.2 unaffected) and CVE-2023-6240 (Marvin
RSA timing oracle, fixed only in RHEL downstream) are genuinely
unfixed upstream and are deliberately not excluded here; detailed
analysis posted in the thread.

[1] https://lore.kernel.org/all/4ac849a706feb16688020d5bcc3e74aececd63cf.=
camel@pbarker.dev/

Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 59 +++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index d27d764..8d98c61 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -192,3 +192,62 @@ CVE_STATUS[CVE-2025-68195] =3D "fixed-version: Fixed=
 from 6.18"
 # Fix https://git.kernel.org/stable/c/b4b64fda4d30a83a7f00e92a0c8a1d4769=
9609f3
 # Backport https://git.kernel.org/stable/c/75c5d9bce072abbbc09b701a49869=
ac23c34a906
 CVE_STATUS[CVE-2025-71145] =3D "cpe-stable-backport: Fixed from v6.18.3"
+
+# No kernel fix exists or is planned; this is a consequence of Linux's
+# default weak host model. Mitigation is firewall configuration only
+# (e.g. the strong-host-model rule wg-quick(8) installs); IPv4 rp_filter
+# does not cover IPv6. Ubuntu: deferred since 2019-12-13; Red Hat tracks
+# it against openvpn; Debian does not track it against the kernel.
+CVE_STATUS[CVE-2019-14899] =3D "upstream-wontfix: no kernel fix exists o=
r is \
+planned; weak host model design issue, mitigated by firewall configurati=
on"
+
+# Inherent design property of KSM, not fixable without removing dedup.
+# Red Hat https://bugzilla.redhat.com/show_bug.cgi?id=3D1931327 CLOSED W=
ONTFIX;
+# Debian: "Inherent design limitation, can be avoided by not using KSM".
+# Only exploitable when ksmd is enabled at runtime (default off) and the
+# workload opts in via MADV_MERGEABLE or PR_SET_MEMORY_MERGE.
+CVE_STATUS[CVE-2021-3714] =3D "upstream-wontfix: KSM memory deduplicatio=
n \
+side channel is an inherent design limitation, Red Hat WONTFIX, no \
+upstream fix planned"
+
+# Proposed fixes were rejected or abandoned without a merge
+# (https://lore.kernel.org/all/20211221021744.864115-1-longman@redhat.co=
m/,
+# https://lore.kernel.org/all/20211228170910.623156-1-wander@redhat.com/=
)
+# and the flagged fs/exec.c logic is unchanged as of linux-next 20260727=
.
+# Exploitation requires a relative kernel.core_pattern; a piped or
+# absolute core_pattern (e.g. systemd-coredump) prevents the issue.
+CVE_STATUS[CVE-2021-3864] =3D "upstream-wontfix: no accepted mainline fi=
x \
+after several attempts; requires relative kernel.core_pattern to exploit=
"
+
+# Never substantiated: Red Hat
+# https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575 CLOSED NOTABUG,
+# SUSE bugzilla #1195329 RESOLVED INVALID, Debian: "non issue, no
+# security impact". No affected version or upstream commit was ever
+# identified.
+CVE_STATUS[CVE-2022-0400] =3D "disputed: net/smc out-of-bounds read was =
\
+never substantiated and was closed as not-a-bug by Red Hat, SUSE and Deb=
ian"
+
+# Fix https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800=
061
+# Fix https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80=
f45
+# rose->neighbour->use converted to refcount_t, removing the unlocked
+# use++ in rose_connect() that the CVE describes; backported to 6.1.y,
+# 6.6.y, 6.12.y and 6.16.y. The rose/hamradio subsystem was then removed
+# entirely in v7.1 (dd8d4bc28ad7).
+CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed from version 6.17"
+
+# EntryBleed (KASLR bypass via prefetch timing under KPTI, Intel x86
+# only). Entry text is still mapped _PAGE_GLOBAL into user page tables
+# (arch/x86/mm/pti.c). Upstream and Debian position is that KASLR is not
+# a boundary against local attackers. Note: v6.2 97e3d26b5e5f randomizes
+# the separate cpu_entry_area (that is CVE-2023-3640) and does not fix
+# this.
+CVE_STATUS[CVE-2022-4543] =3D "upstream-wontfix: no fix planned; KASLR i=
s \
+not considered a defense against local attackers"
+
+# Fix https://git.kernel.org/linus/eecd203ada43a4693ce6fdd3a58ae10c78192=
52c
+# The CVE text names usb_giveback_urb() which does not exist in the
+# kernel; the reporter's PoC actually exercises the unthrottled URB
+# resubmit loop in drivers/media/rc/imon.c (printk flood on -EPROTO,
+# requires physical device access). The commit above stops the resubmit
+# loop. Ubuntu triage: "There is no system lockup happening."
+CVE_STATUS[CVE-2023-4010] =3D "fixed-version: Fixed from version 6.18"
--=20
2.43.0


