Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5B8C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 19:46:41 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web08.42738.1656704792480918712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 12:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L7VVp4PL;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id l81so4824829oif.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 12:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=A9Vd9AuzVZIdGumuPQ+PLW3Sf8C+MofGgj3Kpe6zXQo=;
        b=L7VVp4PLEFVsk575T59Xlad8WZfBth/AJ4njtu+X65shPqFUcwWrO0cvgbV90ifUin
         LoyIUA4xwZbG6MMNltirLsEESxW53TUeCgMZfIX22iYcMam09AXP+pUleBK82Lc+gP99
         UBsxv8wGbuqkBrDGsvp1t+Nf0SpjeFZVF9EQzF20I1Y5eItqxatLYb1K/7kWsv8SbDc6
         FD7ZyQFo+ZcumbqtzsRYfG5q2yEEHR60njiDE+zmrcOuMAVCTsWgR8joOz6mVQ2cg/Tr
         2xl7aW/b0voKZ/ECP6t+BpCE4lHwGJzwYgY0iA4oJ3jfWhuBGo0P/D7WhikVDtINaFZv
         R8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=A9Vd9AuzVZIdGumuPQ+PLW3Sf8C+MofGgj3Kpe6zXQo=;
        b=cCwLwCkSpCgG1rq6ixJ6pVt/c6a1ZNqqWiNUE0QYs+Ozntf4AkzoxqwUFEkd+XUsoa
         dbwdL0HMYcpsg3CIs23SXDSteGF6gZGA+l7dsH87zPPbd+jEu8VG6xqIPkryGqjNbZUJ
         8GfHbbBMgcWPUaqRPfDvq0950b+MR5JpoZOSSzT1Qb9DkqQm3fur45oIy9QxVkmMZKU+
         hMZCT+wgREvU6p9+J4p58uwhctoXge520KA2eBsYIxmEyv4oGj6WVMAyRH8LI3VhCfya
         5FpldyaTisnchNiNMbQ91ZXm2YjA7tIDuxAmN98ARhhqMWXXj24sqmUaa3I1owGldKu9
         43cQ==
X-Gm-Message-State: AJIora8ckBE88WP+W50QcuQXL4OWs6zcDkwoTYkfiyT6qsPiU2IsOEyG
	VcFY0UcMhhgvnTqc+JfxlyQ=
X-Google-Smtp-Source: 
 AGRyM1sMO0J45htIcB9wOVa3nSSmnZ1B4FUXYsTL/Df5DzPE/UX41aeEtN9dB6gC/uHOD/lv0ya13g==
X-Received: by 2002:a05:6808:f8b:b0:335:c440:ff3c with SMTP id
 o11-20020a0568080f8b00b00335c440ff3cmr6072361oiw.251.1656704791521;
        Fri, 01 Jul 2022 12:46:31 -0700 (PDT)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d?
 ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 i6-20020a056870c1c600b00101ae32e179sm15103062oad.51.2022.07.01.12.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 12:46:30 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <92f3c188-a784-3af2-9bb9-76353e60deb0@gmail.com>
Date: Fri, 1 Jul 2022 14:46:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220701192449.1358325-1-alex@linutronix.de>
In-Reply-To: <20220701192449.1358325-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 19:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167541

Can you outline what this provides over `git submodules`? It seems 
pretty similar and I'm struggling to see what this provides that isn't 
already provided by that tool.

