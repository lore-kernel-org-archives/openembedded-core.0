Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A8FC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 22:41:40 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.26451.1738795292529228985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 14:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGU6/h1r;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-844e7bc6d84so10203539f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738795292; x=1739400092; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xShLR+pTklTm3f/LBJElmGXBMNOLCLUxNMnfp0BqlDA=;
        b=VGU6/h1rREpFuxzf1SEW/JJjCEphk8pNFzDHhp7vtnXgV+mehdM9sfIbU+sCl1fd3Y
         085EvyaGuqXlsnFlqkkwMauFmza3vUX/csMu2loUZLBRP0AnmJCH7UiOaakAtZny4LRs
         GgjuyXaax4JaVsPIvzao6QDguO2iYxRXGk7DFeOjFAav48Chb1mPtaqauqejzoLS5kae
         00wBgouTiT7d0Vh9MHZ2rMchqH78pmuArMXE8bGlbPB5ayxY8jfhRXEjafECXpe6W67c
         MwCLU+Vf0dVZNbJOx7oTZOk/l/EEDZ6tFNkxSdjyDUMq86hhUWYeQHiPUjiNGq03bh/e
         YkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738795292; x=1739400092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xShLR+pTklTm3f/LBJElmGXBMNOLCLUxNMnfp0BqlDA=;
        b=IyWXYM8Kn5ar/P/z/HMob5i+6z0mB6DuHMlhbVqlF0i7HtmE5rCDVi1ZIQjBr93ur8
         SSDNDhV/iPd0brcBmENPiPmvA6VXuf8ZtIQ9xrRa4jvy0QcHgd1DrBpxVLLeZtmN9sv6
         ZojWKydQpCVXhBxm3a1hff2r7KWqLsvAU3db695NqUOoyvuK1G3/0BdC33JSedUsmbZZ
         DIv1GvBQ/5mXjRF/HoxLSu5Ms+8pfHkGgkOwcKt7r2axGxHqhpsYeFjm9CARtlArDy5Z
         b0JgoTn9xL67ax+3pNyB6FEcWUeIIFv67Fy+//p2g+Jfe5FjR5Gm1/1bhGRqBSjPeLjz
         ZkkQ==
X-Gm-Message-State: AOJu0Yzyx4q+6OtvN9dnQxYzqS6sVXac4kz5duImnItGjznrbhc6E4Nf
	+lbJZk5gmQe0JqocH37aGRnl3RlmD7DvGrTSp1ax2kNYPz2zGsHIOn4MKhl9M1xmhbppOtLey8z
	GcHZ32o50CQidQsWoQhAL5/iiY5E=
X-Gm-Gg: ASbGncvqn1S8EaTw11Vx6lJkaqxlVO5oa4TV/PEOtLIZ1/yqKZccZmEemud1htwKIBw
	b5DI1MY6PdOPLbpS8u596d5x/XnhIuVrSXDgoqgWda5wST8Op6RHEhlUEx/lF43ntSJRsdKS5
X-Google-Smtp-Source: AGHT+IHf2Z45F5iiEMcU0Q8ikA7IotEtEKqa8AGH1XPzV5QbWhvilh9kzY5XWQO9WjfoZTIOOmmjnGhImq4H2rebGyw=
X-Received: by 2002:a05:6602:1ca:b0:841:ab27:acac with SMTP id
 ca18e2360f4ac-854f39a4610mr88001439f.2.1738795291693; Wed, 05 Feb 2025
 14:41:31 -0800 (PST)
MIME-Version: 1.0
References: <20250205212427.2044310-1-JPEWhacker@gmail.com>
 <CANNYZj9Ca6cQcFcb_moABSKX5=HtdRAzvL_ayyCg2cnkuEKcqw@mail.gmail.com>
 <CAJdd5Ga3VU_CW_Dw2TTacOEsACgMJE9i4SnVo4mrZ=tGMwc95A@mail.gmail.com>
 <1821704A9FA6415C.752@lists.openembedded.org> <CANNYZj-+4QBtgpvQLUEJ1qvqbqgQHQO4fQBC7eE79X7-mjaa1g@mail.gmail.com>
In-Reply-To: <CANNYZj-+4QBtgpvQLUEJ1qvqbqgQHQO4fQBC7eE79X7-mjaa1g@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 5 Feb 2025 15:41:17 -0700
X-Gm-Features: AWEUYZntxXJtklbS9atr3fydeXx7QO430gNKctCqrdMNAyuFH3ZWCe5f3fqEcgk
Message-ID: <CAJdd5GYrBnMmAxE2tAVq-NRgSLoc-eRLYPPAYLF2siCNN+jPcQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Include fragments before local.conf
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 22:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210885

