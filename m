X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Mon, 4 Jul 2022 15:20:05 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer repositories/revisions save and restore tooling (aka 'layer configuration')
Message-ID: <YsLpBUD1tiK0pk4W@mail.local>
References: <20220701192449.1358325-1-alex@linutronix.de>
 <57530a45296f2c2e7e86b05aa1b7f10965b586f7.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <57530a45296f2c2e7e86b05aa1b7f10965b586f7.camel@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org

On 04/07/2022 11:01:42+0200, Adrian Freihofer wrote:
> Hi Alex
>=20
> Thank you for initiating this important discussion with the code. This
> could be one way to address this issue. However, the discussion here
> also shows how complicated the issue is and how fragmented the
> solutions and opinions are. There are already several tools out there,
> but none of them has proven to be "the only right way". I'm not sure
> that writing another tool is really the best approach. The complexity
> of the proposed tool seems to me to be already at the upper limit,
> where on the other hand Richard suggests to develop it even further and
> publish it via pip. At the very least, I see the risk of ending up with
> just another tool that is very complicated, needs maintenance, but
> still won't be accepted by the community.
>=20
> Personally I really like to build software as simple as
> git clone --recursive
> bitbake my-image
>=20
> Setting up layers is basically just about fetching git repos. I don't
> see the need for creating some configuration files or other complicated
> tasks during the initial setup. So before introducing a new tool,
> please let me understand why git submodules have not been very
> successful in the past. I see some reasons for that:
>  * In the past, there were different RCS systems and the knowledge
>    about git was not everywhere. I think that has fundamentally changed
>    and the acceptance of git (and also git submodules) has massively
>    increased. Today, git may even be the only version control system
>    that needs to be officially supported to manage bitbake layers.
>  * We still use the submodule structures that Tim mentioned. In
>    general, I agree that using Git submodules is unnecessarily
>    complicated.=A0The challenges start when multiple hierarchies of
>    submodules are used. In this use case, I miss a simple command like
>    "git checkout --recursive" that does everything I currently have to
>    do manually with multiple Git submodules sync, init and update and
>    cd commands.
>  * Probably the lack of a simple, recursive command in git is also the
>    reason why some CI implementations are in rare cases not able to
>    checkout git submodules correctly.
>=20
> Do you think there would be a need for a new tool if:
>  * git submodules would be easy to use?
>  * The Yocto manual would suggest to use git submodules for managing
>    the layers and also provide an example folder and submodules
>    structure as a guide line for the users?
>  * If the knowledge of git had been as widespread a few years ago (when
>    the distributions Tim mentions were published) as it is today?
> I believe that today it may well be possible to establish git
> submodules as the recommended solution. (Something like an easy to use
> "git checkout --recursive" command would certainly helpful.)
>=20
> Since the majority of mostly experienced Yocto/OE developers who are
> participating this discussion tend to develop a new tool, it makes me
> wonder if I'm missing something. I see the following use cases where
> layers need to be fetched:
>  * Initial project setup for working with bitbake.
>  * Retrieving layers from an SDK. (I'm not sure if this should remain
>    something special. The PoC which was recently posted by Alex for
>    bootstrapping the SDK directly from the bitbake environment looks
>    very promising to me).
>  * Fetching the layers on CI infrastructures which often call git fetch
>    with fancy options to improve efficiency. (That would probably not
>    work with a Yocto specific fetch tool anyway.)
> Do you see other use cases for a layer fetching tool?
>=20
> What do you think about trying to optimize git submodules to handle the
> "layer fetching" use case with a simple command, rather than developing
> a new Yocto-specific git wrapper?
>=20
> Is it really useful to generate a configuration for KAS? A tool that
> generates a configuration for another tool that finally does a Git
> checkout seems a bit over-engineered to me. At least for us, an
> implementation based on Git submodules would be usable, which would not
> be the case for a KAS based implementation.
>=20

I think the use case you are missing and that you agree just above that
it is not well supported using git submodule is tagging a release and
moving between those tagged releases. With git submodules, it is a mess
and it is very easy to make mistakes or forget to update a module.

