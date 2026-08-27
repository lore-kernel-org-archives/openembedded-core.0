Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6574C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:53:26 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30378.1787813597989398003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 23:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bTiN9pUH;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e067e908so1140995f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 23:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787813596; x=1788418396; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2eOnyG9lvO0Fr/tKpgcyrCpS9b1E+TPWFnKSMxb3fA=;
        b=bTiN9pUHpcC7RVB6+BOD1EerPJouJpYDMmdTZ7KltTXw/hoLxLOxZ8Dn7iQLIIpuGB
         BhmHKjgiS+jPQRTUtNZd9Yx8FKw+gJWufa+uw5yPAx/C7DnjgYOEOQjVh2uvjn2qviPF
         s/tCgebLri2lqon4OTydtzc8VSsPcNc0LvYLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787813596; x=1788418396;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2eOnyG9lvO0Fr/tKpgcyrCpS9b1E+TPWFnKSMxb3fA=;
        b=dMsrQlOnkLD//CVAUAMvV4TWM5fp3M+7SG76X/1wD0tlFPv9IP9ATNQawqemycuyDl
         LdjLaw6CkHAIh56fobkyftS7aws/sm/h5bTDqaLeLR7Vxct7PZqZo4EI8CSha7ui6vNF
         5PnCmwp3LSXgUJv/5lGLbjmtEJA0kZgsX6XKLkpv7FTnPsuvjoBf3GqufQ4dEfHQtQjC
         jYIRJGQL8piAQRYjv6JdpkwFvCGQkvBQV9a1b99lKnaWAvlQW9CPwbH3rPFQqhWtqu60
         aPd9fIBVM8D5pdlrLdNf+F8742olPw02MfgCLqPzHvdDngx3Hpy0i3pYVcWLQRBTIyWt
         OZlg==
X-Forwarded-Encrypted: i=1; AHgh+Rot/nU7JjUMPST0u7vv06MZC1xMw1hCnI8U0Yk1JWI8YPkwM1GaDwXeb3hmkyXQfEm1d8GxeWefDSXxTkiFUMvqcQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mAYesGPRPxVclLFyoV4+m6cBW7anUT+B0hqqm6jrDm4fZTdJfx
	d5KdBkhv6zNZYyInSmfQmJ63GJGxPR6wKVTaaWydnp5g/K/LiCuLp66bXcR6nUAGYMs=
X-Gm-Gg: AR+sD103PW+UwURWMWRuDBFdZ2XWdPXBN8UrIYrKipttJSLkH2snEawIvioI0UnHunw
	Q5mB5q+wvC8/9uf9nFZSFSyiZ443ZT5/gwSHXg1vfPFlvVzabfV2D6F7PSl6+qr//nUJcnaJqGJ
	ZO3gGbbCcZzEY5PQPysVUjw1zjXpxaZEIKZYxPr/O+SGkItXZjmtYmgWDjZYopD8bChgun0jrSP
	12bpTtkXa1LcNzAjjo1wuTjrLk5ne2KG31CnvCxpZ99yexA4DmV6sDyO3wrmLUduaUf0aa9Wmfv
	6Rf5vC4PF/sL6dGgdHdYuxVdW+/P7TVI9w2k/nF9ThBk0lJo3BgayQKB/OnR/DbDOE2p0rS9u4L
	yWWG3D+cff+hLBWt5IVZiRn9LHa1y/lQeo+ARBMz2n7rvs9v+ZWLvftDrIgnIym+c/L+UQoNyTg
	ZzG1BLM1JkkYUTAmii8VsDQ1eZI91Bq8/0PR64iHRA38qHesZvt9U3EMsa+ApG7TXvg2f85vJAA
	/GZ6J6vEZgdy1vZSfHjQxss6LAQW5dWwho0cYEPXGH7nJejoUHP
X-Received: by 2002:a05:600c:4452:b0:499:7219:122f with SMTP id 5b1f17b1804b1-499dc6fa855mr111640705e9.4.1787813596056;
        Wed, 26 Aug 2026 23:53:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4923662bsm24291045e9.3.2026.08.26.23.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 23:53:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 08:53:15 +0200
Message-Id: <DKZJ0ZDGIXW1.2LVIG3CITIMIS@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <deeratho@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260805083103.2633995-1-deeratho@cisco.com>
 <20260805083103.2633995-2-deeratho@cisco.com>
 <DKY47YY3L5UE.1DLQ2RS87JLFQ@smile.fr>
 <DM4SPRMB0074234D2F9F4B5F7D54EA6CC4AE2@DM4SPRMB0074.namprd11.prod.outlook.com>
