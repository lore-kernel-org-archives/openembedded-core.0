Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EFDC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 20:29:11 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.43106.1656707341624342059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 13:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nQC5i0Cg;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id z21so5619178lfb.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 13:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GOOP1awOiBd7cDHhjnkwAj/rMrfPLR7Igia23ZomGS0=;
        b=nQC5i0CgnZdiYrh314ttv4xkGF4y9plb79dgIUbuTKqQ2yZfuY178INcjqVKmeQf9w
         XH86hUc8qSCRlxU3gSUpp3Zg7WGAgSy8NwS/3XED9JnYjKIjobKTtvkW3+nN5uRGtxu0
         WTTQWXbsOakODRw02a/D2sSaHJszLQkxiZqj1f1PnlqntMKjiPMaMjXJRzoTm6nMK6AO
         rt9TYaPMCAmMveTRoHXpZ4PSFO1tD1fYxBKW5d9HuRJlV8RraU2o4sHzmsZsSMiyMhPh
         vqNUGzirHB1o5eNvvEE1w2TtQa2jyf/VE7C+ynujASveTnBwrqJtgGt/F84ALc4IBhdD
         X3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GOOP1awOiBd7cDHhjnkwAj/rMrfPLR7Igia23ZomGS0=;
        b=fwdajr3RFdx7S2agdpSdc1eB3Q7YCNbBzhGvUGRiAp6issvv61vZuwn57QKwxyGcAQ
         dLDgCIiZZ28RGulvDfygdadVDoO1UR7VDrZG9KxHho8fE+zkSeYD3eOuV0pNHXnPZ6g6
         YJUobrgKFl74+ogJzSK5U8uuwxQEd4u+uaOOSs/mxDU9NzA6PRtGKZrMKtdwLzK8ND3e
         286rixloY7WNPVQHU6zehID8j6AVZDui2XdJ0ETEKioefb/ZnRkR7gcAvYdSoLb3izH8
         xCaWjurd5S9t6QWUpj4CJtb10QPL5xI+NDcfYqcAyZyjkhIqpPdCNAuRfPAgzgXsBByF
         nZtw==
X-Gm-Message-State: AJIora9YiCegguF3b8xqEVSerTcnepEqNX2YoF/6YrUo5fcVL3oys1ct
	Lo67ZH5+y/KXXIURINS0yxf2n/FqMRucEOXSgUo=
X-Google-Smtp-Source: 
 AGRyM1uafRCCSrwkSc9+UBBIePtpeaWXTnNlzn9EPstSCpbHrnx1286h3VSQSQ/QY3R3KRoswf36W+nMzz01LT0708o=
X-Received: by 2002:ac2:5d31:0:b0:47d:c71c:50d5 with SMTP id
 i17-20020ac25d31000000b0047dc71c50d5mr10009666lfb.665.1656707339557; Fri, 01
 Jul 2022 13:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <92f3c188-a784-3af2-9bb9-76353e60deb0@gmail.com>
In-Reply-To: <92f3c188-a784-3af2-9bb9-76353e60deb0@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Jul 2022 22:28:47 +0200
Message-ID: 
 <CANNYZj_6PJ=E3M5X21eYhih3am62jvVE+G+vgjenKoSfRCL36g@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 20:29:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167542

First of all this provides a single command that does all of the work
to capture the layers and their revisions from currently enabled set
in a bitbake build. No other tool does this because they do not know
anything about bitbake or tinfoil, and so you have to write your
config by hand, with all of them.

Here's how the captured metadata loks like [1]. I find it more useful
for understanding what are we actually checking out than submodules'
bare, unhelpful set of git revisions. It also doesn't require a
super-repo containing all of the submodules: you can just toss the
script into one of the layers and it will do the right thing for
bootstrapping. There was also a comment from one of our customers: "
In practice we learned that recursive submodules are not always
correctly handled by GitLab CI. "

I also find git submodules command line UI supremely confusing.
Actually wait, that's what git as a whole is like: confusing.
https://xkcd.com/1597/

But if you would like, we can add a fourth output format to the
bblayers plugin added in this patch that sets up git submodules
instead of writing a standalone python script with embedded json
(which is what I prefer).

Alex

