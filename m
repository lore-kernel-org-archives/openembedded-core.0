Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F714C982FD
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:34:37 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1368.1790228071274808456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iwCzITW0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FuHIfblO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0d1e88aaa-a0a7455e-970f-4221-ab8e-be03363717bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790228073;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=No3LDpNS83X08YB9zFWQLwkAUXhNkjYNv9tB+khrt5Y=;
	b=iwCzITW0/231c41SPTXOVsdTW4jJ7fWAU95uiSjHMwu2aWGcn19gg2uT7pGNGjkG
	NESyWDl2bvC1d/pAZdYvNdQ2vTtVwrxequEXF4lteQqgA6AesoK59hibrLkjPT7hsn0
	qfAvokL5zv5HtgMIuvMtdmWvsZvvrBZekNpySWNE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790228073;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=No3LDpNS83X08YB9zFWQLwkAUXhNkjYNv9tB+khrt5Y=;
	b=FuHIfblOJJnANxvVpXWn/8qLdG/vb3KZ4bYnrl3EFeNl89679yo2X212ya4n8cCj
	3jnVHKb079BJrUEgkHPAI4YB9YLZpFpiudFHYQWRQjzk+n/tvjkkB+q3gFmYoCwOx1q
	zPrUTvQNo0nPa1HnLOnqJ3aS+rFavFUCTCYVPUVA=
Content-Type: multipart/mixed; boundary="===============7897812706529719690=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.68.1 SUCCEEDED
Message-ID: <010101a0d1e88aaa-a0a7455e-970f-4221-ab8e-be03363717bd-000000@us-west-2.amazonses.com>
Date: Thu, 24 Sep 2026 05:34:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.24-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 05:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246562

--===============7897812706529719690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.68.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.67-2.68.1.patch
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
From 7ef61977ea741ed04411738ebea7ff69fff72267 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 24 Sep 2026 05:27:04 +0000
Subject: [PATCH] repo: upgrade 2.67 -> 2.68.1

