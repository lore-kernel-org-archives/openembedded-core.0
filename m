Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9878CCA600D
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 05:25:55 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9311.1791437152455356136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 22:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N9bxe9X8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wVzJPyCw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a119f99d03-2896a353-2e47-45c2-abbf-1eef52662a14-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791437151;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wqYBZmg0v4MN+pC+Q3X8DYpFbOkKT3YtpRdqWjjeG5M=;
	b=N9bxe9X8Jyko9k2cukreaP/TKuSFCxCJ6q0UPjGWFEJSBnVyNCPj2anv9wwde+ze
	cfqi+bJkqUvvtHfUHyTjU/owoCr2BES5Kl7/PJQJy7SQIvbr6AdTely6Vqpc93WZieL
	+sXzrcD03XP1Z0oUvSNALnNnlDp/OjPfYo/XxawY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791437151;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wqYBZmg0v4MN+pC+Q3X8DYpFbOkKT3YtpRdqWjjeG5M=;
	b=wVzJPyCwjl6Gsi012KYE6OjFg7gce1hgqV2gKr17nRdXQNA30GxEFCevSBAR3542
	8YLxENSeZRwdYbghn+FwOvk+kYFhSeMmhRQ4BBRKCEA4Tf+enP3dfUlsGaMLF5uOOsX
	C5AINOEPePHfpGvEe6xosh6H4QYFzEgjAdFEgpKQ=
Content-Type: multipart/mixed; boundary="===============8270114312895048594=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] powertop: upgrading to 2.16.1 SUCCEEDED
Message-ID: <010101a119f99d03-2896a353-2e47-45c2-abbf-1eef52662a14-000000@us-west-2.amazonses.com>
Date: Thu, 8 Oct 2026 05:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.08-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 05:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247411

--===============8270114312895048594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *powertop* to *2.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-powertop-upgrade-2.16-2.16.1.patch
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
From 243d0f10f9d8771314a9440acd4a02a49d0346a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 8 Oct 2026 05:22:37 +0000
Subject: [PATCH] powertop: upgrade 2.16 -> 2.16.1

