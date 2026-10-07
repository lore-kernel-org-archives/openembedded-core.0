Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB34CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 12:29:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8440.1791376188531118766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 05:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KfOnv2vt;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso14576005e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791376187; x=1791980987; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jW5jurKE2X+WVXLUJd9w8yTL+HvaGPQgpcenv0EZVJk=;
        b=KfOnv2vt0IKsytEgMZqKW58MH4+oDy/uK5m9gMLsRzmYdUBDJsbBS4D/tVLc7/fqi+
         z802DCKhIKuMnw+jTMDUWA0BIELyT04yoZHkngS4bVtA8EyHAcuAOKtYD88dZ5PnmLHv
         ia42sI80GMmqUJSgAG6yLjCsFnzMr0uyrntds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376187; x=1791980987;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jW5jurKE2X+WVXLUJd9w8yTL+HvaGPQgpcenv0EZVJk=;
        b=XeJDqOgb8hVhRkAWUCLXqVUS4efWJxFgRWWNkC2uIQ185DMDA1SnNFZxTUpSQ8q7bd
         d3eSrKCM2Tjs1WR5wtMO6b8POpwLPdM8Udr/zj4SOMizFoFUDuWhuXxdugRuXgFQancg
         4N5Gw6R6aNF8WC2rWGL3NrzIDkDbnDwr9SY96BcL0fG98RWjiephps92TsPjKC+8K2Eu
         PtgaKgYMjK1qWtHxqr9FRC+AkZDjBppiVAzq5hioy/ED2Em0Y4KINcWLeJ4KsvIUOwP6
         3L/II6ajOnNcJMk8Dp09XujGY97Gt7h9gwqdkRhYIKXzqPoCvFBemVcjtVxYBVADbpX9
         Gg3A==
X-Forwarded-Encrypted: i=1; AKwUvByRuE+pZJibTO1nqiWkYXRjomCNCOgjtkHkqLQgRjW1uINyk+pRS+kWScf6RxOr+5ipRe5Wgf8xk9oVJtFGAwOKsg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mUFISf/OpZZKfUgA54ymZ1PURVfReYlEkAcuU16Zejp9pqs+ZO
	NkKsoNlChYW79bhinJJ6+BxXOenLMa6Ca95V/TM5oDnamYvZjyUW8sX6fOGytBf0g9E=
X-Gm-Gg: AYBFou151s3io7d+XWqtLhfwIIW6oWrTY80pH5i67/+GvOr3xZUSOufiiXj67yhqMLg
	aLrL1zJSdEDx5eIJVVB9oqbi6M1zKnCiwy0DRVXKJMJMy4C9viYoFybsgq6I2QMb3xWcWLZ5F3v
	mVzyfgVYuLspbxSRiKZGdn2hvk2Sa5/EkVzWqyJKyAV/wfLtcOBPipXNutoPwcegSJsRt2uHnIC
	ZaA1KQF6cW1gdT8tl7x2QOrVmf9N7Jcdt8HkUf1NoxBB2jWCp1yPCb33XPx+U6/ZSZPwDsx0wQO
	sDRj+OBpTt3tZ0VSrR3H5RCtRQZZlNrxesGq+jijNq8OKXLm0J7SnpHjCpR1zgWfp7DxYfa1Qzp
	wqFMgJszCPlx4q5aH6nqcn0WygUrX7htKKc3YD6J+RT7u8QjtJ6a2R7R8m/kO0GX0c7EC3py1rv
	x30ZAze0wX+sIqa71NNrM5/UhElRJx60KdHk1c0XZwj+67UnerVakiOR53agoxc5z6s5Ix2lT91
	QCC1KnFxVXs4brRSi2V6wEACefm4OnJOZkCeRkvH+S2FfUDNpaivfXYnH0+dBr11PBIEkNH
