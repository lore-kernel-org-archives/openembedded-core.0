Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E852C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 11:11:04 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40236.1786101054937357372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 04:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=LDnzl8J3;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=cXp8wnC9;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id DF1FFEC0184;
	Fri,  7 Aug 2026 07:10:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 07 Aug 2026 07:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1786101053; x=1786187453; bh=M5
	efFkEl4akMW98+D7kvgnMjLLeoPHHeaA8hLC5wEZQ=; b=LDnzl8J3xF7KWVSwJo
	bIGVQD+8d1z67pAVImub5uMoGyYHGQgh4B7u/5CbmDdoxLVDv5GDNHH0otLDnbfc
	N5V9+5hQuq+jALqbEAGHKE0McSpU6KRUscfrLsePbpyg44+W0pc0g8U3g8T66tNl
	T3VMi8XsJLqep0q9kIjxmQVY6jJwjHpoLbkLpXB2UZI5PhYTkn5dCSTACWTozaMk
	PafHGBIn1YvaV5jxNXnPNt0B3lxln7RKMxrM+dcyV73CaPAr1nsgeDLgrpJDVUbh
	vXpybQMwml0a1VIrGxMPwY5XhP8AatBcN/E+0a0JQClnizZI8plM3ypznX83r18K
	egdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1786101053; x=1786187453; bh=M5efFkEl4akMW98+D7kvgnMjLLeo
	PHHeaA8hLC5wEZQ=; b=cXp8wnC9cHIcKYw/AUXzFRn2vqSbrrywmH1+Tz18jVJ5
	U/ApT3j3JZleJyFr6CBnjZ8XBJgHNtB7QXu2U5LtNSvm5OmmtdzsjtQwwW4lc6+n
	H+bHZJe7L1iAdg40O8AinwolVBr101yC8D+ZhVjPS1l/SX2QNH5zI8pXCwMJ4oaj
	UAO48HMwKQ/rA2WgAolfeSU4qnpJaWWw3Z5DXg4m1d5jOOGxqW6DEU4Smzabb+x5
	NM7FwHqgH+9Ep5w33tQwCHPwgsh4apaJmmyqzj2RsnUJ7kEYZqbMSDP2jQhnxAOJ
	tzkqUTRzLNDqE4L2aSfD6PdT4IvwRRrl0vNpKDqXaQ==
X-ME-Sender: <xms:Pb11atxiv3qqj9QO7-ZZ5YE8TE65D7RcA243cqG1_eiHqGWIxcNHgQ>
    <xme:Pb11ajRfsvmHP8nkEHJxHqVHfvNT5c1rNVos466szXueqli4gn8jAaY9Hct56mq7j
    yuXr1zYE6wBHUHbvrQxn9fdbekGCsKXbBe0WeXEGrUmP7FqHxrjDA>
X-ME-Received: <xmr:Pb11ak83tKJLxHsDLEj4dsPqoo6ub0rHPOQ_Y2zxmsGA8wsDms3OCQlaoYUUkIOssHx_xq4Vw365ORmLpV9bgQwEaT46eOg>
X-ME-Proxy-Cause: dmFkZTFrpJhmjDkHxon+f9XPKWb0nYAuCWtrzkgMyPEOzB/8P4XgPJ9oFQLiW/KzlPPjQH
    4Hj44/7rcz+lb4R28T3/6gGW8ssb59Ft5jttPlzdp+X9TxG7xXafFCu8T10DhVmL+jjvCG
    NuMeI8tNThhKoiNy25ZulLP3ffR1ptkuUtZSAQkwyYXN+JUP86s+5Xwt6gWvDMVuUkrBuT
    a44DKW2KyBV6mvITkmW28L1G+WAtXxVjKSmLvwZDLvxwly+hFbyX9LOC9m6dcl0SxH9xE+
    4EXOw0OYmHhxr1F2URBz2Ozaz7Q5Fa5trFIwVamrQMMxlpe8tY7O7jGZbi/xELTCH10zLy
    zhes9FIBBC1TNz5ENb5M5Q61VAi118KIcoNp2wNqnn5pxZnBRNwCa04sHOgOB/4gWUdYYW
    8YxUW7R2D7dWRoiJJm+hJhX+1ELKdfziQnNWzU9Q5cxrQelCfMKIYXNHZ1+oH/GZ6sD+dn
    z9kN4LzsZpNmGhePM3y2wwCHLA210sFp97iZS7bKeJL6p3q6NcLr1eX/TRFG2QNPyen8aw
    c7J2jcR6YdmRIKUsIXQqYv7HATtd2hU4eZuL9oIsOPbgdeLf7CmqHH78hnRTbvqyjEAtpd
    o3hdJE9Rdxp9YNduogqKqZFyxjh6gz2aLDuc+LEfOgGGggpl7cTqabeAat4g
X-ME-Proxy: <xmx:Pb11aqrPGte5iDfKyFGdUkyZD9Ast99bnbrdpeJqnypc9h2m-N3Z8Q>
    <xmx:Pb11ahmle3OWZyFhLKTlPainclL9zUEtTo_mgZtK2V5eq-dGIHbcXg>
    <xmx:Pb11ahKtncBY4ZgHwr0jVuWzRa6csM0IQvSCIgbAOrwfuLolQUdBcg>
    <xmx:Pb11amyPzbCXaYZZuomg8z8lB65UbNZXHHthopiY1fmj9-b7Yc60_Q>
    <xmx:Pb11auVtb43KAjhgdO0SYotVlfk9s2vhw3hFUf__XWrQ090pyCiLpe2O>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:10:53 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 07 Aug 2026 12:10:50 +0100
