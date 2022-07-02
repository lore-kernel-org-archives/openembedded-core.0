Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6584C433EF
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 05:59:04 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.47407.1656741536637679243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 22:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MFrimcgk;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id q140so4246959pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 22:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O3FOprk4LnqP+zPnqbsTdf36ZemnzpslnCnOdOD6XhI=;
        b=MFrimcgkFQrgkZYSomeftlyeQLbT362lZ0LSsxhhCceZs7ExBY38GhPYKHi3DK16ch
         EpFUcy3IqYy/sBf0MsI3rKzg07/k5TyBkjhZ/o1E2AzYULNwlx0NLsA06e0AVe/wp7yJ
         R6EDuPxVZa2TaPJNxbmkodgCrAM9/S8wzxXOmbb6Gj4UL/IOU40aTePMzKEg4ptvCdL6
         5T7dvxGfuz32egc74eZFNKQEogGM/4Bs/lyjn73o9vtd8VXMoZaMAXPJ/Iahs6aqGUFB
         klkYbDgw+kefD6akLXXuMg50W6PXWoEeEeBb4Pj5312/2rkl6vPv3O+/FH9aEYZi1DSd
         mI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O3FOprk4LnqP+zPnqbsTdf36ZemnzpslnCnOdOD6XhI=;
        b=flsE33Mrjd5evdR6J/4vILsDla+UUAKUzKjLPZtR8z8TfEv0qZCJP7rwzVQi2oCM60
         6nxDml9lKzT3E9hiNuPrXub8OD2bsNtj8y6rOO57mHzpzglku9PrYMQTA0Gjyc5E0Ron
         FN5ViLXv3t9exTAB+UHylPcYx6Bsoqfxhhvluj5NMeOBKtwIepmG7ZjCMHnS86GU3LPT
         gsl9TSKqxwJCBwiQGeJoxMaBSXqx7hTsLLVJdDXo/0NsSKP6B9gZ/BpHgX8FNema8WT8
         ZNk9bG9OuWrm5GYAv2jzeOCXxdh+hxFU69imxxzdjUc5tqru1W5RNDpmGuILDFspfPmi
         98Kg==
X-Gm-Message-State: AJIora8WXyeO+ngKTwq1yVkGpJFaPwOPTZsvDrdy1z0f/7v3Ga5J3ocb
	cjcnSL6xG3bP4u9zsgA0teZ3BKpCdtk37uzKkfU=
X-Google-Smtp-Source: 
 AGRyM1vx8mQ66vtLM+a98VtHfc7XhLRW+ifF2qlL1+dcINVXGtQvPKU3IcExTYHhxnkBQxNOgfkn8jYV/s8ooCwfUq8=
X-Received: by 2002:a05:6a00:15d6:b0:525:3757:4b98 with SMTP id
 o22-20020a056a0015d600b0052537574b98mr24691381pfu.64.1656741535549; Fri, 01
 Jul 2022 22:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <92f3c188-a784-3af2-9bb9-76353e60deb0@gmail.com>
 <CANNYZj_6PJ=E3M5X21eYhih3am62jvVE+G+vgjenKoSfRCL36g@mail.gmail.com>
 <CAJdd5Gai4N1MXGVOMhqceocjWGpr9D4zEjRgvu3vN8Lgi8WAzg@mail.gmail.com>
In-Reply-To: 
 <CAJdd5Gai4N1MXGVOMhqceocjWGpr9D4zEjRgvu3vN8Lgi8WAzg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 1 Jul 2022 22:58:44 -0700
Message-ID: 
 <CANx9H-Db+K=hMKGJzwmRQbyz+VTLC=tcMviSj5kPzKkTCWKBTg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b60d4205e2cc32e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 05:59:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167544

--000000000000b60d4205e2cc32e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 1, 2022 at 1:44 PM Joshua Watt <JPEWhacker@gmail.com> wrote:

> On Fri, Jul 1, 2022 at 3:29 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > First of all this provides a single command that does all of the work
> > to capture the layers and their revisions from currently enabled set
> > in a bitbake build. No other tool does this because they do not know
> > anything about bitbake or tinfoil, and so you have to write your
> > config by hand, with all of them.
> >
> > Here's how the captured metadata loks like [1]. I find it more useful
> > for understanding what are we actually checking out than submodules'
> > bare, unhelpful set of git revisions. It also doesn't require a
> > super-repo containing all of the submodules: you can just toss the
> > script into one of the layers and it will do the right thing for
> > bootstrapping. There was also a comment from one of our customers: "
> > In practice we learned that recursive submodules are not always
> > correctly handled by GitLab CI. "
> >
> > I also find git submodules command line UI supremely confusing.
> > Actually wait, that's what git as a whole is like: confusing.
> > https://xkcd.com/1597/
> >
> > But if you would like, we can add a fourth output format to the
> > bblayers plugin added in this patch that sets up git submodules
> > instead of writing a standalone python script with embedded json
> > (which is what I prefer).
>
> Thanks for the write up. I don't particularly care if we go down this
> route; it seems fine as long as it doesn't become "the one true way"
> to do layer setup (because I'm still going to use submodules :) )
>

This is exactly the problem. Everyone bike shedding; beautiful paint btw
;). We MUST find some solution that is a common reference. Otherwise we can
just spin wheels forever. I will state for the record that git-repo phoning
home on every invocation (and failing in very non helpful ways without
proper ssh credentials or corporate proxies) is a non-starter. Yes it
works. No, I will die on this mountain fighting against it being the way.
No. Bad design.

I like git sub modules. Yoe distro is a very good example of how to make
this work. I did an ELCE presentation based on a git sub module system. Our
entire team of three was git savvy. This is not a guarantee. Downstream
from us broke very rapidly because folks didn=E2=80=99t understand how to
contribute to the sub modules and keep it in sync. In the long run kas was
drastically simpler to roll out and sustain.

One remaining question is how do we handle configuration? This seems to
address manifest? Git sub modules do not address configuration. Git-repo
scripts are the first thing I have to fix/throw away. Do not assume where
source and builds happen. My builds are on a different drive than my source=
.

One-line command to fetch the layers and configure a build environment that
will JustWork(TM) is the need. Kas is the only tool that does this as far
as I have seen. In an opinionated way that overwrites local.conf (bad).