On 7/1/22 14:24, Alexander Kanavin wrote:
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
>   Writes out a python script/kas config/json config that replicates the directory structure and revisions of the layers in a current build.
>
> positional arguments:
>    destdir               Directory where to write the output
>                          (if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching by the script).
>
> optional arguments:
>    -h, --help            show this help message and exit
>    --output OUTPUT, -o OUTPUT
>                          File name where to write the output, if the default (setup-layers.py/.json/.yml) is undesirable.
>    --format {python,json,kas}, -f {python,json,kas}
>                          Format of the output. The options are:
>                          	python - a self contained python script that fetches all the needed layers and sets them to correct revisions (default, recommended)
>                          	kas - a configuration file for the kas tool that allows the tool to do the same
>                          	json - a json formatted file containing all the needed metadata to do the same by any external or custom tool.
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
>    -h, --help            show this help message and exit
>    --force-meta-alex-checkout
>                          Force the checkout of the bootstrap layer meta-alex (by default it is presumed that this script is in it, and so the layer is already in place).
>    --choose-poky-remote {origin,poky-contrib}
>                          Choose a remote server for layer poky (default: origin)
>    --destdir DESTDIR     Where to check out the layers (default is /srv/work/alex/layers-test).
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
>   meta/lib/bblayers/makesetup.py                | 117 ++++++++++++++++++
>   .../templates/setup-layers.py.template        |  77 ++++++++++++
>   2 files changed, 194 insertions(+)
>   create mode 100644 meta/lib/bblayers/makesetup.py
>   create mode 100644 meta/lib/bblayers/templates/setup-layers.py.template
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
> +    return MakeSetupPlugin()
> +
> +class MakeSetupPlugin(LayerPlugin):
> +
> +    def _write_python(self, repos, output):
> +        with open(os.path.join(os.path.dirname(__file__), "templates", "setup-layers.py.template")) as f:
> +            template = f.read()
> +        args = sys.argv
> +        args[0] = os.path.basename(args[0])
> +        script = template.replace('{cmdline}', " ".join(args)).replace('{layerdata}', json.dumps(repos, sort_keys=True, indent=4))
> +        with open(output, 'w') as f:
> +            f.write(script)
> +        st = os.stat(output)
> +        os.chmod(output, st.st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)
> +
> +    def _write_json(self, repos, output):
> +        with open(output, 'w') as f:
> +            json.dump(repos, f, sort_keys=True, indent=4)
> +
> +    def _write_kas(self, repos, output):
> +        raise NotImplementedError('Kas config writer not implemented yet')
> +
> +    _write_config = {"python":_write_python, "json":_write_json, "kas":_write_kas}
> +    _output_filename = {"python":"setup-layers.py","json":"setup-layers.json","kas":"setup-layers.kas.yaml"}
> +
> +    def _get_repo_path(self, layer_path):
> +        repo_path, _ = bb.process.run('git rev-parse --show-toplevel', cwd=layer_path)
> +        return repo_path.strip()
> +
> +    def _get_remotes(self, repo_path):
> +        remotes = []
> +        remotes_list,_ = bb.process.run('git remote', cwd=repo_path)
> +        for r in remotes_list.split():
> +            uri,_ = bb.process.run('git remote get-url {r}'.format(r=r), cwd=repo_path)
> +            remotes.append({'name':r,'uri':uri.strip()})
> +        return remotes
> +
> +    def _get_describe(self, repo_path):
> +        try:
> +            describe,_ = bb.process.run('git describe --tags', cwd=repo_path)
> +        except bb.process.ExecutionError:
> +            return ""
> +        return describe.strip()
> +
> +    def _make_repo_config(self, destdir):
> +        repos = {}
> +        layers = oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
> +        for l in layers:
> +            if l[1] == 'workspace':
> +                continue
> +            if l[4]:
> +                logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l[1],path=l[0]))
> +                return
> +            repo_path = self._get_repo_path(l[0])
> +            if repo_path not in repos.keys():
> +                repos[repo_path] = {'rev':l[3], 'branch':l[2], 'remotes':self._get_remotes(repo_path), 'layers':[], 'describe':self._get_describe(repo_path)}
> +                if not repos[repo_path]['remotes']:
> +                    logger.error("Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path))
> +                    return
> +                if repo_path in os.path.abspath(destdir):
> +                    repos[repo_path]['is_bootstrap'] = True
> +            repos[repo_path]['layers'].append({'name':l[1],'path':l[0].replace(repo_path,'')[1:]})
> +
> +        repo_dirs = set([os.path.dirname(p) for p in repos.keys()])
> +        if len(repo_dirs) > 1:
> +            logger.error("Layer repositories are not all in the same parent directory: {repo_dirs}. They need to be relocated into the same directory.".format(repo_dirs=repo_dirs))
> +            return
> +
> +        repos_nopaths = {}
> +        for r in repos.keys():
> +            r_nopath = os.path.basename(r)
> +            repos_nopaths[r_nopath] = repos[r]
> +        return repos_nopaths
> +
> +    def do_make_setup(self, args):
> +        """ Writes out a python script/kas config/json config that replicates the directory structure and revisions of the layers in a current build. """
> +        repos = self._make_repo_config(args.destdir)
> +        if not repos:
> +            return
> +        output = args.output
> +        if not output:
> +            output = self._output_filename[args.format]
> +        output = os.path.join(os.path.abspath(args.destdir),output)
> +        self._write_config[args.format](self, repos, output)
> +        logger.info('Created {}'.format(output))
> +
> +    def register_commands(self, sp):
> +        parser_setup_layers = self.add_command(sp, 'create-layers-setup', self.do_make_setup, parserecipes=False)
> +        parser_setup_layers.add_argument('destdir',
> +            help='Directory where to write the output\n(if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching by the script).')
> +        parser_setup_layers.add_argument('--output', '-o',
> +            help='File name where to write the output, if the default (setup-layers.py/.json/.yml) is undesirable.')
> +        parser_setup_layers.add_argument('--format', '-f', choices=['python', 'json', 'kas'], default='python',
> +            help='Format of the output. The options are:\n\tpython - a self contained python script that fetches all the needed layers and sets them to correct revisions (default, recommended)\n\tkas - a configuration file for the kas tool that allows the tool to do the same\n\tjson - a json formatted file containing all the needed metadata to do the same by any external or custom tool.')
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
> +    for l_name in layers:
> +        l_data = layers[l_name]
> +        if 'is_bootstrap' in l_data.keys():
> +            force_arg = 'force_{}_checkout'.format(l_name.replace('-','_'))
> +            if not args[force_arg]:
> +                print('Note: not checking out layer {layer}, use {layerflag} to override.'.format(layer=l_name, layerflag='--force-{}-checkout'.format(l_name)))
> +                continue
> +        rev = l_data['rev']
> +        desc = l_data['describe']
> +        if not desc:
> +            desc = rev[:10]
> +        branch = l_data['branch']
> +        remotes = l_data['remotes']
> +        remote = remotes[0]
> +        if len(remotes) > 1:
> +            remotechoice = args['choose_{}_remote'.format(l_name.replace('-','_'))]
> +            for r in remotes:
> +                if r['name'] == remotechoice:
> +                    remote = r
> +                    print('Note: multiple remotes defined for layer {}, using {} (run with -h to see others).'.format(l_name, r['name']))
> +        print('Checking out layer {}, revision {}, branch {} from remote {} at {}'.format(l_name, desc, branch, remote['name'], remote['uri']))
> +        cmd = 'git clone -q {} {}'.format(remote['uri'], l_name)
> +        cwd = args['destdir']
> +        print("Running '{}' in {}".format(cmd, cwd))
> +        subprocess.check_output(cmd, text=True, shell=True, cwd=cwd)
> +        cmd = 'git checkout -q {}'.format(rev)
> +        cwd = os.path.join(args['destdir'], l_name)
> +        print("Running '{}' in {}".format(cmd, cwd))
> +        subprocess.check_output(cmd, text=True, shell=True, cwd=cwd)
> +
> +layers = json.loads(layerdata)
> +parser = argparse.ArgumentParser(description='A self contained python script that fetches all the needed layers and sets them to correct revisions')
> +
> +bootstraplayer = None
> +for l in layers:
> +    if 'is_bootstrap' in layers[l]:
> +        bootstraplayer = l
> +
> +if bootstraplayer:
> +    parser.add_argument('--force-{bootstraplayer}-checkout'.format(bootstraplayer=bootstraplayer), action='store_true',
> +        help='Force the checkout of the bootstrap layer {bootstraplayer} (by default it is presumed that this script is in it, and so the layer is already in place).'.format(bootstraplayer=bootstraplayer))
> +
> +for l in layers:
> +    remotes = layers[l]['remotes']
> +    if len(remotes) > 1:
> +        parser.add_argument('--choose-{multipleremoteslayer}-remote'.format(multipleremoteslayer=l),choices=[r['name'] for r in remotes], default=remotes[0]['name'],
> +            help='Choose a remote server for layer {multipleremoteslayer} (default: {defaultremote})'.format(multipleremoteslayer=l, defaultremote=remotes[0]['name']))
> +
> +try:
> +    defaultdest = os.path.dirname(subprocess.check_output('git rev-parse --show-toplevel', text=True, shell=True, cwd=os.path.dirname(__file__)))
> +except subprocess.CalledProcessError as e:
> +    defaultdest = os.path.abspath(".")
> +
> +parser.add_argument('--destdir', default=defaultdest, help='Where to check out the layers (default is {defaultdest}).'.format(defaultdest=defaultdest))
> +
> +args = parser.parse_args()
> +
> +_do_checkout(vars(args))
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167540): https://lists.openembedded.org/g/openembedded-core/message/167540
> Mute This Topic: https://lists.openembedded.org/mt/92117681/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

