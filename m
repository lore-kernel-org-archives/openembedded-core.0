Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66406C55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 14:34:41 +0000 (UTC)
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24184.1785681273097104204
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 07:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=oN+wYhlg;
 spf=pass (domain: linux.dev, ip: 95.215.58.189, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785681270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLttGIEDzGZxH5NMq+FREnJ4zbHJOjiPnAUfTv7IpL0=;
	b=oN+wYhlgOQIJN9Htna3bUE5V04/3OOBTV8xyxyQfloGcpGz2HYjkAe6zoH+5PpegrqugbS
	9SYAVrUSkGW9q/ZIevY7vWLj8+zcf0etWD7y16qyTb0bnR5zzE4VoNrxtbwUxWdyTgJ/vx
	lszyfll8nafV9FPKwITj+Pw+3B9H2Oc=
From: Junjie Cao <junjie.cao@linux.dev>
To: linux-yocto@lists.yoctoproject.org
Cc: yocto@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org,
	Paul Barker <paul@pbarker.dev>,
	Randy MacLeod <randy.macleod@windriver.com>,
	"Navuduri, Venkata Adhitya" <Venkata.Navuduri@windriver.com>
Subject: Re: [yocto] linux-yocto CVEs in need of triage
Date: Sun,  2 Aug 2026 07:33:58 -0700
Message-ID: <20260802143403.1178547-1-junjie.cao@linux.dev>
In-Reply-To: <4ac849a706feb16688020d5bcc3e74aececd63cf.camel@pbarker.dev>
References: <4ac849a706feb16688020d5bcc3e74aececd63cf.camel@pbarker.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 14:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242560

Hi Paul,

I have independently triaged the CVEs on this list other than
CVE-2023-3640, which Adhitya already covered. For the seven with a
conclusive status I have sent a patch for cve-exclusion.inc to the
OE-core list ("cve-exclusion: set status for 7 kernel CVEs lacking
upstream fix data"). Summary of all verdicts below; every claimed
commit was verified against mainline history (linux-next 20260727),
and I note explicitly where a tie is my inference rather than a
distro/CNA statement.

Fixed upstream (nobody has connected the dots yet):

* CVE-2022-1247 (rose_connect() refcount race): actually fixed in
  v6.17 by d860d1faa6b2 ("net: rose: convert 'use' field to
  refcount_t") plus da9c9c877597, from Takamitsu Iwai's Aug-2025
  series. The commit message describes the CVE's premise almost
  verbatim ("The 'use' field in struct rose_neigh is used as a
  reference counter but lacks atomicity") and the diff removes the
  exact rose->neighbour->use++ in rose_connect(). Backported to
  6.1.y/6.6.y/6.12.y/6.16.y in the 2025-09-02 stable round. The whole
  rose/hamradio subsystem was then removed in v7.1 (dd8d4bc28ad7), so
  >=3D v7.1 is unaffected by construction. Ubuntu/Debian/Red Hat
  trackers all still show this as open - it may be worth feeding the
  correction back to them. Caution: the two 2022 Duoming Zhou rose
  patches referenced by Ubuntu's tracker fix different rose bugs and
  are not this CVE's fix.

* CVE-2023-4010: the function named by the CVE (usb_giveback_urb())
  does not exist in the kernel. The reporter's own PoC repo output
  points at drivers/media/rc/imon.c: an unthrottled URB resubmit loop
  producing a printk flood on -EPROTO (Ubuntu triage: "There is no
  system lockup happening"). That loop was stopped by eecd203ada43
  ("media: imon: make send_packet() more robust") in v6.18. The commit
  carries no CVE reference, so this tie is inferred - flagged as such
  in the patch; treating it as "disputed" instead would also be
  defensible.

No fix exists or is planned (proposed as upstream-wontfix/disputed in
the patch):

* CVE-2019-14899: weak host model property, config-only mitigations
  (wg-quick ships a firewall rule); NVD CPE is unversioned so it can
  never match a fixed version.

* CVE-2021-3714: KSM dedup side channel; Red Hat bz#1931327 CLOSED
  WONTFIX. Note CONFIG_KSM=3Dy is set in kernel-cache (intel-x86 BSP and
  paravirt_kvm), but ksmd is off by default and pages must opt in via
  MADV_MERGEABLE/PR_SET_MEMORY_MERGE.

* CVE-2021-3864: setuid coredump LPE; the Waiman Long and Wander
  Costa fix attempts (Dec 2021/Jan 2022) were rejected or fizzled and
  the flagged fs/exec.c logic is unchanged today. Only exploitable
  with a relative kernel.core_pattern; happy to drop this entry if you
  would rather keep it visible for sysvinit images that ship the
  kernel default "core" pattern.

* CVE-2022-0400 (net/smc OOB read): never substantiated - Red Hat
  bz#2044575 CLOSED NOTABUG, SUSE bsc#1195329 RESOLVED INVALID, Debian
  "non issue"; the originating report (bz#2040604) was never made
  public and the CNA recorded no affected version.

* CVE-2022-4543 ("EntryBleed"): entry text is still cloned
  _PAGE_GLOBAL into user page tables (arch/x86/mm/pti.c); upstream and
  Debian position is that KASLR is not a boundary against local
  attackers. One clarification worth recording since the two are often
  confused: 97e3d26b5e5f ("x86/mm: Randomize per-cpu entry area",
  v6.2) is the fix for the cpu_entry_area issue - i.e. CVE-2023-3640,
  as Adhitya identified - and does not address EntryBleed, which leaks
  the KASLR base via entry_SYSCALL_64 itself.

Genuinely unfixed - deliberately NOT added to cve-exclusion.inc, so
they stay visible in the metrics:

* CVE-2023-3397: real subsystem is JFS (txEnd()/lmLogClose() UAF),
  not slub. The only proposed fix (lore
  20230515095956.17898-1-zyytlz.wz@163.com) was withdrawn by its
  author after review; the racy code is unchanged at HEAD and syzbot
  was still reproducing slab-use-after-free in txEnd in June 2026.

* CVE-2023-6238 (NVMe passthrough metadata DMA overflow): a
  mitigation ("nvme: remove unprivileged passthrough support",
  20231016060519.231880-1-joshi.k@samsung.com) was applied to nvme-6.6
  and then explicitly backed out by Keith Busch, over Christoph
  Hellwig's objection ("We leave an exploitable hole in"); nothing
  re-landed and nvme_map_user_request() still passes the user
  meta_len through without an NLB*MS cross-check. One actionable
  nuance: the exposure was introduced by 855b7717f44b in v6.2, so
  linux-yocto branches < v6.2 (5.15, 6.1) are not affected - Debian
  independently reached the same conclusion.

* CVE-2023-6240 ("Marvin" RSA timing oracle): nothing to do with
  Marvell or s390; the leaky code is the generic
  pkcs1pad_decrypt_complete() in crypto/rsa-pkcs1pad.c, which still
  branches on secret-derived data at HEAD. Fixed only in RHEL
  downstream (RHSA-2024:2758 etc.); Ubuntu notes "appears unfixed in
  upstream as of 2024.08.24". Practical exposure needs a service
  driving KEYCTL_PKEY_DECRYPT with a long-lived key, which is narrow,
  but the primitive is present.

I kept CVE-2023-3640 out of the patch since Adhitya has it in hand;
the 4543-vs-3640 note above is just so the two KASLR CVEs don't get
cross-wired in the data later.

Happy to adjust any of the statuses or wording, and to help with the
wrynose/scarthgap backports once the master patch is settled.

Best regards,
Junjie Cao

