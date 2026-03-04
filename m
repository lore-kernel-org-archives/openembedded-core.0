Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D334EF8FF4
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 15:15:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20517.1772637340982875327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 07:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T1xmsFOP;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48378136adcso41686605e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 07:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772637339; x=1773242139; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu3HTLAqUs5/eQrH9tbjQKBC+jjQpPRODQDpbO0WlSc=;
        b=T1xmsFOPl5RoBp15vzCcDnGzdqF50sgHhsesObQqYh+z/RbqPmRa0uTZppOoCKch+L
         oAqUaDi/dCwbPNW2LlnC6jaFqtKPlsEDxBDLYbawmqMuxWPBxzeVze0WU95PvIz8+5D0
         YHjnSy2QEoNH4cxFq+Jg88Bte7Obben9LtlTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772637339; x=1773242139;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iu3HTLAqUs5/eQrH9tbjQKBC+jjQpPRODQDpbO0WlSc=;
        b=ryH+OC4q6wik3tEBjWlNyUf3Ke5BJBg+Q1Hf6bmqWpSmVJfuGsHY7Rpw8LkfEnJEKY
         k1QCAT+NO0Ou/QsyC3vG5x8Km/jEFtO2ZmlzgfZyXeCPrZywXOTiJGv5ZyFlTVZnKMRw
         5tqjBqLoAvVfV3wTa8oYOBjC/dNIbZF48DdmcDcUz7D+puj2rKjviXQjBRU0XBh/7OIw
         1ezzcpGG0hPHFWolq61nlaMYYDGKV+KWyF8VZyOPEZfcFXiqK6BHnWmLoOxUEdfc9eZa
         ZA82FQA25k2yACwXC7W9R8FcirrqqXmmxrF41nMvZVyjDBQT+rKAJVMMfIEo/vSWEQW7
         6njQ==
X-Gm-Message-State: AOJu0Yz7wUhs78ZEbt6LD8YawOgmWDAGZacJTRSUzppJpK7Emt4B3kCh
	lyHTzQ3obRA3+iG2G+HomGFJlLRNIk+5rehaCyIEArLojEsF2V58vOzClKjm9trgqlA=
X-Gm-Gg: ATEYQzyjFyWG6/XG45Mnhf+48UmeOeYyqrHF2lwmfE1/GBRihI1fBHi2W+BO6JSK9Zo
	t8yf6PuBiAxYTKR5mDVUTYScMgilPz4KVeKvZ+N5rwbGbuEmc/l/NsK5ZEHwJkBY5+MB6tN+9r5
	aJ4RMcprzOeRtVeQRCsN9QDglDWB3DFpWYXokforF5OE0UnAfqNxyqUpJwTVRhE9GVECuUQW8GB
	w+7A3+JRv5iBkc+z1LT/07WNu/xfaVDgqjyAWAVTbpp3EN6Rup5CJraAfuvvcHoxlS8Jie+SLSw
	zmO6Id6FYGli2d4Y7m5+gzQbrfPB6DsbtupI51L9tINgVtqjqq88vjb4rc4fFtajmFdnB/5Hu+P
	uZRsoMl/YMZ3CxPqaiTkgmCwNul5xUmZAKKtVYr5Yc5OK8jy2+q0G3bRVbCxKUw89HyI9WHNTSN
	g0W970ISelVihE4WL2Mxt0nVSRxkKp2d4UR6idyNhn5A0nrgw6LhMjSQO3DExwqEkSV0M/1nYBk
	4xMV/N0Zgs=
X-Received: by 2002:a05:600c:458d:b0:47d:586e:2fea with SMTP id 5b1f17b1804b1-485198571b0mr39551755e9.15.1772637339182;
        Wed, 04 Mar 2026 07:15:39 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a0485ca0asm59140436d6.11.2026.03.04.07.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:15:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 16:15:34 +0100
Message-Id: <DGU3HPLPGFES.23M3LOS6Y7S4H@smile.fr>
Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Jiaying Song"
 <jiaying.song.cn@windriver.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "Paul Barker"
 <paul@pbarker.dev>
X-Mailer: aerc 0.20.0
References: <cover.1767772757.git.yoann.congal@smile.fr>
 <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr> <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev> <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <5549493a25264654b39a48522691b15feece176c.camel@pbarker.dev> <04c34334-5342-4711-bcdf-177da37b6fdc@smile.fr> <6164cc2da28a6a9e637b47bde280254af4ed6384.camel@pbarker.dev> <CAMSfU+4xvshEKX3ze=w10+iwFsNm7sr8Mz5svaRQ_tuZ2Z-1xA@mail.gmail.com> <AS1PR10MB5697D5349A3C15D8B6E731EFFD7CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697D5349A3C15D8B6E731EFFD7CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 15:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232382

On Wed Mar 4, 2026 at 12:10 PM CET, Peter Marko wrote:
> Hello Yoann, Paul,
>
> What shall we do with this patch?
> Drop or take?
>
> I also think that it=E2=80=99s intrusive, however having this fixed on ol=
der Yocto release and not fixed in newer is weird.
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3Dd9f52c5f86bcc4716e384fe5c01c03d386d60446

Hello,

For context, here an update on status in other distros:
Debian did not fix it:=20
https://security-tracker.debian.org/tracker/CVE-2025-66471

Ubuntu has not fixed for most releases:
https://ubuntu.com/security/CVE-2025-66471

Redhat did take the patch:
https://access.redhat.com/errata/RHSA-2026:1254

So the situation in other distros has not changed much.