[1]
{
    "meta-alex": {
        "branch": "master",
        "describe": "",
        "is_bootstrap": true,
        "layers": [
            {
                "name": "meta-alex",
                "path": ""
            }
        ],
        "remotes": [
            {
                "name": "remote-alex",
                "uri": "https://github.com/kanavin/meta-alex"
            }
        ],
        "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
    },
    "meta-intel": {
        "branch": "master",
        "describe": "15.0-hardknott-3.3-310-g0a96edae",
        "layers": [
            {
                "name": "meta-intel",
                "path": ""
            }
        ],
        "remotes": [
            {
                "name": "origin",
                "uri": "git://git.yoctoproject.org/meta-intel"
            }
        ],
        "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
    },
    "poky": {
        "branch": "akanavin/setup-layers",
        "describe": "4.1_M1-295-gfd524e4984",
        "layers": [
            {
                "name": "meta",
                "path": "meta"
            },
            {
                "name": "meta-poky",
                "path": "meta-poky"
            },
            {
                "name": "meta-yocto-bsp",
                "path": "meta-yocto-bsp"
            }

       ],
        "remotes": [
            {
                "name": "origin",
                "uri": "git://git.yoctoproject.org/poky"
            },
            {
                "name": "poky-contrib",
                "uri": "ssh://git@push.yoctoproject.org/poky-contrib"
            }
        ],
        "rev": "fd524e4984eb535f16a14dd7d79fde661b44aa78"
    }
}

On Fri, 1 Jul 2022 at 21:46, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Can you outline what this provides over `git submodules`? It seems
> pretty similar and I'm struggling to see what this provides that isn't
> already provided by that tool.
>
> On 7/1/22 14:24, Alexander Kanavin wrote:
> > This addresses a long standing gap in the core offering:
> > there is no tooling to capture the currently configured layers
> > with their revisions, or restore the layers from a configuration
> > file (without using external tools, some of which aren't particularly
> > suitable for the task). This plugin addresses the gap.
> >
> > How to use:
> >
> > 1. Saving a layer configuration:
> >
> > a) Command line options:
> >
> > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-l=
ayers-setup -h
> > NOTE: Starting bitbake server...
> > usage: bitbake-layers create-layers-setup [-h] [--output OUTPUT] [--for=
mat {python,json,kas}] destdir
> >
> >   Writes out a python script/kas config/json config that replicates the=
 directory structure and revisions of the layers in a current build.
> >
> > positional arguments:
> >    destdir               Directory where to write the output
> >                          (if it is inside one of the layers, the layer =
becomes a bootstrap repository and thus will be excluded from fetching by t=
he script).
> >
> > optional arguments:
> >    -h, --help            show this help message and exit
> >    --output OUTPUT, -o OUTPUT
> >                          File name where to write the output, if the de=
fault (setup-layers.py/.json/.yml) is undesirable.
> >    --format {python,json,kas}, -f {python,json,kas}
> >                          Format of the output. The options are:
> >                               python - a self contained python script t=
hat fetches all the needed layers and sets them to correct revisions (defau=
lt, recommended)
> >                               kas - a configuration file for the kas to=
ol that allows the tool to do the same
> >                               json - a json formatted file containing a=
ll the needed metadata to do the same by any external or custom tool.
> >
> > b) Running with default choices:
> >
> > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-l=
ayers-setup ../../meta-alex/
> > NOTE: Starting bitbake server...
> > NOTE: Created /srv/work/alex/meta-alex/setup-layers.py
> >
> > 2. Restoring the layers from the saved configuration:
> >
> > a) Clone meta-alex separately, as a bootstrap layer/repository. It shou=
ld already contain setup-layers.py created in the previous step.
> >
> > b) Command line options:
> >
> > alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py -h
> > usage: setup-layers.py [-h] [--force-meta-alex-checkout] [--choose-poky=
-remote {origin,poky-contrib}] [--destdir DESTDIR]
> >
> > A self contained python script that fetches all the needed layers and s=
ets them to correct revisions
> >
> > optional arguments:
> >    -h, --help            show this help message and exit
> >    --force-meta-alex-checkout
> >                          Force the checkout of the bootstrap layer meta=
-alex (by default it is presumed that this script is in it, and so the laye=
r is already in place).
> >    --choose-poky-remote {origin,poky-contrib}
> >                          Choose a remote server for layer poky (default=
: origin)
> >    --destdir DESTDIR     Where to check out the layers (default is /srv=
/work/alex/layers-test).
> >
> > c) Running with default options:
> >
> > alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py
> > Note: not checking out layer meta-alex, use --force-meta-alex-checkout =
to override.
> > Checking out layer meta-intel, revision 15.0-hardknott-3.3-310-g0a96eda=
e, branch master from remote origin at git://git.yoctoproject.org/meta-inte=
l
> > Running 'git clone -q git://git.yoctoproject.org/meta-intel meta-intel'=
 in /srv/work/alex/layers-test
> > Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /=
srv/work/alex/layers-test/meta-intel
> > Note: multiple remotes defined for layer poky, using origin (run with -=
h to see others).
> > Checking out layer poky, revision 4.1_M1-295-g6850b29806, branch akanav=
in/setup-layers from remote origin at git://git.yoctoproject.org/poky
> > Running 'git clone -q git://git.yoctoproject.org/poky poky' in /srv/wor=
k/alex/layers-test
> > Running 'git checkout -q 4cc94de99230201c3c39b924219113157ff47006' in /=
srv/work/alex/layers-test/poky
> >
> > And that's it!
> >
> > FIXMEs:
> > - kas config writer not yet implemented
> > - oe-selftest test cases not yet written
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   meta/lib/bblayers/makesetup.py                | 117 +++++++++++++++++=
+
> >   .../templates/setup-layers.py.template        |  77 ++++++++++++
> >   2 files changed, 194 insertions(+)
> >   create mode 100644 meta/lib/bblayers/makesetup.py
> >   create mode 100644 meta/lib/bblayers/templates/setup-layers.py.templa=
te
> >
> > diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makeset=
up.py
> > new file mode 100644
> > index 0000000000..3c86eea3c4
> > --- /dev/null
> > +++ b/meta/lib/bblayers/makesetup.py
> > @@ -0,0 +1,117 @@
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +
> > +import logging
> > +import os
> > +import stat
> > +import sys
> > +import shutil
> > +import json
> > +
> > +import bb.utils
> > +import bb.process
> > +
> > +from bblayers.common import LayerPlugin
> > +
> > +logger =3D logging.getLogger('bitbake-layers')
> > +
> > +sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
> > +
> > +import oe.buildcfg
> > +
> > +def plugin_init(plugins):
> > +    return MakeSetupPlugin()
> > +
> > +class MakeSetupPlugin(LayerPlugin):
> > +
> > +    def _write_python(self, repos, output):
> > +        with open(os.path.join(os.path.dirname(__file__), "templates",=
 "setup-layers.py.template")) as f:
