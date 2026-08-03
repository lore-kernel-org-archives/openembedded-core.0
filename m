Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B70C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:50:48 +0000 (UTC)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39092.1785747039968533617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=CwXd9yz2;
 spf=pass (domain: linux.dev, ip: 91.218.175.185, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785747037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2+gYhNkY6i2bJhhPYPWtqxURPLSQDW4cZ70kzzWGI9Q=;
	b=CwXd9yz2jn6g6/X+1AFGu3Z/RlZASz6lckU8aJUjxT+bUwD7D8IAgrewzKyhca1ttFXl5T
	lgy0QVXQlPXapkB9pBj9SYqIxtiVTUi3f1oaYOGMRFg6+BfnQvvs8wirddL7dwk8YxzEhD
	TC/4XLpB7hqggPmMHA34D2uGCYJ3+U4=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 08/10] cve-exclusion: set status for CVE-2023-4010
Date: Mon,  3 Aug 2026 01:48:25 -0700
Message-ID: <20260803084827.1348810-9-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242634

The CVE text attributes a system lockup to usb_giveback_urb() in the USB
HCD framework. That function does not exist in the kernel; the closest
name is usb_giveback_urb_bh(). Ubuntu's security team noted the same
discrepancy when triaging the issue.

The reporter's proof of concept identifies the actual driver. Its
output shows the imon driver repeatedly printing errors and consuming
CPU:

  https://github.com/wanrenmi/a-usb-kernel-bug

usb_rx_callback_intf0() and usb_rx_callback_intf1() in
drivers/media/rc/imon.c resubmitted the RX URB after logging an error,
so a device returning -EPROTO caused an unbounded warning loop. That is
fixed by:

  https://git.kernel.org/linus/eecd203ada43a4693ce6fdd3a58ae10c7819252c
  ("media: imon: make send_packet() more robust", v6.18)

whose commit message describes the same mechanism: "usb_rx_callback_intf0=
()
resubmits urb after printk(), and resubmitted urb causes
usb_rx_callback_intf0() to again get -EPROTO error. This results in
printk() flooding (RCU stalls)". The fix returns early for those error
codes instead of resubmitting.

The impact is lower than the CVE suggests. It needs physical access to
attach a malicious device, and Ubuntu's triage concluded "There is no
system lockup happening", only unthrottled logging:

  https://ubuntu.com/security/CVE-2023-4010

Ubuntu's tracker data reaches the same conclusion about which driver is
at fault: it records "break-fix: 21677cfc562a -" for this CVE, and
21677cfc562a is "V4L/DVB: ir-core: add imon driver", the commit that
introduced the driver. Their note explains the choice: "The imon driver
has been issuing those warnings since its inception, so using that as
the break commit."

The tie to the fixing commit is an inference: eecd203ada43 carries no
CVE reference or Fixes tag, so no tracker links the two. It rests on the
reported function not existing, Ubuntu and the reporter's PoC both
pointing at imon, and the mechanism the commit fixes matching the
report.

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

 meta/recipes-kernel/linux/cve-exclusion.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 827a487e..0647586f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -239,3 +239,8 @@ considered a defence against local attackers"
 # https://lore.kernel.org/all/20230515095956.17898-1-zyytlz.wz@163.com/
 CVE_STATUS[CVE-2023-3397] =3D "unpatched: no upstream fix, the only prop=
osed \
 patch was withdrawn by its author and the affected fs/jfs code is unchan=
ged"
+
+# Fix https://git.kernel.org/linus/eecd203ada43a4693ce6fdd3a58ae10c78192=
52c
+# The CVE names usb_giveback_urb(), which does not exist; the reporter's=
 PoC
+# and Ubuntu's break-fix data both point at drivers/media/rc/imon.c.
+CVE_STATUS[CVE-2023-4010] =3D "fixed-version: Fixed from version 6.18"
--=20
2.43.0


