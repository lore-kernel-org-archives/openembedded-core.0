Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <57530a45296f2c2e7e86b05aa1b7f10965b586f7.camel@gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer repositories/revisions save and restore tooling (aka 'layer configuration')
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
Date: Mon, 04 Jul 2022 11:01:42 +0200
In-Reply-To: <20220701192449.1358325-1-alex@linutronix.de>
References: <20220701192449.1358325-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org

Hi Alex

Thank you for initiating this important discussion with the code. This
could be one way to address this issue. However, the discussion here
also shows how complicated the issue is and how fragmented the
solutions and opinions are. There are already several tools out there,
but none of them has proven to be "the only right way". I'm not sure
that writing another tool is really the best approach. The complexity
of the proposed tool seems to me to be already at the upper limit,
where on the other hand Richard suggests to develop it even further and
publish it via pip. At the very least, I see the risk of ending up with
just another tool that is very complicated, needs maintenance, but
still won't be accepted by the community.

Personally I really like to build software as simple as
git clone --recursive
bitbake my-image

Setting up layers is basically just about fetching git repos. I don't
see the need for creating some configuration files or other complicated
tasks during the initial setup. So before introducing a new tool,
please let me understand why git submodules have not been very
successful in the past. I see some reasons for that:
 * In the past, there were different RCS systems and the knowledge
   about git was not everywhere. I think that has fundamentally changed
   and the acceptance of git (and also git submodules) has massively
   increased. Today, git may even be the only version control system
   that needs to be officially supported to manage bitbake layers.
 * We still use the submodule structures that Tim mentioned. In
   general, I agree that using Git submodules is unnecessarily
   complicated. The challenges start when multiple hierarchies of
   submodules are used. In this use case, I miss a simple command like
   "git checkout --recursive" that does everything I currently have to
   do manually with multiple Git submodules sync, init and update and
   cd commands.
 * Probably the lack of a simple, recursive command in git is also the
   reason why some CI implementations are in rare cases not able to
   checkout git submodules correctly.

Do you think there would be a need for a new tool if:
 * git submodules would be easy to use?
 * The Yocto manual would suggest to use git submodules for managing
   the layers and also provide an example folder and submodules
   structure as a guide line for the users?
 * If the knowledge of git had been as widespread a few years ago (when
   the distributions Tim mentions were published) as it is today?
I believe that today it may well be possible to establish git
submodules as the recommended solution. (Something like an easy to use
"git checkout --recursive" command would certainly helpful.)

Since the majority of mostly experienced Yocto/OE developers who are
participating this discussion tend to develop a new tool, it makes me
wonder if I'm missing something. I see the following use cases where
layers need to be fetched:
 * Initial project setup for working with bitbake.
 * Retrieving layers from an SDK. (I'm not sure if this should remain
   something special. The PoC which was recently posted by Alex for
   bootstrapping the SDK directly from the bitbake environment looks
   very promising to me).
 * Fetching the layers on CI infrastructures which often call git fetch
   with fancy options to improve efficiency. (That would probably not
   work with a Yocto specific fetch tool anyway.)
Do you see other use cases for a layer fetching tool?

What do you think about trying to optimize git submodules to handle the
"layer fetching" use case with a simple command, rather than developing
a new Yocto-specific git wrapper?

Is it really useful to generate a configuration for KAS? A tool that
generates a configuration for another tool that finally does a Git
checkout seems a bit over-engineered to me. At least for us, an
implementation based on Git submodules would be usable, which would not
be the case for a KAS based implementation.

Thank you and regards,
Adrian


