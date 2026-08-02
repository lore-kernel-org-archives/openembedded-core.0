Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A828C55179
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 06:00:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18785.1785650406279996430
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 23:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nye09Ax8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FQ8jMAu/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fc10edfad-0d62faea-64af-417d-b255-8972d47577b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785650405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cepnO6yliICQqaMpZ3TuL4Zja1ac4dopTwm2aHFCqeg=;
	b=nye09Ax81bXKAkqZeGo7aIXUaaAy4EWF+NCZBuBd6yP1w8YtzLNL2E8ooQqy88eG
	cRS5C0l03qsfdnKu/HIAIZmk+Sm0tc4mdJmObArWmKfcumqesd0S/JeD3oikBb1WRtu
	GoWaUySBy9F1AdsWmYMHDZM3sJH4LCWG4/n4C5yo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785650405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cepnO6yliICQqaMpZ3TuL4Zja1ac4dopTwm2aHFCqeg=;
	b=FQ8jMAu/6/EyecfmxPk5x2mAgddpIDDcpinQw96TOUIGtA6uFgxL0VFdP3HJiZqV
	926RNQgJuTa26DHOwnJPbcND+9iDVnVvLvRXpKNdvOa9X1rlufpA+E//mZj0lCK2Ekd
	EY5QgzHMoSBw0o1kmC6YJmGFCkcDaluw0qlulH5c=
Content-Type: multipart/mixed; boundary="===============1380178883222152606=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.5 SUCCEEDED
Message-ID: <0101019fc10edfad-0d62faea-64af-417d-b255-8972d47577b7-000000@us-west-2.amazonses.com>
Date: Sun, 2 Aug 2026 06:00:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 06:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242517

--===============1380178883222152606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-3.0.4-3.0.5.patch
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
From 98fd933c7bfb1808952942192efa39fcebddb4da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 2 Aug 2026 05:22:20 +0000
Subject: [PATCH] pkgconf: upgrade 3.0.4 -> 3.0.5

Source: NEWS

Changes from 3.0.4 to 3.0.5:
----------------------------

* Correctness fixes:
  - Shell quoting and backslash escapes in pc(5) properties are now consumed
    once, after variable substitution, instead of while splitting the property
    beforehand.  Quoting arriving from a variable is therefore treated like
    quoting written inline, --variable reports a value as the .pc file spells
    it, and fragments are escaped exactly once when rendered.  This supersedes
    the 3.0.4 fix, which unescaped whitespace at parse time and so hid the
    escaping from consumers such as cmake's FindPkgConfig.
    See https://github.com/pkgconf/pkgconf/issues/575 and
    https://github.com/pkgconf/pkgconf/issues/579.
  - Metadata queries no longer consult Conflicts rules between the modules named
    on the command line, as reporting metadata does not combine them into a
    build.  This covers --license, --license-file, --modversion, --path,
    --print-provides, --print-requires, --print-requires-private,
    --print-variables, --source and --variable.  --cflags, --libs and --exists
    are unaffected.
    See https://github.com/pkgconf/pkgconf/issues/580.
  - ${pc_sysrootdir} is now injected into the path taken by every -isystem and
    -idirafter flag in a fragment list, rather than only the first.
  - -isystem and -idirafter written joined to their path, as in `-isystem/opt`,
    are split into the flag and the path it takes, so that the path is subject
    to the same sysroot injection and deduplication as the separated spelling.
  - Sysroot injection is decided by reading the fragment's path instead of
    remembering whether ${pc_sysrootdir} was expanded, so a path which already
    lies under the sysroot never acquires a doubled prefix.

* Performance:
  - The package cache and the fragment deduplication index are kept sorted and
    searched with bsearch() rather than re-sorted or scanned linearly.
  - Variable keys and fragment text are stored with the structures they belong
    to, and buffers are rewound and reused rather than reallocated.
  - Escaping, fragment rendering and path relocation write into their
    destination buffer directly.
  Resolving a graph of roughly forty modules is about six times faster than
  3.0.4, and a small graph such as gio-2.0 about twice as fast.

* Build and portability fixes:
  - Fix the pkgconf-lite build, which failed to link because the dependency list
    renderer had come to depend on tracing machinery that pkgconf-lite omits.
  - Fix the test runner failing to build on MinGW, where the mkdtemp(3) fallback
    was compiled only for MSVC builds.
    See https://github.com/pkgconf/pkgconf/issues/582.
  - The meson build now defines HAVE_DECL_READLINKAT, so readlinkat(2) is used
    where it is available instead of always falling back to readlink(2).
  The MinGW and readlinkat fixes are by moi15moi.

