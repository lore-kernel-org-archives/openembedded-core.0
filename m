Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA43FEA8535
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 16:09:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41891.1772986167769212257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 09:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RIbDnYkJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5AA7FC42860;
	Sun,  8 Mar 2026 16:09:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 415D05FF9D;
	Sun,  8 Mar 2026 16:09:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 757FA10369968;
	Sun,  8 Mar 2026 17:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772986164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w5yhu1FBYOUl0cYTLPGl1UJVMOCV+m0mqAyapaLVZkU=;
	b=RIbDnYkJb9Y9NujPOlDlQaBNbMqa+6NPtX5Fh+Sq7oM8WOp3dXGX/HssB9rqToC5fxz7Kq
	OCUj235EEERkOwFkPXmSmJ8lyeAbcF2jWna0yHuEhDWT6W6jYEAnAal7CQn3Yebshp5e+k
	YOssNh4Qtu8kqaGXJ7RLuhjFRH4eSpl7BXziZnKNNRy4fmHt1GkdyKtfv5xTwlrlmYg5Vg
	hrBibrMZXfHpeYLYiKAhK04tnnLqW3vOJTDrqi1eBzN812/YIHlNY/P5mJHC9Hq6orjfKy
	xs69+p3OD6mK7ps+n21LDH1r2yRaL5Bwi/2p8CBu/DVpWIPq6HcGH9qNMA9bUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Mar 2026 17:09:22 +0100
Message-Id: <DGXJ52WWUKEO.GZLFB46U22IX@bootlin.com>
Subject: Re: [OE-core][PATCH v2] go: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260306172416.23307-1-pratik.farkase@est.tech>
In-Reply-To: <20260306172416.23307-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 16:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232663

On Fri Mar 6, 2026 at 6:24 PM CET, Pratik Farkase wrote:
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

Thanks for the new version.

On the autobuilder, the OOM killer is triggered on most tests:

[  314.773868] Tasks state (memory values in pages):
[  314.774517] [  pid  ]   uid  tgid total_vm      rss rss_anon rss_file rs=
s_shmem pgtables_bytes swapents oom_score_adj name
[  314.780755] [    138]     0   138     2490      268      235       33   =
      0    49152        0         -1000 udevd
[  314.782773] [    322]     0   322     2379      335      250       85   =
      0    53248        0         -1000 sshd
[  314.801338] [    328]     0   328     1015       53        0       53   =
      0    40960        0             0 syslogd
[  314.811001] [    331]     0   331     1015       53        0       53   =
      0    40960        0             0 klogd
[  314.819041] [    337]     0   337     1029      126       64       62   =
      0    36864        0             0 start_getty
[  314.820980] [    338]     0   338     1029      126       64       62   =
      0    45056        0             0 start_getty
[  314.823947] [    339]     0   339     1015       32        0       32   =
      0    45056        0             0 getty
[  314.826345] [    342]     0   342     1072      153       96       57   =
      0    45056        0             0 sh
[  314.835899] [    343]     0   343     1015       83       32       51   =
      0    40960        0             0 getty
[  314.837471] [    388]     0   388     2619      335      288       47   =
      0    57344        0             0 sshd-session
[  314.849074] [    390]     0   390     2684      454      353      101   =
      0    61440        0             0 sshd-session
[  314.850742] [    391]     0   391      639       73        0       73   =
      0    40960        0             0 ptest-runner
[  314.863046] [    392]     0   392     1028      105       64       41   =
      0    45056        0             0 run-ptest
[  314.868775] [    397]     0   397   335448    14669    14640       29   =
      0   245760        0             0 go
[  314.881173] [    398]     0   398     1028       97       39       58   =
      0    45056        0             0 run-ptest
[  314.882869] [    798]     0   798   371933    60075    60023       20   =
     32   630784        0             0 compile
[  314.893578] [   1230]     0  1230   371846    55334    55248       54   =
     32   589824        0             0 compile
[  314.895156] [   1381]     0  1381   371669    48968    48879       57   =
     32   540672        0             0 compile
[  314.904257] [   1445]     0  1445   371821    50116    50067       17   =
     32   552960        0             0 compile
[  314.907744] oom-kill:constraint=3DCONSTRAINT_NONE,nodemask=3D(null),cpus=
et=3D/,mems_allowed=3D0,global_oom,task_memcg=3D/,task=3Dcompile,pid=3D798,=
uid=3D0
[  314.910323] Out of memory: Killed process 798 (compile) total-vm:1487732=
kB, anon-rss:240092kB, file-rss:408kB, shmem-rss:128kB, UID:0 pgtables:616k=
B oom_score_adj:0

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3229
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3201
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1196

We might need to increase QEMU memory size. Did you had similar issues
on your side?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


