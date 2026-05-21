Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7874CD5BAA
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 08:50:13 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32380.1779353410056421645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 01:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R+83ahAy;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43fe62837baso3390607f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779353408; x=1779958208; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcsUXPP9D+R6fXowxPddR9/IL8mb4i1PMZyJyWCxt04=;
        b=R+83ahAydHVa2HUF2Os9B75hNpsNFBWA+z1ReNvGRxSivjH+8kld35n+wMRoVTajfy
         cM4+Bl3o6kU7i9bZRw+poJfvwpxK0h5JPhlq9AUiLHGS6KS7ICVRq8lp7NGl2FMndHFD
         +M70smL4DNROzliQijSC/XjCCOmN3YKC2uH3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353408; x=1779958208;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcsUXPP9D+R6fXowxPddR9/IL8mb4i1PMZyJyWCxt04=;
        b=tR8BFerWFQGCLHro07Zf/Y8AWGDsd/qi39sGY3dqOmt1Gm8oC83F35A6FdIbeHtmjU
         BFvz5sK+UIYotnxs/AlP5NMvomH7H1lDacCDh2PwpahqEURwC8gQOseq0J6CkYeAM1Cy
         nnDYMTec9gqFt8IA7B0OuhU4CQUBDOEb1yp5EHiUgPEB5VB9SvEW978cMxyMIjgWHMcG
         KVkls5VsWUe2muYmJpciwDTgMrYEEXOq+UDAQs4iVSiqqlmnIsSfFBKCaRStvveuIW5J
         NHQaV7Qq+JnbAd33uHaXByr7/BLchz+V0VqkV8MO0+KQjzzv+iDW4owRB/vQJr7BBxgM
         I+YA==
X-Forwarded-Encrypted: i=1; AFNElJ84NTGyPNtqQvO01BtCWmT5YZI4TIhoKecwbbPUDfvn0GDV17CdTzLJVZfbCUkR5yTjZ2HnM071lPZ2jf7tMajHEw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCG+TP16FU/nOawaOA4Wp2BlgenrvlAYt0fdKT9nWFvcmRiCpY
	za6C7eJJBQOJ5cVjDPuEKIjbtcHmwLbQkkophTxXZznuvuowsJo0WhTtPIRdLhkNXSs=
X-Gm-Gg: Acq92OF284uomMCpaaVzcObg4p6amRtBreEe9y2IZ84wsMk0R6N2oWCxfTQhzL9hGCo
	XG2EhPb6//T8AT2PW6VxCpWUjeh9WTp39nVk+dMadkeMIOMlJsBkwG634zbQKqaePtNEl+EiH0E
	Vc03IMaPo5h95Yw71uZE/ticHjR2iuioag/LRQIGROAhx99GwuiR4Sh+dO6WHBpToQwKZW5qAfC
	i0bWSfLqJzMq4G90JA9cdzlPISweKtMb0BjxbBR8cmtFSK0g7qQRbmiK9Y98ffrgPFi0S1B1QFm
	wCO1/aagBxP9woKoL9EsFAwG7onqLl2E12w9VTDpKPV72dmRJoJi7d4VsWLjrhq1h1Jtw/v+/3t
	h7E0cn2Ureh2BHfIz1fkkpmnBvowpHFU654gM75HHt9SB69nkOg2z1tZ4Hjie5LnrCwKPMPNjIi
	uXdPGGs49pqjwh3LT8smhVIZqVN0WWfrNV9mtjrj0TWsjFyE+dojxgJ6zVvkTD2yFZ7lyJkv4Pm
	UgpvsvtZGWHawL5hKcf5gWOYg==
X-Received: by 2002:a05:6000:220d:b0:451:2157:6291 with SMTP id ffacd0b85a97d-45ea413afb3mr2938406f8f.41.1779353408387;
        Thu, 21 May 2026 01:50:08 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa944995sm1089417f8f.34.2026.05.21.01.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:50:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 10:50:07 +0200
Message-Id: <DIO852TLB09U.2JG6JG4L1XMIE@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH] scripts/install-buildtools:
 Update to 5.3.2
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <aleksandar.nikolic010@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260314180151.43501-1-aleksandar.nikolic22@pm.me>
 <20260314180151.43501-3-aleksandar.nikolic22@pm.me>
 <DH2RVWI85JHY.9VXXCUXB22I3@smile.fr>
 <2115555.1778649727366269581@lists.openembedded.org>
In-Reply-To: <2115555.1778649727366269581@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237482

On Wed May 13, 2026 at 7:22 AM CEST, Aleksandar Nikolic via lists.openembed=
ded.org wrote:
> On Sat, Mar 14, 2026 at 09:03 PM, Yoann Congal wrote:
>
>>=20
>> On Sat Mar 14, 2026 at 7:01 PM CET, Aleksandar Nikolic via
>> lists.openembedded.org wrote:
>>=20
>>> Update to the 5.3.2 release of the 5.3 series for buildtools
>>>=20
>>> Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
>>> ---
>>> scripts/install-buildtools | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
>>> index c3f257ff93..b9c008a2ec 100755
>>> --- a/scripts/install-buildtools
>>> +++ b/scripts/install-buildtools
>>> @@ -57,8 +57,8 @@ logger =3D scriptutils.logger_create(PROGNAME,
>>> stream=3Dsys.stdout)
>>>=20
>>> DEFAULT_INSTALL_DIR =3D
>>> os.path.join(os.path.split(scripts_path)[0],'buildtools')
>>> DEFAULT_BASE_URL =3D ' https://downloads.yoctoproject.org/releases/yoct=
o'
>>> -DEFAULT_RELEASE =3D 'yocto-5.3.1'
>>> -DEFAULT_INSTALLER_VERSION =3D '5.3.1'
>>> +DEFAULT_RELEASE =3D 'yocto-5.3.2'
>>> +DEFAULT_INSTALLER_VERSION =3D '5.3.2'
>>> DEFAULT_BUILDDATE =3D '202110XX'
>>>=20
>>> # Python version sanity check
>>=20
>> Hello,
>>=20
>> I already sent it: [whinlatter][PATCH] scripts/install-buildtools: Updat=
e
>> to 5.3.2
>> https://lore.kernel.org/openembedded-core/20260312231730.751467-1-yoann.=
congal@smile.fr/
>>=20
>> It should be merged soon.
>>=20
>> FYI, I've noted to do this upgrade in the next review cycle after each
>> release. Feel free to remind me if I forget.
>
> Just to be on the same page, will you do this for all actively maintained=
 branches?

I plan to do it for the maintained stable branches yes (currently scarthgap=
 and
wrynose). On that note, I just added the 5.0.17 upgrade to my review branch=
.

Regards,

>
> Cheers,
> Aleksandar
>>=20
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