* New libpkgconf API additions:
  - pkgconf_argv_split_raw: splits a string into an argument vector

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../pkgconf/{pkgconf_3.0.4.bb => pkgconf_3.0.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.4.bb => pkgconf_3.0.5.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
index 0abd0fa923..79ac3208d3 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "91ce346b47f46b87d680c6928e6c43240b9cdc7a31afbea19f2298de4dbe266d"
+SRC_URI[sha256sum] = "3acd3a8a3cce65a8d620321855d92fb602e026cbe8e13ee36bdec58483b59ace"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============1380178883222152606==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-3.0.4-3.0.5.patch"

RnJvbSA5OGZkOTMzYzdiZmIxODA4OTUyOTQyMTkyZWZhMzlmY2ViZGRiNGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMiBBdWcgMjAyNiAwNToyMjoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMy4wLjQgLT4gMy4wLjUKClNvdXJjZTogTkVXUwoKQ2hhbmdlcyBmcm9t
IDMuMC40IHRvIDMuMC41OgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgoqIENvcnJlY3Ru
ZXNzIGZpeGVzOgogIC0gU2hlbGwgcXVvdGluZyBhbmQgYmFja3NsYXNoIGVzY2FwZXMgaW4gcGMo
NSkgcHJvcGVydGllcyBhcmUgbm93IGNvbnN1bWVkCiAgICBvbmNlLCBhZnRlciB2YXJpYWJsZSBz
dWJzdGl0dXRpb24sIGluc3RlYWQgb2Ygd2hpbGUgc3BsaXR0aW5nIHRoZSBwcm9wZXJ0eQogICAg
YmVmb3JlaGFuZC4gIFF1b3RpbmcgYXJyaXZpbmcgZnJvbSBhIHZhcmlhYmxlIGlzIHRoZXJlZm9y
ZSB0cmVhdGVkIGxpa2UKICAgIHF1b3Rpbmcgd3JpdHRlbiBpbmxpbmUsIC0tdmFyaWFibGUgcmVw
b3J0cyBhIHZhbHVlIGFzIHRoZSAucGMgZmlsZSBzcGVsbHMKICAgIGl0LCBhbmQgZnJhZ21lbnRz
IGFyZSBlc2NhcGVkIGV4YWN0bHkgb25jZSB3aGVuIHJlbmRlcmVkLiAgVGhpcyBzdXBlcnNlZGVz
CiAgICB0aGUgMy4wLjQgZml4LCB3aGljaCB1bmVzY2FwZWQgd2hpdGVzcGFjZSBhdCBwYXJzZSB0
aW1lIGFuZCBzbyBoaWQgdGhlCiAgICBlc2NhcGluZyBmcm9tIGNvbnN1bWVycyBzdWNoIGFzIGNt
YWtlJ3MgRmluZFBrZ0NvbmZpZy4KICAgIFNlZSBodHRwczovL2dpdGh1Yi5jb20vcGtnY29uZi9w
a2djb25mL2lzc3Vlcy81NzUgYW5kCiAgICBodHRwczovL2dpdGh1Yi5jb20vcGtnY29uZi9wa2dj
b25mL2lzc3Vlcy81NzkuCiAgLSBNZXRhZGF0YSBxdWVyaWVzIG5vIGxvbmdlciBjb25zdWx0IENv
bmZsaWN0cyBydWxlcyBiZXR3ZWVuIHRoZSBtb2R1bGVzIG5hbWVkCiAgICBvbiB0aGUgY29tbWFu
ZCBsaW5lLCBhcyByZXBvcnRpbmcgbWV0YWRhdGEgZG9lcyBub3QgY29tYmluZSB0aGVtIGludG8g
YQogICAgYnVpbGQuICBUaGlzIGNvdmVycyAtLWxpY2Vuc2UsIC0tbGljZW5zZS1maWxlLCAtLW1v
ZHZlcnNpb24sIC0tcGF0aCwKICAgIC0tcHJpbnQtcHJvdmlkZXMsIC0tcHJpbnQtcmVxdWlyZXMs
IC0tcHJpbnQtcmVxdWlyZXMtcHJpdmF0ZSwKICAgIC0tcHJpbnQtdmFyaWFibGVzLCAtLXNvdXJj
ZSBhbmQgLS12YXJpYWJsZS4gIC0tY2ZsYWdzLCAtLWxpYnMgYW5kIC0tZXhpc3RzCiAgICBhcmUg
dW5hZmZlY3RlZC4KICAgIFNlZSBodHRwczovL2dpdGh1Yi5jb20vcGtnY29uZi9wa2djb25mL2lz
c3Vlcy81ODAuCiAgLSAke3BjX3N5c3Jvb3RkaXJ9IGlzIG5vdyBpbmplY3RlZCBpbnRvIHRoZSBw
YXRoIHRha2VuIGJ5IGV2ZXJ5IC1pc3lzdGVtIGFuZAogICAgLWlkaXJhZnRlciBmbGFnIGluIGEg
ZnJhZ21lbnQgbGlzdCwgcmF0aGVyIHRoYW4gb25seSB0aGUgZmlyc3QuCiAgLSAtaXN5c3RlbSBh
bmQgLWlkaXJhZnRlciB3cml0dGVuIGpvaW5lZCB0byB0aGVpciBwYXRoLCBhcyBpbiBgLWlzeXN0
ZW0vb3B0YCwKICAgIGFyZSBzcGxpdCBpbnRvIHRoZSBmbGFnIGFuZCB0aGUgcGF0aCBpdCB0YWtl
cywgc28gdGhhdCB0aGUgcGF0aCBpcyBzdWJqZWN0CiAgICB0byB0aGUgc2FtZSBzeXNyb290IGlu
amVjdGlvbiBhbmQgZGVkdXBsaWNhdGlvbiBhcyB0aGUgc2VwYXJhdGVkIHNwZWxsaW5nLgogIC0g
U3lzcm9vdCBpbmplY3Rpb24gaXMgZGVjaWRlZCBieSByZWFkaW5nIHRoZSBmcmFnbWVudCdzIHBh
dGggaW5zdGVhZCBvZgogICAgcmVtZW1iZXJpbmcgd2hldGhlciAke3BjX3N5c3Jvb3RkaXJ9IHdh
cyBleHBhbmRlZCwgc28gYSBwYXRoIHdoaWNoIGFscmVhZHkKICAgIGxpZXMgdW5kZXIgdGhlIHN5
c3Jvb3QgbmV2ZXIgYWNxdWlyZXMgYSBkb3VibGVkIHByZWZpeC4KCiogUGVyZm9ybWFuY2U6CiAg
LSBUaGUgcGFja2FnZSBjYWNoZSBhbmQgdGhlIGZyYWdtZW50IGRlZHVwbGljYXRpb24gaW5kZXgg
YXJlIGtlcHQgc29ydGVkIGFuZAogICAgc2VhcmNoZWQgd2l0aCBic2VhcmNoKCkgcmF0aGVyIHRo
YW4gcmUtc29ydGVkIG9yIHNjYW5uZWQgbGluZWFybHkuCiAgLSBWYXJpYWJsZSBrZXlzIGFuZCBm
cmFnbWVudCB0ZXh0IGFyZSBzdG9yZWQgd2l0aCB0aGUgc3RydWN0dXJlcyB0aGV5IGJlbG9uZwog
ICAgdG8sIGFuZCBidWZmZXJzIGFyZSByZXdvdW5kIGFuZCByZXVzZWQgcmF0aGVyIHRoYW4gcmVh
bGxvY2F0ZWQuCiAgLSBFc2NhcGluZywgZnJhZ21lbnQgcmVuZGVyaW5nIGFuZCBwYXRoIHJlbG9j
YXRpb24gd3JpdGUgaW50byB0aGVpcgogICAgZGVzdGluYXRpb24gYnVmZmVyIGRpcmVjdGx5Lgog
IFJlc29sdmluZyBhIGdyYXBoIG9mIHJvdWdobHkgZm9ydHkgbW9kdWxlcyBpcyBhYm91dCBzaXgg
dGltZXMgZmFzdGVyIHRoYW4KICAzLjAuNCwgYW5kIGEgc21hbGwgZ3JhcGggc3VjaCBhcyBnaW8t
Mi4wIGFib3V0IHR3aWNlIGFzIGZhc3QuCgoqIEJ1aWxkIGFuZCBwb3J0YWJpbGl0eSBmaXhlczoK
ICAtIEZpeCB0aGUgcGtnY29uZi1saXRlIGJ1aWxkLCB3aGljaCBmYWlsZWQgdG8gbGluayBiZWNh
dXNlIHRoZSBkZXBlbmRlbmN5IGxpc3QKICAgIHJlbmRlcmVyIGhhZCBjb21lIHRvIGRlcGVuZCBv
biB0cmFjaW5nIG1hY2hpbmVyeSB0aGF0IHBrZ2NvbmYtbGl0ZSBvbWl0cy4KICAtIEZpeCB0aGUg
dGVzdCBydW5uZXIgZmFpbGluZyB0byBidWlsZCBvbiBNaW5HVywgd2hlcmUgdGhlIG1rZHRlbXAo
MykgZmFsbGJhY2sKICAgIHdhcyBjb21waWxlZCBvbmx5IGZvciBNU1ZDIGJ1aWxkcy4KICAgIFNl
ZSBodHRwczovL2dpdGh1Yi5jb20vcGtnY29uZi9wa2djb25mL2lzc3Vlcy81ODIuCiAgLSBUaGUg
bWVzb24gYnVpbGQgbm93IGRlZmluZXMgSEFWRV9ERUNMX1JFQURMSU5LQVQsIHNvIHJlYWRsaW5r
YXQoMikgaXMgdXNlZAogICAgd2hlcmUgaXQgaXMgYXZhaWxhYmxlIGluc3RlYWQgb2YgYWx3YXlz
IGZhbGxpbmcgYmFjayB0byByZWFkbGluaygyKS4KICBUaGUgTWluR1cgYW5kIHJlYWRsaW5rYXQg
Zml4ZXMgYXJlIGJ5IG1vaTE1bW9pLgoKKiBOZXcgbGlicGtnY29uZiBBUEkgYWRkaXRpb25zOgog
IC0gcGtnY29uZl9hcmd2X3NwbGl0X3Jhdzogc3BsaXRzIGEgc3RyaW5nIGludG8gYW4gYXJndW1l
bnQgdmVjdG9yCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hhcmFj
dGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50IHRv
IHRoZSBBVUggZW1haWxdCi0tLQogLi4uL3BrZ2NvbmYve3BrZ2NvbmZfMy4wLjQuYmIgPT4gcGtn
Y29uZl8zLjAuNS5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Br
Z2NvbmYve3BrZ2NvbmZfMy4wLjQuYmIgPT4gcGtnY29uZl8zLjAuNS5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC40LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuNS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzMuMC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzMuMC41LmJiCmluZGV4IDBhYmQwZmE5MjMuLjc5YWMzMjA4ZDMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjQuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuNS5iYgpAQCAtMjAsNyArMjAsNyBA
QCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1uYXRpdmUuaW4gXAogICAgIGZp
bGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkxY2Uz
NDZiNDdmNDZiODdkNjgwYzY5MjhlNmM0MzI0MGI5Y2RjN2EzMWFmYmVhMTlmMjI5OGRlNGRiZTI2
NmQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2FjZDNhOGEzY2NlNjVhOGQ2MjAzMjE4NTVkOTJm
YjYwMmUwMjZjYmU4ZTEzZWUzNmJkZWM1ODQ4M2I1OWFjZSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VY
ID0gInBrZ2NvbmYtKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQrKVwudGFyIgogCiBpbmhl
cml0IGF1dG90b29scyBwa2djb25maWcKLS0gCjIuNDcuMQoK

--===============1380178883222152606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.4.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.5.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PV changed from "3.0.4" to "3.0.5"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 3.0.4 [default] to 3.0.5 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 767976 to 793176 (+3%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "3.0.4" to "3.0.5"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 3.0.4 [default] to 3.0.5 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 42096 to 45016 (+7%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "3.0.4" to "3.0.5"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 3.0.4 [default] to 3.0.5 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 67870 to 68209 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "3.0.4" to "3.0.5"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 3.0.4 [default] to 3.0.5 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "3.0.4" to "3.0.5"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 3.0.4 [default] to 3.0.5 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 556853 to 574086 (+3%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "3.0.4" to "3.0.5"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/3.0.4/cli/bomtool -> /usr/src/debug/pkgconf/3.0.5/cli/bomtool, directory renamed /usr/src/debug/pkgconf/3.0.4/cli/spdxtool -> /usr/src/debug/pkgconf/3.0.5/cli/spdxtool, directory renamed /usr/src/debug/pkgconf/3.0.4/cli -> /usr/src/debug/pkgconf/3.0.5/cli, directory renamed /usr/src/debug/pkgconf/3.0.4/cli/pccritic -> /usr/src/debug/pkgconf/3.0.5/cli/pccritic, directory renamed /usr/src/debug/pkgconf/3.0.4/libpkgconf -> /usr/src/debug/pkgconf/3.0.5/libpkgconf
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 3.0.4 [default] to 3.0.5 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "3.0.4" to "3.0.5"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 3.0.4 [default] to 3.0.5 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 298069 to 306261 (+3%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "3.0.4" to "3.0.5"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 3.0.4 [default] to 3.0.5 [default]

--===============1380178883222152606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pkgconf-changelog.txt"

Changelog for pkgconf: 3.0.4 -> 3.0.5
Source: NEWS

Changes from 3.0.4 to 3.0.5:
----------------------------

* Correctness fixes:
  - Shell quoting and backslash escapes in pc(5) properties are now consumed
    once, after variable substitution, instead of while splitting the property
    beforehand.  Quoting arriving from a variable is therefore treated like
    quoting written inline, --variable reports a value as the .pc file spells
    it, and fragments are escaped exactly once when rendered.  This supersedes
    the 3.0.4 fix, which unescaped whitespace at parse time and so hid the
    escaping from consumers such as cmake's FindPkgConfig.
    See https://github.com/pkgconf/pkgconf/issues/575 and
    https://github.com/pkgconf/pkgconf/issues/579.
  - Metadata queries no longer consult Conflicts rules between the modules named
    on the command line, as reporting metadata does not combine them into a
    build.  This covers --license, --license-file, --modversion, --path,
    --print-provides, --print-requires, --print-requires-private,
    --print-variables, --source and --variable.  --cflags, --libs and --exists
    are unaffected.
    See https://github.com/pkgconf/pkgconf/issues/580.
  - ${pc_sysrootdir} is now injected into the path taken by every -isystem and
    -idirafter flag in a fragment list, rather than only the first.
  - -isystem and -idirafter written joined to their path, as in `-isystem/opt`,
    are split into the flag and the path it takes, so that the path is subject
    to the same sysroot injection and deduplication as the separated spelling.
  - Sysroot injection is decided by reading the fragment's path instead of
    remembering whether ${pc_sysrootdir} was expanded, so a path which already
    lies under the sysroot never acquires a doubled prefix.

* Performance:
  - The package cache and the fragment deduplication index are kept sorted and
    searched with bsearch() rather than re-sorted or scanned linearly.
  - Variable keys and fragment text are stored with the structures they belong
    to, and buffers are rewound and reused rather than reallocated.
  - Escaping, fragment rendering and path relocation write into their
    destination buffer directly.
  Resolving a graph of roughly forty modules is about six times faster than
  3.0.4, and a small graph such as gio-2.0 about twice as fast.

* Build and portability fixes:
  - Fix the pkgconf-lite build, which failed to link because the dependency list
    renderer had come to depend on tracing machinery that pkgconf-lite omits.
  - Fix the test runner failing to build on MinGW, where the mkdtemp(3) fallback
    was compiled only for MSVC builds.
    See https://github.com/pkgconf/pkgconf/issues/582.
  - The meson build now defines HAVE_DECL_READLINKAT, so readlinkat(2) is used
    where it is available instead of always falling back to readlink(2).
  The MinGW and readlinkat fixes are by moi15moi.

* New libpkgconf API additions:
  - pkgconf_argv_split_raw: splits a string into an argument vector like
    pkgconf_argv_split, but leaves the quoting it reads in place.
  - pkgconf_fragment_filter_splice: like pkgconf_fragment_filter, but moves the
    matching fragments to the destination list instead of copying them.
  - pkgconf_charset_from_spans: compiles a span list into a byte set.
  - pkgconf_buffer_escape_charset: escapes a buffer against such a byte set.
  - pkgconf_buffer_rewind: empties a buffer while keeping its allocation.
  - pkgconf_list_splice: moves the contents of one list onto the end of another.

--===============1380178883222152606==--

