Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC31EC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 22:29:23 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.78330.1656973758647405101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 15:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ptv2pYIM;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id z25so120476lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 15:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wjG0rPfafwjX5TNxZp4XOiKe2CPuBNgILDqvTfPF980=;
        b=ptv2pYIM61fYwEeomzaxU8/DVajbMqXPBX8obgN4/rFayTb7qWEZw8fNAjcx6LYYGv
         jPx93kuF6xjpGQA7fNjIsNKnSQZkMXdW7/KZeMI3WJcWJqR5WcT4hg8uog1103T2OpCm
         xuuVX7Oa0tIEy5GcBfWgWaTd6RajrMyJjaclZz+Inq0wkHTxh2WDEr208lUInUWsBHxp
         bfsh9iCAki7ron0eypZqEcFPKcTgMzcYztJh6A63SPiWHedLkXSsMJ7OjzTY7tsFgTKb
         ADsMkJY+7FrFOGMbww2NyfnvIgRVar85umeY2/Af3TaYL5dX/GggH3v3vIGopb17T/rQ
         yjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wjG0rPfafwjX5TNxZp4XOiKe2CPuBNgILDqvTfPF980=;
        b=lVgCNqHRKhUqeia8DZIz+qaEgX4RAx7ey6VmFwmhJP+fJexlQcWAhqLlQFJC4MkLWX
         N2I/L+Apcq2hwp4b1WjKLXZT2bDvA4P6DyULbXjTmBQrjPakD0DFlY4F9priTwf4PN2k
         7hgJPxAeCFaT8KzFXXEisodI3Ql5Z2qvqdhZS4+s+SgLffsMXvadxUQD3eigCNDILC8f
         Ynwk3yMT1VdhM/g9nd+nwSgCY1qujvsiheee0zOG4IFv3eSLNskSmTMURAH/weoQ+nI1
         TOqd+fzEMFQ4xqZC9xD8uX65XLmcrq7rL162p+ZjmOWtGSe4RUX7gl1AKy+3XLo7vVZq
         d4Lg==
X-Gm-Message-State: AJIora/e3xf5z5DbLEf8U8HnjtSFjmiPPY55Ai4A1oHbTu7eAEAjb+X0
	INSJstNCZQVHdWbk51NN3PfQDqwh93XtV6Vtluk=
X-Google-Smtp-Source: 
 AGRyM1tbPNErETk1c7OIXUUbyWjn0FlCFUIEtqUJJAklhN6cw2R6veXh/VY8l2usro0tQzF8yckhOAUtBC0vXSj3cTw=
X-Received: by 2002:ac2:5597:0:b0:47f:8d1d:c63d with SMTP id
 v23-20020ac25597000000b0047f8d1dc63dmr19758204lfg.521.1656973756472; Mon, 04
 Jul 2022 15:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <57530a45296f2c2e7e86b05aa1b7f10965b586f7.camel@gmail.com>
 <CANNYZj-pzRWV_n5TSuSDOz4dr+_-6+B_oN1Q4-_2SGrV5GOdsw@mail.gmail.com>
 <84fd0a3149ee9debe2994743fb594afc991312a1.camel@gmail.com>
In-Reply-To: <84fd0a3149ee9debe2994743fb594afc991312a1.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jul 2022 00:29:04 +0200
Message-ID: 
 <CANNYZj9aXPfE9Y0_6Pb6bMLQ5emwZ0jwOwPDkBue+56jfvNH=Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 22:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167629

Yes, for a start I explicitly decided to support only setups where all
layers repositories (not the layers!) are in the same top level
directory. If there is a repo tree, it needs to be flattened out first
and bblayers.conf adjusted accordingly. I see this as more of an
implementation detail that can be addressed later.

The script is not just a replacement for the eSDK installer: it's
meant also to help those who want to bootstrap a regular yocto build.
The goal is to make it unnecessary to read the README when you clone
some layer to see what needs to be done next: if the layer comes with
a generated build setup script, just run it and it will get you to a
ready-to-use bitbake environment. The important part is that the
script is generated using the standard tooling, and operates from the
metadata in a standard format.

Alex