> Thank you and regards,
> Adrian
>=20
>=20
> On Fri, 2022-07-01 at 21:24 +0200, Alexander Kanavin wrote:
> > This addresses a long standing gap in the core offering:
> > there is no tooling to capture the currently configured layers
> > with their revisions, or restore the layers from a configuration
> > file (without using external tools, some of which aren't particularly
> > suitable for the task). This plugin addresses the gap.
> >=20
> > How to use:
> >=20
> > 1. Saving a layer configuration:
> >=20
> > a) Command line options:
> >=20
> > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-l=
ayers-setup -h
> > NOTE: Starting bitbake server...
> > usage: bitbake-layers create-layers-setup [-h] [--output OUTPUT] [--for=
mat {python,json,kas}] destdir
> >=20
> >  Writes out a python script/kas config/json config that replicates the =
directory structure and revisions of the layers in a current build.
> >=20
> > positional arguments:
> >  destdir Directory where to write the output
> >  (if it is inside one of the layers, the layer becomes a bootstrap repo=
sitory and thus will be excluded from fetching by the script).
> >=20
> > optional arguments:
> >  -h, --help show this help message and exit
> >  --output OUTPUT, -o OUTPUT
> >  File name where to write the output, if the default (setup-layers.py/.=
json/.yml) is undesirable.
> >  --format {python,json,kas}, -f {python,json,kas}
> >  Format of the output. The options are:
> >  python - a self contained python script that fetches all the needed la=
yers and sets them to correct revisions (default, recommended)
> >  kas - a configuration file for the kas tool that allows the tool to do=
 the same
