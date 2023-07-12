Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950C1EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 18:20:55 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.3362.1689186048544763037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 11:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MgqLNSFn;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so11799295e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689186047; x=1691778047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+68P2TMzl2ayY7LBSr2AzGL7ifEcToEZwvJSj60HivA=;
        b=MgqLNSFnnZEH5F+rnu+AMNBzGSYztYj2U288/+oFv1GkNmTqufFqDWW2G/ZKyvdD32
         QojKjeTWvzY4APf6Gj9x0rD3qzGZLa6LyDKDSmFnMiCWAKPTyQu5eV+soCzf0qT4SIvR
         whgAXFWdfEQHgPQlxDnXhvJJMxZeIXP63K0ZHfMOGf1S1Tl+7z+4aYkGnRQN3pwARVQ5
         sXgfbgI6Gn9QN3TmVNmDsCMU23SwlnpZmnbiJWskEytzRIiJ+zLQbsgAEgdy72dgJYAf
         MbAp7O47b8wKi5A4L2ybXC6p3mhsNfVAk5fn/jwyF67+8EQu9tORkAAIscLPdNQw5OYT
         r+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689186047; x=1691778047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+68P2TMzl2ayY7LBSr2AzGL7ifEcToEZwvJSj60HivA=;
        b=Nvaztyb5m2LOBQqiA8EjcWoKcxNKXukVksonXzJMMYVYJNyrR4p3eo9izUa0LRjOjp
         bMEi2KiPSy/aG9i9rhs0YA7smt7tXt5//dk6MjslVZc5vcKxywBYbxvzcOUeXeOV6OiU
         MFslmJsl5mR0E3UUDPqCKhlg3YWtbiUprr1nNCsKcArdIOYITz/jV/zK0mnkAzz8FnPH
         LGAsUhlNlvtamaHg9KbULSu89KNGt8MkQpgb8PUS2dpjKqvqHoa7IR1TsfDK4Ni0fgc7
         L2gyFj2+jrkEIrQVvqoGfmJ6qJwwuD8dyKYDI42259qznZgbT5DdGeQ2wo1HMGJL2VQx
         q29w==
X-Gm-Message-State: ABy/qLZR76LXQVUdyeqQYIsHBHpG2xZvZHMnRgJw36VBEj8jtNfdIbZQ
	FSAkxvRF6pW9fyCVxZH8cwYHyGcGjlS2Dg9ECGc=
X-Google-Smtp-Source: APBJJlGTvCJwsKwk76gkMWlgc8XHdsUVoDyMfgSaoyhREeRw2cu22qkOp5q36FOdtMh+eQTazh3PXHCkczAqtENXbt8=
X-Received: by 2002:a05:6512:60f:b0:4ed:cc6d:61fe with SMTP id
 b15-20020a056512060f00b004edcc6d61femr14968295lfe.24.1689186046550; Wed, 12
 Jul 2023 11:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=6tBRhQaqO8jkM7CCpRfNAyYiByB4V4dFbbbWhu7A6QN6KTQ@mail.gmail.com>
In-Reply-To: <CAB=6tBRhQaqO8jkM7CCpRfNAyYiByB4V4dFbbbWhu7A6QN6KTQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Jul 2023 20:20:35 +0200
Message-ID: <CANNYZj8S6_P96ACXF8i=Pdw2ytAqq41ZF8WZOizsDrdZqmi7TA@mail.gmail.com>
Subject: Re: [OE-Core][RFC] update-layers: Update layers managed by setup-layers
To: Chuck Wolber <chuckwolber@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 18:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184212

Thanks, perhaps this functionality should simply be folded directly
into bitbake-layers perhaps, as an extension of 'create-layers-setup'?
Does it need to be in a separate script?

Alex

