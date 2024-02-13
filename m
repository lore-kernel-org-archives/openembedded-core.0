Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9FFC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 20:52:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.24720.1707857545036895603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 12:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vmj6wYEC;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-410c804e933so20792025e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 12:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707857543; x=1708462343; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VkAWwn3wsmek1juP+qO+86kFfiBM09XSZQO+8I77OnQ=;
        b=Vmj6wYECfaNycHe3hD2gyGP0/ggU/p3RKUpv2VNzh4T0o+4GdJllcyG84JmzujM1rT
         hQMDvsaoDyiAEjgcZi94VCXu2uHgL+n2VPMAXSIA4ynm4dA/bRR0rDvMu9bKfxjmerBI
         4B0x0VWq+/PxUvdES0UrkGpUfjn2lNo8Z+34jZAKIU0f9p5Z7qXW5VMnNFqny8gHQ0OT
         xX3JIhvZ313vr3p9931n0NuEQ96yxpQXw6jDtG5UzAYW/jbhJbci4nzwkfNeElvoxx+5
         kzyIfbDwO4q4DTqcBvdm0NxJ7PRtvKH8/g+nxHNzjH9tjvgZH6KxsUhps75/mndvsNzq
         CkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707857543; x=1708462343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkAWwn3wsmek1juP+qO+86kFfiBM09XSZQO+8I77OnQ=;
        b=EljXz1dHT1+KFLcXRe8gKeHbzjr4cPNof0bMuDV3fQW4yQJbCpfWspUbnn+xF/cH29
         nlCXc3FDe+bdWgmb285u4Jdp4i+BJ4HUiOLUF1ANZ4Q9E4DGer+lXdEN9IcMTeBRRLg6
         PFkz+kxCoAuPuB08pCIC2smjiW/wpS9OVM+C98c/bKbpu4MXw8HsUpQdtHZGF8oXx8pS
         kzc2bfpci3SSsBJ0XUClIBA6C2G2EfA2S0ZIr+Mm0/BoVnBbUIud5rwqwHRvR7yBheiA
         EEoKXn1We+xrXfGvTzHIeW2LACa7chkCnG37086CeDEuiutAe48lZCdC2jFBU/gOdlgv
         WPow==
X-Gm-Message-State: AOJu0YxbdXr4oyUt6oJoA7lIv72eDm51E/q7bmE34vQmSCAih75KFZhU
	WY8qXG9CVfVlK7oQOOc7XTz2fMEYlaAXyhV6hsHsCzf5mcVMWYwB
X-Google-Smtp-Source: AGHT+IHS9fRrf5++f+WF7nvrrbtq2XdSAxiFyHSb6wdZgAo9PWBeJEzoYiYqA3KYcTYXFuAYb3kAKg==
X-Received: by 2002:a05:600c:1c08:b0:411:dd04:f46c with SMTP id j8-20020a05600c1c0800b00411dd04f46cmr355889wms.6.1707857543259;
        Tue, 13 Feb 2024 12:52:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUsFiMXNEQV/p81DQnyb23YMzDaRsB/ie2NKgrohavFvwdpso6mYauW+deO6QCjAOFmj2wiZOnY7nz6ZenowNY2tHdVjr9+3VgG2/++eVbRAKBrWuSxD6cWeJrqCa0gHdBFbXhO8TukqwNxv17q/z/YvSUIjwj6oUF/P8qox15Xv9Rx+I=
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id z19-20020a1c4c13000000b00410bc0cbdfasm8234651wmf.18.2024.02.13.12.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 12:52:22 -0800 (PST)
Message-ID: <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
Subject: Re: VS Code plugin and multiple build directories
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt
 <enguerrand.de-ribaucourt@savoirfairelinux.com>,  Peter Kjellerstedt
 <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <Ross.Burton@arm.com>,  Mohammed Raza <mohammed.raza@savoirfairelinux.com>
Date: Tue, 13 Feb 2024 21:52:21 +0100
In-Reply-To: <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
References: 
	<DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 20:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195427