I looked closer at the patch:
* There is indeed an API change:
    ContentDecoder.decompress(..., max_length: int =3D -1)
    BaseHTTPResponse._decode(..., max_length: int | None =3D None)
  But this has a default value so existing code will use that and
  preserve current behavior (uncompress without limit).
  That could be a problem for users that subclassed those but, a
  decompress() without max_length would have the CVE so better fix it
  and _decode() is not intended to be subclassed (as private?)
* The upgraded dependency to brotli >=3D 1.2.0:
  * is optional
  * existing brotli 1.1.0 (in meta-openembedded/scarthgap) will still
    work but generate a valid warning (the 1.1.0 version of brotli can't
    support fixes for this CVE)
* For what it's worth (not much), this patch was in released scarthgap
  5.0.15 for 1.5 months and yet we had no user reports.

I don't see how you could fix this CVE without changing the API you have
to limit the size of the decompressed data, but you also have to pass
the maximum size to the underlying decompressor somehow...

Interestingly, urllib3 has paid support available:
https://urllib3.readthedocs.io/en/latest/index.html#for-enterprise
Maybe an interested party can ask through that for a smaller fix?

In conclusion, I'm leaning toward taking the patch : while it is
definitely intrusive, some care was taken in it to ensure
compatibility and the breakages are inherent to the CVE.

Paul, would you agree?

Regards,

> Peter
>
>
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Friday, January 30, 2026 11:34
> To: Paul Barker <paul@pbarker.dev>
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; openembedde=
d-core@lists.openembedded.org; Jiaying Song <jiaying.song.cn@windriver.com>
> Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
>
>
>
> Le mer. 7 janv. 2026 =C3=A0 15:05, Paul Barker <paul@pbarker.dev<mailto:p=
aul@pbarker.dev>> a =C3=A9crit :
> On Wed, 2026-01-07 at 13:47 +0100, Yoann Congal wrote:
>>
>> Le 07/01/2026 =C3=A0 13:32, Paul Barker a =C3=A9crit :
>> > On Wed, 2026-01-07 at 12:19 +0000, Marko, Peter wrote:
>> > >
>> > > > -----Original Message-----
>> > > > From: Paul Barker <paul@pbarker.dev<mailto:paul@pbarker.dev>>
>> > > > Sent: Wednesday, January 7, 2026 12:49
>> > > > To: yoann.congal@smile.fr<mailto:yoann.congal@smile.fr>; openembed=
ded-core@lists.openembedded.org<mailto:openembedded-core@lists.openembedded=
.org>;
>> > > > Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com<mailto:Pet=
er.Marko@siemens.com>>
>> > > > Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
>> > > >
>> > > > On Wed, 2026-01-07 at 09:08 +0100, Yoann Congal via
>> > > > lists.openembedded.org<http://lists.openembedded.org> wrote:
>> > > > > From: Peter Marko <peter.marko@siemens.com<mailto:peter.marko@si=
emens.com>>
>> > > > >
>> > > > > Pick patch per [1].
>> > > > >
>> > > > > [1] https://nvd.nist.gov/vuln/detail/CVE-2025-66471
>> > > > >
>> > > > > Signed-off-by: Peter Marko <peter.marko@siemens.com<mailto:peter=
.marko@siemens.com>>
>> > > > > ---
>> > > > >  .../python3-urllib3/CVE-2025-66471.patch      | 930 +++++++++++=
+++++++
>> > > > >  .../python/python3-urllib3_2.5.0.bb<http://python3-urllib3_2.5.=
0.bb>           |   1 +
>> > > > >  2 files changed, 931 insertions(+)
>> > > > >  create mode 100644 meta/recipes-devtools/python/python3-urllib3=
/CVE-2025-
>> > > > 66471.patch
>> > > >
>> > > > This seems like a very large patch for a CVE issue. The changelog =
entry
>> > > > in the patch also says that the API of urllib3.response.ContentDec=
oder
>> > > > is changed.
>> > > >
>> > > > We should look for a narrower fix, and only take this if there is =
no
>> > > > other option.
>> > >
>> > > I originally didn't want to patch this CVE due to this reason (and d=
idn't patch it in kirkstone).
>> > > But since this has landed in scarthgap, I decided for the same in wh=
inlatter for consistency.
>> > > Should we revert it from scartghap?
>> >
>> > I don't think we need to rush to a decision.
>>
>> On my side, I need to do the whinlatter 5.3.1 release build on Monday.
>> I propose to set this patch aside to not block the release and the other
>> patches.
>
> Agreed.
>
>> For scarthgap, we can revert the current fix and add the "proper" fix
>> when we have it. I'd rather avoid a patched->applicable transition on a =
CVE.
>
> We don't need to do this immediately, let's take a little time to think
> and see if others have any thoughts.
>
> Ubuntu seem to have applied the patch with post-fixes :
> https://git.launchpad.net/ubuntu/+source/python-urllib3/tree/debian/patch=
es?h=3Dubuntu%2Fnoble-security
> CVE-2025-66471.patch # the upstream patch
> CVE-2025-66471-post1.patch  # Remove brotli version warning
> CVE-2025-66471-fix1.patch # Revert fix for zstd
> CVE-2025-66471-fix2.patch # Fix zstandard using unknown attribute
>
> but also, has deem the fix too intrusive for most maintained releases: ht=
tps://ubuntu.com/security/CVE-2025-66471#status
>
> Debian has not patched: https://security-tracker.debian.org/tracker/CVE-2=
025-66471
> Intrusive to backport; requires update for src:brotli for effective fix
> The fix requires an updated src:brotli >=3D 1.2.0 for the fix to be effec=
tive,
> which adds the optional output_buffer_limit option to avoid these attacks=
.
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


