Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291B4C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 14:21:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152144.1783347681829979572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 07:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dhna9Q2+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b1710405so19049025e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783347680; x=1783952480; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is25beGJGvmUU6ae6OFvPe65geNftiW5HNXhCZLvFZo=;
        b=Dhna9Q2+kvtqXqEyi3i2YeA7ptwF3EvR46SjOrzZA5B0cgwjefupFjOSISJ+8pcUoV
         xGeMiudSB3HqWCjI7jUnDFQbZh/LsV0KD2F6uIFLyBQAkEy38SrivB4artihnEtaIhqJ
         R3o4FhBdfZfPdg+WdQyep5/6mlm9dU1/QbQK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347680; x=1783952480;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=is25beGJGvmUU6ae6OFvPe65geNftiW5HNXhCZLvFZo=;
        b=Js03evWm/OtQ1EM+Ch/8wAFDifi9RcSFAxJn2zKBaxAZX9j3PUSytFz8/QW72SJXWY
         nNFrrNxtr/k4KWlmO+FCrTWif+I07fwNCcz8zWY+JlcWfy9lltUpOhNr1gaJefUPUmNC
         OW8qM5h2KL92J7gPVRYI5KHS26F5GrT6o+xFEwyE/PExTdm4ZhnsROy9ZlLaPRfFosKn
         5247amHU8CBMSZxRVbBPNXixN++Z08YMj7YkAdVmA70nQm47M70cAM9ooGAIX4rxUOTW
         QZw6vi7lsBWdeLeE3qBOAIIb1gI+CAHppRBBKeN9DrDFknD23LtFFtUs8qZYnLM7Xq9v
         8I2A==
X-Forwarded-Encrypted: i=1; AHgh+RpEvlLMpJCfQH5LhEQvSOENxabYspmBW92CxHp2BZ4nqQT8WQFbZ5i07CjA8QDMuCpJb1oBXFecjYQSU+a4mTzn1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzNnBRyX3mvokz6GftKQDrj27IS/7Ylf6sblJGM0EpXnyU0VFuf
	G3WKQiixezkeRneiss9vVK9iD5ESRMtt/JwfvIA63akFCHEzty43vd1el3SV1FsyFjw=
X-Gm-Gg: AfdE7cnYKQws4O5n0McjF0+6Xt7h3e26/3HEedkjzRdexwsjrmQ83CgCN0akTIm7o4k
	gQ58qfaO4tMLTHgck+v67+dv1RLEj6kAVFs/XnnlJCu79jzs1IkJdxG19sWokNRzRMiRLybsGRv
	oy/97zH0hRNv2ROD8UitZTRI5VWjEHhUULkBCb84BTnDhBG5lIQ0rdq8HNev7/D9Jeg5U7Rz7jT
	F5nQ/lv5J389weno2Cq7/5dD7hb+f3vPpNw333gMzzXmhWYCtB9TzhXUWxKDTk1jODoMq+W8u4h
	qu/D/k6KHlXiBEy9N+bawnRdhUtvnuKwSwfWcCkXkhIQhFhYgENg2BqxqzdaPopih+GzzbxlJ0r
	D59agZEGcXjiMiiKvhQoZDwlLXtdCWCGygapLS1R4smz0odIdK4O/IHEAtFhJmjryQdEkwzqd8i
	NSi2h4WCCmnaRNXXyEd+fS0BMkElEN6hyOxl2RCwao7e7MBM3RmQBMyCWHLYMqUZlElsIH0voy5
	1cgZg==
X-Received: by 2002:a05:600c:8b28:b0:492:3e44:214b with SMTP id 5b1f17b1804b1-493df069041mr7856555e9.13.1783347679909;
        Mon, 06 Jul 2026 07:21:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3cdb:498e:44d8:3112? ([2001:8b0:aba:5f3c:3cdb:498e:44d8:3112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm25859309f8f.11.2026.07.06.07.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:21:19 -0700 (PDT)
Message-ID: <dbf6b5084554145aa039588a5b5cd2ac5acfbfa8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] Remove 'extend_recipe_sysroot' from
 'BB_HASHEXCLUDE_COMMON'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adam.blank.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 06 Jul 2026 15:21:18 +0100
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240275

On Sat, 2026-04-18 at 20:34 +0200, Adam Blank via lists.openembedded.org wr=
ote:
> It has lain there for a while, obscuring certain aspects of
> how task signatures are calculated.
>=20
> This changeset does not change the current status quo, but
> rather changes the way in which it is implemented. It can be
> followed by changes which further refine what is excluded and
> how, from those tasks which refer to 'extend_recipe_sysroot'.
>=20
> Related discussion:
> https://lore.kernel.org/openembedded-core/aa893eb861bf4dd18e3e84e6bbebdee=
3b0367d1b.camel@linuxfoundation.org/
>=20
> Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> ---
> Adam Blank (7):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_pkgdata: fix typo to stop calling =
undefined function
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging: add 'vardepsexclude' to 'staging_=
populate_sysroot_dir'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging: add 'extend_recipe_sysroot' to 'v=
ardepsexclude'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cross: add 'extend_recipe_sysroot' to 'var=
depsexclude'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 native: add 'extend_recipe_sysroot' to 'va=
rdepsexclude'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wic-tool: add 'extend_recipe_sysroot' to '=
vardepsexclude'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake.conf: remove 'extend_recipe_sysroo=
t' from BB_HASHEXCLUDE_COMMON
>=20
> =C2=A0meta/classes-global/package_pkgdata.bbclass | 4 +++-
> =C2=A0meta/classes-global/staging.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 5 ++++-
> =C2=A0meta/classes-recipe/cross.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0meta/classes-recipe/native.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> =C2=A0meta/recipes-core/meta/wic-tools.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A06 files changed, 11 insertions(+), 3 deletions(-)

I finally found a bit of time to look at this. I took some of it, I
ended up reworking some of the patches as they needed rewording to
justify them and explain the changes being made.

I didn't take the extend_recipe_sysroot removal from bitbake.conf as
I'm still not convinced we have all the issues that might cause
identified. The function name typo and the incorrect vardepsexclude are
fixed though (or will be once a couple of patches pass testing/review
and merge).

Cheers,

Richard

