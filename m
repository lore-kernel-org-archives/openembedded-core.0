Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A491C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 15:53:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23064.1786031616810909969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 08:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DnXPuNnO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.61])
	by linux.microsoft.com (Postfix) with ESMTPSA id C590020B710C;
	Thu,  6 Aug 2026 08:53:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C590020B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1786031594;
	bh=GhkHDapsEQmNNembOhgjPucTGBGoAuigIw4Th5EXJWg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=DnXPuNnOpuMH7KvOGE4WBBmNyrdG3CjhhESIN4e/okm8XUazK629Fzx5J4a5dXquv
	 3TCcKIdSEW4lE5Z4RVGj3KRDzHhHwmNTDnlZr9Daxk8e5x4lnejUP10q3dJOQrhC2L
	 w/UwjUnKiTu3i2gakJN1EY4Ys8xJzGXaU9RfnKHQ=
Content-Type: multipart/alternative;
 boundary="------------Rz7JofQgCAatmN4jMVnl63P4"
Message-ID: <1e9b2d8b-6527-4e4e-a862-3e8d6cb83b7d@linux.microsoft.com>
Date: Thu, 6 Aug 2026 09:53:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] bitbake.conf, rust-common.bbclass: include
 RUST_BUILD_SYS in the task hash
To: mathieu.dubois-briand@bootlin.com,
 openembedded-core@lists.openembedded.org
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
 <20260804220456.2342710-4-alhe@linux.microsoft.com>
 <DKHMPRMDWGEP.3NF324RFG6OHF@bootlin.com>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <DKHMPRMDWGEP.3NF324RFG6OHF@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 15:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242954

This is a multi-part message in MIME format.
--------------Rz7JofQgCAatmN4jMVnl63P4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/2026 11:58 PM, Mathieu Dubois-Briand via lists.openembedded.org 
wrote:
> On Wed Aug 5, 2026 at 12:04 AM CEST, Alejandro Hernandez Samaniego via lists.openembedded.org wrote:
>> RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
>> tells bitbake that rust recipes should hash-match regardless of the
>> build machine's triplet. In practice that is not true:
>>
>> rustc computes each crate's Strict Version Hash (SVH) using inputs
>> that include the *stage0/stage1 bootstrap compiler* fingerprint, which
>> in turn depends on the build host arch. That seed cascades through
>> every dependent crate's mangled symbols and the packing order of
>> rodata sections, so an sstate blob populated on one worker arch and
>> reused on a differently-arched worker produces byte-different (but
>> semantically identical) artifacts and fails the reproducibility
>> selftest causing autobuilder intermittent issues when the sstate
>> matches for the incorrect architecture.
>>
>> Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
>> tracks the build triplet and mixed-arch autobuilder pools get an
>> sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
>> RUST_TARGET_SYS stay excluded because they're already covered by the
>> target/host arch hash inputs.
>>
>> While this is not ideal, it should unblock the reproducible test case,
>> another solution would be to patch rust sources manually and attempt
>> to upstream that change.
>>
>> This also has the side-effect that multiple variants of the conflicting
>> rust recipes sstate artifacts are created, but they'll be correctly used
>> now in each architecture.
>>
>> Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
>> declarations in rust-common.bbclass so future readers don't re-add
>> the exclusion.
>>
>> Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produces
>> different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
>> graphy/cargo/librsvg, where previously the hashes matched despite the
>> build machine change.
>>
>> [YOCTO #15554]
>>
>> Assisted-by: AI - OpenAI
>> Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
>> ---
> Hi Alejandro,
>
> It looks like this is breaking some selftests:
>
> 2026-08-05 10:11:05,494 - oe-selftest - INFO - sstatetests.SStateHashSameSigs.test_sstate_sdk_arch_same_hash (subunit.RemotedTestCase)
> 2026-08-05 10:11:05,494 - oe-selftest - INFO -  ... FAIL
> ...
>
> 2026-08-05 10:11:05,495 - oe-selftest - INFO - 6: 27/69 496/763 (108.24s) (2 failed) (sstatetests.SStateHashSameSigs.test_sstate_sdk_arch_same_hash)
> 2026-08-05 10:11:05,495 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 416, in test_sstate_sdk_arch_same_hash
>      self.sstate_hashtest("aarch64")
>      ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
>    File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>      return func(*args, **kwargs)
>    File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 401, in sstate_hashtest
>      self.assertCountEqual(files1, files2)
>      ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3.13/unittest/case.py", line 1238, in assertCountEqual
>      self.fail(msg)
>      ~~~~~~~~~^^^^^
>    File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
>      raise self.failureException(msg)
> AssertionError: Element counts were not equal:
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native/3.24.52.do_create_spdx.sigdata.469683d7e676bd4feadb3e363efaa9a55c47eb06559fcda0d3f5cf26473919c5'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native/3.24.52.do_populate_sysroot.sigdata.c29ff418823da4b52189a4cf7395c310a3c14fed57eb24562cd0e387fe2235a3'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native/3.24.52.do_create_package_spdx.sigdata.ede62d86abb84a871e239607d0a7173c6a9c45027aafffc624b37e2e1bb5111f'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_create_spdx.sigdata.76ed6652ba8e8eba4e8750240fa7a048fcc90e94b45e753068a44560ef2e29f0'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_create_package_spdx.sigdata.4234a33aff5f4b52703a74c1caec1893206476f908c70b32c78e46dcc3e4fb38'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_compile.sigdata.67ed98cf74ac06f829d6432f4fd904779b2f6e540f588baeab3dcf0ac35a9c75'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_populate_sysroot.sigdata.3203f6ea1fd6bb92ed523ba0e1ef0464166f1e5392207ea002c35e0007d435f9'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_configure.sigdata.df7cc5717b4cbc2ccb19bdb823fb55193cc2f95049ac7e07d440bc2da5590c96'
> ...
>
> And same for sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash:
> 2026-08-05 10:07:29,974 - oe-selftest - INFO - sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash (subunit.RemotedTestCase)
> 2026-08-05 10:07:29,975 - oe-selftest - INFO -  ... FAIL
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4472
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4290
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

Thanks Mathieu, yes this actually make sense, this is why I wasn't too convinced since the beginning and wanted to send an RFC, I'll attempt to fix this in some other way.

Alejandro

>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242899):https://lists.openembedded.org/g/openembedded-core/message/242899
> Mute This Topic:https://lists.openembedded.org/mt/120602088/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------Rz7JofQgCAatmN4jMVnl63P4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/5/2026 11:58 PM, Mathieu
      Dubois-Briand via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:DKHMPRMDWGEP.3NF324RFG6OHF@bootlin.com">
      <pre wrap="" class="moz-quote-pre">On Wed Aug 5, 2026 at 12:04 AM CEST, Alejandro Hernandez Samaniego via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
