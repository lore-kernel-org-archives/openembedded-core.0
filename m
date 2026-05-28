Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3837CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:00:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10337.1779973224858102601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VndLFNGW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso35623345e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779973223; x=1780578023; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i57BK8xN/PfZ61OA9VDC2o/rVykDQfR3VtxV2Fd9n8c=;
        b=VndLFNGWvVZZ2loHZGMnoj86zNCq/2FCg0gXb47kx3JJWZd9AsXvL2PQz9BUkgQ/O8
         IEc+G8KQ1KzE6tjcv9FIlETbbCb+3P+BoE1G3ob9P8umGSpp3uc0fTJksaiyYZ9pijeQ
         q45keqQiRzP4qc489JU6NAOzJVQzFModhUHh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973223; x=1780578023;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i57BK8xN/PfZ61OA9VDC2o/rVykDQfR3VtxV2Fd9n8c=;
        b=CRGoTHtD8GP75ZAMZEbOIx1YzyaOfgZerfzavGFn76+30VG9+dlW5BobY0kBr08vod
         ScU/Kr7dDKDbLHff+m0Un/AXEUkdWMJTKCBRoT/OTRrVeY2Ni6mPG5s5gKDgzs/BWv2F
         3sHgNnt5I0KzwdHnggzM8VKqNbtwRosIU80WVaDw/rI5XFuhxYbdbZhYmxUPHnhQAc1D
         qsmAIwFgdhuqDpUoglZfitbAF0q81Gk90nVfaJDxaTWw+/3IEJmROdf9IXhCL6cjfQ7g
         ZW3Sm+0MKfyiohwwIypCUpcLstrWF+/BnKgp8fBRfHF5u+Ht9BJzuX5zWMx6qmNCcgR/
         D5Fg==
X-Gm-Message-State: AOJu0Yws0B7PjDx36KpYoiS1wRm/e1k9uVAf1kDxu51iGGw5QsWqwwLc
	a5/mIM1gp/cr4ofd2JWl6RZlXsiYCRTKFJViE5oCSfBhp0t0Js+pZNXPD02gMm6hPuI=
X-Gm-Gg: Acq92OGod298xa5aH8ty6wSVl5JeqjwPIa4ctvURmRAYB5atvvDUSW6t9ZCuFPlC5Bn
	WdhnqQOwOENd6FsHrrlE6ecbdKWDdeU9TmcdvBDFQzyjknhvXLKnSuFonueIEQtPKpoOsMxFQrG
	8ia0IlMxwzBotyZIYL0F5IziXMIZsrYSgrs2zHERCdnLtSr4UQqpJ+z7Os0kuR+6HwE6RyhOeoP
	83R7m09qiSTZjlArD8E4yt72pRuLKC5+wvj0gaTLJ1CKGlQNGtw6dV0+4l9ZegSEcrb6Ncn7lqL
	Uw0LeSbYGeKAS6HQNkpeQzbikei+O6ZRlZ0QZDtJAt4vXlToA5FundhxggQ34Go0f8gPJ5rycWi
	qNF1DOmWyTMXWs9gHtYJWHqSW71CSfeLQlvzJuljI+EAeiEl5KX75KJqgv5OdjXqBTN1Jg+HywR
	irhHHaQQh2+Xb2WuSkqiwr3adf4sFcc/5R1kwlSD0N4h+wYSt8E/zXl9p1aWYG1LkT/iS2In4vs
	0kizcgn99j0xxUrWvhrzxF2
X-Received: by 2002:a05:600c:8b21:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490958f2a8fmr19860495e9.13.1779973223092;
        Thu, 28 May 2026 06:00:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd? ([2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a82ea2sm69299135e9.9.2026.05.28.06.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:00:21 -0700 (PDT)
Message-ID: <ea78d370348fbc117e23085ae59791fce6c0b404.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 28 May 2026 14:00:19 +0100
In-Reply-To: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237703

Hi Bruce,

On Wed, 2026-05-27 at 22:37 -0400, bruce.ashfield@gmail.com wrote:
> Here's the latest -stable bumps for OEcore and yocto-bsps (again,
> let me know if the combined pull causes issues).
>=20
> I've also moved the dev kernel to v7.1 and fixed lttng-modules
> along the way. Hopefully a new point release will be available soon
> and we can quickly drop the backported patches.
>=20
> Also note that since ross removed the CVE exclusions .inc file in
> a patch (which I think is still pending), I haven't updated the
> exclusions for the kernel in this series.

Thanks for these. I put them in for testing and there are two weird failure=
s:

qemuarm64 musl python3 ptest:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/460

which leads to:

https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemuarm64=
-musl-ptest/python3.log

test_tracemalloc_track_race (test.test_tracemalloc.TestCAPI.test_tracemallo=
c_track_race) ... Fatal Python error: Segmentation fault

qemux86-64 musl libc-test ptest failure:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/444

which failed in functional_ipc_shm

https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemux86-6=
4-musl-ptest/libc-test.log

FAIL src/functional/ipc_shm.exe [status 1]

--- ptest result ---
FAIL: functional_ipc_shm


I'll rerun the tests, it is possible this is some weird intermittent
issue, I just can't tell :(

Cheers,

Richard

