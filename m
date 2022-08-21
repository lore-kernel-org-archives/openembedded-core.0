Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0526AC00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 22:04:21 +0000 (UTC)
Received: from smtp1.emailarray.com (smtp1.emailarray.com [65.39.216.14])
 by mx.groups.io with SMTP id smtpd.web08.11733.1661119458617627407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 15:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: balister.org, ip: 65.39.216.14, mailfrom: philip@balister.org)
Received: (qmail 3185 invoked by uid 89); 21 Aug 2022 22:04:17 -0000
Received: from unknown (HELO ?192.168.11.139?)
 (cGhpbGlwQGJhbGlzdGVyLm9yZ0A3NS43NS45Ni4y) (POLARISLOCAL)  
  by smtp1.emailarray.com with SMTP; 21 Aug 2022 22:04:17 -0000
Message-ID: <a77db410-7158-d873-0817-cc158560a1cf@balister.org>
Date: Sun, 21 Aug 2022 18:04:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core] [PATCH 4/5] scripts/oe-setup-layers: add a script that
 restores the layer configuration from a json file
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-4-alex@linutronix.de>
From: Philip Balister <philip@balister.org>
In-Reply-To: <20220817131023.4093773-4-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Aug 2022 22:04:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169655

On 8/17/22 09:10, Alexander Kanavin wrote:
> This script can be used directly from poky, or can be copied directly into a

Does this work if you are not using poky?

Philip