Subject: [PATCH] ruby: Avoid build-time race condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-ruby-v1-1-6e971b4d55a9@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIADm9dWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNz3aLSpErd1KTENBNTc4PEJJM0JaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAFSHL7JoAAAA
X-Change-ID: 20260807-ruby-ebaf4570ab4f
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5191; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=yQyu6v64SNV5S0n3/ixzFTVSO99DO4n9jsyVzkqHLjg=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSV7rUVW+PT47ZIWdS5PP0RD1Nr06qb4W+j1BJFgwLLM
 u/IM6/qKGVhEONikBVTZNnc8/X+015H3oyQWwowc1iZQIYwcHEKwEROSzD8T8zaOGOl1nbpFO8s
 jiNGnR+2iakZTcpZcTi3Sd7iS+HFNIa/Ulve7uJ9KViqpGk690/pjO0V20TnMujHXjvZJfZ1U08
 ALwA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 11:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243007

The ruby Makefile rule for $(REVISION_H) is always marked as PHONY
when building from a source tarball. This has no benefit,
file2lastrev.rb will just print a warning and exit if we're not in a VCS
checkout, but it can cause problems.

When cross-compiling, the generated file $(arch)-fake.rb is used by
every invocation of MINIRUBY. $(arch)-fake.rb depends on $(REVISION_H),
so it is considered perpetually out-of-date and sub-make invocations
will repeatedly regenerate this file.

There is no enforcement of dependencies between sub-make invocations, so
one sub-make can be running MINIRUBY (and so using $(arch)-fake.rb) at
the same time as a different sub-make is regenerating $(arch)-fake.rb.
Truncating and re-writing $(arch)-fake.rb while it is mmapped by a
running ruby interpreter can cause a SIGBUS error, for example:

    i686-linux-gnu-fake.rb: [BUG] Bus Error at 0x00007fee11f02765

No addition of dependencies to Makefile rules can address this. Instead,
we need to stop treating $(REVISION_H) as PHONY when not building from a
git checkout.

[YOCTO #16283]

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 ...-time-race-condition-when-cross-compiling.patch | 67 ++++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_4.0.6.bb           |  1 +
 2 files changed, 68 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
new file mode 100644
index 000000000000..3435dae7d02d
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
@@ -0,0 +1,67 @@
+From b79c9ccbf17852f3ffd6acb8cc56124829e03edf Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@pbarker.dev>
+Date: Fri, 31 Jul 2026 13:15:37 +0100
+Subject: [PATCH] Avoid build-time race condition when cross-compiling from a
+ source tarball
+
+Since commit 66529eef883c ("Force to update revision.h when commits
+differ"), the Makefile rule for $(REVISION_H) is always marked as PHONY
+when building from a source tarball. This has no benefit,
+file2lastrev.rb will just print a warning and exit if we're not in a VCS
+checkout, but it can cause problems.
+
+When cross-compiling, the generated file $(arch)-fake.rb is used by
+every invocation of MINIRUBY. $(arch)-fake.rb depends on $(REVISION_H),
+so it is considered perpetually out-of-date and sub-make invocations
+will repeatedly regenerate this file.
+
+There is no enforcement of dependencies between sub-make invocations, so
+one sub-make can be running MINIRUBY (and so using $(arch)-fake.rb) at
+the same time as a different sub-make is regenerating $(arch)-fake.rb.
+Truncating and re-writing $(arch)-fake.rb while it is mmapped by a
+running ruby interpreter can cause a SIGBUS error, for example:
+
+  i686-linux-gnu-fake.rb: [BUG] Bus Error at 0x00007fee11f02765
+
+No addition of dependencies to Makefile rules can address this. Instead,
+we need to stop treating $(REVISION_H) as PHONY when not building from a
+git checkout.
+
+[YOCTO #16283]
+
+Upstream-Status: Backport [squashed two commits:
+  https://github.com/ruby/ruby/commit/bb235bddd4ce7d9e73a80931782f0f0b3971d12b
+  https://github.com/ruby/ruby/commit/ef6b630cdb51d3223299a4ddc9c97b2444235f59
+  ]
+Signed-off-by: Paul Barker <paul@pbarker.dev>
+---
+ defs/gmake.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/defs/gmake.mk b/defs/gmake.mk
+index e6f553fa8c1b..413057ca6896 100644
+--- a/defs/gmake.mk
++++ b/defs/gmake.mk
+@@ -435,9 +435,7 @@ endif
+ 
+ ifeq ($(HAVE_GIT),yes)
+ REVISION_LATEST := $(shell $(GIT_LOG_FORMAT)%H -1 2>/dev/null)
+-else
+-REVISION_LATEST := update
+-endif
++ifneq ($(REVISION_LATEST),)
+ REVISION_IN_HEADER := $(shell sed '/^\#define RUBY_FULL_REVISION "\(.*\)"/!d;s//\1/;q' $(wildcard $(srcdir)/revision.h revision.h) /dev/null 2>/dev/null)
+ ifeq ($(REVISION_IN_HEADER),)
+ REVISION_IN_HEADER := none
+@@ -445,6 +443,8 @@ endif
+ ifneq ($(REVISION_IN_HEADER),$(REVISION_LATEST))
+ $(REVISION_H): PHONY
+ endif
++endif
++endif
+ 
+ include $(top_srcdir)/yjit/yjit.mk
+ include $(top_srcdir)/zjit/zjit.mk
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.6.bb b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
index 13b6746bbeb3..0ef0e33a1144 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
            file://0001-Don-t-save-the-original-name-and-timestamp.patch \
+           file://0001-Avoid-build-time-race-condition-when-cross-compiling.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 

---
base-commit: 9bb9763c4c857edfc64aa2ad189a78a4bfb0c897
change-id: 20260807-ruby-ebaf4570ab4f

Best regards,
--  
Paul Barker


