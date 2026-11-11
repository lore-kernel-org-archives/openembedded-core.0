Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3720.1794377107573489907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=svfhsx3i;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=42BarVH8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1c935c496-fdaf7fe5-7468-48a6-89ad-99ea02e5adda-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377106;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XDm4fzU8dwiyl+aH+ZPoYAl8yw9uZsMoq6atbrpLEk0=;
	b=svfhsx3ijBTJ+5wkOgPr/waZMbtKiIzIr6lEjAD2LOLcUqAKS+/E/yPQepGUzm+D
	FmFh8Hu1tDkW6Jf0oP6wHnkmaEfoPcAuaoZS1MiS63L4xDItl6YwZShDFIs40HvNzsc
	PP9/uomcWMcPc4IkAWHeu8n6sc3khJW/st/sbYqE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377106;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XDm4fzU8dwiyl+aH+ZPoYAl8yw9uZsMoq6atbrpLEk0=;
	b=42BarVH8rgXvsXpQ81/CM9sbkddEmXht/fPZJsmFTeZstN0/l77d4gRWuczikKxW
	S7rkEZVsvirlmBcx9P3NAl/CNvYAiopZfNCihIl4UA8XR5iuFIY8FkrOLAuRKvOLUbS
	X9nWPaQo5qVYBi9SZ+J6eHJjW/+/DgBHMPWZhuJM=
Content-Type: multipart/mixed; boundary="===============5503758141473415242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.56.1 SUCCEEDED
Message-ID: <010101a1c935c496-fdaf7fe5-7468-48a6-89ad-99ea02e5adda-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249953

--===============5503758141473415242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.56.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.56.0-2.56.1.patch
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
From b1b46a997354c4fe860d358de88d4a44f1ddce21 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:13:55 +0000
Subject: [PATCH] git: upgrade 2.56.0 -> 2.56.1

Git v2.50.2 Release Notes
=========================

This addresses the security issues CVE-2026-111760, CVE-2026-113408,
CVE-2026-114466, CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437.

This release also backports fixes necessary to let the CI builds pass
successfully.

Fixes since v2.50.1
-------------------

   Recursive clones are susceptible to Remote Code Execution: an
   attacker-controlled repository can be crafted in a way that exploits
   a bug in Git whereby Git can be fooled into overwriting a gitfile
   (used for submodules) with a symbolic link that then points to a
   directory with malicious config or hooks. The config or hooks may
   have attacker-specified code.

   See <https://github.com/git/git/security/advisories/GHSA-vp2w-7xxj-jvxr>
   for details.

   It is possible for a server to advertise an unborn HEAD that contains
   path-traversal characters (e.g., `refs/heads/../../../TARGET`). With
   the files ref backend that can lead to ref-updating actions to write
   to unwanted files.

   See <https://gitlab.com/gitlab-org/git/-/work_items/809> for details.

   When Git strips the GPG signatures from a commit message, it only
   accounts for two signatures. A commit message containing more than
   two signatures therefore causes a stack memory corruption.

   This can be triggered when using `git merge` with a tag which
   contains more than two signatures. As such, this makes way for a DoS
   attack which can potentially also affect forges when such a tag is
   pushed to a remote and a merge action is initiated.

   See <https://gitlab.com/gitlab-org/git/-/work_items/810> for details.

   Git rejects patches larger than ~1 GiB, because its patch application
   code does not work well with large files. That check, however, only
   considered the size of the patch as it appears in the input, which for
   binary patches is much smaller than the size of the file the patch
   describes, as binary patches are compressed and encoded. A binary
   patch that inflates to a very large size therefore slipped past the
   check and crashed Git with an out-of-bounds read.

   See <https://gitlab.com/gitlab-org/git/-/work_items/811> for details.

   When merging, Git computes the size of the buffer holding the merge
   result in a way that can overflow for very large merges, which can be
   triggered by a large number of conflicts combined with a large
   `conflict-marker-size`. The resulting buffer can then be too small,
   and Git writes past its end (and, before and after that, before its
   start), corrupting the heap.

   See <https://gitlab.com/gitlab-org/git/-/work_items/814> for details.

   In response to CVE-2019-1348, `fast-import` disallows the
   `export-marks` feature by default. The features
   `rewrite-submodules-to` and `rewrite-submodules-from` as well as the
   option `export-pack-edges` that were introduced in the meantime also
   allow reading from arbitrary paths, and are therefore now also
   disallowed by default.

   See <https://gitlab.com/gitlab-org/git/-/work_items/812> for details.

