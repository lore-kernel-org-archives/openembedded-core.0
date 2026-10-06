Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6A7CA6006
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 06:25:06 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39325.1791267900698386649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 23:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f5oWrlR3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lLQEGNrq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a10fe30908-6cbd5714-0e99-4ebc-a5a0-9a4f9946ed59-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791267899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ImiRJn/CCsQEtntZS30Y7Cd6DdpCcyWWTeqNXd/k35I=;
	b=f5oWrlR3coj43CNnZkMb3spw7sZVDr6US9steGFktrZShvkKl0uxHRgrdcbgpgoI
	Oh/6+jkLp1BQi78FUB3Jc/mKGt/7P9mh3QitRfS2N8ml/5goW8D/g+im8FTqv/qFYNG
	gD/FoukKBeM24+TZR92Ib2E34uBLufpmWbna5xdM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791267899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ImiRJn/CCsQEtntZS30Y7Cd6DdpCcyWWTeqNXd/k35I=;
	b=lLQEGNrqcERgyeKJKrxJfUELvJqPcaslYeJBzlrrUXYyjzODK5YSOvjjKyska8m2
	cnIBOUEkB18AxUXzQyyCK6n81Oj4CO0hrJQazqc2fqAKASmp37q/7cbMMagB8RN7d9v
	2HnZMuTxonxaWPuMi4zHCVGuSs9e0B/yYDcV+Lkw=
Content-Type: multipart/mixed; boundary="===============4235717301259117188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.20 SUCCEEDED
Message-ID: <010101a10fe30908-6cbd5714-0e99-4ebc-a5a0-9a4f9946ed59-000000@us-west-2.amazonses.com>
Date: Tue, 6 Oct 2026 06:24:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.06-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 06:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247274

--===============4235717301259117188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cups* to *2.4.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.19-2.4.20.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2a57e57512aeed2f9e03af90da68a64b7eb2c99b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 6 Oct 2026 06:13:57 +0000
Subject: [PATCH] cups: upgrade 2.4.19 -> 2.4.20

v2.4.20 - 2026-10-05
--------------------

- SECURITY-5.7: The scheduler did not open temporary PPD files in exclusive
  mode (CVE-2026-55480)
- SECURITY-5.5: The scheduler did not remove all job status attributes from a
  job creation request (GHSA-7j85-5r23-xhvh)
- SECURITY-5.3: The scheduler did not validate the request language value
  (CVE-2026-61702)
- SECURITY-4.6: Attribute names were not validated as proper keyword values
  (GHSA-w9hj-hq9p-m7f6)
- SECURITY-4.3: The `cupsUTF32toUTF8` function incorrectly treated UTF-32
  values as 64-bit (CVE-2026-87875)
- SECURITY-4.1: Held jobs for temporary print queues could crash the scheduler
  (GHSA-qqm8-4q5h-jg55)
- SECURITY-3.3: The backend did not sanitize IPP attribute strings
  (CVE-2026-55453)
- SECURITY-3.3: The scheduler did not filter out group separators from job
  submissions (GHSA-wjc4-qhjr-5m5x)
- SECURITY-3.0: Quota and policy operations did not treat usernames as case-
  sensitive (CVE-2026-87876)
- SECURITY-3.0: The scheduler's startup permission checks were vulnerable to
  TOU attacks (GHSA-gj33-wxpv-6fgg)
- SECURITY-2.5: The scheduler did not sanitize fax numbers (CVE-2026-55467)
- SECURITY-2.5: The 'mailto' notifier did not sanitize the recipient address
  provided to the sendmail command (CVE-2026-105326)
- SECURITY-2.3: The scheduler could crash when modifying a class
  (GHSA-pwg4-pv39-8c22)
