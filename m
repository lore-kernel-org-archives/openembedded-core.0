Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A88D107526A
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 06:57:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5334.1773903442525922143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 23:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b7YLh9u0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3A4B64E42711
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 06:57:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8F565FDEB;
	Thu, 19 Mar 2026 06:57:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C552104506B5;
	Thu, 19 Mar 2026 07:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773903439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cufaO28CZ8mdvtsLbBMDKPd5N2TrxMfvFWX1xemSY3g=;
	b=b7YLh9u0MW8sQB99Ekg7o2850IKqdOijcvbswGk7vSqEsJmoUh6B3hx20qN1ikoB2Pyzd0
	hRehOx8EBXQAYdXq8bKp8vfHdbvXAjgjYVmGVrYq62ZgO9yqSakEpF9kPOYVB1rpC7DTlD
	IqKuKSRtqkInzi0YOuDp+oayBctpHNpUa7vf20Kn8xwmWMIJacIl7IWrvYFfU5Ma2ILlW/
	IxQ3SfKYpqpOvhjHRUc9plPGAJniOF/+Vox7cj4aJYtZH5Wp2cpSsb7L+2Han6cO36lsWy
	R3WOJhGBEGBArjzaLa8BNhMyomiK3r8GUx9M/Vp4ZhGknGvyt2tjf5C/YLmadg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 07:57:16 +0100
Message-Id: <DH6KACIJTUKF.2I7WOQSMNY39E@bootlin.com>
Subject: Re: [OE-core][PATCH v3] go: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260318140356.7609-1-pratik.farkase@est.tech>
In-Reply-To: <20260318140356.7609-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 06:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233462

On Wed Mar 18, 2026 at 3:03 PM CET, Pratik Farkase wrote:
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
> Changes in v3:
> - Move go from PTESTS_FAST to PTESTS_SLOW (~45min runtime)
>   inside ptest-packagelists.inc
>
> Changes in v2:
> - Exclude .elf* files to fix QA arch errors on all architectures
> - Exclude *-x86-64* files to fix additional arch-specific test binaries
> - Tested on x86-64, x86, aarch64, and arm builds
> ---

Hi Pratik,

Thanks for the new version, but we still have some failures:

WARNING: core-image-ptest-go-1.0-r0 do_testimage: There were failing ptests=
.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunne=
r_expectfail
    self.do_ptestrunner()
    ~~~~~~~~~~~~~~~~~~~^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestrunner
    self.fail(failmsg)
    ~~~~~~~~~^^^^^^^^^
AssertionError: ERROR: Processes were killed by the OOM Killer:
[  132.843492] Out of memory: Killed process 769 (compile) total-vm:1553664=
kB, anon-rss:256564kB, file-rss:0kB, shmem-rss:128kB, UID:0 pgtables:644kB =
oom_score_adj:0


Failed ptests:
{'go': ['archive/tar',
        'archive/zip',
        'bufio',
        'bytes',
        'cmp',
        'compress/bzip2',
        'compress
	...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3319
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3294
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1277

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


