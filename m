Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3488CE92704
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 12:06:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6877.1766837189994517626
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 04:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lyALRxA/;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43260a5a096so3308592f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 04:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766837188; x=1767441988; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JxRUZtPe4N4jMjkeeMfbLZfWR9HbXUoUqPYGLtZAPbY=;
        b=lyALRxA/ztWJeK0dHGacvJpDR2D5R/zgLDUmjww0MVxvQ+GZkD3djX9SefsLKM+21Z
         W2S5hTIf7EMqypeH1iLtD/5mVRyRvWwH3TVLaqk1vWTHJcHfA4xR2AsCXm8AkaiZtidr
         pa8IEXgckCFpxS/HAj9trEOZumMlKQbpnmPf8g4Lhv2qI1xT27CLtSY1etgGJH3wvG6D
         QHRYAjn/pc2Hk+JElTbhkGg+b/0n7QLtPDV50SJgCpvnOzDMDSrqKCTCsYZrjFT0Jug7
         QpeV4C8CXUabSDPZVG+QFLsLVarxfOVoKvJIlgcsOfk6WwKxyWgyXfiyRfQ2RutRGehG
         Vi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837188; x=1767441988;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxRUZtPe4N4jMjkeeMfbLZfWR9HbXUoUqPYGLtZAPbY=;
        b=YWIRhcmagxCbXWG4fKjKcg5r/MGgQ70CmewUafHR3eUno8F98k9Qj1JO3YUQ6DbuIZ
         PmyS+bf4uM9iJQ8aKFD+DRN6tcSFtSmFlaUEVlRiVDkZefY1y8zYByfD6lYSz9VmxsVq
         NIzNd+GvUzVISqcsh+Yld1eJU5HU2M/gNbd6KAF4HbI2fxBiYJnIzZQbCG9RO2wf1xHV
         oWGXYQVMALJeX+o4bJQuUwMu/8Vf22iKtjQ5mM++B77Mymf7oRZLV2O6K9IUDeolXEjs
         ZQmBVtcZtcqzxVj7TM/tx/wlI/LAJcK3s/y4bFshk3dayrpPHTPHNZGlhkXycdfGuNxY
         4kdw==
X-Gm-Message-State: AOJu0YzF9rs6TktDjDUqBpH9vOb31zQQgS1C4w5zc0rthJpYspjJbBs2
	Jp5pF+6Ihrl3e5xpHNFel+q+57P6ypYXsJIgkfqQdTCgvpPYy6MNHk40
X-Gm-Gg: AY/fxX7gneSlzFUVU2SsrW3ACB1rvQEMfgxe24VzwuWm9orRhBxQfpqFCc5jqub/FhB
	yip67yz+a42U7D1CYjhFMzaEs1UPjJnwI6U6VRf0THQC1QhVKbRnb9K1Tu9tMuhy9xzXFg3zR0d
	ci7NHOtZ09H3ZD0Xwb8T4k8R6EBBU02PVapE8l0jBqvGMOxARfiuNH0m6mrXH5eUAGnvccNFQVD
	cUfo0Vg8tmxqlafY4++zyrddBbKqossHqRgGFXm9byMLcqI3XKzNd9mwaaizJWXBo35gviz08dG
	5DVv33l8lshyNbYBe2lG51Wm2rVwqwSO3TvgX9wLhgGIRJd5lVFrX5Ze1qZ9nwQVb1dPOtHG1Hf
	3285IqzZr43Ma9+hCzVcv0T/Y/pgsM0zPYphf2T2rhj4z/dNypJ7umeGy6fHC6CJZLSPTzocP9N
	LEEj/U4GttiB1rFckPbQCBmJiyu6aF3kHrvdg0Ea4TI23VcefE8EDOT5Vqx3VZuO2wGUKwoT8=
X-Google-Smtp-Source: AGHT+IET2faX3ucDX8LhGPTn/nYxiycJQRf/wseRyGseRVK/+zppoccQOqR1n7pWgpEGf0OOnv360w==
X-Received: by 2002:a05:6000:2586:b0:430:fcda:452d with SMTP id ffacd0b85a97d-4324e4cbd79mr32068880f8f.22.1766837187806;
        Sat, 27 Dec 2025 04:06:27 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm51362001f8f.37.2025.12.27.04.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:06:27 -0800 (PST)
