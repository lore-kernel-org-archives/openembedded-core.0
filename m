Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5B2F01825
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 10:23:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66508.1772792591988733044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 02:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=exDrRfNk;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A9644E4258A;
	Fri,  6 Mar 2026 10:23:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20D115FF92;
	Fri,  6 Mar 2026 10:23:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3C8710369937;
	Fri,  6 Mar 2026 11:23:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772792589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p/fzYz3BOnMIxx1ludBk9AmBkofomBOV6LGmq1nxve4=;
	b=exDrRfNkTEOmYb+t+hGXLqHxIGa2AqLpIP+p9BEsQOSNAHM/4RpoqVNgHB7w2ZNiZqUmhk
	p5BrEe3tfO0Mc54G+bJrBkPB7I8MptcXe8P4uyvLI6Z0KDQJGcqso8u58++iUuyMYORiFC
	5wgUVYU8Ppq+WK+w2P3f3RjJyJ0xDtDjfx99q11BxGBQllwRtDw29dpQmq4NddU4w6znzN
	ykJbDTb6c3nq9EVwTayXgRcc1n/O4bKYH/RiLMw1AGmOAAJNFs+upJIEBoTT8EGIriHhQq
	GXGnsb6Zz2oMW+o4LM4io3rpWoQo913a3jNChEffF+m0U403E0PkzUZoT84tiQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 11:23:08 +0100
Message-Id: <DGVMIW1FRS05.1F1INJLSVDOEI@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v1] go: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260305110200.17834-1-pratik.farkase@est.tech>
In-Reply-To: <20260305110200.17834-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 10:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232561

On Thu Mar 5, 2026 at 12:02 PM CET, Pratik Farkase wrote:
> Add ptest infrastructure to test the Go standard library.
>
> - Run 'go test -short std' via run-ptest script
> - Install source tree and pkg/include headers
> - Create VERSION file for architecture detection
> - Exclude multi-arch binary testdata to avoid QA errors
>
> Test results: 237/253 pass (93.7%) on qemux86-64.
>
> Known issues:
> - debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary tes=
tdata
> - time: requires embedded timezone data
> - net/http: requires unstripped go binary
> - testing, go/types: minor edge cases
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for your patch.

It looks like this is failing QA, when we are building for another
architecture:

ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/bitfi=
elds.elf4 [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/rngli=
stx.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/issue=
57046-clang.elf5 [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/typed=
ef.elf4 [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/line-=
gcc-dwarf5.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/line-=
gcc-zstd.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/cycle=
.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/split=
.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/line-=
gcc.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/range=
s.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/line-=
clang-dwarf5.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/line-=
clang.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/typed=
ef.elf5 [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/cppun=
suptypes.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/dwarf/testdata/typed=
ef.elf [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/elf/testdata/go-relo=
cation-test-gcc930-ranges-no-rela-x86-64 [arch]
ERROR: go-1.26.0-r0 do_package_qa: QA Issue: Architecture did not match (x8=
6-64, expected AArch64) in /usr/lib/go/ptest/src/debug/elf/testdata/go-relo=
cation-test-gcc930-ranges-with-rela-x86-64 [arch]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3286
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/3272
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3328
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/3289
https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/3136

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