On Mon, 4 Jul 2022 at 23:59, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hello Alex
>
> After the discussion turned to the pros and cons of submodules, I was
> thinking more about the initial setup of the Bitbake environment. The
> json output of your script has something to do with this topic, but the
> generated Python script does not. The Python script is meant to
> replicate a bitbake setup to bootstrap an SDK environment. It is more
> or less a replacement for the eSDK shell script installer.
>
>
> On Mon, 2022-07-04 at 11:59 +0200, Alexander Kanavin wrote:
> > Hello Adrian,
> >
> > I am not proposing a whole new standalone tool, RP is :-) What I am
> > proposing is that  once there is an active, working build, it is
> > possible to capture the information about the layer structure in that
> > build and available build configurations in the active layers into a
> > metadata file (json), place that file inside a 'bootstrap layer', and
> > then either let the users handle that file any way they please, or
> > provide a self-contained, self-hosting script inside that same
> > bootstrap layer that replicates the layer structure and sets up a
> > build directory using information from the json. It's not really that
> > complex, if both the script and its generator fit inside a single
> > commit :)
> >
> > This is the value over git submodules:
> > a) the layer structure and list of available build configurations can
> > be saved with a single command if that command is using tinfoil to get
> > the needed data about layers from a currently active build. No need to
> > write anything by hand, or make scripts that work only with your
> > specific product, and need to be adjusted every time layer setup
> > changes. There's no way we can add this functionality to git :-)
> >
> > b) we can place anything that can be useful to layer users inside the
> > metadata. Git submodules do not capture any of this layer-specific
> > information (such as what branch we're on? what is the latest tag in
> > that branch? what are other remotes that we can fetch from? where are
> > the templates for build configurations and can I see their
> > descriptions? and so on). All they allow is a single remote, and a
> > single, cryptic revision on that remote for each of the layers. I've
> > worked with that in a customer project, and I disliked it for lack of
> > visibility into what am I actually checking out, and how do I actually
> > set up a build once I ran the checkout (which is another thing that
> > git will never do for you).
> >
> > Does this make sense? Did you try the code? Did you look at what is in
> > the json? Maybe that helps to understand where I want to head with
> > this.
>
> Yes, I did. It works nicely for simpler folder structures but I was not
> able to get it working with more complicated layer setups. I got
> "ERROR: Layer repositories are not all in the same parent directory".
> One more detail is that it expects the output folder to be there
> instead of just creating it if not.
>
> It looks really promising to me and I think it will also be appreciated
> by git submodule fans as an alternative for populate_sdk_ext.
>
> Thank you very much.
>
> Regards,
> Adrian
>
>
> >
> > Alex
> >
> > On Mon, 4 Jul 2022 at 11:01, Adrian Freihofer
> > <adrian.freihofer@gmail.com> wrote:
> > >
> > > Hi Alex
> > >
> > > Thank you for initiating this important discussion with the code. Thi=
s
> > > could be one way to address this issue. However, the discussion here
> > > also shows how complicated the issue is and how fragmented the
> > > solutions and opinions are. There are already several tools out there=
,
> > > but none of them has proven to be "the only right way". I'm not sure
> > > that writing another tool is really the best approach. The complexity
> > > of the proposed tool seems to me to be already at the upper limit,
> > > where on the other hand Richard suggests to develop it even further a=
nd
> > > publish it via pip. At the very least, I see the risk of ending up wi=
th
> > > just another tool that is very complicated, needs maintenance, but
> > > still won't be accepted by the community.
> > >
> > > Personally I really like to build software as simple as
> > > git clone --recursive
> > > bitbake my-image
> > >
> > > Setting up layers is basically just about fetching git repos. I don't
> > > see the need for creating some configuration files or other complicat=
ed
> > > tasks during the initial setup. So before introducing a new tool,
> > > please let me understand why git submodules have not been very
> > > successful in the past. I see some reasons for that:
> > >  * In the past, there were different RCS systems and the knowledge
> > >    about git was not everywhere. I think that has fundamentally chang=
ed
> > >    and the acceptance of git (and also git submodules) has massively
> > >    increased. Today, git may even be the only version control system
> > >    that needs to be officially supported to manage bitbake layers.
> > >  * We still use the submodule structures that Tim mentioned. In
> > >    general, I agree that using Git submodules is unnecessarily
> > >    complicated. The challenges start when multiple hierarchies of
> > >    submodules are used. In this use case, I miss a simple command lik=
e
> > >    "git checkout --recursive" that does everything I currently have t=
o
> > >    do manually with multiple Git submodules sync, init and update and
> > >    cd commands.
> > >  * Probably the lack of a simple, recursive command in git is also th=
e
> > >    reason why some CI implementations are in rare cases not able to
> > >    checkout git submodules correctly.
> > >
> > > Do you think there would be a need for a new tool if:
> > >  * git submodules would be easy to use?
> > >  * The Yocto manual would suggest to use git submodules for managing
> > >    the layers and also provide an example folder and submodules
> > >    structure as a guide line for the users?
> > >  * If the knowledge of git had been as widespread a few years ago (wh=
en
> > >    the distributions Tim mentions were published) as it is today?
> > > I believe that today it may well be possible to establish git
> > > submodules as the recommended solution. (Something like an easy to us=
e
> > > "git checkout --recursive" command would certainly helpful.)
> > >
> > > Since the majority of mostly experienced Yocto/OE developers who are
> > > participating this discussion tend to develop a new tool, it makes me
> > > wonder if I'm missing something. I see the following use cases where
> > > layers need to be fetched:
> > >  * Initial project setup for working with bitbake.
> > >  * Retrieving layers from an SDK. (I'm not sure if this should remain
> > >    something special. The PoC which was recently posted by Alex for
> > >    bootstrapping the SDK directly from the bitbake environment looks
> > >    very promising to me).
> > >  * Fetching the layers on CI infrastructures which often call git fet=
ch
> > >    with fancy options to improve efficiency. (That would probably not
> > >    work with a Yocto specific fetch tool anyway.)
> > > Do you see other use cases for a layer fetching tool?
> > >
> > > What do you think about trying to optimize git submodules to handle t=
he
> > > "layer fetching" use case with a simple command, rather than developi=
ng
> > > a new Yocto-specific git wrapper?
> > >
> > > Is it really useful to generate a configuration for KAS? A tool that
> > > generates a configuration for another tool that finally does a Git
> > > checkout seems a bit over-engineered to me. At least for us, an
> > > implementation based on Git submodules would be usable, which would n=
ot
> > > be the case for a KAS based implementation.
> > >
> > > Thank you and regards,
> > > Adrian
> > >
> > >
> > > On Fri, 2022-07-01 at 21:24 +0200, Alexander Kanavin wrote:
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
> > > > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers crea=
te-layers-setup -h
> > > > NOTE: Starting bitbake server...
> > > > usage: bitbake-layers create-layers-setup [-h] [--output OUTPUT] [-=
-format {python,json,kas}] destdir
> > > >
> > > >  Writes out a python script/kas config/json config that replicates =
the directory structure and revisions of the layers in a current build.
> > > >
> > > > positional arguments:
> > > >  destdir Directory where to write the output
> > > >  (if it is inside one of the layers, the layer becomes a bootstrap =
repository and thus will be excluded from fetching by the script).
> > > >
> > > > optional arguments:
> > > >  -h, --help show this help message and exit
> > > >  --output OUTPUT, -o OUTPUT
> > > >  File name where to write the output, if the default (setup-layers.=
py/.json/.yml) is undesirable.
> > > >  --format {python,json,kas}, -f {python,json,kas}
> > > >  Format of the output. The options are:
> > > >  python - a self contained python script that fetches all the neede=
d layers and sets them to correct revisions (default, recommended)
> > > >  kas - a configuration file for the kas tool that allows the tool t=
o do the same
> > > >  json - a json formatted file containing all the needed metadata to=
 do the same by any external or custom tool.
