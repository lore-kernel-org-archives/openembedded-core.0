Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E03CD10376
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:59:15 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.7102.1729803548744763480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T279LGrJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d808ae924so945180f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729803547; x=1730408347; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZT49xLm+dSO4y+hNAB8PlnY/9KPIuXcdRiWv3V1+os=;
        b=T279LGrJyAjkR5xce3NtxKpmZEwMrNwixT/pWzJOusKCW0ZyA3GQWbnqVnAzMI3ipm
         jIZjFeYBtFlSh6bpRwevepRPRG0mLUorbzRFOvvUj+3dvMS78yN38k5xcbTYYVnAa9QH
         qlw9+h2IEwaji61BCCltwhFFzpBMsgRatvso0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729803547; x=1730408347;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZT49xLm+dSO4y+hNAB8PlnY/9KPIuXcdRiWv3V1+os=;
        b=Lm81hSjia6r2w7x5vhrx0ZVbWbd3RnaGLmRNkRtdvqFQwYR/uQ0rlOJfZxvmJWmerQ
         nAX0mn5Po3tCY34NmM+EJ7Aq/kCMbaRoaDHEZxZ2u2UYXfC5yzTM77qtnybAL51DDUM5
         C3+gm3fb+VhRknY3gnh/SNQmwEB1JQfZq31vjTdfCNlDJ1eAECDSMGwk8oN6KYrsOMiq
         a29LoW8roo84UC5XSR3ijA1o5r/1IEycQXW3bW3C4j8n3+GlAhtW9GvPPyLcFZOTuEh/
         REx1jDZWubnZ8lzImd/+N0JfvOhzU3m/PTEdtNx/XNZh2gQ3aE0DmvRZSCo95x2a5NpF
         U26g==
X-Forwarded-Encrypted: i=1; AJvYcCUckHxmkmioET4us+pyOQ5CGsAfxmXVL0QjfOPqje9e+iMUzqisFxqw06JdXkeJo5iqiZ7S43Bp+lDZS4M96HdQJQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyA+Z8W78xebkE3B4OxftN4sr7uLVpIH1MpPQyk1DjWu2q5mphS
	WVlcC6FXpvkNfrd6ieM3Un9yz0xmTOPxbBJwANowuZjjnDexTtPF2yb6KskYZA4=
X-Google-Smtp-Source: AGHT+IHCkjW1r0gJG++MGSeAvvOh5K0lLT44kSW7IdMXWeC3/Qd/rci65fNJ0HjZy/zfVgyfGftqCg==
X-Received: by 2002:adf:e111:0:b0:37d:523c:5ce2 with SMTP id ffacd0b85a97d-3803ac84c08mr2415285f8f.1.1729803546973;
        Thu, 24 Oct 2024 13:59:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c3cc:29c5:4b3a:41ad? ([2001:8b0:aba:5f3c:c3cc:29c5:4b3a:41ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9433asm12153412f8f.80.2024.10.24.13.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:59:06 -0700 (PDT)
Message-ID: <8ce2c92656f98f0c3606fb26bfc7b020f13103c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/package: scan B first when populating
 -src package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2024 21:59:05 +0100
In-Reply-To: <20241024172506.473232-1-ross.burton@arm.com>
References: <20241024172506.473232-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 20:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206308

On Thu, 2024-10-24 at 18:25 +0100, Ross Burton via lists.openembedded.org w=
rote:
> There's an interesting reproducibility problem triggered when a recipe
> has a file in $S that is manipulated and then written into $B.=C2=A0 As a
> concrete example, zlib has zconf.h in the source tree which is then
> processed by configure to create zconf.h in the build tree.
>=20
> When we populate the zlib-src package we have to work from the mapped
> source paths in the binaries (of the form /usr/src/BP) and try to
> identify where the file came from. To do this we iterate through the
> mapping paths looking for files, and using cpio in a loop we end up with
> the newest file with the name we're after in the -src package, which
> tends to be the right thing to do.
>=20
> However, when building zlib from scratch we create the -src package by
> hard linking files from the source and build trees. Then as the final
> act of do_package the sstate archive is created, and this clamps the
> file timestamps to SOURCE_DATE_EPOCH (see fixtimestamp in sstate.bbclass)=
.
>=20
> The fundamental problem is that we clamp the mtimes in sstate_package in
> a way that changes the source files. There are several paths through the
> code:
>=20
> 1. Full build from clean
> In this case B/zconf.h is freshly generated and has a current timestamp,
> and the final zlib-src package in sstate has the correct file.
>=20
> 2. Repackage from existing tree
> If we need to repackage but there is an existing build tree then we've
> previously clamped the timestamp of zconf.h. When iterating the map paths
> for files we first copy from $S and then $B, but as the file in $M has
> an identical timestamp it isn't used. This results in the wrong file in
> the final zlib-src package in sstate.
>=20
> 3. Repackage from sstate
> Depending on whether the sstate has the correct or incorrect file, the
> output will have the same contents.
>=20
> The long-term fix to this is to not clamp the actual files but instead
> to clamp then when writing the tarballs, but this isn't trivial as you
> need to handle the sstate and non-sstate paths separately.=C2=A0 What I t=
hink
> is an acceptable workaround is to reorder the prefix map list and move
> ${B} to the front, on the assumption that generated files should be
> preferred over non-generated. This results in ${B}/zconf.h having priorit=
y
> over ${S}/zconf.h when they both have identical timestamps.
>=20
> [ YOCTO #15491 ]
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/lib/oe/package.py | 10 +++++++++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index c213a9a3ca6..8ec00b96b69 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1010,7 +1010,15 @@ def copydebugsources(debugsrcdir, sources, d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.mkdirhier(basep=
ath)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpath.updatecache(basepa=
th)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pmap in prefixmap:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Re-order the prefix list so=
 that we sweep ${B} first, as the sstate creation will
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # clamp mtimes of hardlinks i=
n the -src package, and that will change the source.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # (see #15491)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b =3D d.getVar("B")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefixmap_keys =3D list(prefi=
xmap)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefixmap_keys.remove(b)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefixmap_keys.insert(0, b)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pmap in prefixmap_keys:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# Ignore files from the recipe sysroots (target and native)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
cmd =3D=C2=A0 "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((<internal>|<bu=
ilt-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# We need to ignore files that are not actually ours

Thanks for working on this. You have clearly explained the problem
which is great and helps a lot.

I am worried that this code is still fragile as some cpios seem to
overwrite and some do not. Would adding the -u option and always
overwriting not be safer until we properly resolve the sstate issue?
${B} isn't the only directory we might have generated sources in, the
compiler in particular probably depends on this ordering and has other
source files we'd alter timestamps of?

If you're not convinced about the -u option, I'm starting to think we
may need to fix this properly even if it is painful :(.

Cheers,

Richard






