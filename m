Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58271C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:14:12 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8103.1787235245915705194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 07:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tl1u/mZH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a422090b14so494284a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787235244; x=1787840044; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uLAjPUz42aLcKBit0EFDphSaNifoZDEWpMEMo5xFWL8=;
        b=Tl1u/mZHt4Be/+LyXQdpX8mjFlZt7TNdtjRsyea0Zeu+Go+XRz+R+ii8U22CQk3Y5u
         e2u7Ouec/bguhjZoERulhcJWUfojXpB5mhR80qeKe2eJY+m8mnS6YrDICXRyIbLz/RgE
         mgfRSQ1e3il3Oe5FdirKpQ1LFTa4XFI2ThwX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235244; x=1787840044;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLAjPUz42aLcKBit0EFDphSaNifoZDEWpMEMo5xFWL8=;
        b=s8HQU/OVHnIfn6Dk/crilpIqKRTRzFEQHUR3CeiUUYEu6GIfww3LrwfI4spnBRbsGV
         Z1sHThLvtmpaPe6p7//914WaLrZ8e3ConjvOc17Tr0MKBFmus051NH6bJ37/zZSPuiae
         2aifgKK+lLnA3Igw3U7/vFFybSLr4ukzkRXn0HQ7SLBNLWyy0LJvsd0I8p0AQb8241gJ
         uJwp4lUQqPOWSQtuZAiK+Leazw8ceS8PjBwfWOxsxygpzAnp+uIzsYs4i3Ns2INCt6FQ
         vaA/AoVXjbqjD64nP7txtzKZuGLqT3USu4fAL17zH2TEpoLocBA/HoJ9nwCHnn2uzbbr
         eGsQ==
X-Forwarded-Encrypted: i=1; AHgh+Roi0rG4pdPyVOKMrWlHzwcmaEQgYo4p1NOHgSrDf+suxY9MHP9d6/9BKSs96Bc0Zty4eYeGdDzXSW2t8GZ5RUbljA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lEXhpSd5r24n9tykrgyfnc/Ub6BF7pIqfP4olgKHK329SvPiW+
	fFj1d9+FtNN4RcK0OhRhcQm0yjU7utVudkYyPeXZZ0ZM8z7k4oKKle4+/ayMP/3KdKw=
X-Gm-Gg: AR+sD11nUFWqOk8bf43hOvAZUTXHy+miJn0TWLVgXUt1efqL+8+Qo3mJ1ls6KwDO2Y6
	r7+34uOhoycIpuY5InxDe9R9QxDs482BTASNdCQ7j1mj0VoTESubpgkpbH0zdCjCFRFIzh3uhhI
	dfrJZkIqGu4eLH9bQ5wHURcsR+PTL+FoyNUiIawIS9l5PHi8Dz0uxJPQ/e8N90zTG9F2M0c0wyZ
	w7c5zOJIkDDOGhVxGOVWiyGr69CrcE/1JfVX/H+/SZUzpn1AfoywvjHy2aZv7Tqa8y+hPk7nrQr
	8A8vOCRcbDk15JFp5etISR1DQjRvmFlFrQkvBtLQ369KAR+1urrzHLOPuqgthHlJPc4sqHZeqDK
	Fo8ilXiQxLjY6o2RCfNLjseJsA2extw2a3tocz/VZsl/FagwhUlQzvwYuU3wdVFFAad6Lqh7WPY
	QwgHtAYrp4t1J+ProC88JJr0gmLpZu0Dp9Dtl2N9RcCz/DPaE4rp4WRhRIVwj6htRSidU37e5me
	2vWMHfg96L46R1jv7VZThgedhrtzxr/eBy7ZlEcIMHf59uZPR2SGg==