> > +            template =3D f.read()
> > +        args =3D sys.argv
> > +        args[0] =3D os.path.basename(args[0])
> > +        script =3D template.replace('{cmdline}', " ".join(args)).repla=
ce('{layerdata}', json.dumps(repos, sort_keys=3DTrue, indent=3D4))
> > +        with open(output, 'w') as f:
> > +            f.write(script)
> > +        st =3D os.stat(output)
> > +        os.chmod(output, st.st_mode | stat.S_IEXEC | stat.S_IXGRP | st=
at.S_IXOTH)
> > +
> > +    def _write_json(self, repos, output):
> > +        with open(output, 'w') as f:
> > +            json.dump(repos, f, sort_keys=3DTrue, indent=3D4)
> > +
> > +    def _write_kas(self, repos, output):
> > +        raise NotImplementedError('Kas config writer not implemented y=
et')
> > +
> > +    _write_config =3D {"python":_write_python, "json":_write_json, "ka=
s":_write_kas}
> > +    _output_filename =3D {"python":"setup-layers.py","json":"setup-lay=
ers.json","kas":"setup-layers.kas.yaml"}
> > +
> > +    def _get_repo_path(self, layer_path):
> > +        repo_path, _ =3D bb.process.run('git rev-parse --show-toplevel=
', cwd=3Dlayer_path)
> > +        return repo_path.strip()
> > +
> > +    def _get_remotes(self, repo_path):
> > +        remotes =3D []
> > +        remotes_list,_ =3D bb.process.run('git remote', cwd=3Drepo_pat=
h)
> > +        for r in remotes_list.split():
> > +            uri,_ =3D bb.process.run('git remote get-url {r}'.format(r=
=3Dr), cwd=3Drepo_path)
> > +            remotes.append({'name':r,'uri':uri.strip()})
> > +        return remotes
> > +
> > +    def _get_describe(self, repo_path):
> > +        try:
> > +            describe,_ =3D bb.process.run('git describe --tags', cwd=
=3Drepo_path)
> > +        except bb.process.ExecutionError:
> > +            return ""
> > +        return describe.strip()
> > +
> > +    def _make_repo_config(self, destdir):
> > +        repos =3D {}
> > +        layers =3D oe.buildcfg.get_layer_revisions(self.tinfoil.config=
_data)
> > +        for l in layers:
> > +            if l[1] =3D=3D 'workspace':
> > +                continue
> > +            if l[4]:
> > +                logger.error("Layer {name} in {path} has uncommitted m=
odifications or is not in a git repository.".format(name=3Dl[1],path=3Dl[0]=
))
> > +                return
> > +            repo_path =3D self._get_repo_path(l[0])
> > +            if repo_path not in repos.keys():
> > +                repos[repo_path] =3D {'rev':l[3], 'branch':l[2], 'remo=
tes':self._get_remotes(repo_path), 'layers':[], 'describe':self._get_descri=
be(repo_path)}
> > +                if not repos[repo_path]['remotes']:
> > +                    logger.error("Layer repository in {path} does not =
have any remotes configured. Please add at least one with 'git remote add'.=
".format(path=3Drepo_path))
> > +                    return
> > +                if repo_path in os.path.abspath(destdir):
> > +                    repos[repo_path]['is_bootstrap'] =3D True
> > +            repos[repo_path]['layers'].append({'name':l[1],'path':l[0]=
.replace(repo_path,'')[1:]})
> > +
> > +        repo_dirs =3D set([os.path.dirname(p) for p in repos.keys()])
> > +        if len(repo_dirs) > 1:
> > +            logger.error("Layer repositories are not all in the same p=
arent directory: {repo_dirs}. They need to be relocated into the same direc=
tory.".format(repo_dirs=3Drepo_dirs))
> > +            return
> > +
> > +        repos_nopaths =3D {}
> > +        for r in repos.keys():
> > +            r_nopath =3D os.path.basename(r)
> > +            repos_nopaths[r_nopath] =3D repos[r]
> > +        return repos_nopaths
> > +
> > +    def do_make_setup(self, args):
> > +        """ Writes out a python script/kas config/json config that rep=
licates the directory structure and revisions of the layers in a current bu=
ild. """
> > +        repos =3D self._make_repo_config(args.destdir)
> > +        if not repos:
> > +            return
> > +        output =3D args.output
> > +        if not output:
> > +            output =3D self._output_filename[args.format]
> > +        output =3D os.path.join(os.path.abspath(args.destdir),output)
> > +        self._write_config[args.format](self, repos, output)
> > +        logger.info('Created {}'.format(output))
> > +
> > +    def register_commands(self, sp):
> > +        parser_setup_layers =3D self.add_command(sp, 'create-layers-se=
tup', self.do_make_setup, parserecipes=3DFalse)
> > +        parser_setup_layers.add_argument('destdir',
> > +            help=3D'Directory where to write the output\n(if it is ins=
ide one of the layers, the layer becomes a bootstrap repository and thus wi=
ll be excluded from fetching by the script).')
> > +        parser_setup_layers.add_argument('--output', '-o',
> > +            help=3D'File name where to write the output, if the defaul=
t (setup-layers.py/.json/.yml) is undesirable.')
> > +        parser_setup_layers.add_argument('--format', '-f', choices=3D[=
'python', 'json', 'kas'], default=3D'python',
> > +            help=3D'Format of the output. The options are:\n\tpython -=
 a self contained python script that fetches all the needed layers and sets=
 them to correct revisions (default, recommended)\n\tkas - a configuration =
file for the kas tool that allows the tool to do the same\n\tjson - a json =
formatted file containing all the needed metadata to do the same by any ext=
ernal or custom tool.')
> > diff --git a/meta/lib/bblayers/templates/setup-layers.py.template b/met=
a/lib/bblayers/templates/setup-layers.py.template
> > new file mode 100644
> > index 0000000000..a704ad3d70
> > --- /dev/null
> > +++ b/meta/lib/bblayers/templates/setup-layers.py.template
> > @@ -0,0 +1,77 @@
> > +#!/usr/bin/env python3
> > +#
> > +# This file was generated by running
> > +#
> > +# {cmdline}
> > +#
> > +# It is recommended that you do not modify it directly, but rather re-=
run the above command.
> > +#
> > +
> > +layerdata =3D """
> > +{layerdata}
> > +"""
> > +
> > +import argparse
> > +import json
> > +import os
> > +import subprocess
> > +
> > +def _do_checkout(args):
> > +    for l_name in layers:
> > +        l_data =3D layers[l_name]
> > +        if 'is_bootstrap' in l_data.keys():
> > +            force_arg =3D 'force_{}_checkout'.format(l_name.replace('-=
','_'))
> > +            if not args[force_arg]:
> > +                print('Note: not checking out layer {layer}, use {laye=
rflag} to override.'.format(layer=3Dl_name, layerflag=3D'--force-{}-checkou=
t'.format(l_name)))
> > +                continue
> > +        rev =3D l_data['rev']
> > +        desc =3D l_data['describe']
> > +        if not desc:
> > +            desc =3D rev[:10]
> > +        branch =3D l_data['branch']
> > +        remotes =3D l_data['remotes']
> > +        remote =3D remotes[0]
> > +        if len(remotes) > 1:
> > +            remotechoice =3D args['choose_{}_remote'.format(l_name.rep=
lace('-','_'))]
> > +            for r in remotes:
> > +                if r['name'] =3D=3D remotechoice:
> > +                    remote =3D r
> > +                    print('Note: multiple remotes defined for layer {}=
, using {} (run with -h to see others).'.format(l_name, r['name']))
> > +        print('Checking out layer {}, revision {}, branch {} from remo=
te {} at {}'.format(l_name, desc, branch, remote['name'], remote['uri']))
> > +        cmd =3D 'git clone -q {} {}'.format(remote['uri'], l_name)
> > +        cwd =3D args['destdir']
> > +        print("Running '{}' in {}".format(cmd, cwd))
> > +        subprocess.check_output(cmd, text=3DTrue, shell=3DTrue, cwd=3D=
cwd)
> > +        cmd =3D 'git checkout -q {}'.format(rev)
> > +        cwd =3D os.path.join(args['destdir'], l_name)
> > +        print("Running '{}' in {}".format(cmd, cwd))
> > +        subprocess.check_output(cmd, text=3DTrue, shell=3DTrue, cwd=3D=
cwd)
> > +
> > +layers =3D json.loads(layerdata)
> > +parser =3D argparse.ArgumentParser(description=3D'A self contained pyt=
hon script that fetches all the needed layers and sets them to correct revi=
sions')
> > +
> > +bootstraplayer =3D None
> > +for l in layers:
> > +    if 'is_bootstrap' in layers[l]:
> > +        bootstraplayer =3D l
> > +
> > +if bootstraplayer:
> > +    parser.add_argument('--force-{bootstraplayer}-checkout'.format(boo=
tstraplayer=3Dbootstraplayer), action=3D'store_true',
> > +        help=3D'Force the checkout of the bootstrap layer {bootstrapla=
yer} (by default it is presumed that this script is in it, and so the layer=
 is already in place).'.format(bootstraplayer=3Dbootstraplayer))
> > +
> > +for l in layers:
> > +    remotes =3D layers[l]['remotes']
> > +    if len(remotes) > 1:
> > +        parser.add_argument('--choose-{multipleremoteslayer}-remote'.f=
ormat(multipleremoteslayer=3Dl),choices=3D[r['name'] for r in remotes], def=
ault=3Dremotes[0]['name'],
> > +            help=3D'Choose a remote server for layer {multipleremotesl=
ayer} (default: {defaultremote})'.format(multipleremoteslayer=3Dl, defaultr=
emote=3Dremotes[0]['name']))
> > +
> > +try:
> > +    defaultdest =3D os.path.dirname(subprocess.check_output('git rev-p=
arse --show-toplevel', text=3DTrue, shell=3DTrue, cwd=3Dos.path.dirname(__f=
ile__)))
> > +except subprocess.CalledProcessError as e:
> > +    defaultdest =3D os.path.abspath(".")
> > +
> > +parser.add_argument('--destdir', default=3Ddefaultdest, help=3D'Where =
to check out the layers (default is {defaultdest}).'.format(defaultdest=3Dd=
efaultdest))
> > +
> > +args =3D parser.parse_args()
> > +
> > +_do_checkout(vars(args))
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#167540): https://lists.openembedded.org/g/openembed=
ded-core/message/167540
> > Mute This Topic: https://lists.openembedded.org/mt/92117681/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