On Wed, Feb 5, 2025 at 3:37=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> Btw the other option for overriding fragments would be to use direct requ=
ire statement with a path to them in local.conf, followed by tweaks. It=E2=
=80=99s not too horrible. And using a fragment variable can then be seen as=
 =E2=80=98immutable=E2=80=99 fragment enabling which could be beneficial pr=
ecisely because users can=E2=80=99t mess with it.

Sure, and I've done that before. I assumed this was intended to
replace that behavior with a nicer UI, but apparently that was not the
goal?


>
> Alex
>
> On Wed 5. Feb 2025 at 23.26, Alexander Kanavin via lists.openembedded.org=
 <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> One could conceivably want to ship a local.conf.sample template with fra=
gments already enabled in it, or hand edit local.conf to enable something v=
ia fragment. We can=E2=80=99t force users to use fragment tooling.
>>
>> It would be equally surprising to find out that setting fragments this w=
ay doesn=E2=80=99t actually have any effect.
>>
>> I understand your argument, it=E2=80=99s just that we=E2=80=99ve taken t=
he least worst option. Consider fragments as extensions of distro and machi=
ne configurations - both come after local.conf and can=E2=80=99t be tweaked=
 from it.
>>
>> Alex
>>
>> On Wed 5. Feb 2025 at 22.55, Joshua Watt <jpewhacker@gmail.com> wrote:
>>>
>>> On Wed, Feb 5, 2025 at 2:36=E2=80=AFPM Alexander Kanavin <alex.kanavin@=
gmail.com> wrote:
>>> >
>>> > We have discussed this before. With this change, users will no longer=
 be able to set fragments from local.conf, as addfragments would be process=
ed before that file. You need to use ?=3D in fragments instead for things t=
hat are meant to be overridden.
>>>
>>> Is there need to set fragments from local.conf? IMHO, not being able
>>> to override a fragment in local.conf is "surprising" behavior, and I
>>> don't think it's going to necessarily be possible to alway use ?=3D in =
a
>>> fragment; all of the ad-hoc "fragment" management systems I've used
>>> before have allowed local.conf to be the final source of truth, so it
>>> will also make migration to use config fragments harder if they don't
>>> follow suite.
>>>
>>> Anyway, maybe some other users of "fragment" like systems can chime in
>>> if they have an opinion.
>>>
>>> >
>>> > Alex
>>> >
>>> > On Wed 5. Feb 2025 at 22.24, Joshua Watt <jpewhacker@gmail.com> wrote=
:
>>> >>
>>> >> Per some usability assessment and offline discussion, one of the use=
ful
>>> >> use cases of config fragments is that they allow the "default"
>>> >> configuration for some device to be committed to source control and
>>> >> easily selected and used by the end users. However, when doing this,
>>> >> there is still the desire that the user can "override" the provided
>>> >> fragments for their local builds in local.conf
>>> >>
>>> >> As a practical example, the configuration for a product can be captu=
re
>>> >> as a config fragment, and an empty local.conf will reproduce the
>>> >> standard build for the product. If the user wants to make "tweaks" t=
o
>>> >> the standard build, they can do so in local.conf
>>> >>
>>> >> As such, move the config fragments to be loaded before local.conf
>>> >>
>>> >> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>> >> ---
>>> >>  meta/conf/bitbake.conf | 3 ++-
>>> >>  1 file changed, 2 insertions(+), 1 deletion(-)
>>> >>
>>> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> >> index 8b607088c6e..d0154044f5a 100644
>>> >> --- a/meta/conf/bitbake.conf
>>> >> +++ b/meta/conf/bitbake.conf
>>> >> @@ -826,12 +826,13 @@ FILESOVERRIDES =3D "${TRANSLATED_TARGET_ARCH}:=
${MACHINEOVERRIDES}:${DISTROOVERRIDE
>>> >>  require conf/abi_version.conf
>>> >>  include conf/site.conf
>>> >>  include conf/auto.conf
>>> >> -include conf/local.conf
>>> >>
>>> >>  OE_FRAGMENTS_PREFIX ?=3D "conf/fragments"
>>> >>  OE_FRAGMENTS_METADATA_VARS ?=3D "BB_CONF_FRAGMENT_SUMMARY BB_CONF_F=
RAGMENT_DESCRIPTION"
>>> >>  addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METAD=
ATA_VARS
>>> >>
>>> >> +include conf/local.conf
>>> >> +
>>> >>  require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if "${BB_CURREN=
T_MC}" !=3D "" else ""}
>>> >>  include conf/machine/${MACHINE}.conf
>>> >>  include conf/machine-sdk/${SDKMACHINE}.conf
>>> >> --
>>> >> 2.47.1
>>> >>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#210881): https://lists.openembedded.org/g/openembedd=
ed-core/message/210881
>> Mute This Topic: https://lists.openembedded.org/mt/111021218/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