On Tue, 2024-02-13 at 16:27 +0100, Enguerrand de Ribaucourt wrote:
> Thanks for your feedback!
> > I normally do not use VS Code, but I actually had a reason to do so
> > the
> > other day. After having installed the new bitbake plugin, I noticed
> > two
> > things related to the settings. One is the odd defaults where I
> > would
> > have expected something that matches the default Poky configuration
> > (which I guess is part of Adrian's changes). The other is that the
> Adrian's change will indeed produce better defaults for poky.
>=20
> We could consider changing the extension's defaults if they really
> don't=20
> work for most users. It currently assumes poky is in `sources/poky`.=20
> Cloning just poky would result in just `.`. While multi layered
> projects=20
> will often put it in `poky` or `sources/poky`. I'd rather wait for an
> official oe-layer-setup like tool and structure to be wildly used and
> align with it rather than guessing the default configuration another=20
> way. Changing the default will break some users configs, so I'm also=20
> being conservative.
>=20
> I'm really open to suggestions on this.

If the oe-init-build-env script generates a configuration for VSCode
and for the yocto-bitbake plugin, this should be solved for all
possible configurations I can think of.

Changing the default configuration can then be considered unnecessary.
Whatever the default configuration will look like, it will not fit for
many use cases.
But interestingly, we have the exact same configuration as Peter. But I
have not seen a setup with sources/poky so far.

> > plugin seems to make a hard assumption that you only have a single
> > build
> > directory within a workspace. In our case we typically setup the
> > environment with one build directory per machine and/or use case,
> > e.g.,
> > rather than a `build` directory, I have `builds/foo`, `builds/bar`
> > and
> > `builds/bar-selftest`. And while I of course can configure the
> > plugin to
> > use one of the build directories, in a typical session I regularly
> > switch
> > between the build directories depending on what I am doing at the
> > moment
> > and it seems awkward to have to have one VS Code configuration per
> > build
> > directory when the source files are the same in all cases. Now, I
> > am a
> > total VS Code novice so maybe there are better ways to do it, but
> > for
> > now I just configured the plugin to create its own build directory
> > in
> > `.VS Code/build` and forgot about it.

Also this is exactly what we do as well.

> >=20
> > I have no idea what is possible to do with a VS Code extension, but
> > would
> > it be possible to make the plugin support multiple build
> > directories for
> > one workspace, e.g., by allowing multiple build directories and/or
> > patterns to be specified? I.e., in our case I would like to be able
> > to
> > configure the build directories as `${workspaceFolder}/builds/*`
> > and
> > then choose which is currently active from with the VS Code UI.Yes
> > currently, the extension only manages one build directory and=20
> machine/distro config. This is a feature that has been requested
> quite=20
> often. My plan would be to rely on Yocto's multiconfigs since it is
> the=20
> official tool to manage multiple configurations. I prefer
> multiconfigs=20
> rather than an array of bitbake settings.json and different build=20
> directories (like you describe). We'd add a picker in the bottom
> status=20
> bar to select the configuration and prefix all bitbake commands with
> the=20
> appropriate "mc:" config.

These are different things:
* We use different build folders for different, independent targets.
Typically we have one build folder per distro. Otherwise different
variants of the same package will be built in the same TMPDIR. This
can be confusing.
Different MACHINEs can share one TMPDIR. All build variants of a
package should get their own tmp folder if the PACKAGE_ARCH is set
correctly for all recipes. But of course, having a build folder per
machine works as well.
* mc: This is used to have multiple build configurations for one
target. Multiconfigs are implemented with subfolders in one build
folder because these configurations have dependencies on each other.
The argument that multiple build folders are not supported in favor
of multiconfigs is incomprehensible to me.

If the plugin is supposed to support what Yocto supports, it should
support:
* Different build folders. What Peter suggests with the * wildcard can
work. Alternatively it could also look like this:

"bitbake.pathToBuildFolder": "${workspaceFolder}/build/foo"
"bitbake.pathToBuildFolders": ["${workspaceFolder}/build/foo",
"/var/build/bar"]

- pathToBuildFolder refers to the active build configuration (as of
now).
- Activating one of the configs from pathToBuildFolders should be
simple and should change the pathToBuildFolder setting.
* Multiconfigs should be automatically detected in the active build
folder. The plugin should offer to build the top level configuration
which depends on all the multiconfigs but also support to build only
one of the multiconfigs.
* Switching the active build folder means reloading the bitbake
environment by calling oe-init-build-env. Mutliconfigs should be
buildable like recipes. The user can build one of them without
reloading the bitbake environment.

Thank you for sharing your thoughts.
I will send the template patches ASAP.

Adrian



> >=20
> > //Peter
> >=20
> >=20
> Regards
> Enguerrand de Ribaucourt


