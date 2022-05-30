Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0BFC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:39:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.33859.1653892756385246095
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BURp9ZyT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653892754; i=@fujitsu.com;
	bh=a0rDvsxsvojpQPsWO1Gi8wyLiAVn3gcCXz7V+Zf3j7g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BURp9ZyTXabjSa2AUL1iJaYtGWp1EbdAgz9/4GhG2lIIAJCxfsgoPDYO7rhyCAo+L
	 TbBdEi7zx1Iu2H6UZCKwLgfzyC4KId6hOZcL6CY/MWcXWMyFJiekMs7AQwDt5Mncrk
	 rKR7G2tuI3voWWmY+IQ8EdCnOCCd9qM84N4mAvYabzpYgQcghAArQKIZoA3cXWyzqM
	 sFWWo9gerJkbjWcfYhOQ+PiotMH7PBjyZWdkhoetdAIQHCl+PSlZsYF7BZiBzVcmAV
	 h5I9FfjoVJEMIkY2JbZYLUBEY7Wzu8+t0slkNjx2TGqqJ75XSvtt8BJ1UBIDkfBhZG
	 x9XnN3bvIWZ2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqDsxbUq
  SwYSFqhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bTaykFE0QrTv94ztLAOF2oi5GLQ0jgMaPE
  3K6lzBDOeSaJ1QenM0I4exgltk5cAuRwcrAJqElMv3WDtYuRg0NEQE/i6j9RkDCzgIrEi9897
  CC2sIC5ROe35awgNouAqsTXBxeZQWxeASeJzcvfs4HYEgIKElMevgeLcwo4Syz8sghsvBBQza
  y2mYwQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiRkztkHNVJO4em4T8wRGwVlI2mchaV/
  AyLSK0SapKDM9oyQ3MTNH19DAQNfQ0FTX0kzX0NhQL7FKN1EvtVQ3L7+oJEMXyC8v1kstLtYr
  rsxNzknRy0st2cQIDOOU4oTmHYz39v3SO8QoycGkJMp7VnVykhBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3vjkKUlCgkWp6akVaZk5wJiCSUtw8CiJ8C5JAErzFhck5hZnpkOkTjEqSonznk8ESg
  iAJDJK8+DaYHF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb0oq0BSezLwSuOmvgBYzAS3
  mZpoIsrgkESEl1cDkbuZR7Sj+K/2+/bZ9whn8TzZ8iMm1j7NdxJZ+5PCEFgahkkLpLzkWe2f6
  WqjJaysxONxfL8l2k3/32tQVR6rnHS2NZXqpXd/js6RFOUN5g33tReukWdd9Pq27foPt7ipbl
  y8TKus61x59cFLjcH+/+J/aqZ+S+00v3Yr6VcnKPT1FzEZkm+3VG80Bp89/79AobdIV42kQCd
  okd3qD8MTy55oed+3qvoXxFD/ewGfjLha7X5qZ68ABq+i/ASWvuaccmf077fuBH+L32NesnTP
  5wpEus1m1M700j3g0P85K/raycXsUT/wioyLxCyVCxROefju9/UXVojfnFp+V8jZsu9JU+6Bc
  OW9qzXZ+0VVKLMUZiYZazEXFiQAJ0edzXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-745.messagelabs.com!1653892753!114669!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27229 invoked from network); 30 May 2022 06:39:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:39:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E6917100180
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:39:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C15B910018E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:39:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:38:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cups: upgrade 2.4.1 -> 2.4.2
Date: Mon, 30 May 2022 14:38:40 +0800
Message-ID: <1653892722-23407-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653892722-23407-1-git-send-email-wangmy@fujitsu.com>
References: <1653892722-23407-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166265

Changelog:
==========
- Fixed certificate strings comparison for Local authorization (CVE-2022-26691)
- The cupsFileOpen function no longer opens files for append in read-write
  mode (Issue #291)
- The cupsd daemon removed processing temporary queue (Issue #364)
- Fixed delay in IPP backend if GNUTLS is used and endpoint doesn't confirm
  closing the connection (Issue #365)
- Fixed conditional jump based on uninitialized value in cups/ppd.c (Issue #329)
- Fixed CSS related issues in CUPS Web UI (Issue #344)
- Fixed copyright in CUPS Web UI trailer template (Issue #346)
- mDNS hostname in device uri is not resolved when installaling a permanent
- IPP Everywhere queue (Issues #340, #343)
- The lpstat command now reports when the scheduler is not running
  (Issue #352)
- Updated the man pages concerning the -h option (Issue #357)
- Re-added LibreSSL/OpenSSL support (Issue #362)
- Updated the Solaris smf service file (Issue #368)
- Fixed a regression in lpoptions option support (Issue #370)
- The scheduler now regenerates the PPD cache information after changing the
  "cupsd.conf" file (Issue #371)
- Updated the scheduler to set "auth-info-required" to "username,password" if a
  backend reports it needs authentication info but doesn't set a method for
  authentication (Issue #373)
- Updated the configure script to look for the OpenSSL library the old way if
  pkg-config is not available (Issue #375)
- Fixed the prototype for the httpWriteResponse function (Issue #380)
- Brought back minimal AIX support (Issue #389)
  cupsGetResponse did not always set the last error.
- Fixed a number of old references to the Apple CUPS web page.
- Restored the default/generic printer icon file for the web interface.
- Removed old stylesheet classes that are no longer used by the web
  interface.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/cups/{cups_2.4.1.bb => cups_2.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.1.bb => cups_2.4.2.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.1.bb b/meta/recipes-extended/cups/cups_2.4.2.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.1.bb
rename to meta/recipes-extended/cups/cups_2.4.2.bb
index 27c88f82c7..f5ca749bac 100644
--- a/meta/recipes-extended/cups/cups_2.4.1.bb
+++ b/meta/recipes-extended/cups/cups_2.4.2.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "c7339f75f8d4f2dec50c673341a45fc06b6885bb6d4366d6bf59a4e6c10ae178"
+SRC_URI[sha256sum] = "f03ccb40b087d1e30940a40e0141dcbba263f39974c20eb9f2521066c9c6c908"
-- 
2.25.1


