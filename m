Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8372.1794115345399469150
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 21:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uJGfBKDy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WZO/22p+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1b99b9800-9a11f051-5bf2-4e12-b395-abdfb57f893a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794115344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+wbjubOlFSn+lGJ5ObpDNkrgvyE1VPwWXykqGKVxoHA=;
	b=uJGfBKDy6WTZHVnsRMMzenGdCqEmdSVUAcAozJe8GyXxKtFRCLFKmOAf0I4tZcY7
	K4Wxzm2nIINrOQg+eOS7tSASeXSGipIjiTzlLQE8rdbUdoxMamxoLQpZYoVHG/uXv7H
	4Om8ENBw3opG1F3E9pJPMcXjeXI9pLyrRqDir2lU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794115344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+wbjubOlFSn+lGJ5ObpDNkrgvyE1VPwWXykqGKVxoHA=;
	b=WZO/22p+7JJ/jUkE+xtIFvizJdZjOejdJjgO2hjd2AML0tgZ736Bs2v5xzwB9OmO
	kT1iCVY3bN2CZeESgm60StnskLJU6Fv1dIcoVWYglPTlhelR2y7UfyE5KD0afIfpB62
	vubPJbDpWfShD89dnYdOTrLyetcTdKhoS6m8LlCw=
Content-Type: multipart/mixed; boundary="===============7533952008716028416=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Enoch Ng <enoch.ng@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 12.2.1 SUCCEEDED
Message-ID: <010101a1b99b9800-9a11f051-5bf2-4e12-b395-abdfb57f893a-000000@us-west-2.amazonses.com>
Date: Sun, 8 Nov 2026 05:22:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.08-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 05:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249750

--===============7533952008716028416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *12.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fmt-upgrade-12.2.0-12.2.1.patch
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
From c979c664bd8d03c5fe0d6ddd14a2f8b6e43b3e78 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 8 Nov 2026 05:13:26 +0000
Subject: [PATCH] fmt: upgrade 12.2.0 -> 12.2.1

# 12.2.1 - 2026-11-07

- Fixed a heap buffer overflow on 32-bit targets when the size of a formatting
  buffer overflows, e.g. `fmt::format(L"{:>{}}", s, 1100000000)`. Such
  allocations now throw `std::bad_alloc`.

- Fixed an out-of-bounds read when parsing format specifiers of
  `std::error_code` ( ).
  Thanks @IfkumRfnl.

- Fixed a crash when formatting `nullptr` with `FMT_COMPILE` and an exception
  in `fmt::to_string(nullptr)`; both now format it as `0x0`
  ( ). Thanks @INo-xious.