release: bump version to v2.16.1 and update translations/release notes
devlist: migrate owning devuser/devpower vectors to unique_ptr
Migrate tab_windows to sole unique_ptr ownership
local.md: document tab_windows mixed-ownership scoping notes
process/work: migrate all_work to map<unsigned long, unique_ptr<work>>
process/timer: migrate all_timers to map<uint64_t, unique_ptr<timer>>
parameters: migrate past_results to vector<unique_ptr<result_bundle>>
devices: migrate all_devices to vector<unique_ptr<device>>
devfreq: drop non-actionable "Devfreq not enabled" stderr message
local.md: note cursor_down() scroll-cap pitfall from #217
display: fix broken cursor navigation on WakeUp/Tunables tabs
Log RAII migration progress in local.md
Convert 4 more single owning pointers to unique_ptr (RAII pass 2)
Update local.md with unique_ptr conversion pattern learnings
Fix review item #1: convert report_maker's formatter to unique_ptr
Fix review item #3: device_has_runtime_pm() misreads legitimate zero values
Fix review items #4 and #5: unused include and unenforced invariant
Add audited .clang-format and reformat two review-flagged files
docs: record std::from_chars leading-plus-sign gotcha in local.md
devlist,extech: modernize remaining strtoull/strtod to std::from_chars
Merge pull request #219 from prownd/parameters-show-power-estimates-with-250-or-
more-parameters-s01
Merge pull request #227 from prownd/main-add-vi-style-navigation-keys-s01
Merge pull request #226 from prownd/tests-don-t-read-the-host-MSRs-in-the-
rapl_interface-tests-s01
Merge pull request #225 from prownd/meson-point-PACKAGE_BUGREPORT-at-the-GitHub-
issue-tracker-s01
Merge pull request #224 from prownd/process-drop-debug-printf-that-corrupts-the-
interact-screen-s01
docs: record RAPL stub fail-injection testing pattern in local.md
drop stale file left over from autoconf
tests: add regression test for gpu_rapl_device uninitialized energy (PR #223)
Merge pull request #223 from prownd/gpu_rapl_device-don-t-use-an-uninitialized-
energy-value-s01
Merge pull request #222 from prownd/main-check-the-statfs-result-before-using-
it-s01
docs: note fs_compile_project fix and remaining run_cpp issue
Merge pull request #221 from prownd/extech-reject-invalid-BCD-digits-and-don-t-
report-errors-as-power-s01
docs: update local.md with PR review workflow notes
main: use EXIT_FAILURE/EXIT_SUCCESS and std::from_chars for option parsing
Merge pull request #220 from prownd/main-accept-s-and-reject-non-positive-
numeric-option-values-s01
main: add vi-style navigation keys
tests: don't read the host MSRs in the rapl_interface tests
meson: point PACKAGE_BUGREPORT at the GitHub issue tracker
process: drop debug printf that corrupts the interactive screen
gpu_rapl_device: don't use an uninitialized energy value
main: check the statfs() result before using it
extech: reject invalid BCD digits and don't report errors as power
main: accept -s and reject non-positive numeric option values
parameters: show power estimates with 250 or more parameters
Merge pull request #218 from EkaterinePapava/master
po: Add Georgian translation
po: Add Georgian translation
devices: hide rfkill from Device stats list
Bump version to 2.16.1-rc1
remove legacy autoconf support
Bump autoconf C++ standard requirement to C++20
Merge pull request #212 from jubalh/fix-missing-files
Add missing files to Makefile.am
---
 .../powertop/{powertop_2.16.bb => powertop_2.16.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/powertop/{powertop_2.16.bb => powertop_2.16.1.bb} (93%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.16.bb b/meta/recipes-kernel/powertop/powertop_2.16.1.bb
similarity index 93%
rename from meta/recipes-kernel/powertop/powertop_2.16.bb
rename to meta/recipes-kernel/powertop/powertop_2.16.1.bb
index 674cf67b5a..4cfff1da1c 100644
--- a/meta/recipes-kernel/powertop/powertop_2.16.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.16.1.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "6147262e506c607036eaca4182ee491b61d06aa3"
+SRCREV = "11db5648c9fdea97d36ce6a11ef282e4e037aa92"
 
 inherit meson gettext pkgconfig bash-completion
 
-- 
2.47.1


--===============8270114312895048594==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-powertop-upgrade-2.16-2.16.1.patch"

RnJvbSAyNDNkMGYxMGY5ZDg3NzEzMTRhOTQ0MGFjZDRhMDJhNDlkMDM0NmEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOCBPY3QgMjAyNiAwNToyMjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBv
d2VydG9wOiB1cGdyYWRlIDIuMTYgLT4gMi4xNi4xCgpyZWxlYXNlOiBidW1wIHZlcnNpb24gdG8g
djIuMTYuMSBhbmQgdXBkYXRlIHRyYW5zbGF0aW9ucy9yZWxlYXNlIG5vdGVzCmRldmxpc3Q6IG1p
Z3JhdGUgb3duaW5nIGRldnVzZXIvZGV2cG93ZXIgdmVjdG9ycyB0byB1bmlxdWVfcHRyCk1pZ3Jh
dGUgdGFiX3dpbmRvd3MgdG8gc29sZSB1bmlxdWVfcHRyIG93bmVyc2hpcApsb2NhbC5tZDogZG9j
dW1lbnQgdGFiX3dpbmRvd3MgbWl4ZWQtb3duZXJzaGlwIHNjb3Bpbmcgbm90ZXMKcHJvY2Vzcy93
b3JrOiBtaWdyYXRlIGFsbF93b3JrIHRvIG1hcDx1bnNpZ25lZCBsb25nLCB1bmlxdWVfcHRyPHdv
cms+Pgpwcm9jZXNzL3RpbWVyOiBtaWdyYXRlIGFsbF90aW1lcnMgdG8gbWFwPHVpbnQ2NF90LCB1
bmlxdWVfcHRyPHRpbWVyPj4KcGFyYW1ldGVyczogbWlncmF0ZSBwYXN0X3Jlc3VsdHMgdG8gdmVj
dG9yPHVuaXF1ZV9wdHI8cmVzdWx0X2J1bmRsZT4+CmRldmljZXM6IG1pZ3JhdGUgYWxsX2Rldmlj
ZXMgdG8gdmVjdG9yPHVuaXF1ZV9wdHI8ZGV2aWNlPj4KZGV2ZnJlcTogZHJvcCBub24tYWN0aW9u
YWJsZSAiRGV2ZnJlcSBub3QgZW5hYmxlZCIgc3RkZXJyIG1lc3NhZ2UKbG9jYWwubWQ6IG5vdGUg
Y3Vyc29yX2Rvd24oKSBzY3JvbGwtY2FwIHBpdGZhbGwgZnJvbSAjMjE3CmRpc3BsYXk6IGZpeCBi
cm9rZW4gY3Vyc29yIG5hdmlnYXRpb24gb24gV2FrZVVwL1R1bmFibGVzIHRhYnMKTG9nIFJBSUkg
bWlncmF0aW9uIHByb2dyZXNzIGluIGxvY2FsLm1kCkNvbnZlcnQgNCBtb3JlIHNpbmdsZSBvd25p
bmcgcG9pbnRlcnMgdG8gdW5pcXVlX3B0ciAoUkFJSSBwYXNzIDIpClVwZGF0ZSBsb2NhbC5tZCB3
aXRoIHVuaXF1ZV9wdHIgY29udmVyc2lvbiBwYXR0ZXJuIGxlYXJuaW5ncwpGaXggcmV2aWV3IGl0
ZW0gIzE6IGNvbnZlcnQgcmVwb3J0X21ha2VyJ3MgZm9ybWF0dGVyIHRvIHVuaXF1ZV9wdHIKRml4
IHJldmlldyBpdGVtICMzOiBkZXZpY2VfaGFzX3J1bnRpbWVfcG0oKSBtaXNyZWFkcyBsZWdpdGlt
YXRlIHplcm8gdmFsdWVzCkZpeCByZXZpZXcgaXRlbXMgIzQgYW5kICM1OiB1bnVzZWQgaW5jbHVk
ZSBhbmQgdW5lbmZvcmNlZCBpbnZhcmlhbnQKQWRkIGF1ZGl0ZWQgLmNsYW5nLWZvcm1hdCBhbmQg
cmVmb3JtYXQgdHdvIHJldmlldy1mbGFnZ2VkIGZpbGVzCmRvY3M6IHJlY29yZCBzdGQ6OmZyb21f
Y2hhcnMgbGVhZGluZy1wbHVzLXNpZ24gZ290Y2hhIGluIGxvY2FsLm1kCmRldmxpc3QsZXh0ZWNo
OiBtb2Rlcm5pemUgcmVtYWluaW5nIHN0cnRvdWxsL3N0cnRvZCB0byBzdGQ6OmZyb21fY2hhcnMK
TWVyZ2UgcHVsbCByZXF1ZXN0ICMyMTkgZnJvbSBwcm93bmQvcGFyYW1ldGVycy1zaG93LXBvd2Vy
LWVzdGltYXRlcy13aXRoLTI1MC1vci0KbW9yZS1wYXJhbWV0ZXJzLXMwMQpNZXJnZSBwdWxsIHJl
cXVlc3QgIzIyNyBmcm9tIHByb3duZC9tYWluLWFkZC12aS1zdHlsZS1uYXZpZ2F0aW9uLWtleXMt
czAxCk1lcmdlIHB1bGwgcmVxdWVzdCAjMjI2IGZyb20gcHJvd25kL3Rlc3RzLWRvbi10LXJlYWQt
dGhlLWhvc3QtTVNScy1pbi10aGUtCnJhcGxfaW50ZXJmYWNlLXRlc3RzLXMwMQpNZXJnZSBwdWxs
IHJlcXVlc3QgIzIyNSBmcm9tIHByb3duZC9tZXNvbi1wb2ludC1QQUNLQUdFX0JVR1JFUE9SVC1h
dC10aGUtR2l0SHViLQppc3N1ZS10cmFja2VyLXMwMQpNZXJnZSBwdWxsIHJlcXVlc3QgIzIyNCBm
cm9tIHByb3duZC9wcm9jZXNzLWRyb3AtZGVidWctcHJpbnRmLXRoYXQtY29ycnVwdHMtdGhlLQpp
bnRlcmFjdC1zY3JlZW4tczAxCmRvY3M6IHJlY29yZCBSQVBMIHN0dWIgZmFpbC1pbmplY3Rpb24g
dGVzdGluZyBwYXR0ZXJuIGluIGxvY2FsLm1kCmRyb3Agc3RhbGUgZmlsZSBsZWZ0IG92ZXIgZnJv
bSBhdXRvY29uZgp0ZXN0czogYWRkIHJlZ3Jlc3Npb24gdGVzdCBmb3IgZ3B1X3JhcGxfZGV2aWNl
IHVuaW5pdGlhbGl6ZWQgZW5lcmd5IChQUiAjMjIzKQpNZXJnZSBwdWxsIHJlcXVlc3QgIzIyMyBm
cm9tIHByb3duZC9ncHVfcmFwbF9kZXZpY2UtZG9uLXQtdXNlLWFuLXVuaW5pdGlhbGl6ZWQtCmVu
ZXJneS12YWx1ZS1zMDEKTWVyZ2UgcHVsbCByZXF1ZXN0ICMyMjIgZnJvbSBwcm93bmQvbWFpbi1j
aGVjay10aGUtc3RhdGZzLXJlc3VsdC1iZWZvcmUtdXNpbmctCml0LXMwMQpkb2NzOiBub3RlIGZz
X2NvbXBpbGVfcHJvamVjdCBmaXggYW5kIHJlbWFpbmluZyBydW5fY3BwIGlzc3VlCk1lcmdlIHB1
bGwgcmVxdWVzdCAjMjIxIGZyb20gcHJvd25kL2V4dGVjaC1yZWplY3QtaW52YWxpZC1CQ0QtZGln
aXRzLWFuZC1kb24tdC0KcmVwb3J0LWVycm9ycy1hcy1wb3dlci1zMDEKZG9jczogdXBkYXRlIGxv
Y2FsLm1kIHdpdGggUFIgcmV2aWV3IHdvcmtmbG93IG5vdGVzCm1haW46IHVzZSBFWElUX0ZBSUxV
UkUvRVhJVF9TVUNDRVNTIGFuZCBzdGQ6OmZyb21fY2hhcnMgZm9yIG9wdGlvbiBwYXJzaW5nCk1l
cmdlIHB1bGwgcmVxdWVzdCAjMjIwIGZyb20gcHJvd25kL21haW4tYWNjZXB0LXMtYW5kLXJlamVj
dC1ub24tcG9zaXRpdmUtCm51bWVyaWMtb3B0aW9uLXZhbHVlcy1zMDEKbWFpbjogYWRkIHZpLXN0
eWxlIG5hdmlnYXRpb24ga2V5cwp0ZXN0czogZG9uJ3QgcmVhZCB0aGUgaG9zdCBNU1JzIGluIHRo
ZSByYXBsX2ludGVyZmFjZSB0ZXN0cwptZXNvbjogcG9pbnQgUEFDS0FHRV9CVUdSRVBPUlQgYXQg
dGhlIEdpdEh1YiBpc3N1ZSB0cmFja2VyCnByb2Nlc3M6IGRyb3AgZGVidWcgcHJpbnRmIHRoYXQg
Y29ycnVwdHMgdGhlIGludGVyYWN0aXZlIHNjcmVlbgpncHVfcmFwbF9kZXZpY2U6IGRvbid0IHVz
ZSBhbiB1bmluaXRpYWxpemVkIGVuZXJneSB2YWx1ZQptYWluOiBjaGVjayB0aGUgc3RhdGZzKCkg
cmVzdWx0IGJlZm9yZSB1c2luZyBpdApleHRlY2g6IHJlamVjdCBpbnZhbGlkIEJDRCBkaWdpdHMg
YW5kIGRvbid0IHJlcG9ydCBlcnJvcnMgYXMgcG93ZXIKbWFpbjogYWNjZXB0IC1zIGFuZCByZWpl
Y3Qgbm9uLXBvc2l0aXZlIG51bWVyaWMgb3B0aW9uIHZhbHVlcwpwYXJhbWV0ZXJzOiBzaG93IHBv
d2VyIGVzdGltYXRlcyB3aXRoIDI1MCBvciBtb3JlIHBhcmFtZXRlcnMKTWVyZ2UgcHVsbCByZXF1
ZXN0ICMyMTggZnJvbSBFa2F0ZXJpbmVQYXBhdmEvbWFzdGVyCnBvOiBBZGQgR2VvcmdpYW4gdHJh
bnNsYXRpb24KcG86IEFkZCBHZW9yZ2lhbiB0cmFuc2xhdGlvbgpkZXZpY2VzOiBoaWRlIHJma2ls
bCBmcm9tIERldmljZSBzdGF0cyBsaXN0CkJ1bXAgdmVyc2lvbiB0byAyLjE2LjEtcmMxCnJlbW92
ZSBsZWdhY3kgYXV0b2NvbmYgc3VwcG9ydApCdW1wIGF1dG9jb25mIEMrKyBzdGFuZGFyZCByZXF1
aXJlbWVudCB0byBDKysyMApNZXJnZSBwdWxsIHJlcXVlc3QgIzIxMiBmcm9tIGp1YmFsaC9maXgt
bWlzc2luZy1maWxlcwpBZGQgbWlzc2luZyBmaWxlcyB0byBNYWtlZmlsZS5hbQotLS0KIC4uLi9w
b3dlcnRvcC97cG93ZXJ0b3BfMi4xNi5iYiA9PiBwb3dlcnRvcF8yLjE2LjEuYmJ9ICAgICAgICAg
ICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3Ave3Bvd2VydG9wXzIuMTYuYmIgPT4g
cG93ZXJ0b3BfMi4xNi4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvcG93ZXJ0b3AvcG93ZXJ0b3BfMi4xNi5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0
b3AvcG93ZXJ0b3BfMi4xNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3BfMi4xNi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWtlcm5lbC9wb3dlcnRvcC9wb3dlcnRvcF8yLjE2LjEuYmIKaW5kZXggNjc0Y2Y2
N2I1YS4uNGNmZmYxZGExYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9wb3dlcnRv
cC9wb3dlcnRvcF8yLjE2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93
ZXJ0b3BfMi4xNi4xLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTEyZjg4NGQyYWUxZmY4N2Mw
OWU1YjdjY2MyYzRjYTdlIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmVucnVzNzUv
cG93ZXJ0b3A7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9IgotU1JDUkVW
ID0gIjYxNDcyNjJlNTA2YzYwNzAzNmVhY2E0MTgyZWU0OTFiNjFkMDZhYTMiCitTUkNSRVYgPSAi
MTFkYjU2NDhjOWZkZWE5N2QzNmNlNmExMWVmMjgyZTRlMDM3YWE5MiIKIAogaW5oZXJpdCBtZXNv
biBnZXR0ZXh0IHBrZ2NvbmZpZyBiYXNoLWNvbXBsZXRpb24KIAotLSAKMi40Ny4xCgo=

--===============8270114312895048594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/powertop: PACKAGES: added "powertop-locale-ka"

--===============8270114312895048594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="powertop-changelog.txt"

release: bump version to v2.16.1 and update translations/release notes
devlist: migrate owning devuser/devpower vectors to unique_ptr
Migrate tab_windows to sole unique_ptr ownership
local.md: document tab_windows mixed-ownership scoping notes
process/work: migrate all_work to map<unsigned long, unique_ptr<work>>
process/timer: migrate all_timers to map<uint64_t, unique_ptr<timer>>
parameters: migrate past_results to vector<unique_ptr<result_bundle>>
devices: migrate all_devices to vector<unique_ptr<device>>
devfreq: drop non-actionable "Devfreq not enabled" stderr message
local.md: note cursor_down() scroll-cap pitfall from #217
display: fix broken cursor navigation on WakeUp/Tunables tabs
Log RAII migration progress in local.md
Convert 4 more single owning pointers to unique_ptr (RAII pass 2)
Update local.md with unique_ptr conversion pattern learnings
Fix review item #1: convert report_maker's formatter to unique_ptr
Fix review item #3: device_has_runtime_pm() misreads legitimate zero values
Fix review items #4 and #5: unused include and unenforced invariant
Add audited .clang-format and reformat two review-flagged files
docs: record std::from_chars leading-plus-sign gotcha in local.md
devlist,extech: modernize remaining strtoull/strtod to std::from_chars
Merge pull request #219 from prownd/parameters-show-power-estimates-with-250-or-
more-parameters-s01
Merge pull request #227 from prownd/main-add-vi-style-navigation-keys-s01
Merge pull request #226 from prownd/tests-don-t-read-the-host-MSRs-in-the-
rapl_interface-tests-s01
Merge pull request #225 from prownd/meson-point-PACKAGE_BUGREPORT-at-the-GitHub-
issue-tracker-s01
Merge pull request #224 from prownd/process-drop-debug-printf-that-corrupts-the-
interact-screen-s01
docs: record RAPL stub fail-injection testing pattern in local.md
drop stale file left over from autoconf
tests: add regression test for gpu_rapl_device uninitialized energy (PR #223)
Merge pull request #223 from prownd/gpu_rapl_device-don-t-use-an-uninitialized-
energy-value-s01
Merge pull request #222 from prownd/main-check-the-statfs-result-before-using-
it-s01
docs: note fs_compile_project fix and remaining run_cpp issue
Merge pull request #221 from prownd/extech-reject-invalid-BCD-digits-and-don-t-
report-errors-as-power-s01
docs: update local.md with PR review workflow notes
main: use EXIT_FAILURE/EXIT_SUCCESS and std::from_chars for option parsing
Merge pull request #220 from prownd/main-accept-s-and-reject-non-positive-
numeric-option-values-s01
main: add vi-style navigation keys
tests: don't read the host MSRs in the rapl_interface tests
meson: point PACKAGE_BUGREPORT at the GitHub issue tracker
process: drop debug printf that corrupts the interactive screen
gpu_rapl_device: don't use an uninitialized energy value
main: check the statfs() result before using it
extech: reject invalid BCD digits and don't report errors as power
main: accept -s and reject non-positive numeric option values
parameters: show power estimates with 250 or more parameters
Merge pull request #218 from EkaterinePapava/master
po: Add Georgian translation
po: Add Georgian translation
devices: hide rfkill from Device stats list
Bump version to 2.16.1-rc1
remove legacy autoconf support
Bump autoconf C++ standard requirement to C++20
Merge pull request #212 from jubalh/fix-missing-files
Add missing files to Makefile.am

--===============8270114312895048594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/powertop: SRC_URI changed from "git://github.com/fenrus75/powertop;protocol=https;branch=master;tag=v2.16" to "git://github.com/fenrus75/powertop;protocol=https;branch=master;tag=v2.16.1"
packages/x86-64-v3-poky-linux/powertop: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop: PACKAGES: added "powertop-locale-ka"
packages/x86-64-v3-poky-linux/powertop: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-bash-completion: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-bash-completion: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-dbg: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-dbg: PKGSIZE changed from 32424368 to 33460904 (+3%)
packages/x86-64-v3-poky-linux/powertop/powertop-dbg: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-dev: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-dev: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-doc: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-doc: PKGSIZE changed from 3860 to 3896 (+1%)
packages/x86-64-v3-poky-linux/powertop/powertop-doc: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-ca: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-ca: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-cs-cz: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-cs-cz: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-de-de: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-de-de: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-en-gb: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-en-gb: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-en-us: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-en-us: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-es-es: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-es-es: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-hu-hu: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-hu-hu: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-id-id: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-id-id: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-nl-nl: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-nl-nl: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-pt-pt: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-pt-pt: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-locale-zh-tw: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-locale-zh-tw: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-src: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-src: PKGSIZE changed from 727086 to 733924 (+1%)
packages/x86-64-v3-poky-linux/powertop/powertop-src: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop-src: FILELIST: directory renamed /usr/src/debug/powertop/2.16/src/cpu -> /usr/src/debug/powertop/2.16.1/src/cpu, directory renamed /usr/src/debug/powertop/2.16/src/calibrate -> /usr/src/debug/powertop/2.16.1/src/calibrate, directory renamed /usr/src/debug/powertop/2.16/src/parameters -> /usr/src/debug/powertop/2.16.1/src/parameters, directory renamed /usr/src/debug/powertop/2.16/src/perf -> /usr/src/debug/powertop/2.16.1/src/perf, directory renamed /usr/src/debug/powertop/2.16/src -> /usr/src/debug/powertop/2.16.1/src, directory renamed /usr/src/debug/powertop/2.16/src/measurement -> /usr/src/debug/powertop/2.16.1/src/measurement, directory renamed /usr/src/debug/powertop/2.16/src/devices -> /usr/src/debug/powertop/2.16.1/src/devices, directory renamed /usr/src/debug/powertop/2.16/src/report -> /usr/src/debug/powertop/2.16.1/src/report, directory renamed /usr/src/debug/powertop/2.16/src/wakeup -> /usr/src/debug/powertop/2.16.1/src/wakeu
 p, directory renamed /usr/src/debug/powertop/2.16/src/cpu/rapl -> /usr/src/debug/powertop/2.16.1/src/cpu/rapl, directory renamed /usr/src/debug/powertop/2.16/src/process -> /usr/src/debug/powertop/2.16.1/src/process, directory renamed /usr/src/debug/powertop/2.16 -> /usr/src/debug/powertop/2.16.1, directory renamed /usr/src/debug/powertop/2.16/src/tuning -> /usr/src/debug/powertop/2.16.1/src/tuning
packages/x86-64-v3-poky-linux/powertop/powertop-staticdev: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop-staticdev: PV changed from "2.16" to "2.16.1"
packages/x86-64-v3-poky-linux/powertop/powertop: PKGV changed from 2.16 [default] to 2.16.1 [default]
packages/x86-64-v3-poky-linux/powertop/powertop: PKGSIZE changed from 1567056 to 1575248 (+1%)
packages/x86-64-v3-poky-linux/powertop/powertop: PV changed from "2.16" to "2.16.1"

--===============8270114312895048594==--