On Fri, 2022-07-01 at 21:24 +0200, Alexander Kanavin wrote:
> This addresses a long standing gap in the core offering:
> there is no tooling to capture the currently configured layers
> with their revisions, or restore the layers from a configuration
> file (without using external tools, some of which aren't particularly
> suitable for the task). This plugin addresses the gap.
> 
> How to use:
> 
> 1. Saving a layer configuration:
> 
> a) Command line options:
> 
> alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-layers-setup -h
> NOTE: Starting bitbake server...
> usage: bitbake-layers create-layers-setup [-h] [--output OUTPUT] [--format {python,json,kas}] destdir
> 
>  Writes out a python script/kas config/json config that replicates the directory structure and revisions of the layers in a current build.
> 
> positional arguments:
>  destdir Directory where to write the output
>  (if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching by the script).
> 
> optional arguments:
>  -h, --help show this help message and exit
>  --output OUTPUT, -o OUTPUT
>  File name where to write the output, if the default (setup-layers.py/.json/.yml) is undesirable.
>  --format {python,json,kas}, -f {python,json,kas}
>  Format of the output. The options are:
>  python - a self contained python script that fetches all the needed layers and sets them to correct revisions (default, recommended)
>  kas - a configuration file for the kas tool that allows the tool to do the same
>  json - a json formatted file containing all the needed metadata to do the same by any external or custom tool.
> 
> b) Running with default choices:
> 
> alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-layers-setup ../../meta-alex/
> NOTE: Starting bitbake server...
> NOTE: Created /srv/work/alex/meta-alex/setup-layers.py
> 
> 2. Restoring the layers from the saved configuration:
> 
> a) Clone meta-alex separately, as a bootstrap layer/repository. It should already contain setup-layers.py created in the previous step.
> 
> b) Command line options:
> 
> alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py -h
> usage: setup-layers.py [-h] [--force-meta-alex-checkout] [--choose-poky-remote {origin,poky-contrib}] [--destdir DESTDIR]
> 
> A self contained python script that fetches all the needed layers and sets them to correct revisions
> 
> optional arguments:
>  -h, --help show this help message and exit
>  --force-meta-alex-checkout
>  Force the checkout of the bootstrap layer meta-alex (by default it is presumed that this script is in it, and so the layer is already in place).
>  --choose-poky-remote {origin,poky-contrib}
>  Choose a remote server for layer poky (default: origin)
>  --destdir DESTDIR Where to check out the layers (default is /srv/work/alex/layers-test).
> 
> c) Running with default options:
> 
> alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py
> Note: not checking out layer meta-alex, use --force-meta-alex-checkout to override.
> Checking out layer meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master from remote origin at git://git.yoctoproject.org/meta-intel
> Running 'git clone -q git://git.yoctoproject.org/meta-intel meta-intel' in /srv/work/alex/layers-test
> Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/layers-test/meta-intel
> Note: multiple remotes defined for layer poky, using origin (run with -h to see others).
> Checking out layer poky, revision 4.1_M1-295-g6850b29806, branch akanavin/setup-layers from remote origin at git://git.yoctoproject.org/poky
> Running 'git clone -q git://git.yoctoproject.org/poky poky' in /srv/work/alex/layers-test
> Running 'git checkout -q 4cc94de99230201c3c39b924219113157ff47006' in /srv/work/alex/layers-test/poky
> 
> And that's it!
> 
> FIXMEs:
> - kas config writer not yet implemented
> - oe-selftest test cases not yet written
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/bblayers/makesetup.py | 117 ++++++++++++++++++
>  .../templates/setup-layers.py.template | 77 ++++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 meta/lib/bblayers/makesetup.py
>  create mode 100644 meta/lib/bblayers/templates/setup-layers.py.template
> 
> diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
> new file mode 100644
> index 0000000000..3c86eea3c4
> --- /dev/null
> +++ b/meta/lib/bblayers/makesetup.py
> @@ -0,0 +1,117 @@
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +import logging
> +import os
> +import stat
> +import sys
> +import shutil
> +import json
> +
> +import bb.utils
> +import bb.process
> +
> +from bblayers.common import LayerPlugin
> +
> +logger = logging.getLogger('bitbake-layers')
> +
> +sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
> +
> +import oe.buildcfg
> +
> +def plugin_init(plugins):
> + return MakeSetupPlugin()
> +
> +class MakeSetupPlugin(LayerPlugin):
> +
> + def _write_python(self, repos, output):
> + with open(os.path.join(os.path.dirname(__file__), "templates", "setup-layers.py.template")) as f:
> + template = f.read()
> + args = sys.argv
> + args[0] = os.path.basename(args[0])
> + script = template.replace('{cmdline}', " ".join(args)).replace('{layerdata}', json.dumps(repos, sort_keys=True, indent=4))
> + with open(output, 'w') as f:
> + f.write(script)
> + st = os.stat(output)
> + os.chmod(output, st.st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)
> +
> + def _write_json(self, repos, output):
> + with open(output, 'w') as f:
> + json.dump(repos, f, sort_keys=True, indent=4)
> +
> + def _write_kas(self, repos, output):
> + raise NotImplementedError('Kas config writer not implemented yet')
> +
> + _write_config = {"python":_write_python, "json":_write_json, "kas":_write_kas}
> + _output_filename = {"python":"setup-layers.py","json":"setup-layers.json","kas":"setup-layers.kas.yaml"}
> +
> + def _get_repo_path(self, layer_path):
> + repo_path, _ = bb.process.run('git rev-parse --show-toplevel', cwd=layer_path)
> + return repo_path.strip()
> +
> + def _get_remotes(self, repo_path):
> + remotes = []
> + remotes_list,_ = bb.process.run('git remote', cwd=repo_path)
> + for r in remotes_list.split():
> + uri,_ = bb.process.run('git remote get-url {r}'.format(r=r), cwd=repo_path)
> + remotes.append({'name':r,'uri':uri.strip()})
> + return remotes
> +
> + def _get_describe(self, repo_path):
> + try:
> + describe,_ = bb.process.run('git describe --tags', cwd=repo_path)
> + except bb.process.ExecutionError:
> + return ""
> + return describe.strip()
> +
> + def _make_repo_config(self, destdir):
> + repos = {}
> + layers = oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
> + for l in layers:
> + if l[1] == 'workspace':
> + continue
> + if l[4]:
> + logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l[1],path=l[0]))
> + return
> + repo_path = self._get_repo_path(l[0])
> + if repo_path not in repos.keys():
> + repos[repo_path] = {'rev':l[3], 'branch':l[2], 'remotes':self._get_remotes(repo_path), 'layers':[], 'describe':self._get_describe(repo_path)}
> + if not repos[repo_path]['remotes']:
> + logger.error("Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path))
> + return
> + if repo_path in os.path.abspath(destdir):
> + repos[repo_path]['is_bootstrap'] = True
> + repos[repo_path]['layers'].append({'name':l[1],'path':l[0].replace(repo_path,'')[1:]})
> +
> + repo_dirs = set([os.path.dirname(p) for p in repos.keys()])
> + if len(repo_dirs) > 1:
> + logger.error("Layer repositories are not all in the same parent directory: {repo_dirs}. They need to be relocated into the same directory.".format(repo_dirs=repo_dirs))
> + return
> +
> + repos_nopaths = {}
> + for r in repos.keys():
> + r_nopath = os.path.basename(r)
> + repos_nopaths[r_nopath] = repos[r]
> + return repos_nopaths
> +
> + def do_make_setup(self, args):
> + """ Writes out a python script/kas config/json config that replicates the directory structure and revisions of the layers in a current build. """
> + repos = self._make_repo_config(args.destdir)
> + if not repos:
> + return
> + output = args.output
> + if not output:
> + output = self._output_filename[args.format]
> + output = os.path.join(os.path.abspath(args.destdir),output)
> + self._write_config[args.format](self, repos, output)
> + logger.info('Created {}'.format(output))
> +
> + def register_commands(self, sp):
> + parser_setup_layers = self.add_command(sp, 'create-layers-setup', self.do_make_setup, parserecipes=False)
> + parser_setup_layers.add_argument('destdir',
> + help='Directory where to write the output\n(if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching by the script).')
> + parser_setup_layers.add_argument('--output', '-o',
> + help='File name where to write the output, if the default (setup-layers.py/.json/.yml) is undesirable.')
> + parser_setup_layers.add_argument('--format', '-f', choices=['python', 'json', 'kas'], default='python',
> + help='Format of the output. The options are:\n\tpython - a self contained python script that fetches all the needed layers and sets them to correct revisions (default, recommended)\n\tkas - a configuration file for the kas tool that allows the tool to do the same\n\tjson - a json formatted file containing all the needed metadata to do the same by any external or custom tool.')
> diff --git a/meta/lib/bblayers/templates/setup-layers.py.template b/meta/lib/bblayers/templates/setup-layers.py.template
> new file mode 100644
> index 0000000000..a704ad3d70
> --- /dev/null
> +++ b/meta/lib/bblayers/templates/setup-layers.py.template
> @@ -0,0 +1,77 @@
> +#!/usr/bin/env python3
> +#
> +# This file was generated by running
> +#
> +# {cmdline}
> +#
> +# It is recommended that you do not modify it directly, but rather re-run the above command.
> +#
> +
> +layerdata = """
> +{layerdata}
> +"""
> +
> +import argparse
> +import json
> +import os
> +import subprocess
> +
> +def _do_checkout(args):
> + for l_name in layers:
> + l_data = layers[l_name]
> + if 'is_bootstrap' in l_data.keys():
> + force_arg = 'force_{}_checkout'.format(l_name.replace('-','_'))
> + if not args[force_arg]:
> + print('Note: not checking out layer {layer}, use {layerflag} to override.'.format(layer=l_name, layerflag='--force-{}-checkout'.format(l_name)))
> + continue
> + rev = l_data['rev']
> + desc = l_data['describe']
> + if not desc:
> + desc = rev[:10]
> + branch = l_data['branch']
> + remotes = l_data['remotes']
> + remote = remotes[0]
> + if len(remotes) > 1:
> + remotechoice = args['choose_{}_remote'.format(l_name.replace('-','_'))]
> + for r in remotes:
> + if r['name'] == remotechoice:
> + remote = r
> + print('Note: multiple remotes defined for layer {}, using {} (run with -h to see others).'.format(l_name, r['name']))
> + print('Checking out layer {}, revision {}, branch {} from remote {} at {}'.format(l_name, desc, branch, remote['name'], remote['uri']))
> + cmd = 'git clone -q {} {}'.format(remote['uri'], l_name)
> + cwd = args['destdir']
> + print("Running '{}' in {}".format(cmd, cwd))
> + subprocess.check_output(cmd, text=True, shell=True, cwd=cwd)
> + cmd = 'git checkout -q {}'.format(rev)
> + cwd = os.path.join(args['destdir'], l_name)
> + print("Running '{}' in {}".format(cmd, cwd))
> + subprocess.check_output(cmd, text=True, shell=True, cwd=cwd)
> +
> +layers = json.loads(layerdata)
> +parser = argparse.ArgumentParser(description='A self contained python script that fetches all the needed layers and sets them to correct revisions')
> +
> +bootstraplayer = None
> +for l in layers:
> + if 'is_bootstrap' in layers[l]:
> + bootstraplayer = l
> +
> +if bootstraplayer:
> + parser.add_argument('--force-{bootstraplayer}-checkout'.format(bootstraplayer=bootstraplayer), action='store_true',
> + help='Force the checkout of the bootstrap layer {bootstraplayer} (by default it is presumed that this script is in it, and so the layer is already in place).'.format(bootstraplayer=bootstraplayer))
> +
> +for l in layers:
> + remotes = layers[l]['remotes']
> + if len(remotes) > 1:
> + parser.add_argument('--choose-{multipleremoteslayer}-remote'.format(multipleremoteslayer=l),choices=[r['name'] for r in remotes], default=remotes[0]['name'],
> + help='Choose a remote server for layer {multipleremoteslayer} (default: {defaultremote})'.format(multipleremoteslayer=l, defaultremote=remotes[0]['name']))
> +
> +try:
> + defaultdest = os.path.dirname(subprocess.check_output('git rev-parse --show-toplevel', text=True, shell=True, cwd=os.path.dirname(__file__)))
> +except subprocess.CalledProcessError as e:
> + defaultdest = os.path.abspath(".")
> +
> +parser.add_argument('--destdir', default=defaultdest, help='Where to check out the layers (default is {defaultdest}).'.format(defaultdest=defaultdest))
> +
> +args = parser.parse_args()
> +
> +_do_checkout(vars(args))
> 
> 