---
 .../0001-Fix-fallback-uint128-bitwise-not-4813.patch   | 10 +++++-----
 .../fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch   |  8 ++++----
 .../fmt/{fmt_12.2.0.bb => fmt_12.2.1.bb}               |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/fmt/{fmt_12.2.0.bb => fmt_12.2.1.bb} (88%)

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.patch b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.patch
index ef5c6e9f82..e07e89b39b 100644
--- a/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.patch
+++ b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.patch
@@ -1,4 +1,4 @@
-From d838c8c7923730afb751350ecac2b169256f1445 Mon Sep 17 00:00:00 2001
+From ae7e9eb7f0c17735d577d1a7dea4f2ce78b46700 Mon Sep 17 00:00:00 2001
 From: Vinay Kumar <vkslog69@gmail.com>
 Date: Thu, 18 Jun 2026 12:22:12 +0530
 Subject: [PATCH] Fix fallback uint128 bitwise not (#4813)
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 8 insertions(+)
 
 diff --git a/include/fmt/format.h b/include/fmt/format.h
-index f33c8b87..ca95f6df 100644
+index 36f483a4..07b99ca9 100644
 --- a/include/fmt/format.h
 +++ b/include/fmt/format.h
-@@ -326,6 +326,9 @@ class uint128 {
+@@ -327,6 +327,9 @@ class uint128 {
        -> uint128 {
      return {lhs.hi_ & rhs.hi_, lhs.lo_ & rhs.lo_};
    }
@@ -25,10 +25,10 @@ index f33c8b87..ca95f6df 100644
        -> uint128 {
      auto result = uint128(lhs);
 diff --git a/test/format-test.cc b/test/format-test.cc
-index 61a53c72..7e48b751 100644
+index 3de178a0..d2ef0144 100644
 --- a/test/format-test.cc
 +++ b/test/format-test.cc
-@@ -81,6 +81,11 @@ TEST(uint128_test, minus) {
+@@ -82,6 +82,11 @@ TEST(uint128_test, minus) {
    EXPECT_EQ(n - 2, 40);
  }
  
diff --git a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
index afae644d49..f2df082a48 100644
--- a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
+++ b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
@@ -1,4 +1,4 @@
-From 6ee6b54766c50ae8df9478efd91075543e89f66e Mon Sep 17 00:00:00 2001
+From 96adf3e174ad93daa2833e9a924e195a70392b6a Mon Sep 17 00:00:00 2001
 From: Victor Zverovich <viz@meta.com>
 Date: Sat, 22 Mar 2025 06:57:04 -0700
 Subject: [PATCH] Workaround an ABI issue in spdlog
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/include/fmt/format.h b/include/fmt/format.h
-index 5044befd..f33c8b87 100644
+index 672a8ddf..36f483a4 100644
 --- a/include/fmt/format.h
 +++ b/include/fmt/format.h
-@@ -774,7 +774,9 @@ enum { inline_buffer_size = 500 };
+@@ -775,7 +775,9 @@ enum { inline_buffer_size = 500 };
   * converted to `std::string` with `to_string(out)`.
   */
  template <typename T, size_t SIZE = inline_buffer_size,
@@ -24,7 +24,7 @@ index 5044befd..f33c8b87 100644
  class basic_memory_buffer : public detail::buffer<T> {
   private:
    T store_[SIZE];
-@@ -2769,7 +2771,7 @@ class bigint {
+@@ -2770,7 +2772,7 @@ class bigint {
    }
  
   public:
diff --git a/meta/recipes-devtools/fmt/fmt_12.2.0.bb b/meta/recipes-devtools/fmt/fmt_12.2.1.bb
similarity index 88%
rename from meta/recipes-devtools/fmt/fmt_12.2.0.bb
rename to meta/recipes-devtools/fmt/fmt_12.2.1.bb
index d68684e4f6..0f3eeec20e 100644
--- a/meta/recipes-devtools/fmt/fmt_12.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.2.1.bb
@@ -5,12 +5,12 @@ LICENSE = "MIT WITH fmt-exception"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec080902ed8f82f5a97ed13e8042634 \
                     file://doc/LICENSE-exception;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=main;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/fmtlib/fmt;branch=12.x;protocol=https;tag=${PV} \
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
            file://run-ptest \
            file://0001-Fix-fallback-uint128-bitwise-not-4813.patch \
            "
-SRCREV = "1be298e1bd68957e4cd352e1f676f00e07dcfb57"
+SRCREV = "208219daff58f2a7438f6931cc2ddc358acf33ef"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============7533952008716028416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PKGSIZE changed from 198004360 to 198093608 (+0%)
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: FILELIST: removed "/usr/lib/.debug/libfmt.so.12.2.0", added "/usr/lib/.debug/libfmt.so.12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PKGSIZE changed from 604538 to 604784 (+0%)
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-doc: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt-doc: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-locale: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt-locale: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-ptest: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt-ptest: PKGSIZE changed from 15967412 to 15971540 (+0%)
packages/x86-64-v3-poky-linux/fmt/fmt-ptest: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-src: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt-src: PKGSIZE changed from 2483483 to 2484594 (+0%)
packages/x86-64-v3-poky-linux/fmt/fmt-src: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-src: FILELIST: directory renamed /usr/src/debug/fmt/12.2.0/test/gtest -> /usr/src/debug/fmt/12.2.1/test/gtest, directory renamed /usr/src/debug/fmt/12.2.0/test/gtest/gmock -> /usr/src/debug/fmt/12.2.1/test/gtest/gmock, directory renamed /usr/src/debug/fmt/12.2.0/include/fmt -> /usr/src/debug/fmt/12.2.1/include/fmt, directory renamed /usr/src/debug/fmt/12.2.0/test/gtest/gtest -> /usr/src/debug/fmt/12.2.1/test/gtest/gtest, directory renamed /usr/src/debug/fmt/12.2.0/src -> /usr/src/debug/fmt/12.2.1/src, directory renamed /usr/src/debug/fmt/12.2.0/test -> /usr/src/debug/fmt/12.2.1/test
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
packages/x86-64-v3-poky-linux/fmt/fmt: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt/fmt: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
packages/x86-64-v3-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.12.2.0", added "/usr/lib/libfmt.so.12.2.1"
packages/x86-64-v3-poky-linux/fmt: PV changed from "12.2.0" to "12.2.1"
packages/x86-64-v3-poky-linux/fmt: SRC_URI changed from "git://github.com/fmtlib/fmt;branch=main;protocol=https;tag=12.2.0 file://0001-Workaround-an-ABI-issue-in-spdlog.patch file://run-ptest file://0001-Fix-fallback-uint128-bitwise-not-4813.patch" to "git://github.com/fmtlib/fmt;branch=12.x;protocol=https;tag=12.2.1 file://0001-Workaround-an-ABI-issue-in-spdlog.patch file://run-ptest file://0001-Fix-fallback-uint128-bitwise-not-4813.patch"
packages/x86-64-v3-poky-linux/fmt: PKGV changed from 12.2.0 [default] to 12.2.1 [default]
Changes to packages/x86-64-v3-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so.12 changed symlink target from libfmt.so.12.2.0 to libfmt.so.12.2.1
  /usr/lib/libfmt.so.12.2.0 moved to /usr/lib/libfmt.so.12.2.1

--===============7533952008716028416==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fmt-upgrade-12.2.0-12.2.1.patch"

RnJvbSBjOTc5YzY2NGJkOGQwM2M1ZmUwZDZkZGQxNGEyZjhiNmU0M2IzZTc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgOCBOb3YgMjAyNiAwNToxMzoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZt
dDogdXBncmFkZSAxMi4yLjAgLT4gMTIuMi4xCgojIDEyLjIuMSAtIDIwMjYtMTEtMDcKCi0gRml4
ZWQgYSBoZWFwIGJ1ZmZlciBvdmVyZmxvdyBvbiAzMi1iaXQgdGFyZ2V0cyB3aGVuIHRoZSBzaXpl
IG9mIGEgZm9ybWF0dGluZwogIGJ1ZmZlciBvdmVyZmxvd3MsIGUuZy4gYGZtdDo6Zm9ybWF0KEwi
ezo+e319IiwgcywgMTEwMDAwMDAwMClgLiBTdWNoCiAgYWxsb2NhdGlvbnMgbm93IHRocm93IGBz
dGQ6OmJhZF9hbGxvY2AuCgotIEZpeGVkIGFuIG91dC1vZi1ib3VuZHMgcmVhZCB3aGVuIHBhcnNp
bmcgZm9ybWF0IHNwZWNpZmllcnMgb2YKICBgc3RkOjplcnJvcl9jb2RlYCAoICkuCiAgVGhhbmtz
IEBJZmt1bVJmbmwuCgotIEZpeGVkIGEgY3Jhc2ggd2hlbiBmb3JtYXR0aW5nIGBudWxscHRyYCB3
aXRoIGBGTVRfQ09NUElMRWAgYW5kIGFuIGV4Y2VwdGlvbgogIGluIGBmbXQ6OnRvX3N0cmluZyhu
dWxscHRyKWA7IGJvdGggbm93IGZvcm1hdCBpdCBhcyBgMHgwYAogICggKS4gVGhhbmtzIEBJTm8t
eGlvdXMuCi0tLQogLi4uLzAwMDEtRml4LWZhbGxiYWNrLXVpbnQxMjgtYml0d2lzZS1ub3QtNDgx
My5wYXRjaCAgIHwgMTAgKysrKystLS0tLQogLi4uL2ZtdC8wMDAxLVdvcmthcm91bmQtYW4tQUJJ
LWlzc3VlLWluLXNwZGxvZy5wYXRjaCAgIHwgIDggKysrKy0tLS0KIC4uLi9mbXQve2ZtdF8xMi4y
LjAuYmIgPT4gZm10XzEyLjIuMS5iYn0gICAgICAgICAgICAgICB8ICA0ICsrLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2ZtdC97Zm10XzEyLjIuMC5iYiA9PiBmbXRfMTIuMi4xLmJifSAoODgl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10LzAwMDEtRml4LWZh
bGxiYWNrLXVpbnQxMjgtYml0d2lzZS1ub3QtNDgxMy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9mbXQvZm10LzAwMDEtRml4LWZhbGxiYWNrLXVpbnQxMjgtYml0d2lzZS1ub3QtNDgxMy5w
YXRjaAppbmRleCBlZjVjNmU5ZjgyLi5lMDdlODliMzliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZm10L2ZtdC8wMDAxLUZpeC1mYWxsYmFjay11aW50MTI4LWJpdHdpc2Utbm90
LTQ4MTMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXQvMDAwMS1GaXgt
ZmFsbGJhY2stdWludDEyOC1iaXR3aXNlLW5vdC00ODEzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBkODM4YzhjNzkyMzczMGFmYjc1MTM1MGVjYWMyYjE2OTI1NmYxNDQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBhZTdlOWViN2YwYzE3NzM1ZDU3N2QxYTdkZWE0ZjJjZTc4YjQ2
NzAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVmluYXkgS3VtYXIgPHZrc2xvZzY5
QGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTggSnVuIDIwMjYgMTI6MjI6MTIgKzA1MzAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRml4IGZhbGxiYWNrIHVpbnQxMjggYml0d2lzZSBub3QgKCM0ODEzKQpAQCAt
MTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+CiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKIAogZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZm10L2Zvcm1hdC5oIGIvaW5jbHVkZS9mbXQvZm9ybWF0LmgKLWluZGV4
IGYzM2M4Yjg3Li5jYTk1ZjZkZiAxMDA2NDQKK2luZGV4IDM2ZjQ4M2E0Li4wN2I5OWNhOSAxMDA2
NDQKIC0tLSBhL2luY2x1ZGUvZm10L2Zvcm1hdC5oCiArKysgYi9pbmNsdWRlL2ZtdC9mb3JtYXQu
aAotQEAgLTMyNiw2ICszMjYsOSBAQCBjbGFzcyB1aW50MTI4IHsKK0BAIC0zMjcsNiArMzI3LDkg
QEAgY2xhc3MgdWludDEyOCB7CiAgICAgICAgLT4gdWludDEyOCB7CiAgICAgIHJldHVybiB7bGhz
LmhpXyAmIHJocy5oaV8sIGxocy5sb18gJiByaHMubG9ffTsKICAgIH0KQEAgLTI1LDEwICsyNSwx
MCBAQCBpbmRleCBmMzNjOGI4Ny4uY2E5NWY2ZGYgMTAwNjQ0CiAgICAgICAgLT4gdWludDEyOCB7
CiAgICAgIGF1dG8gcmVzdWx0ID0gdWludDEyOChsaHMpOwogZGlmZiAtLWdpdCBhL3Rlc3QvZm9y
bWF0LXRlc3QuY2MgYi90ZXN0L2Zvcm1hdC10ZXN0LmNjCi1pbmRleCA2MWE1M2M3Mi4uN2U0OGI3
NTEgMTAwNjQ0CitpbmRleCAzZGUxNzhhMC4uZDJlZjAxNDQgMTAwNjQ0CiAtLS0gYS90ZXN0L2Zv
cm1hdC10ZXN0LmNjCiArKysgYi90ZXN0L2Zvcm1hdC10ZXN0LmNjCi1AQCAtODEsNiArODEsMTEg
QEAgVEVTVCh1aW50MTI4X3Rlc3QsIG1pbnVzKSB7CitAQCAtODIsNiArODIsMTEgQEAgVEVTVCh1
aW50MTI4X3Rlc3QsIG1pbnVzKSB7CiAgICBFWFBFQ1RfRVEobiAtIDIsIDQwKTsKICB9CiAgCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdC8wMDAxLVdvcmthcm91bmQt
YW4tQUJJLWlzc3VlLWluLXNwZGxvZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQv
Zm10LzAwMDEtV29ya2Fyb3VuZC1hbi1BQkktaXNzdWUtaW4tc3BkbG9nLnBhdGNoCmluZGV4IGFm
YWU2NDRkNDkuLmYyZGYwODJhNDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9m
bXQvZm10LzAwMDEtV29ya2Fyb3VuZC1hbi1BQkktaXNzdWUtaW4tc3BkbG9nLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10LzAwMDEtV29ya2Fyb3VuZC1hbi1BQkktaXNz
dWUtaW4tc3BkbG9nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZWU2YjU0NzY2YzUwYWU4
ZGY5NDc4ZWZkOTEwNzU1NDNlODlmNjZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5
NmFkZjNlMTc0YWQ5M2RhYTI4MzNlOWE5MjRlMTk1YTcwMzkyYjZhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogVmljdG9yIFp2ZXJvdmljaCA8dml6QG1ldGEuY29tPgogRGF0ZTogU2F0
LCAyMiBNYXIgMjAyNSAwNjo1NzowNCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBXb3JrYXJvdW5k
IGFuIEFCSSBpc3N1ZSBpbiBzcGRsb2cKQEAgLTEwLDEwICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9pbmNsdWRlL2ZtdC9mb3Jt
YXQuaCBiL2luY2x1ZGUvZm10L2Zvcm1hdC5oCi1pbmRleCA1MDQ0YmVmZC4uZjMzYzhiODcgMTAw
NjQ0CitpbmRleCA2NzJhOGRkZi4uMzZmNDgzYTQgMTAwNjQ0CiAtLS0gYS9pbmNsdWRlL2ZtdC9m
b3JtYXQuaAogKysrIGIvaW5jbHVkZS9mbXQvZm9ybWF0LmgKLUBAIC03NzQsNyArNzc0LDkgQEAg
ZW51bSB7IGlubGluZV9idWZmZXJfc2l6ZSA9IDUwMCB9OworQEAgLTc3NSw3ICs3NzUsOSBAQCBl
bnVtIHsgaW5saW5lX2J1ZmZlcl9zaXplID0gNTAwIH07CiAgICogY29udmVydGVkIHRvIGBzdGQ6
OnN0cmluZ2Agd2l0aCBgdG9fc3RyaW5nKG91dClgLgogICAqLwogIHRlbXBsYXRlIDx0eXBlbmFt
ZSBULCBzaXplX3QgU0laRSA9IGlubGluZV9idWZmZXJfc2l6ZSwKQEAgLTI0LDcgKzI0LDcgQEAg
aW5kZXggNTA0NGJlZmQuLmYzM2M4Yjg3IDEwMDY0NAogIGNsYXNzIGJhc2ljX21lbW9yeV9idWZm
ZXIgOiBwdWJsaWMgZGV0YWlsOjpidWZmZXI8VD4gewogICBwcml2YXRlOgogICAgVCBzdG9yZV9b
U0laRV07Ci1AQCAtMjc2OSw3ICsyNzcxLDcgQEAgY2xhc3MgYmlnaW50IHsKK0BAIC0yNzcwLDcg
KzI3NzIsNyBAQCBjbGFzcyBiaWdpbnQgewogICAgfQogIAogICBwdWJsaWM6CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMi4yLjAuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZm10L2ZtdF8xMi4yLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTIuMi4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMi4yLjEuYmIKaW5kZXggZDY4Njg0ZTRmNi4uMGYz
ZWVlYzIwZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTIuMi4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzEyLjIuMS5iYgpAQCAtNSwx
MiArNSwxMiBAQCBMSUNFTlNFID0gIk1JVCBXSVRIIGZtdC1leGNlcHRpb24iCiBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT02ZWMwODA5MDJlZDhmODJmNWE5N2VkMTNlODA0
MjYzNCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9kb2MvTElDRU5TRS1leGNlcHRpb247
bWQ1PWI5MjU3Nzg1ZmM0ZjM4MDNhNGI3MWI3NmMxNDEyNzI5IgogCi1TUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vZm10bGliL2ZtdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwczt0YWc9JHtQ
Vn0gXAorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2ZtdGxpYi9mbXQ7YnJhbmNoPTEyLng7
cHJvdG9jb2w9aHR0cHM7dGFnPSR7UFZ9IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtV29ya2Fy
b3VuZC1hbi1BQkktaXNzdWUtaW4tc3BkbG9nLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1
bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUZpeC1mYWxsYmFjay11aW50MTI4LWJp
dHdpc2Utbm90LTQ4MTMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMWJlMjk4ZTFi
ZDY4OTU3ZTRjZDM1MmUxZjY3NmYwMGUwN2RjZmI1NyIKK1NSQ1JFViA9ICIyMDgyMTlkYWZmNThm
MmE3NDM4ZjY5MzFjYzJkZGMzNThhY2YzM2VmIgogCiBpbmhlcml0IGNtYWtlIHB0ZXN0CiAKLS0g
CjIuNDcuMQoK

--===============7533952008716028416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.12.2.0", added "/usr/lib/libfmt.so.12.2.1"
Changes to packages/x86-64-v3-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so.12 changed symlink target from libfmt.so.12.2.0 to libfmt.so.12.2.1
  /usr/lib/libfmt.so.12.2.0 moved to /usr/lib/libfmt.so.12.2.1

--===============7533952008716028416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fmt-changelog.txt"

# 12.2.1 - 2026-11-07

- Fixed a heap buffer overflow on 32-bit targets when the size of a formatting
  buffer overflows, e.g. `fmt::format(L"{:>{}}", s, 1100000000)`. Such
  allocations now throw `std::bad_alloc`.

- Fixed an out-of-bounds read when parsing format specifiers of
  `std::error_code` ( ).
  Thanks @IfkumRfnl.

- Fixed a crash when formatting `nullptr` with `FMT_COMPILE` and an exception
  in `fmt::to_string(nullptr)`; both now format it as `0x0`
  ( ). Thanks @INo-xious.

--===============7533952008716028416==--