> layer or any other repository - it is self-suffucient and requires only python3
> and git on the host where it will run. It is also copied by the bitbake-layers
> layers-setup plugin together with the json, unless requested otherwise.
> 
> 1. How to restore the layers from the saved configuration:
> 
> a) Clone the bootstrap layer or some other repository to obtain the json config and the setup script that can use it.
> (use 'bitbake-layers create-layer-setup' from the previous commit to create them)
> 
> b) Running with default options:
> (note: this will work to update an existing checkout as well)
> 
> alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
> Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.
> 
> Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
> Running 'git init -q /srv/work/alex/my-build/meta-intel'
> Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
> Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
> Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel
> 
> Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
> Running 'git init -q /srv/work/alex/my-build/poky'
> Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
> Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
> Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
> Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
> Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' in /srv/work/alex/my-build/poky
> 
> Available build configurations:
> /srv/work/alex/my-build/meta-alex/conf/templates/configuration-gadget
> /srv/work/alex/my-build/meta-alex/conf/templates/configuration-gizmo
> /srv/work/alex/my-build/poky/meta-poky/conf
> 
> You can set up a build with:
> TEMPLATECONF=one/of/the/above . /srv/work/alex/my-build/poky/oe-init-build-env
> 
> 2. Command line options:
> 
> alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers -h
> usage: setup-layers [-h] [--force-bootstraplayer-checkout] [--destdir DESTDIR] [--jsondata JSONDATA]
> 
> A self contained python script that fetches all the needed layers and sets them to correct revisions
> 
> optional arguments:
>    -h, --help            show this help message and exit
>    --force-bootstraplayer-checkout
>                          Force the checkout of the layer containing this file (by default it is presumed that as this script is in it, the layer is already in place).
>    --destdir DESTDIR     Where to check out the layers (default is /srv/work/alex/my-build).
>    --jsondata JSONDATA   File containing the layer data in json format (default is /srv/work/alex/my-build/meta-alex/setup-layers.json).
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   scripts/oe-setup-layers | 89 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100755 scripts/oe-setup-layers
> 
> diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
> new file mode 100755
> index 0000000000..fe948898b0
> --- /dev/null
> +++ b/scripts/oe-setup-layers
> @@ -0,0 +1,89 @@
> +#!/usr/bin/env python3
> +#
> +# This file was copied from poky(or oe-core)/scripts/oe-setup-layers by running
> +#
> +# bitbake-layers create-layers-setup destdir
> +#
> +# It is recommended that you do not modify this file directly, but rather re-run the above command to get the freshest upstream copy.
> +#
> +
> +import argparse
> +import json
> +import os
> +import subprocess
> +
> +def _do_checkout(args, json):
> +    layers = json['sources']
> +    buildconfs = []
> +    oecorepath = ""
> +    for l_name in layers:
> +        l_data = layers[l_name]
> +        layerdir = os.path.abspath(os.path.join(args['destdir'], l_data['path']))
> +
> +        for ll_name in l_data['layers']:
> +            if ll_name == 'meta':
> +                oecorepath = layerdir
> +            ll_data = l_data['layers'][ll_name]
> +            if 'buildconfigs' in ll_data:
> +                for c in ll_data['buildconfigs']:
> +                    buildconfs.append(os.path.join(layerdir, ll_data['subpath'], c))
> +
> +        if 'contains_this_file' in l_data.keys():
> +            force_arg = 'force_bootstraplayer_checkout'
> +            if not args[force_arg]:
> +                print('Note: not checking out source {layer}, use {layerflag} to override.'.format(layer=l_name, layerflag='--force-bootstraplayer-checkout'))
> +                continue
> +        l_remote = l_data['git-remote']
> +        rev = l_remote['rev']
> +        desc = l_remote['describe']
> +        if not desc:
> +            desc = rev[:10]
> +        branch = l_remote['branch']
> +        remotes = l_remote['remotes']
> +
> +        print('\nSetting up source {}, revision {}, branch {}'.format(l_name, desc, branch))
> +        cmd = 'git init -q {}'.format(layerdir)
> +        print("Running '{}'".format(cmd))
> +        subprocess.check_output(cmd, shell=True)
> +
> +        for remote in remotes:
> +            cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
> +            print("Running '{}' in {}".format(cmd, layerdir))
> +            subprocess.check_output(cmd, shell=True, cwd=layerdir)
> +
> +            cmd = "git fetch -q {} || true".format(remote)
> +            print("Running '{}' in {}".format(cmd, layerdir))
> +            subprocess.check_output(cmd, shell=True, cwd=layerdir)
> +
> +        cmd = 'git checkout -q {}'.format(rev)
> +        print("Running '{}' in {}".format(cmd, layerdir))
> +        subprocess.check_output(cmd, shell=True, cwd=layerdir)
> +
> +
> +    print("\nAvailable build configurations:\n{}\n".format("\n".join(buildconfs)))
> +    print("You can set up a build with:\nTEMPLATECONF=one/of/the/above . {}/oe-init-build-env".format(oecorepath))
> +
> +
> +parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
> +
> +parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
> +        help='Force the checkout of the layer containing this file (by default it is presumed that as this script is in it, the layer is already in place).')
> +
> +try:
> +    defaultdest = os.path.dirname(subprocess.check_output('git rev-parse --show-toplevel', universal_newlines=True, shell=True, cwd=os.path.dirname(__file__)))
> +except subprocess.CalledProcessError as e:
> +    defaultdest = os.path.abspath(".")
> +
> +parser.add_argument('--destdir', default=defaultdest, help='Where to check out the layers (default is {defaultdest}).'.format(defaultdest=defaultdest))
> +parser.add_argument('--jsondata', default=__file__+".json", help='File containing the layer data in json format (default is {defaultjson}).'.format(defaultjson=__file__+".json"))
> +
> +args = parser.parse_args()
> +
> +with open(args.jsondata) as f:
> +    json = json.load(f)
> +
> +supported_versions = ["1.0"]
> +if json["version"] not in supported_versions:
> +    raise Exception("File {} has version {}, which is not in supported versions: {}".format(args.jsondata, json["version"], supported_versions))
> +
> +_do_checkout(vars(args), json)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169481): https://lists.openembedded.org/g/openembedded-core/message/169481
> Mute This Topic: https://lists.openembedded.org/mt/93080238/384425
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [philip@balister.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

