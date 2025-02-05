Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CA3C02199
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 21:55:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.25294.1738792539062793515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 13:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nldndv/B;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401c68b89eso245550e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 13:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738792537; x=1739397337; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyatLvNIy2ulG5JDOrYgnWPft/7Cpgy4NtlcXJNGCa0=;
        b=Nldndv/B/pOt+wOLmjr9vK6bOM8vhiITNuAWXjfJNVtAlJz0924Hzmm0DP3melTXlw
         BdXQBZXoug6Szg7HL3cskGPpjdl6hGWp+alUxaH/L2hGVU1JdSo4OF/1PFRp7NRw6vVJ
         HbUFU9XWmVRvZj3x+1Y1B0q4nD8zmxeTFD3GU/6Ny1wYOnVXs5fppld5bcq2igI00Fy/
         NleTTcjGnx6TFdw6piti/yxQHB+yP9/xG93TGDZX+mVut9rJUgTIV6wwzzvGP3AA2NHo
         Rfz/bTlA/+/bcYPA+XzOEyyJ3wpB3P2Mf+XoAv45jHXSbi7Wt+qprZZ8alkfMmk2J3SE
         cDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738792537; x=1739397337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyatLvNIy2ulG5JDOrYgnWPft/7Cpgy4NtlcXJNGCa0=;
        b=HcugDq7+aohsm+wgm0MqTLAnQCkuo1T9qOj4MnHH+ENb4F8BrG79Oph4951KILweRm
         SnKJMny+nexx6xvzQuzvaJJ3sHXXBbY7Bc3GjLHOM/NVJDVCiOicBbdR6I6J6KKZgdH2
         CUXwdC3Fb51tlmDoJ4QN/CL7WeLNqIM42E3PtZT1dCtF02X05GDAJB9g+86bfhcDIA/H
         cCy66ogioAiMOq2qItJrj3XQtwwZOvwQpH4FaHOVQ/0s2lftQKgmZM0/htOmTpImVuLA
         ILchzsTJIJQf6Sl/zgorjBjvwe3So0dCoe/OTU1L+8565q4rxfArMOlfdHCk68SIpDW1
         KVwQ==
X-Gm-Message-State: AOJu0YybYERJuRd0LeA548+46IPWmI7TSXVJMYjnVqGafk5Yxh3ZzLVE
	QP6wrpgCQC3TB6+IJX8QgNXQm2Nb5DUHy0eRn5PFvX0kBDwqfrOaie39zF0/CYkzBd2nhIVPIgR
	ttpSI42LXvC+z41orFSO2nOrGDCg=
X-Gm-Gg: ASbGnctEmoiGc2iWuDnj8ulmdMHCGRUfD3ZgKeWkNHizZFIfFd9hQGyQR8m+bLRAEcX
	7thpBGrzoGVhyTYYfR2HfZkpelI+zhVvgOQxPHqHcctKQAq4gcXzavI7BNsFTW+zSyx132Dm/
X-Google-Smtp-Source: AGHT+IE5G56M8zaVPuTSe020CWI3WwwCergiRBlV0eDJG5lisBRhygDboDg9YnMJRulcFc4v6o7z6SOvlvP4riSFXGc=
X-Received: by 2002:ac2:4f06:0:b0:542:8d53:5eab with SMTP id
 2adb3069b0e04-5440e636610mr303723e87.6.1738792536659; Wed, 05 Feb 2025
 13:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20250205212427.2044310-1-JPEWhacker@gmail.com> <CANNYZj9Ca6cQcFcb_moABSKX5=HtdRAzvL_ayyCg2cnkuEKcqw@mail.gmail.com>
In-Reply-To: <CANNYZj9Ca6cQcFcb_moABSKX5=HtdRAzvL_ayyCg2cnkuEKcqw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 5 Feb 2025 14:55:24 -0700
X-Gm-Features: AWEUYZkqIAZYJrQyAzptwdFDnjEZobvzQOHrKJXcz708ePOnBZTImOnJPPpf-64
Message-ID: <CAJdd5Ga3VU_CW_Dw2TTacOEsACgMJE9i4SnVo4mrZ=tGMwc95A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Include fragments before local.conf
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210879

On Wed, Feb 5, 2025 at 2:36=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> We have discussed this before. With this change, users will no longer be =
able to set fragments from local.conf, as addfragments would be processed b=
efore that file. You need to use ?=3D in fragments instead for things that =
are meant to be overridden.

Is there need to set fragments from local.conf? IMHO, not being able
to override a fragment in local.conf is "surprising" behavior, and I
don't think it's going to necessarily be possible to alway use ?=3D in a
fragment; all of the ad-hoc "fragment" management systems I've used
before have allowed local.conf to be the final source of truth, so it
will also make migration to use config fragments harder if they don't
follow suite.

Anyway, maybe some other users of "fragment" like systems can chime in
if they have an opinion.

>
> Alex
>
> On Wed 5. Feb 2025 at 22.24, Joshua Watt <jpewhacker@gmail.com> wrote:
>>
>> Per some usability assessment and offline discussion, one of the useful
>> use cases of config fragments is that they allow the "default"
>> configuration for some device to be committed to source control and
>> easily selected and used by the end users. However, when doing this,
>> there is still the desire that the user can "override" the provided
>> fragments for their local builds in local.conf
>>
>> As a practical example, the configuration for a product can be capture
>> as a config fragment, and an empty local.conf will reproduce the
>> standard build for the product. If the user wants to make "tweaks" to
>> the standard build, they can do so in local.conf
>>
>> As such, move the config fragments to be loaded before local.conf
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>  meta/conf/bitbake.conf | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 8b607088c6e..d0154044f5a 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -826,12 +826,13 @@ FILESOVERRIDES =3D "${TRANSLATED_TARGET_ARCH}:${MA=
CHINEOVERRIDES}:${DISTROOVERRIDE
>>  require conf/abi_version.conf
>>  include conf/site.conf
>>  include conf/auto.conf
>> -include conf/local.conf
>>
>>  OE_FRAGMENTS_PREFIX ?=3D "conf/fragments"
>>  OE_FRAGMENTS_METADATA_VARS ?=3D "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FRAGM=
ENT_DESCRIPTION"
>>  addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_=
VARS
>>
>> +include conf/local.conf
>> +
>>  require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if "${BB_CURRENT_MC=
}" !=3D "" else ""}
>>  include conf/machine/${MACHINE}.conf
>>  include conf/machine-sdk/${SDKMACHINE}.conf
>> --
>> 2.47.1
>>

