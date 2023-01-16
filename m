Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E687FC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 13:30:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.166186.1673875825225049261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 05:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OJafCXBG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z5so26429394wrt.6
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 05:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/nJzW8xVIERb2g1wsx0uCiMnNvKehUxsOm/8vcRGz9Y=;
        b=OJafCXBGDW7fetSkvyQB+LRpJbFoNp8QRs7eMJXGANDGjd8a0BwoU571RsYQFKlLHN
         2TRUfwPrpyMsT6n5wyS8Z8xgmwbFsSgJfQYY0w5IkKTbR3zwnBeUrcAfmPa0i+5i9323
         UIkxtNcbSTyFMTbX8SyS2LTHYNb4oq/rrVqME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nJzW8xVIERb2g1wsx0uCiMnNvKehUxsOm/8vcRGz9Y=;
        b=hVJHmN6uEYVw8frIFf+DTAff1ajQv19hVq9VhJYd8cvWWVkwBZJ5yhogtsQ/sbpY7O
         5jgTNhM7rZUpsipivn0qWyr4qGi9+5fv5jhj18yOQ6k6e0b2uDSGVYlJb9zDZNi28lIt
         3/76Xrf2Y4hFgq9H6exCmvl3YAGOCRSORGqcrMSF/cwLPkrAytYlP5+Nu5dwUPPOVYbB
         4Hl5OcCoWGaQvd8tAlDuMReIuBccZE4rnUl7s6MBfKBTIj594YeggeQHSXVW6YImxAoV
         6lpigCcyDKOzOZW5wJzdh3JIGU+jnV2gJuzZXxwoh6yvAm4itg42qF4Mbe8EV18ITEE8
         7kgw==
X-Gm-Message-State: AFqh2koOJ4VTdMMu7U3ugNRo3vsWoxQqeoDdUGSp/Gxw+qeL0qEi8l9L
	nRwPf0U56HB6TgpHq/ym6sUmLw==
X-Google-Smtp-Source: AMrXdXtB8ufvyQVgXgCFybiMVZsnA2szC+WXtGBPVwGDHnLtbz/v966bZM1JTVLe8LycgcQ0Ly2+cg==
X-Received: by 2002:adf:e9c9:0:b0:2bd:f782:d26d with SMTP id l9-20020adfe9c9000000b002bdf782d26dmr5354603wrn.30.1673875823444;
        Mon, 16 Jan 2023 05:30:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id g2-20020a5d64e2000000b002be063f6820sm3491759wri.81.2023.01.16.05.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 05:30:23 -0800 (PST)
Message-ID: <eaf6331bec173b7d5b7c758659223e34b71226dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oe-setup-build: add a tool for discovering
 config templates and setting up builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 16 Jan 2023 13:30:22 +0000
In-Reply-To: <20221110092433.2874130-1-alex@linutronix.de>
References: <20221110092433.2874130-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 13:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175983

On Thu, 2022-11-10 at 10:24 +0100, Alexander Kanavin wrote:
> This is the last (I believe) piece of the puzzle in setting up builds fro=
m nothing
> without having to write custom scripts or use external tools.
>=20
> After layers have been fetched and placed into their respective locations=
, one would
> surely want to proceed to the actual build, and here's how:
>=20
> 1. Without arguments or with 'list-config-templates', the tool simply wal=
ks the ../..
> of its location (which is the parent dir of poky/oe-core), and prints wha=
t templates it
> has found, as seen below. If the following is not enough information,
> adding '-v' will also print conf-notes.txt for each of the templates:
>=20
> $ oe-setup-build
> Available build configuration templates (re-run with -v to see their desc=
riptions):
>=20
> /srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/a=
lex/poky/meta-poky/conf/templates/default
> will create a build configuration in /srv/work/alex/build-meta-poky-defau=
lt
>=20
> /srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/a=
lex/meta-alex/conf/templates/configuration-gizmo
> will create a build configuration in /srv/work/alex/build-meta-alex-confi=
guration-gizmo
>=20
> /srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/a=
lex/meta-alex/conf/templates/configuration-gadget
> will create a build configuration in /srv/work/alex/build-meta-alex-confi=
guration-gadget
>=20
> 2. Then the user picks one command of the above and runs it. This will la=
nd them in a shell ready to run bitbake:
>=20
> $ oe-setup-build setup-build-env -c /srv/work/alex/meta-alex/conf/templat=
es/configuration-gizmo
> Running: TEMPLATECONF=3D/srv/work/alex/meta-alex/conf/templates/configura=
tion-gizmo . /srv/work/alex/poky/oe-init-build-env /srv/work/alex/build-met=
a-alex-configuration-gizmo && /bin/bash
> You had no conf/local.conf file. This configuration file has therefore be=
en
> created for you from /srv/work/alex/meta-alex/conf/templates/configuratio=
n-gizmo/local.conf.sample
> You may wish to edit it to, for example, select a different MACHINE (targ=
et
> hardware). See conf/local.conf for more information as common configurati=
on
> options are commented.
>=20
> You had no conf/bblayers.conf file. This configuration file has therefore=
 been
