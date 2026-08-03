Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCD5C55196
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:28:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41069.1785756529702400420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vUQPlNTh;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43E20143D
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 04:28:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED7873F632
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 04:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785756529; bh=8Qge/uf7KG5NXrAclQg15bN3y5FVgeK+0V+o1hRnKqk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vUQPlNThpMWx2B/AsLExuag93LerYF9HEDk8KZxjj8zrnsPBBy0tdHveCFbs5TGTW
	 C2yA+9Vu/5U3pVWJrmcxBx9qqIDZdZmnJX8U7wfMw0ddksA+6r5COtsQ/qIW6jQREH
	 wCT1dBQLUGnCKTPHnPNjo8udkmjF/ta4stjkhoM4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] ruby: upgrade 4.0.5 -> 4.0.6
Date: Mon,  3 Aug 2026 12:28:41 +0100
Message-ID: <20260803112843.1362937-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803112843.1362937-1-ross.burton@arm.com>
References: <20260803112843.1362937-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 11:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242650

Bug fixes only, upstream release notes:

- Thread.each_caller_location(1, 1) segfaults when called from a cfunc
- heap-use-after-free in rb_vm_ci_lookup under parallel Ractors
- defined? returns nil for protected methods defined in a module even whe=
n callable
- [BUG] should have cvar cache entry
- YJIT misaligns locals when there are > 256 local variables
- GC compaction breaks compare-by-identity sets
- invokesuper from define_method in Ractor can call wrong super method or=
 crash
- Array#sum takes slow path, does not perform compensated summation of Fl=
oat elements when init argument is a Float
- Float#round(n) returns a wrong result when n is big
- Float#ceil gives incorrect result
- Freeing a mutex locked by a fiber inside fiber scheduler can crash
- Crash when modifying instance variables during inspect or Marshal dump
- ASAN heap-use-after-free in rb_data_free after TypedData dfree frees dy=
namic rb_data_type_t
- Constant-folded /o regexp crashes with dupstring of a Regexp
- $! stays as the first exception in Ruby Box
- Split the root box into the (newer) root box and the master of copied u=
ser boxes
- Segfault caused by ar_find_entry_hint() not checking for conversion to =
st_table
- error_highlight raises NotImplementedError for ArgumentErrors that get =
wrapped
- Inconsistencies in type coercion error messages for integers
- IO::Buffer#locked leaves the buffer locked when the block raises
- parse.y regexp crash on invalid encoding
- Stack underflow for partial DCE and loops
- void value missed in parse.y
- Segfault in PRISM while Bootsnap compiles aws-sdk client_api.rb
- Unnecessary context-switching, especially bad on multi-core machines.
- Keyword-only method silently accepts a positional argument
- parse.y interpolation inside lambda literal
- SEGV in branch peephole optimization due to label/insn struct aliasing
- Ruby's default SIGINT handling ignores Thread.handle_interrupt masking.
- Enumerator::Lazy#to_enum does not accept method names as strings
- Signal.trap(:EXIT) exception only shown if at_exit also raises

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/ruby/{ruby_4.0.5.bb =3D> ruby_4.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.5.bb =3D> ruby_4.0.6.bb} (98=
%)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.5.bb b/meta/recipes-devt=
ools/ruby/ruby_4.0.6.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.5.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.6.bb
index fef3e351a29..13b6746bbeb 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
=20
 DEPENDS:append:libc-musl =3D " libucontext"
=20
-SRC_URI[sha256sum] =3D "7d6149079a63f8ae1d326c9fa65c6019ba2dc3155eae7b39=
159817911c88958e"
+SRC_URI[sha256sum] =3D "837d299e8f7ddf2be31a229a7a7e019d354979825117989a=
cb3b32b1a9be262a"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
--=20
2.43.0