Message-ID: <c0d4dee98ac9272be866e31e201559fabd853c16.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-vscode: improve VSCode
 bitbake-setup compatibility
From: adrian.freihofer@gmail.com
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 27 Dec 2025 13:06:26 +0100
In-Reply-To: <CANNYZj96VasQFeLuaP+T0m8WErDWw_x-wuPSg5SMX05hCPzJKg@mail.gmail.com>
References: <20251224150805.3312684-1-adrian.freihofer@siemens.com>
	 <20251224150805.3312684-3-adrian.freihofer@siemens.com>
	 <CANNYZj96VasQFeLuaP+T0m8WErDWw_x-wuPSg5SMX05hCPzJKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 12:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228571

Hi Alex

On Fri, 2025-12-26 at 21:46 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Wed, 24 Dec 2025 at 16:08, Adrian Freihofer via
> lists.openembedded.org
> <adrian.freihofer=3Dsiemens.com@lists.openembedded.org> wrote:
> > VSCode is started in the workspace folder where the .vscode
> > directory
> > is located. With the new bitbake-setup based build layout, this
> > starts
> > VSCode in the openembedded-core directory, which means only files
> > in
> > that layer are visible. This is not usable for most projects which
> > span multiple layers.
> ...
> > =C2=A0# Generate an initial configuration for VSCode and the yocto-
> > bitbake plugin.
> > -if command -v code > /dev/null && [ ! -d "$OEROOT/.vscode" ]; then
> > -=C2=A0=C2=A0=C2=A0 oe-setup-vscode "$OEROOT" "$BUILDDIR"
>=20
> I'm not sure I understand how 'seeing multiple layers' worked before,
> or did it? If .vscode is placed into $OEROOT, then only $OEROOT is
> visible, e.g. only the former integrated poky repo, but not other
> layers.
>=20
> Otherwise I guess this should be held until we figure out the changes
> to bitbake-setup?
>=20

My goal is to support making bitbake-setup a first-class user
experience while still preserving the simple, good old way without it.
My understanding of the old way is:

git clone poky && cd poky
. oe-init-build-env

We (and many others) use a slightly more advanced but still static
directory structure based on this basic concept. The following example
is very close to what running bitbake-setup init twice (once for poky-
master and once for oe-nodistro-master) would create:

build
poky-master
conf
site.conf
bblayers.conf
templateconf.cfg
oe-nodistro-master
conf
site.conf
bblayers.conf
templateconf.cfg
bitbake
meta-foo
scripts
oe-setup-vscode
meta-yocto
openembedded-core
scripts
oe-buildenv-internal
oe-setup-vscode
oe-init-build-env
oe-init-build-env

This can be used like this:

git clone --recurse-submodules foo-project ... && cd foo-project
. oe-init-build-env build/poky-master

Switching to oe-nodistro-master is as simple as starting a new shell
and running:

. oe-init-build-env build/oe-nodistro-master

The oe-init-build-env in the top level is a slightly customized copy of
poky/oe-init-build-env. It can, for example, modify the PATH variable
to prioritize scripts found in meta-foo/scripts over scripts found in
openembedded-core/scripts. This allows overriding scripts like we have
it for all the bitbake-related files in layers.

The logic: Set up the build environment with PATH (so bitbake can be
found), OEROOT, and BUILDDIR, then run further scripts which use these
variables.

I hope this explains:
 * How 'seeing multiple layers' worked before (my understanding)
 * Why I ended up with calling init-build-env (respectively the old oe-
   init-build-env) rather then calling separate scripts from bitbake-
   setup:
    - Keep it independent from bitbake-setup (at least for now)
    - Benefit from bitbake-setup: It has to run before everything else
      runs which is the right time for dropping a VSCode configuration.
    - Support customizing the .vscode/settings.json for project specific
      layers

I'm not against creating the VSCode configuration directly from
bitbake-setup. But I think it is more complicated than it looks like. I
also don't want to be the guy who polluted all the git repositories
whit editor specific code :-). OE-core is enough for now.

I hope this at least explains, why I ended up whit these patches.

Thank you.
Regards,
Adrian


> Alex
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228551):
> https://lists.openembedded.org/g/openembedded-core/message/228551
> Mute This Topic: https://lists.openembedded.org/mt/116929993/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

