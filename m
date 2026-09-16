Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9749C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 10:22:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11787.1789554130903675216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 03:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=meJiENqU;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3825135e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 03:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789554129; x=1790158929; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CdRO1upt6ZuueNbqeUiwY6+kpQe+rMVHglUSOI8pvQ=;
        b=meJiENqUEnWHA3dN1ElmMZlp6L0sX+Vp4qEwu4K4B0I1kXcE7iF8XjBJmQ7xDOi2AE
         l/JXavCVS89hUddd65PdAt0fpW27EQqynq4KPPs1gwo1wY0d+jVzHWoWEb/NC3XpHhVd
         DgTPv/Q+keL3CL+MzKUDG5bCEmIodaCyJN+gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554129; x=1790158929;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CdRO1upt6ZuueNbqeUiwY6+kpQe+rMVHglUSOI8pvQ=;
        b=d7rhAgU/nxbM5pwlIbZmUU6DcbyG2WMb1JYT9hnDAFRp9tqfN7AmNyRL5Z49DesZJE
         kSk78JBMBE6zoKqiLq9HQJf9RNREXOPQqbvP3hWzYGYZXTH0LjXgUeZqHKy0yyevNrMi
         ugNkkUNdxiHbBFdVly4pzQUs56RMhCdpqmzSZxBcWHiIf8e56fmwMH1Svc+kjmF8q5pM
         XxKf3eeaI6TtwV57voLOC47go/3cUP9s9g3pt7N0HQA2P2d2TrYMxaSVo6XW6VV4ESzw
         ucpp0RQgrOWz1TFLgp+mq4Rb7WnTH6IQX8XoEGD6Sjdj/TaqHrHXdPgVL+GupeamWDz2
         ucJA==
X-Forwarded-Encrypted: i=1; AKwUvBxVIB23iKqCPScCzT4rkXyxxEYrVbjTwwbgC4h2nMKYf92MWmN0fU5s7ts4lOBQeE8MjjxWeQxOodZpjgt0PuLCRQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kXm9ABHvZ08UQV1PvkjQFlK6ltaWvuw/qJsVWDeiutaP1hjn1a
	NukcHoSPCZ5bO6PG51dWFc5My0W3spkYxAdliyy+KdkPrBo3rbycmumhiCu9ncuHVt4Vsg8lBaO
	/1exOtSY=
X-Gm-Gg: AYBFou0XBNy340TpIwg+pEcy97RW3TzU2vM6L2VLaBXusz4oM9VwCdGKbs7MIvNqCHh
	9x5l7DGshp6YeAxG6Zb8MutBzwYCO8wbxubp9BfFvWRPyx/acSupVe5M1gWRbJd3QpiI6G/3qYR
	wT/7KCRhtI4iyPUaQ7mLtQoIgpVmJVQrF8HH7eTlHgvhe9ZCwprbkJFu55bu0XUYStjLpfsiZwX
	3b2Rjiv5cVO0dU+UxOY5ytw2aL/QVY4KWN+XptW+OG69gabOpYLs9HGgXwU1fjD0u1YEkcHkfIk
	4bIsqz7p8/+TK/vvyR/QxYEMMlf6P4/WUQLmN05QarqlWxFsV/bgLwByxhQeBt/c/rXm9nt7zkA
	UEPFu6yR5PBcgLl9kjIyjemCmJNGEJKjtEQQR0zEQB7ttpnAf44VPewrw31gEaHa+KJqxNhGcTg
	Y2XZUyWaTxj4eb3DEDrDZHWYHBSO1Zyv+OKkfWliKkoxZn7ayWNvmXL3H6Lo16A46rXHSHupHAk
	yaXGas5c4iNZgKKEvKktOwnc8D7agenyFIPY3kPbG6c+y7Q0iJ+Kiwzt1g4ahfYY3/1JQ==
X-Received: by 2002:a05:600c:83c8:b0:49d:1916:59c7 with SMTP id 5b1f17b1804b1-49eac462f02mr18433135e9.7.1789554128947;
        Wed, 16 Sep 2026 03:22:08 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm5784441f8f.9.2026.09.16.03.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 03:22:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 12:22:08 +0200
Message-Id: <DLGNZT5O1D02.1UCS3DAPQ6NYE@smile.fr>
Subject: Re: [External] Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set
 CVE_STATUS for CVE-2026-64831
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Bhavesh Rajesh Maheshwari" <Bhavesh.Maheshwari@einfochips.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
 <20260910133357.452394-2-bhavesh.maheshwari@einfochips.com>
 <DLFYFNE7WFWL.3F3WFUFA1M1VX@smile.fr>
 <SN4SPRMB000391CFE6AF13DFA30508BBE5B92@SN4SPRMB0003.namprd04.prod.outlook.com>
In-Reply-To: <SN4SPRMB000391CFE6AF13DFA30508BBE5B92@SN4SPRMB0003.namprd04.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 10:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245949