- Increased the size of the SNMP supply name buffer used by the network backends
  (Issue #1604)
- The USB backend now clears a halt on USB errors (Issue #1606)
- Updated a few character tests for signed char platforms (Issue #1623)
- Updated dateTime parsing in IPP files (Issue #1710)
- Now explicitly limit IPP attribute names to 255 bytes (Issue #1694)
- Added validation of IPP "printer-state-reasons" and
  "printer-mandatory-job-attributes" attributes (Issue #1632)
- Added missing Set-Printer-Attributes policy to cupsd.conf.
- Removed problematic debug printfs from `dnssd` backend.
- Fixed mapping of standard PPD/PWG/legacy media size names to the local PPD
  size name (Issue #1375)
- Fixed handling of multiple PPD: keywords from filters (Issue #1562,
  related to CVE-2026-34980)
- Fixed handling of Kerberos user@REALM identities for user validation and
  quotas when StripUserDomain is not enabled (Issue #1584)
- Fixed raster error reporting overflow (Issue #1607)
- Fixed `cupsRasterInterpretPPD` handling of bad numbers (Issue #1608)
- Fixed SNMP hex string debug output (Issue #1610)
- Fixed some web interface bugs (Issue #1611)
- Fixed some compression issues in the rastertoepson and rastertohp drivers
  (Issue #1613)
- Fixed MIME `char` rule handling (Issue #1614)
- Fixed duplicate local printers (Issue #1531, Issue #1586, Issue #1593,
  Issue #1620)
- Fixed PPD cache memory leak (Issue #1629, Issue #1344)
- Fixed escaping of spaces in option values (Issue #1630)
- Fixed potential buffer overflow in `cupsCopyDestConflicts` (Issue #1631)
- Fixed backchannel parsing bug in `commandtops` filter (Issue #1637)
- Fixed section parsing in the web help indexing code (Issue #1641)
- Fixed potential buffer overrun in rastertolabel filter (Issue #1644)
- Fixed potential buffer overrun in rastertohp filter (Issue #1650)
- Fixed media selection with a mix of PPD and IPP options (Issue #1651)
- Fixed potential access of deleted IPP Everywhere printer (Issue #1655)
- Fixed limiting of PPD custom number output for large numbers (Issue #1656)
- Fixed a potential output length bug in the rastertohp driver (Issue #1658)
- Fixed a potential buffer underflow buf in the `ippAdd/SetStringf(v)` functions
  (Issue #1664)
- Fixed handling of TLS system priorities (Issue #1677)
- Fixed D-Bus notification policy definition (Issue #1691)
- Fixed raster fallback for IPP Everywhere printers (Issue #1703)
- Fixed potential SNMP OID side-channel overflow (Issue #1719)
- Fixed potential scheduler printer use-after-free bug (Issue #1722)
- Fixed several issues reported by Coverity
- Fixed case-sensitive PPD keyword comparisons when filtering keyword updates
  from filters.
- Fixed potential buffer overrun in `cupsDoAuthentication`.

v2.4.19 - 2026-04-27
--------------------

- Fixed a regression in shared printing from non-local accounts (Issue #1557,
  related to CVE-2026-27447)

v2.4.18 - 2026-04-22
--------------------

- Fixed cupsd crash if user does not exist (Issue #1555, related to
  CVE-2026-27447)

v2.4.17 - 2026-04-17
--------------------
v2.4.16 - 2025-12-04
--------------------
v2.4.15 - 2025-11-27
--------------------
v2.4.14 - 2025-09-11
--------------------
v2.4.13 - 2025-09-11
--------------------
v2.4.12 - 2025-04-08
--------------------
v2.4.11 - 2024-09-30
--------------------
v2.4.10 - 2024-06-18
--------------------
v2.4.9 - 2024-06-11
-------------------
v2.4.8 - 2024-04-26
-------------------
v2.4.7 - 2023-09-20
-------------------
v2.4.6 - 2023-06-22
-------------------
v2.4.5 - 2023-06-13
-------------------
v2.4.4 - 2023-06-06
-------------------
v2.4.3

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../recipes-extended/cups/cups/0001-use-echo-only-in-init.patch | 2 +-
 .../cups/cups/0002-don-t-try-to-run-generated-binaries.patch    | 2 +-
 .../cups/0004-cups-fix-multilib-install-file-conflicts.patch    | 2 +-
 meta/recipes-extended/cups/cups/libexecdir.patch                | 2 +-
 meta/recipes-extended/cups/{cups_2.4.19.bb => cups_2.4.20.bb}   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.19.bb => cups_2.4.20.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index e4b473aaf3..ca92548cbe 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From 575a890a818e8ddc95d22838480b62988ffcd639 Mon Sep 17 00:00:00 2001
+From 4b7e48fb41dce9c10a4c4f91dc9fabfb14b9f1d7 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 378ef677a5..b79b8be307 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From 36fa890e4b30bf42318065fe3172ef92b2d3e313 Mon Sep 17 00:00:00 2001
+From 9818e95ed747752e37d792693d3bf971af765084 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 2728fc7e3c..7dd5920338 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 53aeff85692ce3fd0ac325ec7dcdff31748ccee6 Mon Sep 17 00:00:00 2001
+From c9c54505f5c1f77d598e8e1baea09a3794a4f5d9 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 4acff27e54..4fdc2d7da4 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From fab57dbafccee851b22b757f08fc3273ad78b8ae Mon Sep 17 00:00:00 2001
+From 97f71812d2553661ccac15eaf7fd354824339ef8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
diff --git a/meta/recipes-extended/cups/cups_2.4.19.bb b/meta/recipes-extended/cups/cups_2.4.20.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.19.bb
rename to meta/recipes-extended/cups/cups_2.4.20.bb
index c4885b60bc..18ab74c783 100644
--- a/meta/recipes-extended/cups/cups_2.4.19.bb
+++ b/meta/recipes-extended/cups/cups_2.4.20.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389"
+SRC_URI[sha256sum] = "ab4d9cd7f3e58060091d2b24972223d6401675f11c49b65abf4f6ef31dea22ff"
-- 
2.47.1


--===============4235717301259117188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.19-2.4.20.patch"

RnJvbSAyYTU3ZTU3NTEyYWVlZDJmOWUwM2FmOTBkYTY4YTY0YjdlYjJjOTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNiBPY3QgMjAyNiAwNjoxMzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cHM6IHVwZ3JhZGUgMi40LjE5IC0+IDIuNC4yMAoKdjIuNC4yMCAtIDIwMjYtMTAtMDUKLS0tLS0t
LS0tLS0tLS0tLS0tLS0KCi0gU0VDVVJJVFktNS43OiBUaGUgc2NoZWR1bGVyIGRpZCBub3Qgb3Bl
biB0ZW1wb3JhcnkgUFBEIGZpbGVzIGluIGV4Y2x1c2l2ZQogIG1vZGUgKENWRS0yMDI2LTU1NDgw
KQotIFNFQ1VSSVRZLTUuNTogVGhlIHNjaGVkdWxlciBkaWQgbm90IHJlbW92ZSBhbGwgam9iIHN0
YXR1cyBhdHRyaWJ1dGVzIGZyb20gYQogIGpvYiBjcmVhdGlvbiByZXF1ZXN0IChHSFNBLTdqODUt
NXIyMy14aHZoKQotIFNFQ1VSSVRZLTUuMzogVGhlIHNjaGVkdWxlciBkaWQgbm90IHZhbGlkYXRl
IHRoZSByZXF1ZXN0IGxhbmd1YWdlIHZhbHVlCiAgKENWRS0yMDI2LTYxNzAyKQotIFNFQ1VSSVRZ
LTQuNjogQXR0cmlidXRlIG5hbWVzIHdlcmUgbm90IHZhbGlkYXRlZCBhcyBwcm9wZXIga2V5d29y
ZCB2YWx1ZXMKICAoR0hTQS13OWhqLWhxOXAtbTdmNikKLSBTRUNVUklUWS00LjM6IFRoZSBgY3Vw
c1VURjMydG9VVEY4YCBmdW5jdGlvbiBpbmNvcnJlY3RseSB0cmVhdGVkIFVURi0zMgogIHZhbHVl
cyBhcyA2NC1iaXQgKENWRS0yMDI2LTg3ODc1KQotIFNFQ1VSSVRZLTQuMTogSGVsZCBqb2JzIGZv
ciB0ZW1wb3JhcnkgcHJpbnQgcXVldWVzIGNvdWxkIGNyYXNoIHRoZSBzY2hlZHVsZXIKICAoR0hT
QS1xcW04LTRxNWgtamc1NSkKLSBTRUNVUklUWS0zLjM6IFRoZSBiYWNrZW5kIGRpZCBub3Qgc2Fu
aXRpemUgSVBQIGF0dHJpYnV0ZSBzdHJpbmdzCiAgKENWRS0yMDI2LTU1NDUzKQotIFNFQ1VSSVRZ
LTMuMzogVGhlIHNjaGVkdWxlciBkaWQgbm90IGZpbHRlciBvdXQgZ3JvdXAgc2VwYXJhdG9ycyBm
cm9tIGpvYgogIHN1Ym1pc3Npb25zIChHSFNBLXdqYzQtcWhqci01bTV4KQotIFNFQ1VSSVRZLTMu
MDogUXVvdGEgYW5kIHBvbGljeSBvcGVyYXRpb25zIGRpZCBub3QgdHJlYXQgdXNlcm5hbWVzIGFz
IGNhc2UtCiAgc2Vuc2l0aXZlIChDVkUtMjAyNi04Nzg3NikKLSBTRUNVUklUWS0zLjA6IFRoZSBz
Y2hlZHVsZXIncyBzdGFydHVwIHBlcm1pc3Npb24gY2hlY2tzIHdlcmUgdnVsbmVyYWJsZSB0bwog
IFRPVSBhdHRhY2tzIChHSFNBLWdqMzMtd3hwdi02ZmdnKQotIFNFQ1VSSVRZLTIuNTogVGhlIHNj
aGVkdWxlciBkaWQgbm90IHNhbml0aXplIGZheCBudW1iZXJzIChDVkUtMjAyNi01NTQ2NykKLSBT
RUNVUklUWS0yLjU6IFRoZSAnbWFpbHRvJyBub3RpZmllciBkaWQgbm90IHNhbml0aXplIHRoZSBy
ZWNpcGllbnQgYWRkcmVzcwogIHByb3ZpZGVkIHRvIHRoZSBzZW5kbWFpbCBjb21tYW5kIChDVkUt
MjAyNi0xMDUzMjYpCi0gU0VDVVJJVFktMi4zOiBUaGUgc2NoZWR1bGVyIGNvdWxkIGNyYXNoIHdo
ZW4gbW9kaWZ5aW5nIGEgY2xhc3MKICAoR0hTQS1wd2c0LXB2MzktOGMyMikKLSBJbmNyZWFzZWQg
dGhlIHNpemUgb2YgdGhlIFNOTVAgc3VwcGx5IG5hbWUgYnVmZmVyIHVzZWQgYnkgdGhlIG5ldHdv
cmsgYmFja2VuZHMKICAoSXNzdWUgIzE2MDQpCi0gVGhlIFVTQiBiYWNrZW5kIG5vdyBjbGVhcnMg
YSBoYWx0IG9uIFVTQiBlcnJvcnMgKElzc3VlICMxNjA2KQotIFVwZGF0ZWQgYSBmZXcgY2hhcmFj
dGVyIHRlc3RzIGZvciBzaWduZWQgY2hhciBwbGF0Zm9ybXMgKElzc3VlICMxNjIzKQotIFVwZGF0
ZWQgZGF0ZVRpbWUgcGFyc2luZyBpbiBJUFAgZmlsZXMgKElzc3VlICMxNzEwKQotIE5vdyBleHBs
aWNpdGx5IGxpbWl0IElQUCBhdHRyaWJ1dGUgbmFtZXMgdG8gMjU1IGJ5dGVzIChJc3N1ZSAjMTY5
NCkKLSBBZGRlZCB2YWxpZGF0aW9uIG9mIElQUCAicHJpbnRlci1zdGF0ZS1yZWFzb25zIiBhbmQK
ICAicHJpbnRlci1tYW5kYXRvcnktam9iLWF0dHJpYnV0ZXMiIGF0dHJpYnV0ZXMgKElzc3VlICMx
NjMyKQotIEFkZGVkIG1pc3NpbmcgU2V0LVByaW50ZXItQXR0cmlidXRlcyBwb2xpY3kgdG8gY3Vw
c2QuY29uZi4KLSBSZW1vdmVkIHByb2JsZW1hdGljIGRlYnVnIHByaW50ZnMgZnJvbSBgZG5zc2Rg
IGJhY2tlbmQuCi0gRml4ZWQgbWFwcGluZyBvZiBzdGFuZGFyZCBQUEQvUFdHL2xlZ2FjeSBtZWRp
YSBzaXplIG5hbWVzIHRvIHRoZSBsb2NhbCBQUEQKICBzaXplIG5hbWUgKElzc3VlICMxMzc1KQot
IEZpeGVkIGhhbmRsaW5nIG9mIG11bHRpcGxlIFBQRDoga2V5d29yZHMgZnJvbSBmaWx0ZXJzIChJ
c3N1ZSAjMTU2MiwKICByZWxhdGVkIHRvIENWRS0yMDI2LTM0OTgwKQotIEZpeGVkIGhhbmRsaW5n
IG9mIEtlcmJlcm9zIHVzZXJAUkVBTE0gaWRlbnRpdGllcyBmb3IgdXNlciB2YWxpZGF0aW9uIGFu
ZAogIHF1b3RhcyB3aGVuIFN0cmlwVXNlckRvbWFpbiBpcyBub3QgZW5hYmxlZCAoSXNzdWUgIzE1
ODQpCi0gRml4ZWQgcmFzdGVyIGVycm9yIHJlcG9ydGluZyBvdmVyZmxvdyAoSXNzdWUgIzE2MDcp
Ci0gRml4ZWQgYGN1cHNSYXN0ZXJJbnRlcnByZXRQUERgIGhhbmRsaW5nIG9mIGJhZCBudW1iZXJz
IChJc3N1ZSAjMTYwOCkKLSBGaXhlZCBTTk1QIGhleCBzdHJpbmcgZGVidWcgb3V0cHV0IChJc3N1
ZSAjMTYxMCkKLSBGaXhlZCBzb21lIHdlYiBpbnRlcmZhY2UgYnVncyAoSXNzdWUgIzE2MTEpCi0g
Rml4ZWQgc29tZSBjb21wcmVzc2lvbiBpc3N1ZXMgaW4gdGhlIHJhc3RlcnRvZXBzb24gYW5kIHJh
c3RlcnRvaHAgZHJpdmVycwogIChJc3N1ZSAjMTYxMykKLSBGaXhlZCBNSU1FIGBjaGFyYCBydWxl
IGhhbmRsaW5nIChJc3N1ZSAjMTYxNCkKLSBGaXhlZCBkdXBsaWNhdGUgbG9jYWwgcHJpbnRlcnMg
KElzc3VlICMxNTMxLCBJc3N1ZSAjMTU4NiwgSXNzdWUgIzE1OTMsCiAgSXNzdWUgIzE2MjApCi0g
Rml4ZWQgUFBEIGNhY2hlIG1lbW9yeSBsZWFrIChJc3N1ZSAjMTYyOSwgSXNzdWUgIzEzNDQpCi0g
Rml4ZWQgZXNjYXBpbmcgb2Ygc3BhY2VzIGluIG9wdGlvbiB2YWx1ZXMgKElzc3VlICMxNjMwKQot
IEZpeGVkIHBvdGVudGlhbCBidWZmZXIgb3ZlcmZsb3cgaW4gYGN1cHNDb3B5RGVzdENvbmZsaWN0
c2AgKElzc3VlICMxNjMxKQotIEZpeGVkIGJhY2tjaGFubmVsIHBhcnNpbmcgYnVnIGluIGBjb21t
YW5kdG9wc2AgZmlsdGVyIChJc3N1ZSAjMTYzNykKLSBGaXhlZCBzZWN0aW9uIHBhcnNpbmcgaW4g
dGhlIHdlYiBoZWxwIGluZGV4aW5nIGNvZGUgKElzc3VlICMxNjQxKQotIEZpeGVkIHBvdGVudGlh
bCBidWZmZXIgb3ZlcnJ1biBpbiByYXN0ZXJ0b2xhYmVsIGZpbHRlciAoSXNzdWUgIzE2NDQpCi0g
Rml4ZWQgcG90ZW50aWFsIGJ1ZmZlciBvdmVycnVuIGluIHJhc3RlcnRvaHAgZmlsdGVyIChJc3N1
ZSAjMTY1MCkKLSBGaXhlZCBtZWRpYSBzZWxlY3Rpb24gd2l0aCBhIG1peCBvZiBQUEQgYW5kIElQ
UCBvcHRpb25zIChJc3N1ZSAjMTY1MSkKLSBGaXhlZCBwb3RlbnRpYWwgYWNjZXNzIG9mIGRlbGV0
ZWQgSVBQIEV2ZXJ5d2hlcmUgcHJpbnRlciAoSXNzdWUgIzE2NTUpCi0gRml4ZWQgbGltaXRpbmcg
b2YgUFBEIGN1c3RvbSBudW1iZXIgb3V0cHV0IGZvciBsYXJnZSBudW1iZXJzIChJc3N1ZSAjMTY1
NikKLSBGaXhlZCBhIHBvdGVudGlhbCBvdXRwdXQgbGVuZ3RoIGJ1ZyBpbiB0aGUgcmFzdGVydG9o
cCBkcml2ZXIgKElzc3VlICMxNjU4KQotIEZpeGVkIGEgcG90ZW50aWFsIGJ1ZmZlciB1bmRlcmZs
b3cgYnVmIGluIHRoZSBgaXBwQWRkL1NldFN0cmluZ2YodilgIGZ1bmN0aW9ucwogIChJc3N1ZSAj
MTY2NCkKLSBGaXhlZCBoYW5kbGluZyBvZiBUTFMgc3lzdGVtIHByaW9yaXRpZXMgKElzc3VlICMx
Njc3KQotIEZpeGVkIEQtQnVzIG5vdGlmaWNhdGlvbiBwb2xpY3kgZGVmaW5pdGlvbiAoSXNzdWUg
IzE2OTEpCi0gRml4ZWQgcmFzdGVyIGZhbGxiYWNrIGZvciBJUFAgRXZlcnl3aGVyZSBwcmludGVy
cyAoSXNzdWUgIzE3MDMpCi0gRml4ZWQgcG90ZW50aWFsIFNOTVAgT0lEIHNpZGUtY2hhbm5lbCBv
dmVyZmxvdyAoSXNzdWUgIzE3MTkpCi0gRml4ZWQgcG90ZW50aWFsIHNjaGVkdWxlciBwcmludGVy
IHVzZS1hZnRlci1mcmVlIGJ1ZyAoSXNzdWUgIzE3MjIpCi0gRml4ZWQgc2V2ZXJhbCBpc3N1ZXMg
cmVwb3J0ZWQgYnkgQ292ZXJpdHkKLSBGaXhlZCBjYXNlLXNlbnNpdGl2ZSBQUEQga2V5d29yZCBj
b21wYXJpc29ucyB3aGVuIGZpbHRlcmluZyBrZXl3b3JkIHVwZGF0ZXMKICBmcm9tIGZpbHRlcnMu
Ci0gRml4ZWQgcG90ZW50aWFsIGJ1ZmZlciBvdmVycnVuIGluIGBjdXBzRG9BdXRoZW50aWNhdGlv
bmAuCgp2Mi40LjE5IC0gMjAyNi0wNC0yNwotLS0tLS0tLS0tLS0tLS0tLS0tLQoKLSBGaXhlZCBh
IHJlZ3Jlc3Npb24gaW4gc2hhcmVkIHByaW50aW5nIGZyb20gbm9uLWxvY2FsIGFjY291bnRzIChJ
c3N1ZSAjMTU1NywKICByZWxhdGVkIHRvIENWRS0yMDI2LTI3NDQ3KQoKdjIuNC4xOCAtIDIwMjYt
MDQtMjIKLS0tLS0tLS0tLS0tLS0tLS0tLS0KCi0gRml4ZWQgY3Vwc2QgY3Jhc2ggaWYgdXNlciBk
b2VzIG5vdCBleGlzdCAoSXNzdWUgIzE1NTUsIHJlbGF0ZWQgdG8KICBDVkUtMjAyNi0yNzQ0NykK
CnYyLjQuMTcgLSAyMDI2LTA0LTE3Ci0tLS0tLS0tLS0tLS0tLS0tLS0tCnYyLjQuMTYgLSAyMDI1
LTEyLTA0Ci0tLS0tLS0tLS0tLS0tLS0tLS0tCnYyLjQuMTUgLSAyMDI1LTExLTI3Ci0tLS0tLS0t
LS0tLS0tLS0tLS0tCnYyLjQuMTQgLSAyMDI1LTA5LTExCi0tLS0tLS0tLS0tLS0tLS0tLS0tCnYy
LjQuMTMgLSAyMDI1LTA5LTExCi0tLS0tLS0tLS0tLS0tLS0tLS0tCnYyLjQuMTIgLSAyMDI1LTA0
LTA4Ci0tLS0tLS0tLS0tLS0tLS0tLS0tCnYyLjQuMTEgLSAyMDI0LTA5LTMwCi0tLS0tLS0tLS0t
LS0tLS0tLS0tCnYyLjQuMTAgLSAyMDI0LTA2LTE4Ci0tLS0tLS0tLS0tLS0tLS0tLS0tCnYyLjQu
OSAtIDIwMjQtMDYtMTEKLS0tLS0tLS0tLS0tLS0tLS0tLQp2Mi40LjggLSAyMDI0LTA0LTI2Ci0t
LS0tLS0tLS0tLS0tLS0tLS0KdjIuNC43IC0gMjAyMy0wOS0yMAotLS0tLS0tLS0tLS0tLS0tLS0t
CnYyLjQuNiAtIDIwMjMtMDYtMjIKLS0tLS0tLS0tLS0tLS0tLS0tLQp2Mi40LjUgLSAyMDIzLTA2
LTEzCi0tLS0tLS0tLS0tLS0tLS0tLS0KdjIuNC40IC0gMjAyMy0wNi0wNgotLS0tLS0tLS0tLS0t
LS0tLS0tCnYyLjQuMwoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyA1MDAwIGNo
YXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVu
dCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8w
MDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaCB8IDIgKy0KIC4uLi9jdXBzL2N1cHMvMDAw
Mi1kb24tdC10cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaCAgICB8IDIgKy0KIC4u
Li9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRj
aCAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5w
YXRjaCAgICAgICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL3tj
dXBzXzIuNC4xOS5iYiA9PiBjdXBzXzIuNC4yMC5iYn0gICB8IDIgKy0KIDUgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9jdXBzL3tjdXBzXzIuNC4xOS5iYiA9PiBjdXBzXzIuNC4yMC5iYn0gKDUxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8t
b25seS1pbi1pbml0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAx
LXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaAppbmRleCBlNGI0NzNhYWYzLi5jYTkyNTQ4Y2Jl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVj
aG8tb25seS1pbi1pbml0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1
cHMvMDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDU3NWE4OTBhODE4ZThkZGM5NWQyMjgzODQ4MGI2Mjk4OGZmY2Q2MzkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDRiN2U0OGZiNDFkY2U5YzEwYTRjNGY5MWRjOWZhYmZiMTRiOWYxZDcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRl
bC5jb20+CiBEYXRlOiBUaHUsIDEzIERlYyAyMDEyIDE5OjAzOjUyIC0wODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHVzZSBlY2hvIG9ubHkgaW4gaW5pdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10
by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoCmluZGV4IDM3OGVmNjc3YTUuLmI3OWI4YmUz
MDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24t
dC10cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJp
ZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM2ZmE4OTBlNGIzMGJmNDIzMTgwNjVmZTMx
NzJlZjkyYjJkM2UzMTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk4MThlOTVlZDc0
Nzc1MmUzN2Q3OTI2OTNkM2JmOTcxYWY3NjUwODQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBLb2VuIEtvb2kgPGtvZW5AZG9taW5pb24udGhydWhlcmUubmV0PgogRGF0ZTogU3VuLCAz
MCBKYW4gMjAxMSAxNjozNzoyNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBkb24ndCB0cnkgdG8g
cnVuIGdlbmVyYXRlZCBiaW5hcmllcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2N1cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVs
dGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaAppbmRleCAyNzI4ZmM3ZTNjLi43ZGQ1
OTIwMzM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQt
Y3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFs
bC1maWxlLWNvbmZsaWN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTNhZWZmODU2OTJj
ZTNmZDBhYzMyNWVjN2RjZGZmMzE3NDhjY2VlNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYzljNTQ1MDVmNWMxZjc3ZDU5OGU4ZTFiYWVhMDlhMzc5NGE0ZjVkOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0
ZTogV2VkLCAzIE9jdCAyMDE4IDAwOjI3OjExICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGN1cHM6
IGZpeCBtdWx0aWxpYiBpbnN0YWxsIGZpbGUgY29uZmxpY3RzCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gKaW5kZXggNGFjZmYyN2U1NC4uNGZk
YzJkN2RhNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9saWJl
eGVjZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhl
Y2Rpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmFiNTdkYmFmY2NlZTg1MWIyMmI3NTdm
MDhmYzMyNzNhZDc4YjhhZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTdmNzE4MTJk
MjU1MzY2MWNjYWMxNWVhZjdmZDM1NDgyNDMzOWVmOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogVHVlLCAxMyBK
dWwgMjAyMSAxMjo1NjozMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBVc2UgJGxpYmV4ZWNkaXIg
aW5zdGVhZCBvZiBoYXJkY29kaW5nICRwcmVmaXgvbGliIGFzIHRoaXMKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjE5LmJiIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2N1cHMvY3Vwc18yLjQuMjAuYmIKc2ltaWxhcml0eSBpbmRleCA1MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTkuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjIwLmJiCmluZGV4IGM0ODg1YjYwYmMu
LjE4YWI3NGM3ODMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNf
Mi40LjE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjIwLmJi
CkBAIC0yLDQgKzIsNCBAQCByZXF1aXJlIGN1cHMuaW5jCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiODIwOTg0YjEyYTY3Zjk4NzA1Nzg1YWFlMmRkMTM0N2ZlMGFj
MDk3ODI4MDAxZDQ1ODNmZjY0NTc0YWVkNjM4OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYjRk
OWNkN2YzZTU4MDYwMDkxZDJiMjQ5NzIyMjNkNjQwMTY3NWYxMWM0OWI2NWFiZjRmNmVmMzFkZWEy
MmZmIgotLSAKMi40Ny4xCgo=

--===============4235717301259117188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cups/cups-dbg: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-dbg: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-dbg: PKGSIZE changed from 9074704 to 9083136 (+0%)
packages/x86-64-v3-poky-linux/cups/cups-dev: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-dev: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-dev: PKGSIZE changed from 188710 to 188741 (+0%)
packages/x86-64-v3-poky-linux/cups/cups-doc: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-doc: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-lib: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-lib: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-lib: PKGSIZE changed from 686088 to 690184 (+1%)
packages/x86-64-v3-poky-linux/cups/cups-libimage: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-libimage: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ca: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-cs: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-da: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-de: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-en: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-es: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-fr: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-it: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ja: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ru: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-src: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-src: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-src: FILELIST: directory renamed /usr/src/debug/cups/2.4.19/systemv -> /usr/src/debug/cups/2.4.20/systemv, directory renamed /usr/src/debug/cups/2.4.19/scheduler -> /usr/src/debug/cups/2.4.20/scheduler, directory renamed /usr/src/debug/cups/2.4.19/monitor -> /usr/src/debug/cups/2.4.20/monitor, directory renamed /usr/src/debug/cups/2.4.19/cgi-bin -> /usr/src/debug/cups/2.4.20/cgi-bin, directory renamed /usr/src/debug/cups/2.4.19/tools -> /usr/src/debug/cups/2.4.20/tools, directory renamed /usr/src/debug/cups/2.4.19/ppdc -> /usr/src/debug/cups/2.4.20/ppdc, directory renamed /usr/src/debug/cups/2.4.19/cups -> /usr/src/debug/cups/2.4.20/cups, directory renamed /usr/src/debug/cups/2.4.19/berkeley -> /usr/src/debug/cups/2.4.20/berkeley, directory renamed /usr/src/debug/cups/2.4.19/notifier -> /usr/src/debug/cups/2.4.20/notifier, directory renamed /usr/src/debug/cups/2.4.19/backend -> /usr/src/debug/cups/2.4.20/backend, removed "/usr/src/debug/cups/2.
 4.19/filter/common.c /usr/src/debug/cups/2.4.19/filter/pstops.c /usr/src/debug/cups/2.4.19/filter/gziptoany.c /usr/src/debug/cups/2.4.19/filter/common.h /usr/src/debug/cups/2.4.19/filter/commandtops.c /usr/src/debug/cups/2.4.19/filter/rastertohp.c /usr/src/debug/cups/2.4.19/filter/rastertoepson.c /usr/src/debug/cups/2.4.19/filter/rastertopwg.c /usr/src/debug/cups/2.4.19/filter/rastertolabel.c", added "/usr/src/debug/cups/2.4.20/filter/common.c /usr/src/debug/cups/2.4.20/filter/pstops.c /usr/src/debug/cups/2.4.20/filter/commandtops.c /usr/src/debug/cups/2.4.20/filter/common.h /usr/src/debug/cups/2.4.20/filter/rastertopwg.c /usr/src/debug/cups/2.4.20/filter/rastertohp.c /usr/src/debug/cups/2.4.20/filter/rastertoepson.c /usr/src/debug/cups/2.4.20/filter/rastertolabel.c /usr/src/debug/cups/2.4.20/filter/packbits.h /usr/src/debug/cups/2.4.20/filter/gziptoany.c"
packages/x86-64-v3-poky-linux/cups/cups-src: PKGSIZE changed from 6010632 to 6020394 (+0%)
packages/x86-64-v3-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-staticdev: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups-webif: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups-webif: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups/cups: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups/cups: PKGSIZE changed from 7389869 to 7391089 (+0%)
packages/x86-64-v3-poky-linux/cups: PKGV changed from 2.4.19 [default] to 2.4.20 [default]
packages/x86-64-v3-poky-linux/cups: PV changed from "2.4.19" to "2.4.20"
packages/x86-64-v3-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.19/cups-2.4.19-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.20/cups-2.4.20-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"

--===============4235717301259117188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cups-changelog.txt"

v2.4.20 - 2026-10-05
--------------------

- SECURITY-5.7: The scheduler did not open temporary PPD files in exclusive
  mode (CVE-2026-55480)
- SECURITY-5.5: The scheduler did not remove all job status attributes from a
  job creation request (GHSA-7j85-5r23-xhvh)
- SECURITY-5.3: The scheduler did not validate the request language value
  (CVE-2026-61702)
- SECURITY-4.6: Attribute names were not validated as proper keyword values
  (GHSA-w9hj-hq9p-m7f6)
- SECURITY-4.3: The `cupsUTF32toUTF8` function incorrectly treated UTF-32
  values as 64-bit (CVE-2026-87875)
- SECURITY-4.1: Held jobs for temporary print queues could crash the scheduler
  (GHSA-qqm8-4q5h-jg55)
- SECURITY-3.3: The backend did not sanitize IPP attribute strings
  (CVE-2026-55453)
- SECURITY-3.3: The scheduler did not filter out group separators from job
  submissions (GHSA-wjc4-qhjr-5m5x)
- SECURITY-3.0: Quota and policy operations did not treat usernames as case-
  sensitive (CVE-2026-87876)
- SECURITY-3.0: The scheduler's startup permission checks were vulnerable to
  TOU attacks (GHSA-gj33-wxpv-6fgg)
- SECURITY-2.5: The scheduler did not sanitize fax numbers (CVE-2026-55467)
- SECURITY-2.5: The 'mailto' notifier did not sanitize the recipient address
  provided to the sendmail command (CVE-2026-105326)
- SECURITY-2.3: The scheduler could crash when modifying a class
  (GHSA-pwg4-pv39-8c22)
- Increased the size of the SNMP supply name buffer used by the network backends
  (Issue #1604)
- The USB backend now clears a halt on USB errors (Issue #1606)
- Updated a few character tests for signed char platforms (Issue #1623)
- Updated dateTime parsing in IPP files (Issue #1710)
- Now explicitly limit IPP attribute names to 255 bytes (Issue #1694)
- Added validation of IPP "printer-state-reasons" and
  "printer-mandatory-job-attributes" attributes (Issue #1632)
- Added missing Set-Printer-Attributes policy to cupsd.conf.
- Removed problematic debug printfs from `dnssd` backend.
- Fixed mapping of standard PPD/PWG/legacy media size names to the local PPD
  size name (Issue #1375)
- Fixed handling of multiple PPD: keywords from filters (Issue #1562,
  related to CVE-2026-34980)
- Fixed handling of Kerberos user@REALM identities for user validation and
  quotas when StripUserDomain is not enabled (Issue #1584)
- Fixed raster error reporting overflow (Issue #1607)
- Fixed `cupsRasterInterpretPPD` handling of bad numbers (Issue #1608)
- Fixed SNMP hex string debug output (Issue #1610)
- Fixed some web interface bugs (Issue #1611)
- Fixed some compression issues in the rastertoepson and rastertohp drivers
  (Issue #1613)
- Fixed MIME `char` rule handling (Issue #1614)
- Fixed duplicate local printers (Issue #1531, Issue #1586, Issue #1593,
  Issue #1620)
- Fixed PPD cache memory leak (Issue #1629, Issue #1344)
- Fixed escaping of spaces in option values (Issue #1630)
- Fixed potential buffer overflow in `cupsCopyDestConflicts` (Issue #1631)
- Fixed backchannel parsing bug in `commandtops` filter (Issue #1637)
- Fixed section parsing in the web help indexing code (Issue #1641)
- Fixed potential buffer overrun in rastertolabel filter (Issue #1644)
- Fixed potential buffer overrun in rastertohp filter (Issue #1650)
- Fixed media selection with a mix of PPD and IPP options (Issue #1651)
- Fixed potential access of deleted IPP Everywhere printer (Issue #1655)
- Fixed limiting of PPD custom number output for large numbers (Issue #1656)
- Fixed a potential output length bug in the rastertohp driver (Issue #1658)
- Fixed a potential buffer underflow buf in the `ippAdd/SetStringf(v)` functions
  (Issue #1664)
- Fixed handling of TLS system priorities (Issue #1677)
- Fixed D-Bus notification policy definition (Issue #1691)
- Fixed raster fallback for IPP Everywhere printers (Issue #1703)
- Fixed potential SNMP OID side-channel overflow (Issue #1719)
- Fixed potential scheduler printer use-after-free bug (Issue #1722)
- Fixed several issues reported by Coverity
- Fixed case-sensitive PPD keyword comparisons when filtering keyword updates
  from filters.
- Fixed potential buffer overrun in `cupsDoAuthentication`.

v2.4.19 - 2026-04-27
--------------------

- Fixed a regression in shared printing from non-local accounts (Issue #1557,
  related to CVE-2026-27447)

v2.4.18 - 2026-04-22
--------------------

- Fixed cupsd crash if user does not exist (Issue #1555, related to
  CVE-2026-27447)

v2.4.17 - 2026-04-17
--------------------
v2.4.16 - 2025-12-04
--------------------
v2.4.15 - 2025-11-27
--------------------
v2.4.14 - 2025-09-11
--------------------
v2.4.13 - 2025-09-11
--------------------
v2.4.12 - 2025-04-08
--------------------
v2.4.11 - 2024-09-30
--------------------
v2.4.10 - 2024-06-18
--------------------
v2.4.9 - 2024-06-11
-------------------
v2.4.8 - 2024-04-26
-------------------
v2.4.7 - 2023-09-20
-------------------
v2.4.6 - 2023-06-22
-------------------
v2.4.5 - 2023-06-13
-------------------
v2.4.4 - 2023-06-06
-------------------
v2.4.3 - 2023-06-01
-------------------
v2.4.2 - 2022-05-26
-------------------
v2.4.1 - 2022-01-27
-------------------
v2.4.0 - 2021-11-29
-------------------
v2.4rc1 - 2021-11-12
--------------------
v2.4b1 - 2021-10-27
-------------------

--===============4235717301259117188==--