Git v2.51.3 Release Notes
=========================

This release merges up the fix that appears in v2.50.2 to address
CVE-2026-111760, CVE-2026-113408, CVE-2026-114466, CVE-2026-114467,
CVE-2026-114469 and CVE-2026-105437; see the release notes for that
version for details.

Git v2.52.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2 and v2.51.3
to address CVE-2026-111760, CVE-2026-113408, CVE-2026-114466,
CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437; see the
release notes for these versions for details.

Git v2.53.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2, v2.51.3 and
v2.52.1 to address CVE-2026-111760, CVE-2026-113408, CVE-2026-114466,
CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437; see the
release notes for these versions for details.

Git v2.54.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1 and v2.53.1 to address CVE-2026-111760, CVE-2026-113408,
CVE-2026-114466, CVE-2026-114467, CVE-2026-114469 and
CVE-2026-105437; see the release notes for these versions for
details.

Also contains minor documentation updates and code clean-ups.

Git v2.55.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1, v2.53.1 and v2.54.1 to address CVE-2026-111760,
CVE-2026-113408, CVE-2026-114466, CVE-2026-114467, CVE-2026-114469
and CVE-2026-105437; see the release notes for these versions for
details.

Git v2.56.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1, v2.53.1, v2.54.1 and v2.55.1 to address CVE-2026-111760,
CVE-2026-113408, CVE-2026-114466, CVE-2026-114467, CVE-2026-114469
and CVE-2026-105437; see the release notes for these versions for
details.
---
 meta/recipes-devtools/git/git/fixsort.patch                | 2 +-
 meta/recipes-devtools/git/{git_2.56.0.bb => git_2.56.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.56.0.bb => git_2.56.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 6dda82dbde..c68f7be5d3 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From dbc552db68ca945a24d3cd15f39c6f9982cc317c Mon Sep 17 00:00:00 2001
+From d6a4fa6fa4529f37856913b598d4b3760d64e7a3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
diff --git a/meta/recipes-devtools/git/git_2.56.0.bb b/meta/recipes-devtools/git/git_2.56.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.56.0.bb
rename to meta/recipes-devtools/git/git_2.56.1.bb
index 6fc2d5d78e..48a92673cf 100644
--- a/meta/recipes-devtools/git/git_2.56.0.bb
+++ b/meta/recipes-devtools/git/git_2.56.1.bb
@@ -175,7 +175,7 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "826817fd3671b8565586d6d49f688298de8354ab11db829c02720e5c74b9b39f"
+SRC_URI[tarball.sha256sum] = "fd0c0495427dc9ac445fdced8e36bb5eb6f233a14da5db3c6dfd8dcfa7f85761"
 
 CVE_STATUS[CVE-2024-32002] = "fixed-version: fixed since v2.46.0"
 CVE_STATUS[CVE-2024-50349] = "fixed-version: fixed since v2.49.0"
-- 
2.47.1


--===============5503758141473415242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.56.0-2.56.1.patch"

RnJvbSBiMWI0NmE5OTczNTRjNGZlODYwZDM1OGRlODhkNGE0NGYxZGRjZTIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6MTM6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi41Ni4wIC0+IDIuNTYuMQoKR2l0IHYyLjUwLjIgUmVsZWFzZSBOb3Rlcwo9
PT09PT09PT09PT09PT09PT09PT09PT09CgpUaGlzIGFkZHJlc3NlcyB0aGUgc2VjdXJpdHkgaXNz
dWVzIENWRS0yMDI2LTExMTc2MCwgQ1ZFLTIwMjYtMTEzNDA4LApDVkUtMjAyNi0xMTQ0NjYsIENW
RS0yMDI2LTExNDQ2NywgQ1ZFLTIwMjYtMTE0NDY5IGFuZCBDVkUtMjAyNi0xMDU0MzcuCgpUaGlz
IHJlbGVhc2UgYWxzbyBiYWNrcG9ydHMgZml4ZXMgbmVjZXNzYXJ5IHRvIGxldCB0aGUgQ0kgYnVp
bGRzIHBhc3MKc3VjY2Vzc2Z1bGx5LgoKRml4ZXMgc2luY2UgdjIuNTAuMQotLS0tLS0tLS0tLS0t
LS0tLS0tCgogICBSZWN1cnNpdmUgY2xvbmVzIGFyZSBzdXNjZXB0aWJsZSB0byBSZW1vdGUgQ29k
ZSBFeGVjdXRpb246IGFuCiAgIGF0dGFja2VyLWNvbnRyb2xsZWQgcmVwb3NpdG9yeSBjYW4gYmUg
Y3JhZnRlZCBpbiBhIHdheSB0aGF0IGV4cGxvaXRzCiAgIGEgYnVnIGluIEdpdCB3aGVyZWJ5IEdp
dCBjYW4gYmUgZm9vbGVkIGludG8gb3ZlcndyaXRpbmcgYSBnaXRmaWxlCiAgICh1c2VkIGZvciBz
dWJtb2R1bGVzKSB3aXRoIGEgc3ltYm9saWMgbGluayB0aGF0IHRoZW4gcG9pbnRzIHRvIGEKICAg
ZGlyZWN0b3J5IHdpdGggbWFsaWNpb3VzIGNvbmZpZyBvciBob29rcy4gVGhlIGNvbmZpZyBvciBo
b29rcyBtYXkKICAgaGF2ZSBhdHRhY2tlci1zcGVjaWZpZWQgY29kZS4KCiAgIFNlZSA8aHR0cHM6
Ly9naXRodWIuY29tL2dpdC9naXQvc2VjdXJpdHkvYWR2aXNvcmllcy9HSFNBLXZwMnctN3h4ai1q
dnhyPgogICBmb3IgZGV0YWlscy4KCiAgIEl0IGlzIHBvc3NpYmxlIGZvciBhIHNlcnZlciB0byBh
ZHZlcnRpc2UgYW4gdW5ib3JuIEhFQUQgdGhhdCBjb250YWlucwogICBwYXRoLXRyYXZlcnNhbCBj
aGFyYWN0ZXJzIChlLmcuLCBgcmVmcy9oZWFkcy8uLi8uLi8uLi9UQVJHRVRgKS4gV2l0aAogICB0
aGUgZmlsZXMgcmVmIGJhY2tlbmQgdGhhdCBjYW4gbGVhZCB0byByZWYtdXBkYXRpbmcgYWN0aW9u
cyB0byB3cml0ZQogICB0byB1bndhbnRlZCBmaWxlcy4KCiAgIFNlZSA8aHR0cHM6Ly9naXRsYWIu
Y29tL2dpdGxhYi1vcmcvZ2l0Ly0vd29ya19pdGVtcy84MDk+IGZvciBkZXRhaWxzLgoKICAgV2hl
biBHaXQgc3RyaXBzIHRoZSBHUEcgc2lnbmF0dXJlcyBmcm9tIGEgY29tbWl0IG1lc3NhZ2UsIGl0
IG9ubHkKICAgYWNjb3VudHMgZm9yIHR3byBzaWduYXR1cmVzLiBBIGNvbW1pdCBtZXNzYWdlIGNv
bnRhaW5pbmcgbW9yZSB0aGFuCiAgIHR3byBzaWduYXR1cmVzIHRoZXJlZm9yZSBjYXVzZXMgYSBz
dGFjayBtZW1vcnkgY29ycnVwdGlvbi4KCiAgIFRoaXMgY2FuIGJlIHRyaWdnZXJlZCB3aGVuIHVz
aW5nIGBnaXQgbWVyZ2VgIHdpdGggYSB0YWcgd2hpY2gKICAgY29udGFpbnMgbW9yZSB0aGFuIHR3
byBzaWduYXR1cmVzLiBBcyBzdWNoLCB0aGlzIG1ha2VzIHdheSBmb3IgYSBEb1MKICAgYXR0YWNr
IHdoaWNoIGNhbiBwb3RlbnRpYWxseSBhbHNvIGFmZmVjdCBmb3JnZXMgd2hlbiBzdWNoIGEgdGFn
IGlzCiAgIHB1c2hlZCB0byBhIHJlbW90ZSBhbmQgYSBtZXJnZSBhY3Rpb24gaXMgaW5pdGlhdGVk
LgoKICAgU2VlIDxodHRwczovL2dpdGxhYi5jb20vZ2l0bGFiLW9yZy9naXQvLS93b3JrX2l0ZW1z
LzgxMD4gZm9yIGRldGFpbHMuCgogICBHaXQgcmVqZWN0cyBwYXRjaGVzIGxhcmdlciB0aGFuIH4x
IEdpQiwgYmVjYXVzZSBpdHMgcGF0Y2ggYXBwbGljYXRpb24KICAgY29kZSBkb2VzIG5vdCB3b3Jr
IHdlbGwgd2l0aCBsYXJnZSBmaWxlcy4gVGhhdCBjaGVjaywgaG93ZXZlciwgb25seQogICBjb25z
aWRlcmVkIHRoZSBzaXplIG9mIHRoZSBwYXRjaCBhcyBpdCBhcHBlYXJzIGluIHRoZSBpbnB1dCwg
d2hpY2ggZm9yCiAgIGJpbmFyeSBwYXRjaGVzIGlzIG11Y2ggc21hbGxlciB0aGFuIHRoZSBzaXpl
IG9mIHRoZSBmaWxlIHRoZSBwYXRjaAogICBkZXNjcmliZXMsIGFzIGJpbmFyeSBwYXRjaGVzIGFy
ZSBjb21wcmVzc2VkIGFuZCBlbmNvZGVkLiBBIGJpbmFyeQogICBwYXRjaCB0aGF0IGluZmxhdGVz
IHRvIGEgdmVyeSBsYXJnZSBzaXplIHRoZXJlZm9yZSBzbGlwcGVkIHBhc3QgdGhlCiAgIGNoZWNr
IGFuZCBjcmFzaGVkIEdpdCB3aXRoIGFuIG91dC1vZi1ib3VuZHMgcmVhZC4KCiAgIFNlZSA8aHR0
cHM6Ly9naXRsYWIuY29tL2dpdGxhYi1vcmcvZ2l0Ly0vd29ya19pdGVtcy84MTE+IGZvciBkZXRh
aWxzLgoKICAgV2hlbiBtZXJnaW5nLCBHaXQgY29tcHV0ZXMgdGhlIHNpemUgb2YgdGhlIGJ1ZmZl
ciBob2xkaW5nIHRoZSBtZXJnZQogICByZXN1bHQgaW4gYSB3YXkgdGhhdCBjYW4gb3ZlcmZsb3cg
Zm9yIHZlcnkgbGFyZ2UgbWVyZ2VzLCB3aGljaCBjYW4gYmUKICAgdHJpZ2dlcmVkIGJ5IGEgbGFy
Z2UgbnVtYmVyIG9mIGNvbmZsaWN0cyBjb21iaW5lZCB3aXRoIGEgbGFyZ2UKICAgYGNvbmZsaWN0
LW1hcmtlci1zaXplYC4gVGhlIHJlc3VsdGluZyBidWZmZXIgY2FuIHRoZW4gYmUgdG9vIHNtYWxs
LAogICBhbmQgR2l0IHdyaXRlcyBwYXN0IGl0cyBlbmQgKGFuZCwgYmVmb3JlIGFuZCBhZnRlciB0
aGF0LCBiZWZvcmUgaXRzCiAgIHN0YXJ0KSwgY29ycnVwdGluZyB0aGUgaGVhcC4KCiAgIFNlZSA8
aHR0cHM6Ly9naXRsYWIuY29tL2dpdGxhYi1vcmcvZ2l0Ly0vd29ya19pdGVtcy84MTQ+IGZvciBk
ZXRhaWxzLgoKICAgSW4gcmVzcG9uc2UgdG8gQ1ZFLTIwMTktMTM0OCwgYGZhc3QtaW1wb3J0YCBk
aXNhbGxvd3MgdGhlCiAgIGBleHBvcnQtbWFya3NgIGZlYXR1cmUgYnkgZGVmYXVsdC4gVGhlIGZl
YXR1cmVzCiAgIGByZXdyaXRlLXN1Ym1vZHVsZXMtdG9gIGFuZCBgcmV3cml0ZS1zdWJtb2R1bGVz
LWZyb21gIGFzIHdlbGwgYXMgdGhlCiAgIG9wdGlvbiBgZXhwb3J0LXBhY2stZWRnZXNgIHRoYXQg
d2VyZSBpbnRyb2R1Y2VkIGluIHRoZSBtZWFudGltZSBhbHNvCiAgIGFsbG93IHJlYWRpbmcgZnJv
bSBhcmJpdHJhcnkgcGF0aHMsIGFuZCBhcmUgdGhlcmVmb3JlIG5vdyBhbHNvCiAgIGRpc2FsbG93
ZWQgYnkgZGVmYXVsdC4KCiAgIFNlZSA8aHR0cHM6Ly9naXRsYWIuY29tL2dpdGxhYi1vcmcvZ2l0
Ly0vd29ya19pdGVtcy84MTI+IGZvciBkZXRhaWxzLgoKR2l0IHYyLjUxLjMgUmVsZWFzZSBOb3Rl
cwo9PT09PT09PT09PT09PT09PT09PT09PT09CgpUaGlzIHJlbGVhc2UgbWVyZ2VzIHVwIHRoZSBm
aXggdGhhdCBhcHBlYXJzIGluIHYyLjUwLjIgdG8gYWRkcmVzcwpDVkUtMjAyNi0xMTE3NjAsIENW
RS0yMDI2LTExMzQwOCwgQ1ZFLTIwMjYtMTE0NDY2LCBDVkUtMjAyNi0xMTQ0NjcsCkNWRS0yMDI2
LTExNDQ2OSBhbmQgQ1ZFLTIwMjYtMTA1NDM3OyBzZWUgdGhlIHJlbGVhc2Ugbm90ZXMgZm9yIHRo
YXQKdmVyc2lvbiBmb3IgZGV0YWlscy4KCkdpdCB2Mi41Mi4xIFJlbGVhc2UgTm90ZXMKPT09PT09
PT09PT09PT09PT09PT09PT09PQoKVGhpcyByZWxlYXNlIG1lcmdlcyB1cCB0aGUgZml4IHRoYXQg
YXBwZWFycyBpbiB2Mi41MC4yIGFuZCB2Mi41MS4zCnRvIGFkZHJlc3MgQ1ZFLTIwMjYtMTExNzYw
LCBDVkUtMjAyNi0xMTM0MDgsIENWRS0yMDI2LTExNDQ2NiwKQ1ZFLTIwMjYtMTE0NDY3LCBDVkUt
MjAyNi0xMTQ0NjkgYW5kIENWRS0yMDI2LTEwNTQzNzsgc2VlIHRoZQpyZWxlYXNlIG5vdGVzIGZv
ciB0aGVzZSB2ZXJzaW9ucyBmb3IgZGV0YWlscy4KCkdpdCB2Mi41My4xIFJlbGVhc2UgTm90ZXMK
PT09PT09PT09PT09PT09PT09PT09PT09PQoKVGhpcyByZWxlYXNlIG1lcmdlcyB1cCB0aGUgZml4
IHRoYXQgYXBwZWFycyBpbiB2Mi41MC4yLCB2Mi41MS4zIGFuZAp2Mi41Mi4xIHRvIGFkZHJlc3Mg
Q1ZFLTIwMjYtMTExNzYwLCBDVkUtMjAyNi0xMTM0MDgsIENWRS0yMDI2LTExNDQ2NiwKQ1ZFLTIw
MjYtMTE0NDY3LCBDVkUtMjAyNi0xMTQ0NjkgYW5kIENWRS0yMDI2LTEwNTQzNzsgc2VlIHRoZQpy
ZWxlYXNlIG5vdGVzIGZvciB0aGVzZSB2ZXJzaW9ucyBmb3IgZGV0YWlscy4KCkdpdCB2Mi41NC4x
IFJlbGVhc2UgTm90ZXMKPT09PT09PT09PT09PT09PT09PT09PT09PQoKVGhpcyByZWxlYXNlIG1l
cmdlcyB1cCB0aGUgZml4IHRoYXQgYXBwZWFycyBpbiB2Mi41MC4yLCB2Mi41MS4zLAp2Mi41Mi4x
IGFuZCB2Mi41My4xIHRvIGFkZHJlc3MgQ1ZFLTIwMjYtMTExNzYwLCBDVkUtMjAyNi0xMTM0MDgs
CkNWRS0yMDI2LTExNDQ2NiwgQ1ZFLTIwMjYtMTE0NDY3LCBDVkUtMjAyNi0xMTQ0NjkgYW5kCkNW
RS0yMDI2LTEwNTQzNzsgc2VlIHRoZSByZWxlYXNlIG5vdGVzIGZvciB0aGVzZSB2ZXJzaW9ucyBm
b3IKZGV0YWlscy4KCkFsc28gY29udGFpbnMgbWlub3IgZG9jdW1lbnRhdGlvbiB1cGRhdGVzIGFu
ZCBjb2RlIGNsZWFuLXVwcy4KCkdpdCB2Mi41NS4xIFJlbGVhc2UgTm90ZXMKPT09PT09PT09PT09
PT09PT09PT09PT09PQoKVGhpcyByZWxlYXNlIG1lcmdlcyB1cCB0aGUgZml4IHRoYXQgYXBwZWFy
cyBpbiB2Mi41MC4yLCB2Mi41MS4zLAp2Mi41Mi4xLCB2Mi41My4xIGFuZCB2Mi41NC4xIHRvIGFk
ZHJlc3MgQ1ZFLTIwMjYtMTExNzYwLApDVkUtMjAyNi0xMTM0MDgsIENWRS0yMDI2LTExNDQ2Niwg
Q1ZFLTIwMjYtMTE0NDY3LCBDVkUtMjAyNi0xMTQ0NjkKYW5kIENWRS0yMDI2LTEwNTQzNzsgc2Vl
IHRoZSByZWxlYXNlIG5vdGVzIGZvciB0aGVzZSB2ZXJzaW9ucyBmb3IKZGV0YWlscy4KCkdpdCB2
Mi41Ni4xIFJlbGVhc2UgTm90ZXMKPT09PT09PT09PT09PT09PT09PT09PT09PQoKVGhpcyByZWxl
YXNlIG1lcmdlcyB1cCB0aGUgZml4IHRoYXQgYXBwZWFycyBpbiB2Mi41MC4yLCB2Mi41MS4zLAp2
Mi41Mi4xLCB2Mi41My4xLCB2Mi41NC4xIGFuZCB2Mi41NS4xIHRvIGFkZHJlc3MgQ1ZFLTIwMjYt
MTExNzYwLApDVkUtMjAyNi0xMTM0MDgsIENWRS0yMDI2LTExNDQ2NiwgQ1ZFLTIwMjYtMTE0NDY3
LCBDVkUtMjAyNi0xMTQ0NjkKYW5kIENWRS0yMDI2LTEwNTQzNzsgc2VlIHRoZSByZWxlYXNlIG5v
dGVzIGZvciB0aGVzZSB2ZXJzaW9ucyBmb3IKZGV0YWlscy4KLS0tCiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQogbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNTYuMC5iYiA9PiBnaXRfMi41Ni4xLmJifSB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQve2dpdF8yLjU2LjAuYmIgPT4gZ2l0XzIuNTYu
MS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9m
aXhzb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRj
aAppbmRleCA2ZGRhODJkYmRlLi5jNjhmN2JlNWQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRiYzU1MmRiNjhj
YTk0NWEyNGQzY2QxNWYzOWM2Zjk5ODJjYzMxN2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGQ2YTRmYTZmYTQ1MjlmMzc4NTY5MTNiNTk4ZDRiMzc2MGQ2NGU3YTMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMTcgRmViIDIwMjEgMTc6NTc6MTMgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gZ2VuZXJhdGUtY29uZmlnbGlzdC5zaDogRml4IGRldGVybWluaXNtIGlz
c3VlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjU2LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjU2LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41Ni4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjU2LjEuYmIKaW5kZXgg
NmZjMmQ1ZDc4ZS4uNDhhOTI2NzNjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dpdC9naXRfMi41Ni4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIu
NTYuMS5iYgpAQCAtMTc1LDcgKzE3NSw3IEBAIEVYVFJBX09FQ09ORiArPSAiYWNfY3Zfc25wcmlu
dGZfcmV0dXJuc19ib2d1cz1ubyBcCiAgICAgICAgICAgICAgICAgICIKIEVYVFJBX09FTUFLRSAr
PSAiTk9fR0VUVEVYVD0xIgogCi1TUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICI4MjY4MTdm
ZDM2NzFiODU2NTU4NmQ2ZDQ5ZjY4ODI5OGRlODM1NGFiMTFkYjgyOWMwMjcyMGU1Yzc0YjliMzlm
IgorU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiZmQwYzA0OTU0MjdkYzlhYzQ0NWZkY2Vk
OGUzNmJiNWViNmYyMzNhMTRkYTVkYjNjNmRmZDhkY2ZhN2Y4NTc2MSIKIAogQ1ZFX1NUQVRVU1tD
VkUtMjAyNC0zMjAwMl0gPSAiZml4ZWQtdmVyc2lvbjogZml4ZWQgc2luY2UgdjIuNDYuMCIKIENW
RV9TVEFUVVNbQ1ZFLTIwMjQtNTAzNDldID0gImZpeGVkLXZlcnNpb246IGZpeGVkIHNpbmNlIHYy
LjQ5LjAiCi0tIAoyLjQ3LjEKCg==

--===============5503758141473415242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="git-changelog.txt"

Git v2.50.2 Release Notes
=========================

This addresses the security issues CVE-2026-111760, CVE-2026-113408,
CVE-2026-114466, CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437.

This release also backports fixes necessary to let the CI builds pass
successfully.

Fixes since v2.50.1
-------------------

   Recursive clones are susceptible to Remote Code Execution: an
   attacker-controlled repository can be crafted in a way that exploits
   a bug in Git whereby Git can be fooled into overwriting a gitfile
   (used for submodules) with a symbolic link that then points to a
   directory with malicious config or hooks. The config or hooks may
   have attacker-specified code.

   See <https://github.com/git/git/security/advisories/GHSA-vp2w-7xxj-jvxr>
   for details.

   It is possible for a server to advertise an unborn HEAD that contains
   path-traversal characters (e.g., `refs/heads/../../../TARGET`). With
   the files ref backend that can lead to ref-updating actions to write
   to unwanted files.

   See <https://gitlab.com/gitlab-org/git/-/work_items/809> for details.

   When Git strips the GPG signatures from a commit message, it only
   accounts for two signatures. A commit message containing more than
   two signatures therefore causes a stack memory corruption.

   This can be triggered when using `git merge` with a tag which
   contains more than two signatures. As such, this makes way for a DoS
   attack which can potentially also affect forges when such a tag is
   pushed to a remote and a merge action is initiated.

   See <https://gitlab.com/gitlab-org/git/-/work_items/810> for details.

   Git rejects patches larger than ~1 GiB, because its patch application
   code does not work well with large files. That check, however, only
   considered the size of the patch as it appears in the input, which for
   binary patches is much smaller than the size of the file the patch
   describes, as binary patches are compressed and encoded. A binary
   patch that inflates to a very large size therefore slipped past the
   check and crashed Git with an out-of-bounds read.

   See <https://gitlab.com/gitlab-org/git/-/work_items/811> for details.

   When merging, Git computes the size of the buffer holding the merge
   result in a way that can overflow for very large merges, which can be
   triggered by a large number of conflicts combined with a large
   `conflict-marker-size`. The resulting buffer can then be too small,
   and Git writes past its end (and, before and after that, before its
   start), corrupting the heap.

   See <https://gitlab.com/gitlab-org/git/-/work_items/814> for details.

   In response to CVE-2019-1348, `fast-import` disallows the
   `export-marks` feature by default. The features
   `rewrite-submodules-to` and `rewrite-submodules-from` as well as the
   option `export-pack-edges` that were introduced in the meantime also
   allow reading from arbitrary paths, and are therefore now also
   disallowed by default.

   See <https://gitlab.com/gitlab-org/git/-/work_items/812> for details.

Git v2.51.3 Release Notes
=========================

This release merges up the fix that appears in v2.50.2 to address
CVE-2026-111760, CVE-2026-113408, CVE-2026-114466, CVE-2026-114467,
CVE-2026-114469 and CVE-2026-105437; see the release notes for that
version for details.

Git v2.52.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2 and v2.51.3
to address CVE-2026-111760, CVE-2026-113408, CVE-2026-114466,
CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437; see the
release notes for these versions for details.

Git v2.53.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2, v2.51.3 and
v2.52.1 to address CVE-2026-111760, CVE-2026-113408, CVE-2026-114466,
CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437; see the
release notes for these versions for details.

Git v2.54.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1 and v2.53.1 to address CVE-2026-111760, CVE-2026-113408,
CVE-2026-114466, CVE-2026-114467, CVE-2026-114469 and
CVE-2026-105437; see the release notes for these versions for
details.

Also contains minor documentation updates and code clean-ups.

Git v2.55.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1, v2.53.1 and v2.54.1 to address CVE-2026-111760,
CVE-2026-113408, CVE-2026-114466, CVE-2026-114467, CVE-2026-114469
and CVE-2026-105437; see the release notes for these versions for
details.

Git v2.56.1 Release Notes
=========================

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1, v2.53.1, v2.54.1 and v2.55.1 to address CVE-2026-111760,
CVE-2026-113408, CVE-2026-114466, CVE-2026-114467, CVE-2026-114469
and CVE-2026-105437; see the release notes for these versions for
details.

--===============5503758141473415242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/git/git-bash-completion: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-bash-completion: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git-dbg: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-dbg: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git-dbg: PKGSIZE changed from 114344408 to 114500368 (+0%)
packages/x86-64-v3-poky-linux/git/git-dev: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-dev: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git-doc: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-doc: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git-locale: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-locale: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git-perltools: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-perltools: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git-src: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-src: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git-src: FILELIST: directory renamed /usr/src/debug/git/2.56.0/compat/fsmonitor -> /usr/src/debug/git/2.56.1/compat/fsmonitor, directory renamed /usr/src/debug/git/2.56.0/ewah -> /usr/src/debug/git/2.56.1/ewah, directory renamed /usr/src/debug/git/2.56.0/refs -> /usr/src/debug/git/2.56.1/refs, directory renamed /usr/src/debug/git/2.56.0/odb -> /usr/src/debug/git/2.56.1/odb, directory renamed /usr/src/debug/git/2.56.0/xdiff -> /usr/src/debug/git/2.56.1/xdiff, directory renamed /usr/src/debug/git/2.56.0/sha256/block -> /usr/src/debug/git/2.56.1/sha256/block, directory renamed /usr/src/debug/git/2.56.0 -> /usr/src/debug/git/2.56.1, directory renamed /usr/src/debug/git/2.56.0/compiler-tricks -> /usr/src/debug/git/2.56.1/compiler-tricks, directory renamed /usr/src/debug/git/2.56.0/reftable -> /usr/src/debug/git/2.56.1/reftable, directory renamed /usr/src/debug/git/2.56.0/sha1dc -> /usr/src/debug/git/2.56.1/sha1dc, directory renamed /usr/src/debug/git/2.56
 .0/compat/simple-ipc -> /usr/src/debug/git/2.56.1/compat/simple-ipc, directory renamed /usr/src/debug/git/2.56.0/trace2 -> /usr/src/debug/git/2.56.1/trace2, directory renamed /usr/src/debug/git/2.56.0/compat -> /usr/src/debug/git/2.56.1/compat, directory renamed /usr/src/debug/git/2.56.0/compat/linux -> /usr/src/debug/git/2.56.1/compat/linux, directory renamed /usr/src/debug/git/2.56.0/negotiator -> /usr/src/debug/git/2.56.1/negotiator, directory renamed /usr/src/debug/git/2.56.0/builtin -> /usr/src/debug/git/2.56.1/builtin
packages/x86-64-v3-poky-linux/git/git-src: PKGSIZE changed from 10863211 to 10865867 (+0%)
packages/x86-64-v3-poky-linux/git/git-staticdev: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-staticdev: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git-tk: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git-tk: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/git: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git/git: PKGSIZE changed from 27750132 to 27774708 (+0%)
packages/x86-64-v3-poky-linux/git/gitweb: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git/gitweb: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git: PV changed from "2.56.0" to "2.56.1"
packages/x86-64-v3-poky-linux/git: PKGV changed from 2.56.0 [default] to 2.56.1 [default]
packages/x86-64-v3-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.56.0.tar.gz;name=tarball file://fixsort.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.56.1.tar.gz;name=tarball file://fixsort.patch"

--===============5503758141473415242==--