X-Received: by 2002:a05:600c:6989:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-4a1806677b8mr31585685e9.31.1791376186542;
        Wed, 07 Oct 2026 05:29:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm50109775e9.1.2026.10.07.05.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:29:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 14:29:43 +0200
Message-Id: <DLYLUXTA79UR.2K5DQBMI5ECVY@smile.fr>
Subject: Re: [External] Re: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix for
 CVE-2026-66041
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Bhavesh Rajesh Maheshwari" <Bhavesh.Maheshwari@einfochips.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
 <20260922070209.2770399-5-bhavesh.maheshwari@einfochips.com>
 <DLPJC96BOERE.3M87L9353GN17@smile.fr>
 <SN4PR04MB8398087B79EA4DA077A16DD1E58D2@SN4PR04MB8398.namprd04.prod.outlook.com> <SN4PR04MB83987B1FF67226603695A7CDE5962@SN4PR04MB8398.namprd04.prod.outlook.com>
In-Reply-To: <SN4PR04MB83987B1FF67226603695A7CDE5962@SN4PR04MB8398.namprd04.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 12:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247398

On Mon Oct 5, 2026 at 1:00 PM CEST, Bhavesh Rajesh Maheshwari wrote:
> Hi Yoann,
>
> Any update on this

Hello,

After checking, I'll take those into my branch for test/review. Those
headers are indeed not exported but We had to check the upstream
source's Makefiles to check that. I would have appreciated a direct link
to that (for next time!)

Regards,
>
>
> Thanks,
>
> Bhavesh Maheshwari
> Engineer
> +91 8827543501
> Bhavesh.Maheshwari@einfochips.com<mailto:Bhavesh.Maheshwari@einfochips.co=
m>
> [cid:d3773a93-eb5a-4d0d-a651-42fd8103d1c8]<https://www.einfochips.com/>
> ________________________________
> From: Bhavesh Rajesh Maheshwari <Bhavesh.Maheshwari@einfochips.com>
> Sent: 28 September 2026 15:48
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; yoann.congal@smile.fr <yoann.congal@smile.fr>
> Subject: Re: [External] Re: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix for=
 CVE-2026-66041
>
> Hi Yoann,
> Thanks for checking. I looked at the FFmpeg 8.0 QuircContext documentatio=
n and source. Although Doxygen lists the struct, it is defined in libavfilt=
er/vf_quirc.c and used as the quirc filter=E2=80=99s private context. It is=
n=E2=80=99t part of the public API.
> The patch adds width and height fields to that private context, and the b=
uild with the patch applied is verified. I don=E2=80=99t expect this to bre=
ak supported external code. The only potential concern would be downstream =
code relying directly on this internal struct layout.
>
> Thanks,
>
> Bhavesh Maheshwari
> Engineer
> +91 8827543501
> Bhavesh.Maheshwari@einfochips.com<mailto:Bhavesh.Maheshwari@einfochips.co=
m>
> [cid:a6d6c0b2-4532-484b-9ec6-adca64de6f13]<https://www.einfochips.com/>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: 27 September 2026 02:07
> To: Bhavesh Rajesh Maheshwari <bhavesh.maheshwari@einfochips.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
> Subject: [External] Re: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix for CVE=
-2026-66041
>
>
> CAUTION: This email originated from outside of the organization. This mes=
sage might not be safe, use caution in opening it. If in doubt, do not open=
 the attachment nor links in the message.