> > > >
> > > > b) Running with default choices:
> > > >
> > > > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers crea=
te-layers-setup ../../meta-alex/
> > > > NOTE: Starting bitbake server...
> > > > NOTE: Created /srv/work/alex/meta-alex/setup-layers.py
> > > >
> > > > 2. Restoring the layers from the saved configuration:
> > > >
> > > > a) Clone meta-alex separately, as a bootstrap layer/repository. It =
should already contain setup-layers.py created in the previous step.
> > > >
> > > > b) Command line options:
> > > >
> > > > alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py -=
h
> > > > usage: setup-layers.py [-h] [--force-meta-alex-checkout] [--choose-=
poky-remote {origin,poky-contrib}] [--destdir DESTDIR]
> > > >
> > > > A self contained python script that fetches all the needed layers a=
nd sets them to correct revisions
> > > >
> > > > optional arguments:
> > > >  -h, --help show this help message and exit
> > > >  --force-meta-alex-checkout
> > > >  Force the checkout of the bootstrap layer meta-alex (by default it=
 is presumed that this script is in it, and so the layer is already in plac=
e).
> > > >  --choose-poky-remote {origin,poky-contrib}
> > > >  Choose a remote server for layer poky (default: origin)
> > > >  --destdir DESTDIR Where to check out the layers (default is /srv/w=
ork/alex/layers-test).
> > > >
> > > > c) Running with default options:
> > > >
> > > > alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py
> > > > Note: not checking out layer meta-alex, use --force-meta-alex-check=
out to override.
> > > > Checking out layer meta-intel, revision 15.0-hardknott-3.3-310-g0a9=
6edae, branch master from remote origin at git://git.yoctoproject.org/meta-=
intel
> > > > Running 'git clone -q git://git.yoctoproject.org/meta-intel meta-in=
tel' in /srv/work/alex/layers-test
> > > > Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' =
in /srv/work/alex/layers-test/meta-intel
> > > > Note: multiple remotes defined for layer poky, using origin (run wi=
th -h to see others).
> > > > Checking out layer poky, revision 4.1_M1-295-g6850b29806, branch ak=
anavin/setup-layers from remote origin at git://git.yoctoproject.org/poky
> > > > Running 'git clone -q git://git.yoctoproject.org/poky poky' in /srv=
/work/alex/layers-test
> > > > Running 'git checkout -q 4cc94de99230201c3c39b924219113157ff47006' =
in /srv/work/alex/layers-test/poky
> > > >
> > > > And that's it!
> > > >
> > > > FIXMEs:
> > > > - kas config writer not yet implemented
> > > > - oe-selftest test cases not yet written
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  meta/lib/bblayers/makesetup.py | 117 ++++++++++++++++++
> > > >  .../templates/setup-layers.py.template | 77 ++++++++++++
> > > >  2 files changed, 194 insertions(+)
> > > >  create mode 100644 meta/lib/bblayers/makesetup.py
> > > >  create mode 100644 meta/lib/bblayers/templates/setup-layers.py.tem=
plate
> > > >
> > > > diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/mak=
esetup.py
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
> > > > + return MakeSetupPlugin()
> > > > +
> > > > +class MakeSetupPlugin(LayerPlugin):
> > > > +
> > > > + def _write_python(self, repos, output):
> > > > + with open(os.path.join(os.path.dirname(__file__), "templates", "s=
etup-layers.py.template")) as f:
> > > > + template =3D f.read()
> > > > + args =3D sys.argv
> > > > + args[0] =3D os.path.basename(args[0])
> > > > + script =3D template.replace('{cmdline}', " ".join(args)).replace(=
'{layerdata}', json.dumps(repos, sort_keys=3DTrue, indent=3D4))
> > > > + with open(output, 'w') as f:
> > > > + f.write(script)
> > > > + st =3D os.stat(output)
> > > > + os.chmod(output, st.st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.=
S_IXOTH)
> > > > +
> > > > + def _write_json(self, repos, output):
> > > > + with open(output, 'w') as f:
> > > > + json.dump(repos, f, sort_keys=3DTrue, indent=3D4)
> > > > +
> > > > + def _write_kas(self, repos, output):
> > > > + raise NotImplementedError('Kas config writer not implemented yet'=
)
> > > > +
> > > > + _write_config =3D {"python":_write_python, "json":_write_json, "k=
as":_write_kas}
> > > > + _output_filename =3D {"python":"setup-layers.py","json":"setup-la=
yers.json","kas":"setup-layers.kas.yaml"}
> > > > +
> > > > + def _get_repo_path(self, layer_path):
> > > > + repo_path, _ =3D bb.process.run('git rev-parse --show-toplevel', =
cwd=3Dlayer_path)
> > > > + return repo_path.strip()
> > > > +
> > > > + def _get_remotes(self, repo_path):
> > > > + remotes =3D []
> > > > + remotes_list,_ =3D bb.process.run('git remote', cwd=3Drepo_path)
> > > > + for r in remotes_list.split():
> > > > + uri,_ =3D bb.process.run('git remote get-url {r}'.format(r=3Dr), =
cwd=3Drepo_path)
> > > > + remotes.append({'name':r,'uri':uri.strip()})
> > > > + return remotes
> > > > +
> > > > + def _get_describe(self, repo_path):
> > > > + try:
> > > > + describe,_ =3D bb.process.run('git describe --tags', cwd=3Drepo_p=
ath)
> > > > + except bb.process.ExecutionError:
> > > > + return ""
> > > > + return describe.strip()
> > > > +
> > > > + def _make_repo_config(self, destdir):
> > > > + repos =3D {}
> > > > + layers =3D oe.buildcfg.get_layer_revisions(self.tinfoil.config_da=
ta)
> > > > + for l in layers:
> > > > + if l[1] =3D=3D 'workspace':
> > > > + continue
> > > > + if l[4]:
> > > > + logger.error("Layer {name} in {path} has uncommitted modification=
s or is not in a git repository.".format(name=3Dl[1],path=3Dl[0]))
> > > > + return
> > > > + repo_path =3D self._get_repo_path(l[0])
> > > > + if repo_path not in repos.keys():
> > > > + repos[repo_path] =3D {'rev':l[3], 'branch':l[2], 'remotes':self._=
get_remotes(repo_path), 'layers':[], 'describe':self._get_describe(repo_pat=
h)}
> > > > + if not repos[repo_path]['remotes']:
> > > > + logger.error("Layer repository in {path} does not have any remote=
s configured. Please add at least one with 'git remote add'.".format(path=
=3Drepo_path))
> > > > + return
> > > > + if repo_path in os.path.abspath(destdir):
> > > > + repos[repo_path]['is_bootstrap'] =3D True
> > > > + repos[repo_path]['layers'].append({'name':l[1],'path':l[0].replac=
e(repo_path,'')[1:]})
> > > > +
> > > > + repo_dirs =3D set([os.path.dirname(p) for p in repos.keys()])
> > > > + if len(repo_dirs) > 1:
> > > > + logger.error("Layer repositories are not all in the same parent d=
irectory: {repo_dirs}. They need to be relocated into the same directory.".=
format(repo_dirs=3Drepo_dirs))
> > > > + return
> > > > +
> > > > + repos_nopaths =3D {}
> > > > + for r in repos.keys():
> > > > + r_nopath =3D os.path.basename(r)
> > > > + repos_nopaths[r_nopath] =3D repos[r]
> > > > + return repos_nopaths
> > > > +
> > > > + def do_make_setup(self, args):
> > > > + """ Writes out a python script/kas config/json config that replic=
ates the directory structure and revisions of the layers in a current build=
. """
> > > > + repos =3D self._make_repo_config(args.destdir)
> > > > + if not repos:
> > > > + return
> > > > + output =3D args.output
> > > > + if not output:
> > > > + output =3D self._output_filename[args.format]
> > > > + output =3D os.path.join(os.path.abspath(args.destdir),output)
> > > > + self._write_config[args.format](self, repos, output)
> > > > + logger.info('Created {}'.format(output))
> > > > +
> > > > + def register_commands(self, sp):
> > > > + parser_setup_layers =3D self.add_command(sp, 'create-layers-setup=
', self.do_make_setup, parserecipes=3DFalse)
> > > > + parser_setup_layers.add_argument('destdir',
> > > > + help=3D'Directory where to write the output\n(if it is inside one=
 of the layers, the layer becomes a bootstrap repository and thus will be e=
xcluded from fetching by the script).')
> > > > + parser_setup_layers.add_argument('--output', '-o',
> > > > + help=3D'File name where to write the output, if the default (setu=
p-layers.py/.json/.yml) is undesirable.')
> > > > + parser_setup_layers.add_argument('--format', '-f', choices=3D['py=
thon', 'json', 'kas'], default=3D'python',
> > > > + help=3D'Format of the output. The options are:\n\tpython - a self=
 contained python script that fetches all the needed layers and sets them t=
o correct revisions (default, recommended)\n\tkas - a configuration file fo=
r the kas tool that allows the tool to do the same\n\tjson - a json formatt=
ed file containing all the needed metadata to do the same by any external o=
r custom tool.')
> > > > diff --git a/meta/lib/bblayers/templates/setup-layers.py.template b=
/meta/lib/bblayers/templates/setup-layers.py.template
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
> > > > +# It is recommended that you do not modify it directly, but rather=
 re-run the above command.
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
> > > > + for l_name in layers:
> > > > + l_data =3D layers[l_name]
> > > > + if 'is_bootstrap' in l_data.keys():
> > > > + force_arg =3D 'force_{}_checkout'.format(l_name.replace('-','_'))
> > > > + if not args[force_arg]:
> > > > + print('Note: not checking out layer {layer}, use {layerflag} to o=
verride.'.format(layer=3Dl_name, layerflag=3D'--force-{}-checkout'.format(l=
_name)))
> > > > + continue
> > > > + rev =3D l_data['rev']
> > > > + desc =3D l_data['describe']
> > > > + if not desc:
> > > > + desc =3D rev[:10]
> > > > + branch =3D l_data['branch']
> > > > + remotes =3D l_data['remotes']
> > > > + remote =3D remotes[0]
> > > > + if len(remotes) > 1:
> > > > + remotechoice =3D args['choose_{}_remote'.format(l_name.replace('-=
','_'))]
> > > > + for r in remotes:
> > > > + if r['name'] =3D=3D remotechoice:
> > > > + remote =3D r
> > > > + print('Note: multiple remotes defined for layer {}, using {} (run=
 with -h to see others).'.format(l_name, r['name']))
> > > > + print('Checking out layer {}, revision {}, branch {} from remote =
{} at {}'.format(l_name, desc, branch, remote['name'], remote['uri']))
> > > > + cmd =3D 'git clone -q {} {}'.format(remote['uri'], l_name)
> > > > + cwd =3D args['destdir']
> > > > + print("Running '{}' in {}".format(cmd, cwd))
> > > > + subprocess.check_output(cmd, text=3DTrue, shell=3DTrue, cwd=3Dcwd=
)
> > > > + cmd =3D 'git checkout -q {}'.format(rev)
> > > > + cwd =3D os.path.join(args['destdir'], l_name)
> > > > + print("Running '{}' in {}".format(cmd, cwd))
> > > > + subprocess.check_output(cmd, text=3DTrue, shell=3DTrue, cwd=3Dcwd=
)
> > > > +
> > > > +layers =3D json.loads(layerdata)
> > > > +parser =3D argparse.ArgumentParser(description=3D'A self contained=
 python script that fetches all the needed layers and sets them to correct =
revisions')
> > > > +
> > > > +bootstraplayer =3D None
> > > > +for l in layers:
> > > > + if 'is_bootstrap' in layers[l]:
> > > > + bootstraplayer =3D l
> > > > +
> > > > +if bootstraplayer:
> > > > + parser.add_argument('--force-{bootstraplayer}-checkout'.format(bo=
otstraplayer=3Dbootstraplayer), action=3D'store_true',
> > > > + help=3D'Force the checkout of the bootstrap layer {bootstraplayer=
} (by default it is presumed that this script is in it, and so the layer is=
 already in place).'.format(bootstraplayer=3Dbootstraplayer))
> > > > +
> > > > +for l in layers:
> > > > + remotes =3D layers[l]['remotes']
> > > > + if len(remotes) > 1:
> > > > + parser.add_argument('--choose-{multipleremoteslayer}-remote'.form=
at(multipleremoteslayer=3Dl),choices=3D[r['name'] for r in remotes], defaul=
t=3Dremotes[0]['name'],
> > > > + help=3D'Choose a remote server for layer {multipleremoteslayer} (=
default: {defaultremote})'.format(multipleremoteslayer=3Dl, defaultremote=
=3Dremotes[0]['name']))
> > > > +
> > > > +try:
> > > > + defaultdest =3D os.path.dirname(subprocess.check_output('git rev-=
parse --show-toplevel', text=3DTrue, shell=3DTrue, cwd=3Dos.path.dirname(__=
file__)))
> > > > +except subprocess.CalledProcessError as e:
> > > > + defaultdest =3D os.path.abspath(".")
> > > > +
> > > > +parser.add_argument('--destdir', default=3Ddefaultdest, help=3D'Wh=
ere to check out the layers (default is {defaultdest}).'.format(defaultdest=
=3Ddefaultdest))
> > > > +
> > > > +args =3D parser.parse_args()
> > > > +
> > > > +_do_checkout(vars(args))
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#167540): https://lists.openembedded.org/g/opene=
mbedded-core/message/167540
> > > > Mute This Topic: https://lists.openembedded.org/mt/92117681/4454582
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [adrian.freihofer@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >
>

