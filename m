Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79645CA9EC7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 16:23:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29399.1791735796554173952
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 09:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HxZjO0Xc;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4207ac26so1132550f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791735795; x=1792340595; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fY1TgeQEhvYuz+gBvQcGtliKD/1umUnwBzqqkVozMtU=;
        b=HxZjO0XcybqKd3JrqlJxuAdBa+p81fjii7NPhNEGCbAw+w0bBLthaRET7uW9++Lm2R
         snK0lrWJvgafmJUX+/5D8qD4Bk257K5XHBVTcmJpXsvFnp6r0KviU8MPXZqviKyCVW06
         qzqFHGAup537fKL9uJNNkua1V72lB+xGnND7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735795; x=1792340595;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fY1TgeQEhvYuz+gBvQcGtliKD/1umUnwBzqqkVozMtU=;
        b=i+d1LMv8RLO2EyV4QZo+D3zloYsf/7YQvTZF9l/U4+bFliwJ7hFoE2m54LwRG3Yueu
         ND2MsMWFYC66emdxdtKrXS/lNHTr0kBC4iQzsATk37ng4VDn4eDSSSa5L3YL2GukPMdx
         PyQ3sCSxsWOQwaBlNpkctZ3v0Yjl0wrwm+fFRG8VuFs8ReYhWSD7tPZytq2lVakneXQx
         uvwHNG6pYe4puiPVn2z7RfsZXojdAY/DMFSb6IeOo5iRYrSty3nw0Z+Hy7fWo2hKcbfP
         zaVIMcECP9spOCDYAcJA3zmXzJ8JQQ9K4ExNY0kPcrr+sCMfbQG8LO+9Wf7tlxThK1yt
         B9NA==
X-Forwarded-Encrypted: i=1; AKwUvByrSHna0IEduqRibtCp3Ot7G2byQF2eSQ6kzkBTgCWGqBtobyHu2eMTy3kRAwXAcCuI9ozxiVKWboHwFIJXcOZxCw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLkChBezqOWaFpixi7HG8XaFSpWzWP6zxCbneE7BTksB3MW/p0v
	HMBCTmLhgxPbOi0VHsCprXiGSrxJBj1pfbCGtRCJVVcyTVfr2vS2ToLuPna3MIMgzIU=
X-Gm-Gg: AYBFou2w6x2KQdv2BqaucCSr7clpTXMOKeBH/mNXqlEg56D6LEMhTOIR+KVwnVm0Hz7
	nXuV2zv8xuy9B7S8OAxIaWWMn+IzPtrJxQl5ROIpM/JTTIiMdi8Qn6iVQy/PW5gYqVXNosjCbuE
	RoI5Upd2ASYnWwlUoHcl6I/yv6cKnF5lbZwUB6IhKVYkHD33B9hYrHkP1uVowsNR5BItx6aZnXr
	Ew19v9z1DQexp8bFuq3xr5/Aoqo5uv9kcvL0pgLfTuNl2aZqZtz88n39nvxexohZhQtZ6ypgYQn
	i/+sBm+dO14/ppio7VOLLOOloSydtard7NveWrPS0raMy3w8ppjeel38x0jzewdAcNZZAxlNF1M
	pZWhbnWS94HWxeMBl/fyrZvnrcNwgSIUuqdfEeQK94xCEZOImRsGTfCYMVO5xpgXZ2ntqp2LReo
	K3PZVQm/01G05DOYdfsUsI77Ty7m8Rzk7Jb9sq/VOXYaEskzgWt7MBoI4o6yvxTg+YFopOZWD1P
	pFFOC2BmyenUocGXPBOjqYQgcd5C1VP1DZHoQFJxqBk5y48gqlctUqqLPeIAw==
X-Received: by 2002:a05:6000:1283:b0:48c:4c35:3ab5 with SMTP id ffacd0b85a97d-48dbaadd3femr10308214f8f.18.1791735794486;
        Sun, 11 Oct 2026 09:23:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aac6a4sm14968465f8f.28.2026.10.11.09.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 09:23:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Oct 2026 18:23:12 +0200
Message-Id: <DM25BW40VU6P.OL7ABO4PSRKK@smile.fr>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Etienne Cordonnier" <ecordonnier@snap.com>
To: <collin.funk1@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261010113029.2347847-1-ecordonnier@snap.com>
 <87pkxh2ynu.fsf@gmail.com>
In-Reply-To: <87pkxh2ynu.fsf@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 16:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247577

On Sat Oct 10, 2026 at 8:33 PM CEST, Collin Funk via lists.openembedded.org=
 wrote:
> Etienne Cordonnier <ecordonnier@snap.com> wrote:
>
>> uutils-coreutils, the Rust reimplementation of GNU coreutils, is mature
>> enough for production use, so move the recipe from meta-oe to oe-core.
>> It provides and rprovides coreutils, and is excluded from world unless
>> selected as the coreutils provider.
>
> Total disregard for the requirements imposed by the GPL is helpful to it
> being "mature enough for production use", of course. See the downplayed
> mention in the 0.12.0 release notes:
>
>     Also, some contributions had carried comments and code over from GNU
>     coreutils, against our own rule that uutils is an original
>     implementation. We reviewed the tree and rewrote what we found, in
>     comments and in the few functions that followed the C too closely;
>     no behaviour change. The GNU coreutils maintainers have been
>     notified.
>
>> +SUMMARY =3D "coreutils ~ GNU coreutils (updated); implemented as univer=
sal (cross-platform) utils, written in Rust"
>
> This summary reads as if it is trying to claim that uutils is the
> official GNU coreutils project.
>
> I'm not familiar enough with openembedded, but a concern raised by other
> distributions and me is that supporting two packages as "coreutils"
> increases maintainers' workload because the implementations are bound to
> diverge, requiring otherwise unnecessary code churn. E.g., for around a
> year, Ubuntu 26.04 had the following:
>
>     $ export LC_ALL=3Den_US.UTF-8
>     $ printf 'USA\nU.S.A\nU-S-A\n' | sort -u
>     USA
>     $ printf 'USA\nU.S.A\nU-S-A\n' | gnusort -u
>     U-S-A
>     U.S.A
>     USA
>
> It still has the following issue [1]:
>
>     $ export LC_ALL=3Den_US.UTF-8
>     $ echo a A b B | tr ' ' '\n' | sort > tst1.txt
>     $ echo a A b C | tr ' ' '\n' | sort > tst2.txt
>     $ comm -23 tst1.txt tst2.txt
>     comm: file 1 is not in sorted order
>     comm: file 2 is not in sorted order
>     B
>     comm: input is not in sorted order
>     $ gnucomm -23 tst1.txt tst2.txt
>     B
>
> Collin
>
> [1] https://bugs.launchpad.net/ubuntu/+source/rust-coreutils/+bug/2169780

For reference we also had issues with uutils-coreutils implementations:
* classes/base: prefer gnu-prefixed HOSTTOOLS - openembedded-core - OpenEmb=
edded Core layer
  https://git.openembedded.org/openembedded-core/commit/?id=3D16f2684ebeffa=
72b5d90525cf9102751b68c298e
* 16028 =E2=80=93 Investigate pseudo/uutils incompatibilities
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16028

Regards,
--=20
Yoann Congal
Smile ECS


