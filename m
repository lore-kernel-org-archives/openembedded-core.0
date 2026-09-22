Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D16C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 08:08:18 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5114.1790064496801461605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 01:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z53OuGZR;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso33259355e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790064495; x=1790669295; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hi1SdbnN94XNL6RHAJMw29wrVqAm1jxJ7hx5cKR89BY=;
        b=Z53OuGZRFUA91ltjIWHcvDGfZdRGqiITC3Nk1oXa0KAdJcrboDIqoJfRJSlX52jGd9
         RDglERsrCqMjO4k6sJzrdqQqV4ryc+MJSPzmJDEbP1rC2KNc89Hv3bEp31rzTK9q7llI
         7J3oT/qTGyW884eTUUMIbStO4u529Fi8e/4/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064495; x=1790669295;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hi1SdbnN94XNL6RHAJMw29wrVqAm1jxJ7hx5cKR89BY=;
        b=s4PvNV08f621kXXhchMlg68QfTUEC5GCPvXou+wx3bazQYLfl3s8upQjDt990ZHoiN
         PZDd20dNHHo6RthySBh37q8cTw6485Nm9k1ow0mVkvaW+pmQKn7bHYt4g8oB/1XSlz0v
         g2AL5ZhSZc/YUMmEGb8eMdo8LpuL4vMyj42Yrjxhs1C7uEP7imi2Wmv4kZwoFOOA8WhN
         Q4H/jDdVBDjyBfn8RjgxDLOuNF7Lktt1nXhFDBLErNa5yZeLM8xZw3UVsxMz5vSLdlSt
         IDnMK73Mu7Yq7BM7iLu0uv0Dj5cBrppGKSEVHmPGoQnu5JLFCJILVTxQyZYFFljtFdGI
         8W2A==
X-Forwarded-Encrypted: i=1; AKwUvBx/qP1GpuCCUrlPqnI/eOJhLWF6sKKTli7NMtW5rMWQSZWAuSm1uRAthLU5OI/nMaGBJWXvznUFbaVjkxOmCCrN7g==@lists.openembedded.org
X-Gm-Message-State: AFuF++kFeCxDpUN+YSpeJITuOf9TpglfR7ndzkr57wwgD68gvJ9JgpPw
	ygbm0Yiu/1OaXVrd5nq/LtVZPCv4HR7HbK5+jH/UpL8haogYoPcFB9Ij6If+PCrckLg=
X-Gm-Gg: AYBFou1Tx14c/onEFJA0o+sG4kwtg30+nTJw7MzMHL8rUVQ+Y3LccnoAFVwjvq2U4he
	p0lUNRIljcdbH4CVpq1JSpliyWHY2GA5Ab+h7v15yq8PeIzrRtpluD6bOEcnKujiwsVAgG/V6O3
	YJOh6GYMNxjBuZ2zsO+a9fSkxiOXjL1ZkAiGnSNSVP/HA4cEr1wfwhw6XNdWBeM0Pzgs305twuS
	rB1POCdZbXGZQxZKWzE6ZVDj19GAXgYvj0PqouBn/R0uaZExW6khNjBeNNVWGI42iAz7gkcR4ru
	Sqv6dgvZo3nm9umq1ZXK8nVq8TZQsslkKWZI2G86cCGPjuAC/dUtdw/rMVcWi63f8/ekdIi3vO6
	Al1TYtqGDTJ/WZIXmSda1wxOOZHVr1olbd0KZc/+ggaw6n04KDrc6skz1Lqtn1Kjw//9nEulxJC
	XYfpgjgXiS4OCRPJayvz728A6zYpR9pXywdAvnM23j7PpG1X9XihAQgnzgY7ZZwfJ0knAenrU49
	MgBehizf1gTt/Q2qdIK/aLsifanSc87BQZrTyTfkpUJSdaJHTkk76V5178E3PsO3LiZXw==
X-Received: by 2002:a05:600c:a14:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49fc574be1dmr182704535e9.27.1790064494957;
        Tue, 22 Sep 2026 01:08:14 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad53b47sm30585085e9.13.2026.09.22.01.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 01:08:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 10:08:13 +0200
Message-Id: <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr>
Subject: Re: [OE-core][scarthgap] linux-yocto/6.6: update to v6.6.157
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <bruce.ashfield@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 08:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246389

On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.6 to the latest korg -stable release that comprise=
s
> the following commits:
>
>     79643295eba17 Linux 6.6.157
>     32e598324edc3 nvmet-rdma: fix queue leak when connect backlog is exce=
eded
>     [...]
>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for allocate vs=
 populate"
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
>  3 files changed, 20 insertions(+), 20 deletions(-)

Hello Bruce,

I think either this 6.6.157 upgrade or the 6.6.156 one triggers a
lttng ptest failure:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21 11:38:31+0=
0:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21 14:57:=
16+00:00

https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux86-6=
4-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.20260921110838=
:
(only one of each message):
|FAIL: kernel/test_userspace_probe 91 - Load command with opts: --input-pat=
h=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zSA9mh
|FAIL: tools/base-path/test_ust 35 - Load command with opts: -i ./tools/bas=
e-path//load-stream-extra-path.lttng
|FAIL: tools/save-load/test_load 2 - Load command with opts: -i ./tools/sav=
e-load//load-42.lttng
|FAIL: tools/rotation/test_ust 101 - App is un-registered
|FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command with optio=
n load-42
|FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list command with o=
ption yTVkM2lxbFoDS7Nu
|FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng enable-rotation siz=
e XML
|FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng enable-rotation tim=
er XML
|FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML
|FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XML after loa=
d
|FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for session load-st=
ream-extra-path
|FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi is valid
|FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger mi is vali=
d
|FAIL: tools/base-path/test_ust 39 - UST per-uid network trace path is vali=
d
|FAIL: tools/save-load/test_autoload 1 - Start session daemon
|FAIL: tools/save-load/test_autoload 3 - No session daemon to kill
|FAIL: tools/save-load/test_load 3 - Destroy session load-42
|FAIL: tools/base-path/test_ust 38 - Destroy session load-stream-extra-path
|FAIL: tools/rotation/test_save_load_mi 21 - Destroy session yTVkM2lxbFoDS7=
Nu
|FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
|FAIL: tools/rotation/test_save_load_mi 20 - Found the right rotation size =
value in list XML after load
|FAIL: tools/base-path/test_ust 40 - Validate trace for event tp:tptest
|FAIL: tools/base-path/test_ust 36 - Start tracing for session load-stream-=
extra-path
|FAIL: kernel/test_userspace_probe 92 - Validate userspace probe listing

Any ideas?

Thanks!
--=20
Yoann Congal
Smile ECS