On Wed Sep 16, 2026 at 11:22 AM CEST, Bhavesh Rajesh Maheshwari wrote:
> Hello Yoann,
> Thanks for the review.
> I agree that a downstream layer could enable Vulkan HEVC hardware
> acceleration. However, by default this configuration is not enabled or
> built by the ffmpeg recipe.
> Since the affected Vulkan HEVC code is not built with the default
> recipe configuration, the proposed fix would not be compiled or
> exercised in our default build.

Yes, that's understood.

> Could we instead handle this using a conditional CVE_STATUS, so that
> the CVE is marked as not applicable when Vulkan HEVC hardware
> acceleration is not enabled, while still allowing the CVE to be
> reported when the relevant configuration is enabled by a downstream
> layer?

In this case, the patch is really simple. So it can be reviewed by
reading it.

And, while, yes it would not be compiled during our process. It would be
on the code-path of downstream users that would activate vulkan. Then,
in case of an issue, they can review/notify us/send fixes.

Conditionnal CVE_STATUS are not a desirable outcome and more a
"last-resort" kind of thing: Here, I don't think this is worth it.

Let's backport the patch instead.

Thanks!

>
> Thanks,
>
> Bhavesh Maheshwari
> Engineer
> +91 8827543501
> Bhavesh.Maheshwari@einfochips.com<mailto:Bhavesh.Maheshwari@einfochips.co=
m>
> [cid:d82e07d2-bdd2-4ad9-b5ee-cc155ce89991]<https://www.einfochips.com/>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: 15 September 2026 19:50
> To: Bhavesh Rajesh Maheshwari <bhavesh.maheshwari@einfochips.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
> Subject: [External] Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set CVE_S=
TATUS for CVE-2026-64831
>
>
> CAUTION: This email originated from outside of the organization. This mes=
sage might not be safe, use caution in opening it. If in doubt, do not open=
 the attachment nor links in the message.
>
>
> On Thu Sep 10, 2026 at 3:31 PM CEST, Bhavesh R Maheshwari via lists.opene=
mbedded.org wrote:
>> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>>
>> Analysis:
>> - CVE-2026-64831 affects Vulkan HEVC hardware acceleration.[1]
>> - The ffmpeg recipe does not enable or build Vulkan HEVC hardware accele=
ration by default.
>> - Hence CVE is not applicable.
>>
>> Reference:
>> [1] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
nvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2026-64831&data=3D05%7C02%7Cbhavesh.mahe=
shwari%40einfochips.com%7C41484021a46a4dfe47bf08df13347c8e%7C0beb0c359cbb4f=
eb99e5589e415c7944%7C1%7C0%7C639250788317922015%7CUnknown%7CTWFpbGZsb3d8eyJ=
FbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl=
dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DyrPdD%2BheY4S%2BI%2Blk9W25PQl%2B48IbR6h=
DqkjhzHwdD38%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/CVE-2026-6483=
1>
>>
>> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>> ---
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recip=
es-multimedia/ffmpeg/ffmpeg_8.0.3.bb
>> index 8c1969369b..af05ab4af9 100644
>> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
>> @@ -186,3 +186,4 @@ CVE_STATUS[CVE-2025-59729] =3D "fixed-version: this =
CVE are fixed since v8.0"
>>  CVE_STATUS[CVE-2025-59730] =3D "fixed-version: this CVE are fixed since=
 v8.0"
>>  CVE_STATUS[CVE-2026-8461] =3D "cpe-stable-backport: this CVE are fixed =
since v8.0.3"
>>  CVE_STATUS[CVE-2026-40962] =3D "cpe-stable-backport: this CVE are fixed=
 since v8.0.2"
>> +CVE_STATUS[CVE-2026-64831] =3D "not-applicable-config: Vulkan HEVC hard=
ware acceleration is not enabled or built by this recipe."
>
> Hello,
>
> Nothing prevent a downstream layer from activating this feature.
>
> The CVE fix[0] (per NVD) is quite simple and does apply on the ffmpeg
> 8.0.x branch. Can you send a backport of the fix instead?
>
> I'll keep reviewing the rest of the series.
>
> [0]: https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
code.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fpulls%2F23665%2Fcommits%2Fea8087200ce91=
f3f296a30541a89b19ae4af19a2&data=3D05%7C02%7Cbhavesh.maheshwari%40einfochip=
s.com%7C41484021a46a4dfe47bf08df13347c8e%7C0beb0c359cbb4feb99e5589e415c7944=
%7C1%7C0%7C639250788317952327%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd=
WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0=
%7C%7C%7C&sdata=3DSvy41Azt9Tq9hacdbW%2BYKDW6HUUQGxDJ7n%2FWQKoUaus%3D&reserv=
ed=3D0<https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23665/commits/ea8087200c=
e91f3f296a30541a89b19ae4af19a2>
>
> Thanks!
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