> >  json - a json formatted file containing all the needed metadata to do =
the same by any external or custom tool.
> >=20
> > b) Running with default choices:
> >=20
> > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-l=
ayers-setup ../../meta-alex/
> > NOTE: Starting bitbake server...
> > NOTE: Created /srv/work/alex/meta-alex/setup-layers.py
> >=20
> > 2. Restoring the layers from the saved configuration:
> >=20
> > a) Clone meta-alex separately, as a bootstrap layer/repository. It shou=
ld already contain setup-layers.py created in the previous step.
> >=20
> > b) Command line options:
> >=20
> > alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py -h
> > usage: setup-layers.py [-h] [--force-meta-alex-checkout] [--choose-poky=
-remote {origin,poky-contrib}] [--destdir DESTDIR]
> >=20
> > A self contained python script that fetches all the needed layers and s=
ets them to correct revisions
> >=20
> > optional arguments:
> >  -h, --help show this help message and exit
> >  --force-meta-alex-checkout
> >  Force the checkout of the bootstrap layer meta-alex (by default it is =
presumed that this script is in it, and so the layer is already in place).
> >  --choose-poky-remote {origin,poky-contrib}
> >  Choose a remote server for layer poky (default: origin)
> >  --destdir DESTDIR Where to check out the layers (default is /srv/work/=
alex/layers-test).
> >=20
> > c) Running with default options:
> >=20
> > alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py
> > Note: not checking out layer meta-alex, use --force-meta-alex-checkout =
to override.
> > Checking out layer meta-intel, revision 15.0-hardknott-3.3-310-g0a96eda=
e, branch master from remote origin at git://git.yoctoproject.org/meta-intel
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
> >=20
> > And that's it!
> >=20
> > FIXMEs:
> > - kas config writer not yet implemented
> > - oe-selftest test cases not yet written
> >=20
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/lib/bblayers/makesetup.py | 117 ++++++++++++++++++
> >  .../templates/setup-layers.py.template | 77 ++++++++++++
> >  2 files changed, 194 insertions(+)
> >  create mode 100644 meta/lib/bblayers/makesetup.py
> >  create mode 100644 meta/lib/bblayers/templates/setup-layers.py.template
> >=20
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
> > + return MakeSetupPlugin()
> > +
> > +class MakeSetupPlugin(LayerPlugin):
> > +
> > + def _write_python(self, repos, output):
> > + with open(os.path.join(os.path.dirname(__file__), "templates", "setup=
-layers.py.template")) as f:
> > + template =3D f.read()
> > + args =3D sys.argv
> > + args[0] =3D os.path.basename(args[0])
> > + script =3D template.replace('{cmdline}', " ".join(args)).replace('{la=
yerdata}', json.dumps(repos, sort_keys=3DTrue, indent=3D4))
> > + with open(output, 'w') as f:
> > + f.write(script)
> > + st =3D os.stat(output)
> > + os.chmod(output, st.st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IX=
OTH)
> > +
> > + def _write_json(self, repos, output):
> > + with open(output, 'w') as f:
> > + json.dump(repos, f, sort_keys=3DTrue, indent=3D4)
> > +
> > + def _write_kas(self, repos, output):
> > + raise NotImplementedError('Kas config writer not implemented yet')
> > +
> > + _write_config =3D {"python":_write_python, "json":_write_json, "kas":=
_write_kas}
> > + _output_filename =3D {"python":"setup-layers.py","json":"setup-layers=
.json","kas":"setup-layers.kas.yaml"}
> > +
> > + def _get_repo_path(self, layer_path):
> > + repo_path, _ =3D bb.process.run('git rev-parse --show-toplevel', cwd=
=3Dlayer_path)
> > + return repo_path.strip()
> > +
> > + def _get_remotes(self, repo_path):
> > + remotes =3D []
> > + remotes_list,_ =3D bb.process.run('git remote', cwd=3Drepo_path)
> > + for r in remotes_list.split():
> > + uri,_ =3D bb.process.run('git remote get-url {r}'.format(r=3Dr), cwd=
=3Drepo_path)
> > + remotes.append({'name':r,'uri':uri.strip()})
> > + return remotes
> > +
> > + def _get_describe(self, repo_path):
> > + try:
> > + describe,_ =3D bb.process.run('git describe --tags', cwd=3Drepo_path)
> > + except bb.process.ExecutionError:
> > + return ""
> > + return describe.strip()
> > +
> > + def _make_repo_config(self, destdir):
> > + repos =3D {}
> > + layers =3D oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
> > + for l in layers:
> > + if l[1] =3D=3D 'workspace':
> > + continue
> > + if l[4]:
> > + logger.error("Layer {name} in {path} has uncommitted modifications or=
 is not in a git repository.".format(name=3Dl[1],path=3Dl[0]))
> > + return
> > + repo_path =3D self._get_repo_path(l[0])
> > + if repo_path not in repos.keys():
> > + repos[repo_path] =3D {'rev':l[3], 'branch':l[2], 'remotes':self._get_=
remotes(repo_path), 'layers':[], 'describe':self._get_describe(repo_path)}
> > + if not repos[repo_path]['remotes']:
> > + logger.error("Layer repository in {path} does not have any remotes co=
nfigured. Please add at least one with 'git remote add'.".format(path=3Drep=
o_path))
> > + return
> > + if repo_path in os.path.abspath(destdir):
> > + repos[repo_path]['is_bootstrap'] =3D True
> > + repos[repo_path]['layers'].append({'name':l[1],'path':l[0].replace(re=
po_path,'')[1:]})
> > +
> > + repo_dirs =3D set([os.path.dirname(p) for p in repos.keys()])
> > + if len(repo_dirs) > 1:
> > + logger.error("Layer repositories are not all in the same parent direc=
tory: {repo_dirs}. They need to be relocated into the same directory.".form=
at(repo_dirs=3Drepo_dirs))
> > + return
> > +
> > + repos_nopaths =3D {}
> > + for r in repos.keys():
> > + r_nopath =3D os.path.basename(r)
> > + repos_nopaths[r_nopath] =3D repos[r]
> > + return repos_nopaths
> > +
> > + def do_make_setup(self, args):
> > + """ Writes out a python script/kas config/json config that replicates=
 the directory structure and revisions of the layers in a current build. """
> > + repos =3D self._make_repo_config(args.destdir)
> > + if not repos:
> > + return
> > + output =3D args.output
> > + if not output:
> > + output =3D self._output_filename[args.format]
> > + output =3D os.path.join(os.path.abspath(args.destdir),output)
> > + self._write_config[args.format](self, repos, output)
> > + logger.info('Created {}'.format(output))
> > +
> > + def register_commands(self, sp):
> > + parser_setup_layers =3D self.add_command(sp, 'create-layers-setup', s=
elf.do_make_setup, parserecipes=3DFalse)
> > + parser_setup_layers.add_argument('destdir',
> > + help=3D'Directory where to write the output\n(if it is inside one of =
the layers, the layer becomes a bootstrap repository and thus will be exclu=
ded from fetching by the script).')
> > + parser_setup_layers.add_argument('--output', '-o',
> > + help=3D'File name where to write the output, if the default (setup-la=
yers.py/.json/.yml) is undesirable.')
> > + parser_setup_layers.add_argument('--format', '-f', choices=3D['python=
', 'json', 'kas'], default=3D'python',
> > + help=3D'Format of the output. The options are:\n\tpython - a self con=
tained python script that fetches all the needed layers and sets them to co=
rrect revisions (default, recommended)\n\tkas - a configuration file for th=
e kas tool that allows the tool to do the same\n\tjson - a json formatted f=
ile containing all the needed metadata to do the same by any external or cu=
stom tool.')
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
> > + for l_name in layers:
> > + l_data =3D layers[l_name]
> > + if 'is_bootstrap' in l_data.keys():
> > + force_arg =3D 'force_{}_checkout'.format(l_name.replace('-','_'))
> > + if not args[force_arg]:
> > + print('Note: not checking out layer {layer}, use {layerflag} to overr=
ide.'.format(layer=3Dl_name, layerflag=3D'--force-{}-checkout'.format(l_nam=
e)))
> > + continue
> > + rev =3D l_data['rev']
> > + desc =3D l_data['describe']
> > + if not desc:
> > + desc =3D rev[:10]
> > + branch =3D l_data['branch']
> > + remotes =3D l_data['remotes']
> > + remote =3D remotes[0]
> > + if len(remotes) > 1:
> > + remotechoice =3D args['choose_{}_remote'.format(l_name.replace('-','_=
'))]
> > + for r in remotes:
> > + if r['name'] =3D=3D remotechoice:
> > + remote =3D r
> > + print('Note: multiple remotes defined for layer {}, using {} (run wit=
h -h to see others).'.format(l_name, r['name']))
> > + print('Checking out layer {}, revision {}, branch {} from remote {} a=
t {}'.format(l_name, desc, branch, remote['name'], remote['uri']))
> > + cmd =3D 'git clone -q {} {}'.format(remote['uri'], l_name)
> > + cwd =3D args['destdir']
> > + print("Running '{}' in {}".format(cmd, cwd))
> > + subprocess.check_output(cmd, text=3DTrue, shell=3DTrue, cwd=3Dcwd)
> > + cmd =3D 'git checkout -q {}'.format(rev)
> > + cwd =3D os.path.join(args['destdir'], l_name)
> > + print("Running '{}' in {}".format(cmd, cwd))
> > + subprocess.check_output(cmd, text=3DTrue, shell=3DTrue, cwd=3Dcwd)
> > +
> > +layers =3D json.loads(layerdata)
> > +parser =3D argparse.ArgumentParser(description=3D'A self contained pyt=
hon script that fetches all the needed layers and sets them to correct revi=
sions')
> > +
> > +bootstraplayer =3D None
> > +for l in layers:
> > + if 'is_bootstrap' in layers[l]:
> > + bootstraplayer =3D l
> > +
> > +if bootstraplayer:
> > + parser.add_argument('--force-{bootstraplayer}-checkout'.format(bootst=
raplayer=3Dbootstraplayer), action=3D'store_true',
> > + help=3D'Force the checkout of the bootstrap layer {bootstraplayer} (b=
y default it is presumed that this script is in it, and so the layer is alr=
eady in place).'.format(bootstraplayer=3Dbootstraplayer))
> > +
> > +for l in layers:
> > + remotes =3D layers[l]['remotes']
> > + if len(remotes) > 1:
> > + parser.add_argument('--choose-{multipleremoteslayer}-remote'.format(m=
ultipleremoteslayer=3Dl),choices=3D[r['name'] for r in remotes], default=3D=
remotes[0]['name'],
> > + help=3D'Choose a remote server for layer {multipleremoteslayer} (defa=
ult: {defaultremote})'.format(multipleremoteslayer=3Dl, defaultremote=3Drem=
otes[0]['name']))
> > +
> > +try:
> > + defaultdest =3D os.path.dirname(subprocess.check_output('git rev-pars=
e --show-toplevel', text=3DTrue, shell=3DTrue, cwd=3Dos.path.dirname(__file=
__)))
> > +except subprocess.CalledProcessError as e:
> > + defaultdest =3D os.path.abspath(".")
> > +
> > +parser.add_argument('--destdir', default=3Ddefaultdest, help=3D'Where =
to check out the layers (default is {defaultdest}).'.format(defaultdest=3Dd=
efaultdest))
> > +
> > +args =3D parser.parse_args()
> > +
> > +_do_checkout(vars(args))
> >=20
> >=20
>=20

>=20
>=20
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