For the record, I wholeheartedly endorse this direction, Alex.


> >
> > Alex
> >
> > [1]
> > {
> >     "meta-alex": {
> >         "branch": "master",
> >         "describe": "",
> >         "is_bootstrap": true,
> >         "layers": [
> >             {
> >                 "name": "meta-alex",
> >                 "path": ""
> >             }
> >         ],
> >         "remotes": [
> >             {
> >                 "name": "remote-alex",
> >                 "uri": "https://github.com/kanavin/meta-alex"
> >             }
> >         ],
> >         "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
> >     },
> >     "meta-intel": {
> >         "branch": "master",
> >         "describe": "15.0-hardknott-3.3-310-g0a96edae",
> >         "layers": [
> >             {
> >                 "name": "meta-intel",
> >                 "path": ""
> >             }
> >         ],
> >         "remotes": [
> >             {
> >                 "name": "origin",
> >                 "uri": "git://git.yoctoproject.org/meta-intel"
> >             }
> >         ],
> >         "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
> >     },
> >     "poky": {
> >         "branch": "akanavin/setup-layers",
> >         "describe": "4.1_M1-295-gfd524e4984",
> >         "layers": [
> >             {
> >                 "name": "meta",
> >                 "path": "meta"
> >             },
> >             {
> >                 "name": "meta-poky",
> >                 "path": "meta-poky"
> >             },
> >             {
> >                 "name": "meta-yocto-bsp",
> >                 "path": "meta-yocto-bsp"
> >             }
> >
> >        ],
> >         "remotes": [
> >             {
> >                 "name": "origin",
> >                 "uri": "git://git.yoctoproject.org/poky"
> >             },
> >             {
> >                 "name": "poky-contrib",
> >                 "uri": "ssh://git@push.yoctoproject.org/poky-contrib"
> >             }
> >         ],
> >         "rev": "fd524e4984eb535f16a14dd7d79fde661b44aa78"
> >     }
> > }
> >
> > On Fri, 1 Jul 2022 at 21:46, Joshua Watt <jpewhacker@gmail.com> wrote:
> > >
> > > Can you outline what this provides over `git submodules`? It seems
> > > pretty similar and I'm struggling to see what this provides that isn'=
t
> > > already provided by that tool.
> > >
> > > On 7/1/22 14:24, Alexander Kanavin wrote:
> > > > This addresses a long standing gap in the core offering:
> > > > there is no tooling to capture the currently configured layers
> > > > with their revisions, or restore the layers from a configuration
> > > > file (without using external tools, some of which aren't particular=
ly
> > > > suitable for the task). This plugin addresses the gap.
> > > >
> > > > How to use:
> > > >
> > > > 1. Saving a layer configuration:
> > > >
> > > > a) Command line options:
> > > >
> > > > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers
> create-layers-setup -h
> > > > NOTE: Starting bitbake server...
> > > > usage: bitbake-layers create-layers-setup [-h] [--output OUTPUT]
> [--format {python,json,kas}] destdir
> > > >
> > > >   Writes out a python script/kas config/json config that replicates
> the directory structure and revisions of the layers in a current build.
> > > >
> > > > positional arguments:
> > > >    destdir               Directory where to write the output
> > > >                          (if it is inside one of the layers, the
> layer becomes a bootstrap repository and thus will be excluded from
> fetching by the script).
> > > >
> > > > optional arguments:
> > > >    -h, --help            show this help message and exit
> > > >    --output OUTPUT, -o OUTPUT
> > > >                          File name where to write the output, if th=
e
> default (setup-layers.py/.json/.yml) is undesirable.
> > > >    --format {python,json,kas}, -f {python,json,kas}
> > > >                          Format of the output. The options are:
> > > >                               python - a self contained python
> script that fetches all the needed layers and sets them to correct
> revisions (default, recommended)
> > > >                               kas - a configuration file for the ka=
s
> tool that allows the tool to do the same
> > > >                               json - a json formatted file
> containing all the needed metadata to do the same by any external or cust=
om
> tool.
> > > >
> > > > b) Running with default choices:
> > > >
> > > > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers
> create-layers-setup ../../meta-alex/
> > > > NOTE: Starting bitbake server...
> > > > NOTE: Created /srv/work/alex/meta-alex/setup-layers.py
> > > >
> > > > 2. Restoring the layers from the saved configuration:
> > > >
> > > > a) Clone meta-alex separately, as a bootstrap layer/repository. It
> should already contain setup-layers.py created in the previous step.
> > > >
> > > > b) Command line options:
> > > >
> > > > alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py -=
h
> > > > usage: setup-layers.py [-h] [--force-meta-alex-checkout]
> [--choose-poky-remote {origin,poky-contrib}] [--destdir DESTDIR]
> > > >
> > > > A self contained python script that fetches all the needed layers
> and sets them to correct revisions
> > > >
> > > > optional arguments:
> > > >    -h, --help            show this help message and exit
> > > >    --force-meta-alex-checkout
> > > >                          Force the checkout of the bootstrap layer
> meta-alex (by default it is presumed that this script is in it, and so th=
e
> layer is already in place).
> > > >    --choose-poky-remote {origin,poky-contrib}
> > > >                          Choose a remote server for layer poky
> (default: origin)
> > > >    --destdir DESTDIR     Where to check out the layers (default is
> /srv/work/alex/layers-test).
> > > >
> > > > c) Running with default options:
> > > >
> > > > alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py
> > > > Note: not checking out layer meta-alex, use
> --force-meta-alex-checkout to override.
> > > > Checking out layer meta-intel, revision
> 15.0-hardknott-3.3-310-g0a96edae, branch master from remote origin at git=
://
> git.yoctoproject.org/meta-intel
> > > > Running 'git clone -q git://git.yoctoproject.org/meta-intel
> meta-intel' in /srv/work/alex/layers-test
> > > > Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a'
> in /srv/work/alex/layers-test/meta-intel
> > > > Note: multiple remotes defined for layer poky, using origin (run
> with -h to see others).
> > > > Checking out layer poky, revision 4.1_M1-295-g6850b29806, branch
> akanavin/setup-layers from remote origin at git://
> git.yoctoproject.org/poky
> > > > Running 'git clone -q git://git.yoctoproject.org/poky poky' in
> /srv/work/alex/layers-test
> > > > Running 'git checkout -q 4cc94de99230201c3c39b924219113157ff47006'
> in /srv/work/alex/layers-test/poky
> > > >
> > > > And that's it!
> > > >
> > > > FIXMEs:
> > > > - kas config writer not yet implemented
> > > > - oe-selftest test cases not yet written
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >   meta/lib/bblayers/makesetup.py                | 117
> ++++++++++++++++++
> > > >   .../templates/setup-layers.py.template        |  77 ++++++++++++
> > > >   2 files changed, 194 insertions(+)
> > > >   create mode 100644 meta/lib/bblayers/makesetup.py
> > > >   create mode 100644
> meta/lib/bblayers/templates/setup-layers.py.template
> > > >
> > > > diff --git a/meta/lib/bblayers/makesetup.py
> b/meta/lib/bblayers/makesetup.py
> > > > new file mode 100644
> > > > index 0000000000..3c86eea3c4
> > > > --- /dev/null
> > > > +++ b/meta/lib/bblayers/makesetup.py
> > > > @@ -0,0 +1,117 @@
> > > > +#
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +
> > > > +import logging
> > > > +import os
> > > > +import stat
> > > > +import sys
> > > > +import shutil
> > > > +import json
> > > > +
> > > > +import bb.utils
> > > > +import bb.process
> > > > +
> > > > +from bblayers.common import LayerPlugin
> > > > +
> > > > +logger =3D logging.getLogger('bitbake-layers')
> > > > +
> > > > +sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
> > > > +
> > > > +import oe.buildcfg
> > > > +
> > > > +def plugin_init(plugins):
> > > > +    return MakeSetupPlugin()
> > > > +
> > > > +class MakeSetupPlugin(LayerPlugin):
> > > > +
> > > > +    def _write_python(self, repos, output):
> > > > +        with open(os.path.join(os.path.dirname(__file__),
> "templates", "setup-layers.py.template")) as f:
> > > > +            template =3D f.read()
> > > > +        args =3D sys.argv
> > > > +        args[0] =3D os.path.basename(args[0])
> > > > +        script =3D template.replace('{cmdline}', "
> ".join(args)).replace('{layerdata}', json.dumps(repos, sort_keys=3DTrue,
> indent=3D4))
> > > > +        with open(output, 'w') as f:
> > > > +            f.write(script)
> > > > +        st =3D os.stat(output)
> > > > +        os.chmod(output, st.st_mode | stat.S_IEXEC | stat.S_IXGRP =
|
> stat.S_IXOTH)
> > > > +
> > > > +    def _write_json(self, repos, output):
> > > > +        with open(output, 'w') as f:
> > > > +            json.dump(repos, f, sort_keys=3DTrue, indent=3D4)
> > > > +
> > > > +    def _write_kas(self, repos, output):
> > > > +        raise NotImplementedError('Kas config writer not
> implemented yet')
> > > > +
> > > > +    _write_config =3D {"python":_write_python, "json":_write_json,
> "kas":_write_kas}
> > > > +    _output_filename =3D
> {"python":"setup-layers.py","json":"setup-layers.json","kas":"setup-layer=
s.kas.yaml"}
> > > > +
> > > > +    def _get_repo_path(self, layer_path):
> > > > +        repo_path, _ =3D bb.process.run('git rev-parse
> --show-toplevel', cwd=3Dlayer_path)
> > > > +        return repo_path.strip()
> > > > +
> > > > +    def _get_remotes(self, repo_path):
> > > > +        remotes =3D []
> > > > +        remotes_list,_ =3D bb.process.run('git remote', cwd=3Drepo=
_path)
> > > > +        for r in remotes_list.split():
> > > > +            uri,_ =3D bb.process.run('git remote get-url
> {r}'.format(r=3Dr), cwd=3Drepo_path)
> > > > +            remotes.append({'name':r,'uri':uri.strip()})
> > > > +        return remotes
> > > > +
> > > > +    def _get_describe(self, repo_path):
> > > > +        try:
> > > > +            describe,_ =3D bb.process.run('git describe --tags',
> cwd=3Drepo_path)
> > > > +        except bb.process.ExecutionError:
> > > > +            return ""
> > > > +        return describe.strip()
> > > > +
> > > > +    def _make_repo_config(self, destdir):
> > > > +        repos =3D {}
> > > > +        layers =3D
> oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
> > > > +        for l in layers:
> > > > +            if l[1] =3D=3D 'workspace':
> > > > +                continue
> > > > +            if l[4]:
> > > > +                logger.error("Layer {name} in {path} has
> uncommitted modifications or is not in a git
> repository.".format(name=3Dl[1],path=3Dl[0]))
> > > > +                return
> > > > +            repo_path =3D self._get_repo_path(l[0])
> > > > +            if repo_path not in repos.keys():
> > > > +                repos[repo_path] =3D {'rev':l[3], 'branch':l[2],
> 'remotes':self._get_remotes(repo_path), 'layers':[],
> 'describe':self._get_describe(repo_path)}
> > > > +                if not repos[repo_path]['remotes']:
> > > > +                    logger.error("Layer repository in {path} does
> not have any remotes configured. Please add at least one with 'git remote
> add'.".format(path=3Drepo_path))
> > > > +                    return
> > > > +                if repo_path in os.path.abspath(destdir):
> > > > +                    repos[repo_path]['is_bootstrap'] =3D True
> > > > +
> repos[repo_path]['layers'].append({'name':l[1],'path':l[0].replace(repo_p=
ath,'')[1:]})
> > > > +
> > > > +        repo_dirs =3D set([os.path.dirname(p) for p in repos.keys(=
)])
> > > > +        if len(repo_dirs) > 1:
> > > > +            logger.error("Layer repositories are not all in the
> same parent directory: {repo_dirs}. They need to be relocated into the sa=
me
> directory.".format(repo_dirs=3Drepo_dirs))
> > > > +            return
> > > > +
> > > > +        repos_nopaths =3D {}
> > > > +        for r in repos.keys():
> > > > +            r_nopath =3D os.path.basename(r)
> > > > +            repos_nopaths[r_nopath] =3D repos[r]
> > > > +        return repos_nopaths
> > > > +
> > > > +    def do_make_setup(self, args):
> > > > +        """ Writes out a python script/kas config/json config that
> replicates the directory structure and revisions of the layers in a curre=
nt
> build. """
> > > > +        repos =3D self._make_repo_config(args.destdir)
> > > > +        if not repos:
> > > > +            return
> > > > +        output =3D args.output
> > > > +        if not output:
> > > > +            output =3D self._output_filename[args.format]
> > > > +        output =3D os.path.join(os.path.abspath(args.destdir),outp=
ut)
> > > > +        self._write_config[args.format](self, repos, output)
> > > > +        logger.info('Created {}'.format(output))
> > > > +
> > > > +    def register_commands(self, sp):
> > > > +        parser_setup_layers =3D self.add_command(sp,
> 'create-layers-setup', self.do_make_setup, parserecipes=3DFalse)
> > > > +        parser_setup_layers.add_argument('destdir',
> > > > +            help=3D'Directory where to write the output\n(if it is
> inside one of the layers, the layer becomes a bootstrap repository and th=
us
> will be excluded from fetching by the script).')
> > > > +        parser_setup_layers.add_argument('--output', '-o',
> > > > +            help=3D'File name where to write the output, if the
> default (setup-layers.py/.json/.yml) is undesirable.')
> > > > +        parser_setup_layers.add_argument('--format', '-f',
> choices=3D['python', 'json', 'kas'], default=3D'python',
> > > > +            help=3D'Format of the output. The options are:\n\tpyth=
on
> - a self contained python script that fetches all the needed layers and
> sets them to correct revisions (default, recommended)\n\tkas - a
> configuration file for the kas tool that allows the tool to do the
> same\n\tjson - a json formatted file containing all the needed metadata t=
o
> do the same by any external or custom tool.')
> > > > diff --git a/meta/lib/bblayers/templates/setup-layers.py.template
> b/meta/lib/bblayers/templates/setup-layers.py.template
> > > > new file mode 100644
> > > > index 0000000000..a704ad3d70
> > > > --- /dev/null
> > > > +++ b/meta/lib/bblayers/templates/setup-layers.py.template
> > > > @@ -0,0 +1,77 @@
> > > > +#!/usr/bin/env python3
> > > > +#
> > > > +# This file was generated by running
> > > > +#
> > > > +# {cmdline}
> > > > +#
> > > > +# It is recommended that you do not modify it directly, but rather
> re-run the above command.
> > > > +#
> > > > +
> > > > +layerdata =3D """
> > > > +{layerdata}
> > > > +"""
> > > > +
> > > > +import argparse
> > > > +import json
> > > > +import os
> > > > +import subprocess
> > > > +
> > > > +def _do_checkout(args):
> > > > +    for l_name in layers:
> > > > +        l_data =3D layers[l_name]
> > > > +        if 'is_bootstrap' in l_data.keys():
> > > > +            force_arg =3D
> 'force_{}_checkout'.format(l_name.replace('-','_'))
> > > > +            if not args[force_arg]:
> > > > +                print('Note: not checking out layer {layer}, use
> {layerflag} to override.'.format(layer=3Dl_name,
> layerflag=3D'--force-{}-checkout'.format(l_name)))
> > > > +                continue
> > > > +        rev =3D l_data['rev']
> > > > +        desc =3D l_data['describe']
> > > > +        if not desc:
> > > > +            desc =3D rev[:10]
> > > > +        branch =3D l_data['branch']
> > > > +        remotes =3D l_data['remotes']
> > > > +        remote =3D remotes[0]
> > > > +        if len(remotes) > 1:
> > > > +            remotechoice =3D
> args['choose_{}_remote'.format(l_name.replace('-','_'))]
> > > > +            for r in remotes:
> > > > +                if r['name'] =3D=3D remotechoice:
> > > > +                    remote =3D r
> > > > +                    print('Note: multiple remotes defined for laye=
r
> {}, using {} (run with -h to see others).'.format(l_name, r['name']))
> > > > +        print('Checking out layer {}, revision {}, branch {} from
> remote {} at {}'.format(l_name, desc, branch, remote['name'],
> remote['uri']))
> > > > +        cmd =3D 'git clone -q {} {}'.format(remote['uri'], l_name)
> > > > +        cwd =3D args['destdir']
> > > > +        print("Running '{}' in {}".format(cmd, cwd))
> > > > +        subprocess.check_output(cmd, text=3DTrue, shell=3DTrue, cw=
d=3Dcwd)
> > > > +        cmd =3D 'git checkout -q {}'.format(rev)
> > > > +        cwd =3D os.path.join(args['destdir'], l_name)
> > > > +        print("Running '{}' in {}".format(cmd, cwd))
> > > > +        subprocess.check_output(cmd, text=3DTrue, shell=3DTrue, cw=
d=3Dcwd)
> > > > +
> > > > +layers =3D json.loads(layerdata)
> > > > +parser =3D argparse.ArgumentParser(description=3D'A self contained
> python script that fetches all the needed layers and sets them to correct
> revisions')
> > > > +
> > > > +bootstraplayer =3D None
> > > > +for l in layers:
> > > > +    if 'is_bootstrap' in layers[l]:
> > > > +        bootstraplayer =3D l
> > > > +
> > > > +if bootstraplayer:
> > > > +
> parser.add_argument('--force-{bootstraplayer}-checkout'.format(bootstrapl=
ayer=3Dbootstraplayer),
> action=3D'store_true',
> > > > +        help=3D'Force the checkout of the bootstrap layer
> {bootstraplayer} (by default it is presumed that this script is in it, an=
d
> so the layer is already in place).'.format(bootstraplayer=3Dbootstraplaye=
r))
> > > > +
> > > > +for l in layers:
> > > > +    remotes =3D layers[l]['remotes']
> > > > +    if len(remotes) > 1:
> > > > +
> parser.add_argument('--choose-{multipleremoteslayer}-remote'.format(multi=
pleremoteslayer=3Dl),choices=3D[r['name']
> for r in remotes], default=3Dremotes[0]['name'],
> > > > +            help=3D'Choose a remote server for layer
> {multipleremoteslayer} (default:
> {defaultremote})'.format(multipleremoteslayer=3Dl,
> defaultremote=3Dremotes[0]['name']))
> > > > +
> > > > +try:
> > > > +    defaultdest =3D os.path.dirname(subprocess.check_output('git
> rev-parse --show-toplevel', text=3DTrue, shell=3DTrue,
> cwd=3Dos.path.dirname(__file__)))
> > > > +except subprocess.CalledProcessError as e:
> > > > +    defaultdest =3D os.path.abspath(".")
> > > > +
> > > > +parser.add_argument('--destdir', default=3Ddefaultdest, help=3D'Wh=
ere
> to check out the layers (default is
> {defaultdest}).'.format(defaultdest=3Ddefaultdest))
> > > > +
> > > > +args =3D parser.parse_args()
> > > > +
> > > > +_do_checkout(vars(args))
> > > >
> > > >
> > > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167543):
> https://lists.openembedded.org/g/openembedded-core/message/167543
> Mute This Topic: https://lists.openembedded.org/mt/92117681/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b60d4205e2cc32e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div><br><div class=3D"gmail_quote"></div></div></div><=
div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Jul 1, 2022 at 1:44 PM Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@=
gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)">On Fri, Jul 1, 2022 at 3:29 PM Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; First of all this provides a single command that does all of the work<=
br>
&gt; to capture the layers and their revisions from currently enabled set<b=
r>
&gt; in a bitbake build. No other tool does this because they do not know<b=
r>
&gt; anything about bitbake or tinfoil, and so you have to write your<br>
&gt; config by hand, with all of them.<br>
&gt;<br>
&gt; Here&#39;s how the captured metadata loks like [1]. I find it more use=
ful<br>
&gt; for understanding what are we actually checking out than submodules&#3=
9;<br>
&gt; bare, unhelpful set of git revisions. It also doesn&#39;t require a<br=
>
&gt; super-repo containing all of the submodules: you can just toss the<br>
&gt; script into one of the layers and it will do the right thing for<br>
&gt; bootstrapping. There was also a comment from one of our customers: &qu=
ot;<br>
&gt; In practice we learned that recursive submodules are not always<br>
&gt; correctly handled by GitLab CI. &quot;<br>
&gt;<br>
&gt; I also find git submodules command line UI supremely confusing.<br>
&gt; Actually wait, that&#39;s what git as a whole is like: confusing.<br>
&gt; <a href=3D"https://xkcd.com/1597/" rel=3D"noreferrer" target=3D"_blank=
">https://xkcd.com/1597/</a><br>
&gt;<br>
&gt; But if you would like, we can add a fourth output format to the<br>
&gt; bblayers plugin added in this patch that sets up git submodules<br>
&gt; instead of writing a standalone python script with embedded json<br>
&gt; (which is what I prefer).<br>
<br>
Thanks for the write up. I don&#39;t particularly care if we go down this<b=
r>
route; it seems fine as long as it doesn&#39;t become &quot;the one true wa=
y&quot;<br>
to do layer setup (because I&#39;m still going to use submodules :) )<br>
</blockquote><div dir=3D"auto"><br></div></div></div></div><div><div><div c=
lass=3D"gmail_quote"><div dir=3D"auto">This is exactly the problem. Everyon=
e bike shedding; beautiful paint btw ;). We MUST find some solution that is=
 a common reference. Otherwise we can just spin wheels forever. I will stat=
e for the record that git-repo phoning home on every invocation (and failin=
g in very non helpful ways without proper ssh credentials or corporate prox=
ies) is a non-starter. Yes it works. No, I will die on this mountain fighti=
ng against it being the way. No. Bad design.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">I like git sub modules. Yoe distro is a very good exam=
ple of how to make this work. I did an ELCE presentation based on a git sub=
 module system. Our entire team of three was git savvy. This is not a guara=
ntee. Downstream from us broke very rapidly because folks didn=E2=80=99t un=
derstand how to contribute to the sub modules and keep it in sync. In the l=
ong run kas was drastically simpler to roll out and sustain.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">One remaining question is how do we h=
andle configuration? This seems to address manifest? Git sub modules do not=
 address configuration. Git-repo scripts are the first thing I have to fix/=
throw away. Do not assume where source and builds happen. My builds are on =
a different drive than my source.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">One-line command to fetch the layers and configure a build enviro=
nment that will JustWork(TM) is the need. Kas is the only tool that does th=
is as far as I have seen. In an opinionated way that overwrites local.conf =
(bad).</div><div dir=3D"auto"><br></div><div dir=3D"auto">For the record, I=
 wholeheartedly endorse this direction, Alex.</div><div dir=3D"auto"><br></=
div></div></div></div><div><div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
><br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; [1]<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;meta-alex&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;branch&quot;: &quot;master&quot=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;describe&quot;: &quot;&quot;,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;is_bootstrap&quot;: true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;layers&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;meta-alex&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pat=
h&quot;: &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;remotes&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;remote-alex&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;uri=
&quot;: &quot;<a href=3D"https://github.com/kanavin/meta-alex" rel=3D"noref=
errer" target=3D"_blank">https://github.com/kanavin/meta-alex</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rev&quot;: &quot;05b25605fb8b23=
99e4706d7323828676bf0da0b5&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;meta-intel&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;branch&quot;: &quot;master&quot=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;describe&quot;: &quot;15.0-hard=
knott-3.3-310-g0a96edae&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;layers&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;meta-intel&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pat=
h&quot;: &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;remotes&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;origin&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;uri=
&quot;: &quot;git://<a href=3D"http://git.yoctoproject.org/meta-intel" rel=
=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-intel</a>&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rev&quot;: &quot;0a96edae609a3f=
48befac36af82cf1eed6786b4a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;poky&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;branch&quot;: &quot;akanavin/se=
tup-layers&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;describe&quot;: &quot;4.1_M1-29=
5-gfd524e4984&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;layers&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;meta&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pat=
h&quot;: &quot;meta&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;meta-poky&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pat=
h&quot;: &quot;meta-poky&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;meta-yocto-bsp&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pat=
h&quot;: &quot;meta-yocto-bsp&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;remotes&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;origin&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;uri=
&quot;: &quot;git://<a href=3D"http://git.yoctoproject.org/poky" rel=3D"nor=
eferrer" target=3D"_blank">git.yoctoproject.org/poky</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nam=
e&quot;: &quot;poky-contrib&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;uri=
&quot;: &quot;ssh://<a href=3D"http://git@push.yoctoproject.org/poky-contri=
b" rel=3D"noreferrer" target=3D"_blank">git@push.yoctoproject.org/poky-cont=
rib</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rev&quot;: &quot;fd524e4984eb53=
5f16a14dd7d79fde661b44aa78&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt;<br>
&gt; On Fri, 1 Jul 2022 at 21:46, Joshua Watt &lt;<a href=3D"mailto:jpewhac=
ker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Can you outline what this provides over `git submodules`? It seem=
s<br>
&gt; &gt; pretty similar and I&#39;m struggling to see what this provides t=
hat isn&#39;t<br>
&gt; &gt; already provided by that tool.<br>
&gt; &gt;<br>
&gt; &gt; On 7/1/22 14:24, Alexander Kanavin wrote:<br>
&gt; &gt; &gt; This addresses a long standing gap in the core offering:<br>
&gt; &gt; &gt; there is no tooling to capture the currently configured laye=
rs<br>
&gt; &gt; &gt; with their revisions, or restore the layers from a configura=
tion<br>
&gt; &gt; &gt; file (without using external tools, some of which aren&#39;t=
 particularly<br>
&gt; &gt; &gt; suitable for the task). This plugin addresses the gap.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; How to use:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 1. Saving a layer configuration:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; a) Command line options:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-laye=
rs create-layers-setup -h<br>
&gt; &gt; &gt; NOTE: Starting bitbake server...<br>
&gt; &gt; &gt; usage: bitbake-layers create-layers-setup [-h] [--output OUT=
PUT] [--format {python,json,kas}] destdir<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Writes out a python script/kas config/json confi=
g that replicates the directory structure and revisions of the layers in a =
current build.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; positional arguments:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 destdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Directory where to write the output<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (if it is inside one of the layers, the lay=
er becomes a bootstrap repository and thus will be excluded from fetching b=
y the script).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; optional arguments:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 -h, --help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 show this help message and exit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 --output OUTPUT, -o OUTPUT<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 File name where to write the output, if the=
 default (<a href=3D"http://setup-layers.py/.json/.yml" rel=3D"noreferrer" =
target=3D"_blank">setup-layers.py/.json/.yml</a>) is undesirable.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 --format {python,json,kas}, -f {python,json,kas=
}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Format of the output. The options are:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python - a self contain=
ed python script that fetches all the needed layers and sets them to correc=
t revisions (default, recommended)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kas - a configuration f=
ile for the kas tool that allows the tool to do the same<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json - a json formatted=
 file containing all the needed metadata to do the same by any external or =
custom tool.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; b) Running with default choices:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-laye=
rs create-layers-setup ../../meta-alex/<br>
&gt; &gt; &gt; NOTE: Starting bitbake server...<br>
&gt; &gt; &gt; NOTE: Created /srv/work/alex/meta-alex/setup-layers.py<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 2. Restoring the layers from the saved configuration:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; a) Clone meta-alex separately, as a bootstrap layer/reposito=
ry. It should already contain setup-layers.py created in the previous step.=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; b) Command line options:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-laye=
rs.py -h<br>
&gt; &gt; &gt; usage: setup-layers.py [-h] [--force-meta-alex-checkout] [--=
choose-poky-remote {origin,poky-contrib}] [--destdir DESTDIR]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; A self contained python script that fetches all the needed l=
ayers and sets them to correct revisions<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; optional arguments:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 -h, --help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 show this help message and exit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 --force-meta-alex-checkout<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Force the checkout of the bootstrap layer m=
eta-alex (by default it is presumed that this script is in it, and so the l=
ayer is already in place).<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 --choose-poky-remote {origin,poky-contrib}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Choose a remote server for layer poky (defa=
ult: origin)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 --destdir DESTDIR=C2=A0 =C2=A0 =C2=A0Where to c=
heck out the layers (default is /srv/work/alex/layers-test).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; c) Running with default options:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-laye=
rs.py<br>
&gt; &gt; &gt; Note: not checking out layer meta-alex, use --force-meta-ale=
x-checkout to override.<br>
&gt; &gt; &gt; Checking out layer meta-intel, revision 15.0-hardknott-3.3-3=
10-g0a96edae, branch master from remote origin at git://<a href=3D"http://g=
it.yoctoproject.org/meta-intel" rel=3D"noreferrer" target=3D"_blank">git.yo=
ctoproject.org/meta-intel</a><br>
&gt; &gt; &gt; Running &#39;git clone -q git://<a href=3D"http://git.yoctop=
roject.org/meta-intel" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/meta-intel</a> meta-intel&#39; in /srv/work/alex/layers-test<br>
&gt; &gt; &gt; Running &#39;git checkout -q 0a96edae609a3f48befac36af82cf1e=
ed6786b4a&#39; in /srv/work/alex/layers-test/meta-intel<br>
&gt; &gt; &gt; Note: multiple remotes defined for layer poky, using origin =
(run with -h to see others).<br>
&gt; &gt; &gt; Checking out layer poky, revision 4.1_M1-295-g6850b29806, br=
anch akanavin/setup-layers from remote origin at git://<a href=3D"http://gi=
t.yoctoproject.org/poky" rel=3D"noreferrer" target=3D"_blank">git.yoctoproj=
ect.org/poky</a><br>
&gt; &gt; &gt; Running &#39;git clone -q git://<a href=3D"http://git.yoctop=
roject.org/poky" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/=
poky</a> poky&#39; in /srv/work/alex/layers-test<br>
&gt; &gt; &gt; Running &#39;git checkout -q 4cc94de99230201c3c39b9242191131=
57ff47006&#39; in /srv/work/alex/layers-test/poky<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And that&#39;s it!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; FIXMEs:<br>
&gt; &gt; &gt; - kas config writer not yet implemented<br>
&gt; &gt; &gt; - oe-selftest test cases not yet written<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@=
linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta/lib/bblayers/makesetup.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 117 ++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 =C2=A0.../templates/setup-layers.py.template=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 77 ++++++++++++<br>
&gt; &gt; &gt;=C2=A0 =C2=A02 files changed, 194 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/lib/bblayers/makesetup.p=
y<br>
&gt; &gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/lib/bblayers/templates/s=
etup-layers.py.template<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblay=
ers/makesetup.py<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000000..3c86eea3c4<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta/lib/bblayers/makesetup.py<br>
&gt; &gt; &gt; @@ -0,0 +1,117 @@<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# SPDX-License-Identifier: GPL-2.0-only<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +import logging<br>
&gt; &gt; &gt; +import os<br>
&gt; &gt; &gt; +import stat<br>
&gt; &gt; &gt; +import sys<br>
&gt; &gt; &gt; +import shutil<br>
&gt; &gt; &gt; +import json<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +import bb.utils<br>
&gt; &gt; &gt; +import bb.process<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +from bblayers.common import LayerPlugin<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +logger =3D logging.getLogger(&#39;bitbake-layers&#39;)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +sys.path.insert(0, os.path.dirname(os.path.dirname(__file__=
)))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +import oe.buildcfg<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +def plugin_init(plugins):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return MakeSetupPlugin()<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +class MakeSetupPlugin(LayerPlugin):<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def _write_python(self, repos, output):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(os.path.join(os.path.=
dirname(__file__), &quot;templates&quot;, &quot;setup-layers.py.template&qu=
ot;)) as f:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 template =3D f.re=
ad()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D sys.argv<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 args[0] =3D os.path.basename(ar=
gs[0])<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 script =3D template.replace(&#3=
9;{cmdline}&#39;, &quot; &quot;.join(args)).replace(&#39;{layerdata}&#39;, =
json.dumps(repos, sort_keys=3DTrue, indent=3D4))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(output, &#39;w&#39;) =
as f:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(script)<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D os.stat(output)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(output, st.st_mode | s=
tat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def _write_json(self, repos, output):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(output, &#39;w&#39;) =
as f:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(repos, =
f, sort_keys=3DTrue, indent=3D4)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def _write_kas(self, repos, output):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise NotImplementedError(&#39;=
Kas config writer not implemented yet&#39;)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 _write_config =3D {&quot;python&quot;:_write_=
python, &quot;json&quot;:_write_json, &quot;kas&quot;:_write_kas}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 _output_filename =3D {&quot;python&quot;:&quo=
t;setup-layers.py&quot;,&quot;json&quot;:&quot;setup-layers.json&quot;,&quo=
t;kas&quot;:&quot;setup-layers.kas.yaml&quot;}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def _get_repo_path(self, layer_path):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_path, _ =3D bb.process.run=
(&#39;git rev-parse --show-toplevel&#39;, cwd=3Dlayer_path)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return repo_path.strip()<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def _get_remotes(self, repo_path):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remotes =3D []<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remotes_list,_ =3D bb.process.r=
un(&#39;git remote&#39;, cwd=3Drepo_path)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in remotes_list.split():<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri,_ =3D bb.proc=
ess.run(&#39;git remote get-url {r}&#39;.format(r=3Dr), cwd=3Drepo_path)<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remotes.append({&=
#39;name&#39;:r,&#39;uri&#39;:uri.strip()})<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return remotes<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def _get_describe(self, repo_path):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 describe,_ =3D bb=
.process.run(&#39;git describe --tags&#39;, cwd=3Drepo_path)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.process.ExecutionErro=
r:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quo=
t;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return describe.strip()<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def _make_repo_config(self, destdir):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repos =3D {}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 layers =3D oe.buildcfg.get_laye=
r_revisions(self.tinfoil.config_data)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in layers:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if l[1] =3D=3D &#=
39;workspace&#39;:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
tinue<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if l[4]:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log=
ger.error(&quot;Layer {name} in {path} has uncommitted modifications or is =
not in a git repository.&quot;.format(name=3Dl[1],path=3Dl[0]))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_path =3D sel=
f._get_repo_path(l[0])<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if repo_path not =
in repos.keys():<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rep=
os[repo_path] =3D {&#39;rev&#39;:l[3], &#39;branch&#39;:l[2], &#39;remotes&=
#39;:self._get_remotes(repo_path), &#39;layers&#39;:[], &#39;describe&#39;:=
self._get_describe(repo_path)}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
not repos[repo_path][&#39;remotes&#39;]:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 logger.error(&quot;Layer repository in {path} does not have any =
remotes configured. Please add at least one with &#39;git remote add&#39;.&=
quot;.format(path=3Drepo_path))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
repo_path in os.path.abspath(destdir):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 repos[repo_path][&#39;is_bootstrap&#39;] =3D True<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repos[repo_path][=
&#39;layers&#39;].append({&#39;name&#39;:l[1],&#39;path&#39;:l[0].replace(r=
epo_path,&#39;&#39;)[1:]})<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_dirs =3D set([os.path.dirn=
ame(p) for p in repos.keys()])<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(repo_dirs) &gt; 1:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quo=
t;Layer repositories are not all in the same parent directory: {repo_dirs}.=
 They need to be relocated into the same directory.&quot;.format(repo_dirs=
=3Drepo_dirs))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repos_nopaths =3D {}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in repos.keys():<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r_nopath =3D os.p=
ath.basename(r)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repos_nopaths[r_n=
opath] =3D repos[r]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return repos_nopaths<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def do_make_setup(self, args):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot; Writes out a=
 python script/kas config/json config that replicates the directory structu=
re and revisions of the layers in a current build. &quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repos =3D self._make_repo_confi=
g(args.destdir)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not repos:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D args.output<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not output:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D self._=
output_filename[args.format]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D os.path.join(os.path=
.abspath(args.destdir),output)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._write_config[args.format]=
(self, repos, output)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" =
rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Created {}&#39;.f=
ormat(output))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def register_commands(self, sp):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser_setup_layers =3D self.ad=
d_command(sp, &#39;create-layers-setup&#39;, self.do_make_setup, parserecip=
es=3DFalse)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser_setup_layers.add_argumen=
t(&#39;destdir&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Direc=
tory where to write the output\n(if it is inside one of the layers, the lay=
er becomes a bootstrap repository and thus will be excluded from fetching b=
y the script).&#39;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser_setup_layers.add_argumen=
t(&#39;--output&#39;, &#39;-o&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;File =
name where to write the output, if the default (<a href=3D"http://setup-lay=
ers.py/.json/.yml" rel=3D"noreferrer" target=3D"_blank">setup-layers.py/.js=
on/.yml</a>) is undesirable.&#39;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser_setup_layers.add_argumen=
t(&#39;--format&#39;, &#39;-f&#39;, choices=3D[&#39;python&#39;, &#39;json&=
#39;, &#39;kas&#39;], default=3D&#39;python&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Forma=
t of the output. The options are:\n\tpython - a self contained python scrip=
t that fetches all the needed layers and sets them to correct revisions (de=
fault, recommended)\n\tkas - a configuration file for the kas tool that all=
ows the tool to do the same\n\tjson - a json formatted file containing all =
the needed metadata to do the same by any external or custom tool.&#39;)<br=
>
&gt; &gt; &gt; diff --git a/meta/lib/bblayers/templates/setup-layers.py.tem=
plate b/meta/lib/bblayers/templates/setup-layers.py.template<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000000..a704ad3d70<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta/lib/bblayers/templates/setup-layers.py.template<b=
r>
&gt; &gt; &gt; @@ -0,0 +1,77 @@<br>
&gt; &gt; &gt; +#!/usr/bin/env python3<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# This file was generated by running<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# {cmdline}<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# It is recommended that you do not modify it directly, but=
 rather re-run the above command.<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +layerdata =3D &quot;&quot;&quot;<br>
&gt; &gt; &gt; +{layerdata}<br>
&gt; &gt; &gt; +&quot;&quot;&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +import argparse<br>
&gt; &gt; &gt; +import json<br>
&gt; &gt; &gt; +import os<br>
&gt; &gt; &gt; +import subprocess<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +def _do_checkout(args):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 for l_name in layers:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l_data =3D layers[l_name]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;is_bootstrap&#39; in l_=
data.keys():<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 force_arg =3D &#3=
9;force_{}_checkout&#39;.format(l_name.replace(&#39;-&#39;,&#39;_&#39;))<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not args[force=
_arg]:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pri=
nt(&#39;Note: not checking out layer {layer}, use {layerflag} to override.&=
#39;.format(layer=3Dl_name, layerflag=3D&#39;--force-{}-checkout&#39;.forma=
t(l_name)))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
tinue<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D l_data[&#39;rev&#39;]<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D l_data[&#39;describe&#=
39;]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not desc:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D rev[:10]=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 branch =3D l_data[&#39;branch&#=
39;]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remotes =3D l_data[&#39;remotes=
&#39;]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote =3D remotes[0]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(remotes) &gt; 1:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remotechoice =3D =
args[&#39;choose_{}_remote&#39;.format(l_name.replace(&#39;-&#39;,&#39;_&#3=
9;))]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in remotes:=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
r[&#39;name&#39;] =3D=3D remotechoice:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote =3D r<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 print(&#39;Note: multiple remotes defined for layer {}, using {}=
 (run with -h to see others).&#39;.format(l_name, r[&#39;name&#39;]))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;Checking out layer {=
}, revision {}, branch {} from remote {} at {}&#39;.format(l_name, desc, br=
anch, remote[&#39;name&#39;], remote[&#39;uri&#39;]))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;git clone -q {} {}=
&#39;.format(remote[&#39;uri&#39;], l_name)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cwd =3D args[&#39;destdir&#39;]=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Running &#39;{}&#39=
; in {}&quot;.format(cmd, cwd))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output(cmd, te=
xt=3DTrue, shell=3DTrue, cwd=3Dcwd)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;git checkout -q {}=
&#39;.format(rev)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cwd =3D os.path.join(args[&#39;=
destdir&#39;], l_name)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Running &#39;{}&#39=
; in {}&quot;.format(cmd, cwd))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output(cmd, te=
xt=3DTrue, shell=3DTrue, cwd=3Dcwd)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +layers =3D json.loads(layerdata)<br>
&gt; &gt; &gt; +parser =3D argparse.ArgumentParser(description=3D&#39;A sel=
f contained python script that fetches all the needed layers and sets them =
to correct revisions&#39;)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +bootstraplayer =3D None<br>
&gt; &gt; &gt; +for l in layers:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if &#39;is_bootstrap&#39; in layers[l]:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bootstraplayer =3D l<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +if bootstraplayer:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 parser.add_argument(&#39;--force-{bootstrapla=
yer}-checkout&#39;.format(bootstraplayer=3Dbootstraplayer), action=3D&#39;s=
tore_true&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Force the checkout =
of the bootstrap layer {bootstraplayer} (by default it is presumed that thi=
s script is in it, and so the layer is already in place).&#39;.format(boots=
traplayer=3Dbootstraplayer))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +for l in layers:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 remotes =3D layers[l][&#39;remotes&#39;]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if len(remotes) &gt; 1:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.add_argument(&#39;--choo=
se-{multipleremoteslayer}-remote&#39;.format(multipleremoteslayer=3Dl),choi=
ces=3D[r[&#39;name&#39;] for r in remotes], default=3Dremotes[0][&#39;name&=
#39;],<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Choos=
e a remote server for layer {multipleremoteslayer} (default: {defaultremote=
})&#39;.format(multipleremoteslayer=3Dl, defaultremote=3Dremotes[0][&#39;na=
me&#39;]))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +try:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 defaultdest =3D os.path.dirname(subprocess.ch=
eck_output(&#39;git rev-parse --show-toplevel&#39;, text=3DTrue, shell=3DTr=
ue, cwd=3Dos.path.dirname(__file__)))<br>
&gt; &gt; &gt; +except subprocess.CalledProcessError as e:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 defaultdest =3D os.path.abspath(&quot;.&quot;=
)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +parser.add_argument(&#39;--destdir&#39;, default=3Ddefaultd=
est, help=3D&#39;Where to check out the layers (default is {defaultdest}).&=
#39;.format(defaultdest=3Ddefaultdest))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +args =3D parser.parse_args()<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +_do_checkout(vars(args))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167543): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167543" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167543</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92117681/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
92117681/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div>

--000000000000b60d4205e2cc32e4--