On Wed, 12 Jul 2023 at 20:00, Chuck Wolber <chuckwolber@gmail.com> wrote:
>
> I wrote this tool to do automatic updating of layers managed by the setup-layers script. This
> addresses some of the functionality I discussed in my OSSNA 2023 talk.
>
> A detailed explanation of what the following script does is found in the comments, but in
> a nutshell:
>
> * If the --sync-upstream argument is provided, any layers that have remotes called
>   "origin" and "upstream" have upstream changes on their configured branch applied
>   to the origin remote (and local clone).
> * Updates rev and description for all layers managed by setup-layers after pulling
>   the latest changes on the configured branch.
> * Leaves the setup-layers.json file in an updated state so git diff will show changes.
>   Changes can then be reviewed and managed based on local project policy.
>
> I am looking for comments and feedback before I send this as a proper patch.
>
> In particular:
>
> * Are there any problems with this general approach?
> * Should this be managed in OE-Core in the same way setup-layers is?
> * I made some stylistic changes (e.g. main function, --dry-run, etc) that I plan to also patch into
>   setup-layers if this is accepted and there are no objections.
>
>
> ---
>
> #!/usr/bin/env python3
> #
> # Copyright OpenEmbedded Contributors
> #
> # SPDX-License-Identifier: MIT
> #
>
> # This script is idempotent and assumes that the layers it is updating have
> # been managed by setup-layers according to the JSON formatted layers data.
> #
> # For each layer repository in the JSON formatted layers data file:
> #
> # * If remotes named upstream and origin exist and the --sync-upstream argument
> # has been provided, merge upstream changes on the configured branch to the
> # origin remote.
> # * Pull the latest changes on the configured branch from origin.
> # * Update the JSON layers data to reflect the latest layer repo HEAD.
> # * Leave layer repository in an updated state with the configured branch
> # checked out.
> #
> # After reviewing the changes in the JSON layers data file, they can either be
> # committed or reverted. If they are reverted, it will be necessary to re-run
> # setup-layers to ensure your layer repositories reflect the intent captured in
> # the configuration. For the sake of completeness, you may also wish to re-run
> # setup-layers even if you commit the configuration changes, as this script
> # leaves the local layer repo clones checked out to the configured branch rather
> # than the configured rev. The HEAD of the configured branch and the configured
> # rev are identical at the completion of this script, but the latter will be
> # more consistent with expectations established by the setup-layers script.
> #
> # The term "setup-layers" refers to the script found at
> # openembedded-core/scripts/oe-setup-layers. Pass the --help argument to this
> # script for the most up to date usage guidance.
>
> import argparse
> import json
> import os
> import subprocess
>
> def _do_git_command(repodir, command):
>     print("Running '{}' in {}".format(command, repodir))
>     if not args.dry_run:
>         subprocess.check_output(command, shell=True, cwd=repodir)
>
> def _do_git_checkout_branch(repodir, remote, branch):
>     _do_git_command(repodir, 'git checkout -B {0} --track {1}/{0} --quiet'.format(branch, remote))
>
> def _do_git_pull(repodir, remote, branch):
>     _do_git_fetch(repodir, remote)
>     _do_git_merge(repodir, remote, branch)
>
> def _do_git_fetch(repodir, remote):
>     _do_git_command(repodir, 'git fetch {} --prune --prune-tags --quiet'.format(remote))
>
> def _do_git_merge(repodir, remote, branch):
>     _do_git_command(repodir, 'git merge {}/{} --ff-only --quiet'.format(remote, branch))
>
> def _do_git_force_push(repodir, remote, branch):
>     _do_git_command(repodir, 'git push {} heads/{} --force --quiet'.format(remote, branch))
>
> def _get_git_rev(repodir):
>     rev = subprocess.check_output("git rev-parse HEAD", shell=True, cwd=repodir, stderr=subprocess.DEVNULL)
>     return rev.strip().decode("utf-8")
>
> def _get_git_desc(repodir):
>     desc = subprocess.check_output("git describe HEAD --always", shell=True, cwd=repodir, stderr=subprocess.DEVNULL)
>     return desc.strip().decode("utf-8")
>
> def _do_sync_upstream(repodir, repo_name, repo_data):
>     if not args.sync_upstream:
>         return
>
>     repo_remote = repo_data['git-remote']
>     branch = repo_remote['branch']
>     remotes = repo_remote['remotes']
>
>     print("Attempting to sync layer repo {} with upstream.".format(repo_name))
>
>     if 'origin' not in remotes or 'upstream' not in remotes:
>         print("Origin and/or upstream remotes not found on {}".format(repo_name))
>         return
>
>     _do_git_checkout_branch(repodir, 'origin', branch)
>     _do_git_pull(repodir, 'origin', branch)
>     _do_git_fetch(repodir, 'upstream')
>     _do_git_merge(repodir, 'upstream', branch)
>     _do_git_force_push(repodir, 'origin', branch)
>
> def _do_update_layer_json(repodir, repo_name, layer_data):
>     print("Updating layer JSON for {} repo.".format(repo_name))
>     branch = layer_data['sources'][repo_name]['git-remote']['branch']
>
>     _do_git_checkout_branch(repodir, 'origin', branch)
>     _do_git_pull(repodir, 'origin', branch)
>
>     layer_data['sources'][repo_name]['git-remote']['rev'] = _get_git_rev(repodir)
>     layer_data['sources'][repo_name]['git-remote']['describe'] = _get_git_desc(repodir)
>
> def _do_update_layers(layer_data):
>     print("Updating layers...")
>     repos = layer_data['sources']
>     for repo_name in repos:
>         repo_data = repos[repo_name]
>         repodir = os.path.abspath(os.path.join(args.destdir, repo_data['path']))
>
>         if 'contains_this_file' in repo_data.keys():
>             continue
>
>         _do_sync_upstream(repodir, repo_name, repo_data)
>         _do_update_layer_json(repodir, repo_name, layer_data)
>
> def _do_save_layer_config(layer_data):
>     print("Saving updated layer config.")
>     if args.dry_run:
>         return
>
>     with open(args.jsondata, 'w') as f:
>         json.dump(layer_data, f, ensure_ascii=False, indent=4)
>
>     print("\nReview {} for layer changes.".format(args.jsondata))
>
> def _parse_args():
>     global args
>
>     try:
>         defaultdest = os.path.dirname(subprocess.check_output('git rev-parse --show-toplevel', universal_newlines=True, shell=True, cwd=os.path.dirname(__file__)))
>     except subprocess.CalledProcessError as e:
>         defaultdest = os.path.abspath(".")
>
>     parser = argparse.ArgumentParser(description="Updates layer setup JSON in addition to layer repos with upstream remotes.")
>
>     parser.add_argument('--destdir', default=defaultdest, help='Where to find the layers (default is {defaultdest}).'.format(defaultdest=defaultdest))
>     parser.add_argument('--jsondata', default=__file__+".json", help='File containing the layer data in json format (default is {defaultjson}).'.format(defaultjson=__file__+".json"))
>     parser.add_argument('--sync-upstream', action='store_true', help="For repositories with origin and upstream remotes, merge any upstream changes to the configured branch.")
>     parser.add_argument('--dry-run', action='store_true', help="Performs a dry run, but does not make any actual changes.")
>
>     args = parser.parse_args()
>
> def _parse_layer_config():
>     with open(args.jsondata) as f:
>         layer_data = json.load(f)
>
>     supported_versions = ["1.0"]
>     if layer_data["version"] not in supported_versions:
>         raise Exception("File {} has version {}, which is not in supported versions: {}".format(args.jsondata, layer_data["version"], supported_versions))
>
>     return layer_data
>
> def main():
>     _parse_args()
>
>     layer_data = _parse_layer_config()
>     _do_update_layers(layer_data)
>     _do_save_layer_config(layer_data)
>
> if __name__=="__main__":
>     main()
>
>
>
> --
> "Perfection must be reached by degrees; she requires the slow hand of time." - Voltaire
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184211): https://lists.openembedded.org/g/openembedded-core/message/184211
> Mute This Topic: https://lists.openembedded.org/mt/100104869/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