tells bitbake that rust recipes should hash-match regardless of the
build machine's triplet. In practice that is not true:

rustc computes each crate's Strict Version Hash (SVH) using inputs
that include the *stage0/stage1 bootstrap compiler* fingerprint, which
in turn depends on the build host arch. That seed cascades through
every dependent crate's mangled symbols and the packing order of
rodata sections, so an sstate blob populated on one worker arch and
reused on a differently-arched worker produces byte-different (but
semantically identical) artifacts and fails the reproducibility
selftest causing autobuilder intermittent issues when the sstate
matches for the incorrect architecture.

Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
tracks the build triplet and mixed-arch autobuilder pools get an
sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
RUST_TARGET_SYS stay excluded because they're already covered by the
target/host arch hash inputs.

While this is not ideal, it should unblock the reproducible test case,
another solution would be to patch rust sources manually and attempt
to upstream that change.

This also has the side-effect that multiple variants of the conflicting
rust recipes sstate artifacts are created, but they'll be correctly used
now in each architecture.

Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
declarations in rust-common.bbclass so future readers don't re-add
the exclusion.

Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produces
different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
graphy/cargo/librsvg, where previously the hashes matched despite the
build machine change.

[YOCTO #15554]

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hi Alejandro,

It looks like this is breaking some selftests:

2026-08-05 10:11:05,494 - oe-selftest - INFO - sstatetests.SStateHashSameSigs.test_sstate_sdk_arch_same_hash (subunit.RemotedTestCase)
2026-08-05 10:11:05,494 - oe-selftest - INFO -  ... FAIL
...

2026-08-05 10:11:05,495 - oe-selftest - INFO - 6: 27/69 496/763 (108.24s) (2 failed) (sstatetests.SStateHashSameSigs.test_sstate_sdk_arch_same_hash)
2026-08-05 10:11:05,495 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 416, in test_sstate_sdk_arch_same_hash
    self.sstate_hashtest("aarch64")
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 401, in sstate_hashtest
    self.assertCountEqual(files1, files2)
    ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1238, in assertCountEqual
    self.fail(msg)
    ~~~~~~~~~^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native/3.24.52.do_create_spdx.sigdata.469683d7e676bd4feadb3e363efaa9a55c47eb06559fcda0d3f5cf26473919c5'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native/3.24.52.do_populate_sysroot.sigdata.c29ff418823da4b52189a4cf7395c310a3c14fed57eb24562cd0e387fe2235a3'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native/3.24.52.do_create_package_spdx.sigdata.ede62d86abb84a871e239607d0a7173c6a9c45027aafffc624b37e2e1bb5111f'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_create_spdx.sigdata.76ed6652ba8e8eba4e8750240fa7a048fcc90e94b45e753068a44560ef2e29f0'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_create_package_spdx.sigdata.4234a33aff5f4b52703a74c1caec1893206476f908c70b32c78e46dcc3e4fb38'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_compile.sigdata.67ed98cf74ac06f829d6432f4fd904779b2f6e540f588baeab3dcf0ac35a9c75'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_populate_sysroot.sigdata.3203f6ea1fd6bb92ed523ba0e1ef0464166f1e5392207ea002c35e0007d435f9'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.96.1.do_configure.sigdata.df7cc5717b4cbc2ccb19bdb823fb55193cc2f95049ac7e07d440bc2da5590c96'
...

And same for sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash:
2026-08-05 10:07:29,974 - oe-selftest - INFO - sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash (subunit.RemotedTestCase)
2026-08-05 10:07:29,975 - oe-selftest - INFO -  ... FAIL
...

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4472">https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4472</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4290">https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4290</a>

Can you have a look at the issue?

Thanks,
Mathieu</pre>
    </blockquote>
    <pre>Thanks Mathieu, yes this actually make sense, this is why I wasn't too convinced since the beginning and wanted to send an RFC, I'll attempt to fix this in some other way.

Alejandro</pre>
    <blockquote type="cite"
      cite="mid:DKHMPRMDWGEP.3NF324RFG6OHF@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#242899): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/242899">https://lists.openembedded.org/g/openembedded-core/message/242899</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/120602088/4354175">https://lists.openembedded.org/mt/120602088/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------Rz7JofQgCAatmN4jMVnl63P4--