project: don't plan a stateless prune without a worktree
sync: skip the bloat check for projects without a worktree
project: don't rerun git status after a failed snapshot
Fix fail in test_repo_trace if trace is disabled
info: reuse branch snapshots and combine history walks
project: avoid unnecessary sync revision enumeration
project: make fast-forward merges explicit
project: fold normal stash detection into status
sync: reuse status HEAD in the bloat scan
project: render worktree status from one snapshot
project: use one status snapshot for dirty checks
git_status: parse one porcelain v2 worktree snapshot
git_command: allow lossless capture of machine output
project: pass --no-filter and --no-tags in DownloadPatchSet
project: rename UncommitedFiles to UncommittedFiles
command: preserve project filters in regex selection
tests: avoid losing trace2 socket readiness signal
sync: keep generated jobs-checkout help host-independent
sync: implement reprojectcmd for the local half
project: report why refreshing the index failed
command: fix group selection across submanifests
release: update-manpages: restore __main__ guard
manifest_xml: Improve error message on base check fail
upload: bypass branch editor with explicit branch and -y
---
 meta/recipes-devtools/repo/{repo_2.67.bb => repo_2.68.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.67.bb => repo_2.68.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.67.bb b/meta/recipes-devtools/repo/repo_2.68.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.67.bb
rename to meta/recipes-devtools/repo/repo_2.68.1.bb
index 948a9a775c..053f1cabcf 100644
--- a/meta/recipes-devtools/repo/repo_2.67.bb
+++ b/meta/recipes-devtools/repo/repo_2.68.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "d27d6829a84f488b7253ea693dcc429076c33914"
+SRCREV = "e1e215a14ea5373419acb8753b6865de19d1f122"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============7897812706529719690==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.67-2.68.1.patch"

RnJvbSA3ZWY2MTk3N2VhNzQxZWQwNDQxMTczOGViZWE3ZmY2OWZmZjcyMjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjQgU2VwIDIwMjYgMDU6Mjc6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNjcgLT4gMi42OC4xCgpwcm9qZWN0OiBkb24ndCBwbGFuIGEgc3RhdGVs
ZXNzIHBydW5lIHdpdGhvdXQgYSB3b3JrdHJlZQpzeW5jOiBza2lwIHRoZSBibG9hdCBjaGVjayBm
b3IgcHJvamVjdHMgd2l0aG91dCBhIHdvcmt0cmVlCnByb2plY3Q6IGRvbid0IHJlcnVuIGdpdCBz
dGF0dXMgYWZ0ZXIgYSBmYWlsZWQgc25hcHNob3QKRml4IGZhaWwgaW4gdGVzdF9yZXBvX3RyYWNl
IGlmIHRyYWNlIGlzIGRpc2FibGVkCmluZm86IHJldXNlIGJyYW5jaCBzbmFwc2hvdHMgYW5kIGNv
bWJpbmUgaGlzdG9yeSB3YWxrcwpwcm9qZWN0OiBhdm9pZCB1bm5lY2Vzc2FyeSBzeW5jIHJldmlz
aW9uIGVudW1lcmF0aW9uCnByb2plY3Q6IG1ha2UgZmFzdC1mb3J3YXJkIG1lcmdlcyBleHBsaWNp
dApwcm9qZWN0OiBmb2xkIG5vcm1hbCBzdGFzaCBkZXRlY3Rpb24gaW50byBzdGF0dXMKc3luYzog
cmV1c2Ugc3RhdHVzIEhFQUQgaW4gdGhlIGJsb2F0IHNjYW4KcHJvamVjdDogcmVuZGVyIHdvcmt0
cmVlIHN0YXR1cyBmcm9tIG9uZSBzbmFwc2hvdApwcm9qZWN0OiB1c2Ugb25lIHN0YXR1cyBzbmFw
c2hvdCBmb3IgZGlydHkgY2hlY2tzCmdpdF9zdGF0dXM6IHBhcnNlIG9uZSBwb3JjZWxhaW4gdjIg
d29ya3RyZWUgc25hcHNob3QKZ2l0X2NvbW1hbmQ6IGFsbG93IGxvc3NsZXNzIGNhcHR1cmUgb2Yg
bWFjaGluZSBvdXRwdXQKcHJvamVjdDogcGFzcyAtLW5vLWZpbHRlciBhbmQgLS1uby10YWdzIGlu
IERvd25sb2FkUGF0Y2hTZXQKcHJvamVjdDogcmVuYW1lIFVuY29tbWl0ZWRGaWxlcyB0byBVbmNv
bW1pdHRlZEZpbGVzCmNvbW1hbmQ6IHByZXNlcnZlIHByb2plY3QgZmlsdGVycyBpbiByZWdleCBz
ZWxlY3Rpb24KdGVzdHM6IGF2b2lkIGxvc2luZyB0cmFjZTIgc29ja2V0IHJlYWRpbmVzcyBzaWdu
YWwKc3luYzoga2VlcCBnZW5lcmF0ZWQgam9icy1jaGVja291dCBoZWxwIGhvc3QtaW5kZXBlbmRl
bnQKc3luYzogaW1wbGVtZW50IHJlcHJvamVjdGNtZCBmb3IgdGhlIGxvY2FsIGhhbGYKcHJvamVj
dDogcmVwb3J0IHdoeSByZWZyZXNoaW5nIHRoZSBpbmRleCBmYWlsZWQKY29tbWFuZDogZml4IGdy
b3VwIHNlbGVjdGlvbiBhY3Jvc3Mgc3VibWFuaWZlc3RzCnJlbGVhc2U6IHVwZGF0ZS1tYW5wYWdl
czogcmVzdG9yZSBfX21haW5fXyBndWFyZAptYW5pZmVzdF94bWw6IEltcHJvdmUgZXJyb3IgbWVz
c2FnZSBvbiBiYXNlIGNoZWNrIGZhaWwKdXBsb2FkOiBieXBhc3MgYnJhbmNoIGVkaXRvciB3aXRo
IGV4cGxpY2l0IGJyYW5jaCBhbmQgLXkKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby97
cmVwb18yLjY3LmJiID0+IHJlcG9fMi42OC4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNjcuYmIgPT4gcmVwb18yLjY4LjEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY3LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JlcG8vcmVwb18yLjY4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY3LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjguMS5iYgppbmRleCA5NDhhOWE3NzVj
Li4wNTNmMWNhYmNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBv
XzIuNjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY4LjEuYmIK
QEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2Vy
cml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1t
YWluO3RhZz12JHtQVn0gXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiZDI3ZDY4MjlhODRmNDg4
YjcyNTNlYTY5M2RjYzQyOTA3NmMzMzkxNCIKK1NSQ1JFViA9ICJlMWUyMTVhMTRlYTUzNzM0MTlh
Y2I4NzUzYjY4NjVkZTE5ZDFmMTIyIgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xl
c291cmNlLmNvbS9naXQtcmVwby5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3
L2dpdC1yZXBvLmdpdCIKIAotLSAKMi40Ny4xCgo=

--===============7897812706529719690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.67" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.68.1"
packages/x86-64-v3-poky-linux/repo: PV changed from "2.67" to "2.68.1"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.67 [default] to 2.68.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.67" to "2.68.1"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.67 [default] to 2.68.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.67" to "2.68.1"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.67 [default] to 2.68.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.67" to "2.68.1"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.67 [default] to 2.68.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.67" to "2.68.1"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.67 [default] to 2.68.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.67" to "2.68.1"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.67 [default] to 2.68.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.67" to "2.68.1"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.67 [default] to 2.68.1 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.67" to "2.68.1"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.67 [default] to 2.68.1 [default]

--===============7897812706529719690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

project: don't plan a stateless prune without a worktree
sync: skip the bloat check for projects without a worktree
project: don't rerun git status after a failed snapshot
Fix fail in test_repo_trace if trace is disabled
info: reuse branch snapshots and combine history walks
project: avoid unnecessary sync revision enumeration
project: make fast-forward merges explicit
project: fold normal stash detection into status
sync: reuse status HEAD in the bloat scan
project: render worktree status from one snapshot
project: use one status snapshot for dirty checks
git_status: parse one porcelain v2 worktree snapshot
git_command: allow lossless capture of machine output
project: pass --no-filter and --no-tags in DownloadPatchSet
project: rename UncommitedFiles to UncommittedFiles
command: preserve project filters in regex selection
tests: avoid losing trace2 socket readiness signal
sync: keep generated jobs-checkout help host-independent
sync: implement reprojectcmd for the local half
project: report why refreshing the index failed
command: fix group selection across submanifests
release: update-manpages: restore __main__ guard
manifest_xml: Improve error message on base check fail
upload: bypass branch editor with explicit branch and -y

--===============7897812706529719690==--