> created for you from /srv/work/alex/meta-alex/conf/templates/configuratio=
n-gizmo/bblayers.conf.sample
> To add additional metadata layers into your configuration please add entr=
ies
> to conf/bblayers.conf.
>=20
> The Yocto Project has extensive documentation about OE including a refere=
nce
> manual which can be found at:
>     https://docs.yoctoproject.org
>=20
> For more information about OpenEmbedded see the website:
>     https://www.openembedded.org/
>=20
> This configuration template will set up a build for the purposes of suppo=
rting gizmo.
> Please refer to meta-alex/README for additional details and available bit=
bake targets.
>=20
> 3. The full set of command line options is:
>=20
> $ oe-setup-build -h
> usage: oe-setup-build [-h] {list-config-templates,setup-build-env} ...
>=20
> A script that discovers available build configuration templates and sets =
up a build environment based on one of them
>=20
> positional arguments:
>   {list-config-templates,setup-build-env}
>     list-config-templates
>                         List available configuration templates
>     setup-build-env     Set up a build environment and open a shell sessi=
on with it, ready to run builds.
>=20
> optional arguments:
>   -h, --help            show this help message and exit
>=20
> $ oe-setup-build list-config-templates -h
> usage: oe-setup-build list-config-templates [-h] [--topdir TOPDIR] [-v]
>=20
> optional arguments:
>   -h, --help       show this help message and exit
>   --topdir TOPDIR  Where to look for available build configuration templa=
tes (default is /srv/work/alex).
>   -v               Print a description for each available build configura=
tion template.
>=20
> $ oe-setup-build setup-build-env -h
> usage: oe-setup-build setup-build-env [-h] -c template_path [-b build_pat=
h] [--no-shell]
>=20
> optional arguments:
>   -h, --help        show this help message and exit
>   -c template_path  Use a build configuration template in template_path t=
o set up a build environment (run this script with 'list-config-templates' =
to see what is available)
>   -b build_path     Set up a build directory in build_path (run this scri=
pt with 'list-config-templates' to see where it would be by default)
>   --no-shell        Create a build directory but do not start a shell ses=
sion with the build environment from it.
>=20
> 4. There's also a selftest that runs a basic check for template discovery=
 and build setup,
> and an added hint in oe-setup-layers about how to proceed (as it is reall=
y not user-friendly
> to fetch the layer repos successfully and then exit without a word).
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

I appreciate I've taken a long time to respond to this, sorry about
that. I'd hoped others might give feedback but that hasn't happened and
something about the patch doesn't "feel" right to me. The trouble is
that as soon as I say that, you'd understandably want to know what it
is and I'm having trouble quantifying it.

Firstly, let me explain why I'm holding this change to a particularly
high standard. The issue the namespaces, this isn't some random layer,
it is in the core and it is adding commands to our core tools. As such
they need to be right. They need to ensure the project scales in the
right ways and ensure we have the ability to add functionality where
needed in the future. Sometimes there is a case for adding something
and then incrementally improving but in this specific case that is
harder.

I think part of my concern is that the tool isn't working with the
layers as everything else does. This results in a bit of an ugly
commandline interface and poor capabilities of the tool. By that I mean
that ideally we shouldn't be walking TOPDIR but we should be be
iterating over the layers looking for config templates in each one. A
config template in one layer could override another using the standard
approach layers have to override each other.

The challenge here is that bblayers.conf is coming from the templates,
so we can't parse anything until we at least have bblayers.conf to say
which layers to parse. This leads to a few different questions:

a) Should bblayers.conf be autogenerated?
b) Should oe-setup-layers write bblayers.conf?
c) Should oe-setup-layers write the json somewhere so that the list of
layers can be known?
d) Should oe-setup-build run in two stages, establishing bblayers.conf,
then once present, list the configs?
e) Should bblayers.conf be moved somewhere other than the build
directory?

I appreciate that the tool works with what we have today, however I
think what we have today is part of the problem we need to fix. If we
add this patch, we're then adding more pieces we're "stuck" to
supporting.

There is also an implied challenge here of the different stages of
"checkout the repos", "document those checkouts in bblayers.conf" and
"here is a separate build directory". The layer config file is where
information from the two are mixed but I suspect there is something
different we could do.

For example, if the config fragment says "I need layers X, Y" but the=20
layer setup json might define Z as well. We'd need a markup for "layers
X, Y, Z are available" from oe-setup-layers. oe-setup-build could then
iterate the layers, show the configs, then generate a setup for configX
which only needed layers Y and Z configured.

Part of the issue here is also the handoff between initial setup and
continued development. If we can solve that issue neatly it would be a
huge win for the project and it is exactly the kind of thing we'd want
to have a tool in core doing.

Going back to this patch, I think the paths needed are a sign that we
need more data being stored for the tools to act upon to allow for more
intelligent configuration of the builds.

That would then naturally lead into what I've talked about elsewhere,
with the idea of "pre-canned" config/setup and ultimately that would
allow us to drop things like the combo-layer poky.

Hopefully that gives some idea of why I'm a bit reluctant to add this
patch in this particular namespace. The oe-setup-layers piece is doing
something which is unlikely to fundamentally change (git
clone/checkouts), but this piece is where we have things we do need to
improve.

Cheers,

Richard