>
>
> On Tue Sep 22, 2026 at 9:01 AM CEST, Bhavesh R Maheshwari via lists.opene=
mbedded.org wrote:
>> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>>
>> Pick the patch from [1], also referenced in the NVD report [2].
>>
>> [1] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
code.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2F4da9812e25894fb51d62a8875cfa8e=
b39b5e20f5&data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C7fe67053e=
d514d0a521d08df1c0df794%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260=
518444725508%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD=
AwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=
=3DyXRkqouFPx5rn7HcXqCIyLYvG6DGjw%2F5lRPYq544zPg%3D&reserved=3D0<https://co=
de.ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25894fb51d62a8875cfa8eb39b5e20f5=
>
>> [2] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
nvd.nist.gov%2Fvuln%2Fdetail%2Fcve-2026-66041&data=3D05%7C02%7Cbhavesh.mahe=
shwari%40einfochips.com%7C7fe67053ed514d0a521d08df1c0df794%7C0beb0c359cbb4f=
eb99e5589e415c7944%7C1%7C0%7C639260518444753817%7CUnknown%7CTWFpbGZsb3d8eyJ=
FbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl=
dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DUvlOY1pB7KYXkF5k%2Bgyx5DEihvVKJ3yojDR%2=
F7QLFNpg%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/cve-2026-66041>
>>
>> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>> ---
>>  .../ffmpeg/ffmpeg/CVE-2026-66041.patch        | 60 +++++++++++++++++++
>>  .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
>>  2 files changed, 61 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041=
.patch
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch =
b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
>> new file mode 100644
>> index 0000000000..7a8c4e0c8b
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
>> @@ -0,0 +1,60 @@
>> +From 9db6b5816516b85e981e177863b2eb361dbec3c8 Mon Sep 17 00:00:00 2001
>> +From: Michael Niedermayer <michael@niedermayer.cc>
>> +Date: Sun, 28 Jun 2026 15:33:38 +0200
>> +Subject: [PATCH] avfilter/vf_quirc: resize the quirc buffers when the i=
nput
>> + size changes
>> +
>> +Fixes: out of array access
>> +Fixes: JbvzNObhorBp
>> +Fixes: 030e140145 (lavfi: add quirc filter)
>> +Found-by: Adrian Junge (vurlo)
>> +Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
>> +
>> +CVE: CVE-2026-66041
>> +Upstream-Status: Backport [https://nam04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fcode.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2F4da981=
2e25894fb51d62a8875cfa8eb39b5e20f5&data=3D05%7C02%7Cbhavesh.maheshwari%40ei=
nfochips.com%7C7fe67053ed514d0a521d08df1c0df794%7C0beb0c359cbb4feb99e5589e4=
15c7944%7C1%7C0%7C639260518444773405%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcG=
kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D=
%3D%7C0%7C%7C%7C&sdata=3DfL9bPK6QDy%2FfoOT4NV2UwWLNCNW3NU12RP0eKmsBr7Q%3D&r=
eserved=3D0<https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25894fb51d=
62a8875cfa8eb39b5e20f5>]
>> +
>> +Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>> +---
>> + libavfilter/vf_quirc.c | 12 ++++++++++++
>> + 1 file changed, 12 insertions(+)
>> +
>> +diff --git a/libavfilter/vf_quirc.c b/libavfilter/vf_quirc.c
>> +index 59dc84caa8..d2ba48e7bc 100644
>> +--- a/libavfilter/vf_quirc.c
>> ++++ b/libavfilter/vf_quirc.c
>> +@@ -36,6 +36,7 @@ typedef struct QuircContext {
>> +     const AVClass *class;
>> +
>> +     struct quirc *quirc;
>> ++    int width, height;
>> + } QuircContext;
>
> Same question as 1/5: https://nam04.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.ffmpeg.org%2Fdoxygen%2F8.0%2FstructQuircContext.html&d=
ata=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C7fe67053ed514d0a521d0=
8df1c0df794%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260518444792117=
%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOi=
JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxB5mU5FhBSh=
AJ7zomz7F7lBWu2BBpYTDKNAdGXAR0QM%3D&reserved=3D0<https://www.ffmpeg.org/dox=
ygen/8.0/structQuircContext.html>
> Are you sure this does not break existing code?
>
> FYI, for the series as a whole: Since 2-4/5 are indenpendant of 1,5/5,
> I'll keep 2-4/5 in my branch for tests/reviews but hold 1,5/5 while we
> clarify the API change.
>
> Thanks!
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