In-Reply-To: <DM4SPRMB0074234D2F9F4B5F7D54EA6CC4AE2@DM4SPRMB0074.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244459

On Wed Aug 26, 2026 at 10:47 AM CEST, Deepak Rathore -X (deeratho - E INFOC=
HIPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
> Thank you for your review and feedback.
> These patches were originally prepared on top of the curl CVE fix
> series that is currently under review and already present in the
> wrynose/wrynose-nut review branches:
>
>   *
> curl: fix CVE-2026-4873 - openembedded-core-contrib - OpenEmbedded Core u=
ser contribution trees<https://git.openembedded.org/openembedded-core-contr=
ib/commit/?h=3Dstable/wrynose-nut&id=3D7e44b94a57a1b7d9ec043554fb7f1f4c3fbf=
bbaf>
>   *
> [wrynose,v4] curl: fix CVE-2026-4873 - Patchwork<https://patchwork.yoctop=
roject.org/project/oe-core/patch/20260731061427.14543-1-deeratho@cisco.com/=
>
>
> Because the remaining curl CVE patches in this series were developed
> on top of that patch, rebasing everything on the current wrynose
> review branch would require additional rebasing work once
> CVE-2026-4873 is merged. If you apply current curl patches on top of
> this CVE-2026-4873 fix, then there will be no build failure. Could you
> please advise on the preferred approach in this situation?
> I appreciate your guidance.
> Regards,
> Deepak Rathore

Ok, there was a bad interaction with other curl patches in my series but
those are gone now.
So, this series does apply cleanly and I've added it to my review
branch.

Thanks!

> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Tuesday, August 25, 2026 8:34 PM
> To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <=
deeratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded=
-core@lists.openembedded.org>
> Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
>
> On Wed Aug 5, 2026 at 10:30 AM CEST, Deepak Rathore via lists.openembedde=
d.org wrote:
>> From: Deepak Rathore <deeratho@cisco.com>
>>
>> This patch applies the upstream curl security fix backport for
>> CVE-2026-8286. The upstream fix commit is referenced in [1],
>> and the public curl advisory is referenced in [2]. The backported
>> commit link is also recorded in the embedded patch header.
>>
>> [1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de=
8319ad16
>> [2] https://curl.se/docs/CVE-2026-8286.html
>>
>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> ---
>>  .../curl/curl/CVE-2026-8286.patch             | 81 +++++++++++++++++++
>>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>>  2 files changed, 82 insertions(+)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch
>
> Hello,
>
> This series does not apply on top of the review branch anymore:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wr=
ynose-review
> |ERROR: curl-8.19.0-r0 do_patch: Applying patch '.../wrynose/bitbake-buil=
ds/poky-wrynose/layers/openembedded-core/meta/recipes-support/curl/curl/CVE=
-2026-8927.patch' on target directory '.../wrynose/bitbake-builds/poky-wryn=
ose/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/sources/curl-8.19.0'
> |CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/=
tmp/work/x86-64-v3-poky-linux/curl/8.19.0/recipe-sysroot-native/etc/quiltrc=
 push', 0, 'stdout: Applying patch CVE-2026-8927.patch
> |patching file lib/url.c
> |patching file lib/urldata.h
> |patching file tests/data/Makefile.am
> |Hunk #1 FAILED at 218.
> |1 out of 1 hunk FAILED -- rejects in file tests/data/Makefile.am
> |patching file tests/data/test1647
> |patching file tests/libtest/Makefile.inc
> |Hunk #1 FAILED at 100.
> |1 out of 1 hunk FAILED -- rejects in file tests/libtest/Makefile.inc
> |patching file tests/libtest/lib1647.c
> |Patch CVE-2026-8927.patch does not apply (enforce with -f)
> |
> |stderr: ')
> |ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wry=
nose/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/temp/log.do_patch.4688=
48
> |ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded=
-core/meta/recipes-support/curl/curl_8.19.0.bb:do_patch) failed with exit c=
ode '1'
>
> Can you please rebase and send a v2?
>
> Please note that there are other pending curl CVE patches, I'd recommand
> reviewing/testing patches to identify conflict at the earliest.
>
> Thanks!
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