X-Received: by 2002:a05:6402:1cc7:b0:6a3:849b:aa48 with SMTP id 4fb4d7f45d1cf-6a4032b8158mr9170793a12.7.1787235243949;
        Thu, 20 Aug 2026 07:14:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9334:47ad:4624:539c? ([2001:8b0:aba:5f3c:9334:47ad:4624:539c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm2118671a12.7.2026.08.20.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:14:01 -0700 (PDT)
Message-ID: <c74cc8fd01dff0446c6d7a06eecea7efcbe31295.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] package: fix source path in
 save_debugsources_info()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: benjamin.robin@bootlin.com, openembedded-core@lists.openembedded.org, 
 Paul Barker <paul@pbarker.dev>
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
	daniel.turull@ericsson.com
Date: Thu, 20 Aug 2026 15:14:01 +0100
In-Reply-To: <deTZ1aVaTSi1lGA0cUFFsw@bootlin.com>
References: 
	<20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
	 <6mKnVq77T3qmNmVG0TaWpg@bootlin.com>
	 <31833741ed68de2878234d906c2a1cfe680c4508.camel@pbarker.dev>
	 <deTZ1aVaTSi1lGA0cUFFsw@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 14:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243867

On Sun, 2026-08-16 at 14:19 +0200, Benjamin Robin via lists.openembedded.or=
g wrote:
> On Sunday, August 16, 2026 at 1:37=E2=80=AFPM, Paul Barker wrote:
> > On Sun, 2026-08-16 at 13:25 +0200, Benjamin Robin wrote:
> > > On Sunday, August 16, 2026 at 1:12=E2=80=AFPM, Benjamin Robin wrote:
> > > > On Sunday, August 16, 2026 at 12:46=E2=80=AFPM, Paul Barker wrote:
> > > > > On Mon, 2026-08-10 at 09:11 +0200, Benjamin Robin wrote:
> > > > > > Previously, except for a kernel recipe, the source file paths w=
ere never
> > > > > > "resolved" since the KERNEL_SRC_PATH variable is always defined=
. So in
> > > > > > the ${PN}-debugsources.json.zstd file the source file paths alw=
ays started
> > > > > > with /usr/src/debug/${PN}/${PV} (which is the value of TARGET_D=
BGSRC_DIR).
> > > > > >=20
> > > > > > Currently the debugsources.json file is only used by the spdx g=
eneration.
> > > > > > - In `get_patched_src()` the sources of the recipe are extracte=
d (again).
> > > > > > =C2=A0 The unpack task is executed from a modified local contex=
t with UNPACKDIR
> > > > > > =C2=A0 set to the value of `${SPDXWORK}`. So in summary the sou=
rces are
> > > > > > =C2=A0 extracted in a sub-directory of `${SPDXWORK}`.
> > > > > > - In `add_package_files()`, with topdir equal to `${SPDXWORK}`,=
 all the
> > > > > > =C2=A0 files (recursively) found in topdir are listed. For each=
 source file,
> > > > > > =C2=A0 if the file path (relative to topdir) is in the list of =
source files
> > > > > > =C2=A0 retrieved by save_debugsources_info, then the file is ad=
ded to the SPDX
> > > > > > =C2=A0 SBoM.
> > > > > >=20
> > > > > > So try to handle that by replacing ${TARGET_DBGSRC_DIR} by the =
relative
> > > > > > path of ${S} relative to ${UNPACKDIR}. If ${S} is not relative =
to
> > > > > > ${UNPACKDIR}, do nothing.
> > > > > >=20
> > > > > > Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> > > > >=20
> > > > > The paths in ${PN}-debugsources.json currently match where the fi=
les
> > > > > will be installed on the target. If we change these to be relativ=
e
> > > > > paths within ${UNPACKDIR} then we would break other ways that the
> > > > > debugsources json files may be used.
> > > >=20
> > > > Hello Paul,
> > > >=20
> > > > This was never the purpose of ${PN}-debugsources.json if I am not m=
istaken.
> > > > If you look at the code (before my patches) the path should have be=
en
> > > > modified to be somewhat relative to WORKDIR. But the code had a bug=
, and
> > > > the paths were never modified.
> > > >=20
> > > > Also, for the kernel, the kernel sources paths were already modifie=
d to be
> > > > the same as the path in SPDX, so starting with ${BP}. This part was
> > > > mostly working for the "main" use case. In a previous RFC series th=
at was
> > > > merged, I fix that to be working for any kernel recipe.
> > > > =C2=A0
> > > > > What is currently broken?=20
> > > >=20
> > > > SPDX_INCLUDE_COMPILED_SOURCES for a normal recipe (not the kernel) =
is not
> > > > working.
> > > >=20
> > > > > Can this be fixed at the point where the
> > > > > debugsources json file is parsed instead of where it is generated=
?
> > >=20
> > > Yes, I guess we could modify how oe.spdx_common.get_compiled_sources(=
) is
> > > implemented. In that case I would recommend to no longer modify the p=
aths
> > > of kernel sources in save_debugsources_info(). We would keep the path=
s as is,
> > > we would only filter for "<internal>", "<built-in>", ...
> > >=20
> > > In any cases, this is kind of a breaking change since the
> > > ${PN}-debugsources.json is not going to contain the same paths as bef=
ore.
> > >=20
> > > But what you are "proposing" (modifying get_compiled_sources()) is a =
bit
> > > cleaner from my point of view. This is a bit more work, that is why I=
 did
> > > not do that.
> > > Joshua do you have an option on that?
> > >=20
> > > > > Sorry if I'm missing some context here.
> > > >=20
> > > > For the full context see:
> > > > https://lore.kernel.org/all/20260727-fix-get-patched-src-v1-0-f5054=
ca10e14@bootlin.com/
> > > > https://github.com/bootlin/yocto-kiss/pull/26#discussion_r362622483=
3
> >=20
> > Hi Benjamin,
> >=20
> > Yes, I was missing some context! I was replying based off discussions w=
e
> > had on the patch review call on Thursday.
> >=20
> > If the paths in debugsources.json files are currently inconsistent
> > between kernel and non-kernel recipes then we should fix that. So
> > perhaps your patch is correct after all. I'll let Joshua give an
> > opinion.
>=20
> Be aware that with all my patches, the content of debugsources.json will
> still contain paths starting with /usr/src/debug/ since there are paths
> from others recipes (header files from glibc for example, ...).
>=20
> I am not sure I will have time this week to take a look at the second
> solution (modifying get_compiled_sources which is a bit cleaner from my
> point of view). I'll let Joshua give his opinion first :)

Giving some extra data here, we list all the sources the binaries
reference, whether they're from the current recipe or a different one.
The sources from a different recipe use the on target paths for the
soruces and I think the paths for the current recipe should be the same
for consistency.

The /usr/src/debug/ paths are therefore correct and we should be
standarising on that, not on transient build paths IMO.

If other code has to resolve that to find the real files, so be it.
That will depend on the context the file is being used in as to whether
they're even still available.

Cheers,

Richard




