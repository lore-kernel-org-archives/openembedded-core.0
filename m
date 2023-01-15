Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25833C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 20:06:03 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.148925.1673813156769027428
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 12:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eQ+968l+;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id s25so28033485lji.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m96BicU9vwFzfRKgBLCb412yozHDtZPIIgDqk64SRto=;
        b=eQ+968l+hN6R6wveM/onSTEeNmEa+b8tcu4q8/ABXISF3ntyh+oaDhJlTuThNYGNq+
         QXMmttuppGpAKny2Det0hyEuDiZynznQQz4+udaZkzukTV0EAGfnbzsfJKwRJ6jbo0hE
         OAVYAdamaHbEOcW0nh0JoBxDev5ad2mJcMVtPFv6bV9EjgWUcxcmEokf9tV5ZVd8KIJE
         EANYm4szgdsqpJR8SJ9TeDR9WbTRkUDIszbCy8PS+DaR4heVgsHkOBhBihiHpHldeUV3
         dl+v7E1Nj3EKPKOdu5rCYrz8lPcwe7GEMAuskiZay2yCZ5H6YD4nJodLRCz+20FbHCVY
         R5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m96BicU9vwFzfRKgBLCb412yozHDtZPIIgDqk64SRto=;
        b=uHc0LzNlc7IeT2AeDVnszdnLaRlKSSTUla1dmsueIA8iwcChD5/wtYTs9SbPszm2zJ
         /ehr1uL/0y6ocRyxTJyDesVk2Chg5wX5+enMp6V5feLhYduaYo8OR3JWiAFUUSfW0MWe
         eNXLLaY6NOOl9xsTOz6F+iY/gWx6z6aIhO3oH+l4WqbQlQwpAQ7V++GDgSJhwqmrxNdY
         pc6bNxFikjfjC5C6T2KpLg2PsVLrwdvyM96oD9DXXxs+ifnTTXUlc0nFOhUJCRUOTCp5
         eHoUBatqckUt9xB4bmKNY17fljQi8R7F6+KycqN6mnOmQI5rpQ8czj426ip9oHYlLx3r
         0Tcw==
X-Gm-Message-State: AFqh2kpjcICREHznmtjmxqefJh/yPirfacyAiHHqpEDE53or/S4NkAcU
	CEvVvjwY/F0DFBpoRj49VCIYkVpaMK8QT0wUvWo=
X-Google-Smtp-Source: AMrXdXuiG+UuT6S715C9tr15Md4J3sCw0Vx594eyIvxblgjvZaavz2hnIWLMiUm3jNMN8MAkyUgUB56t38No1wlfwTI=
X-Received: by 2002:a2e:b4a5:0:b0:282:5f2d:62dc with SMTP id
 q5-20020a2eb4a5000000b002825f2d62dcmr2566937ljm.217.1673813154463; Sun, 15
 Jan 2023 12:05:54 -0800 (PST)
MIME-Version: 1.0
References: <1673744037-3484-1-git-send-email-chuck.wolber@boeing.com>
In-Reply-To: <1673744037-3484-1-git-send-email-chuck.wolber@boeing.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Jan 2023 21:05:42 +0100
Message-ID: <CANNYZj8QFcejeTh_3NFhLpdFSQxcHh6MZKiz9=G4YU6MSU24tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Make oe-setup-layers efficiently idempotent
To: Chuck Wolber <chuck.wolber@boeing.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 20:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175956

Thanks. Do you think the tests for the script should as well be
adjusted so that they fail without the change, and pass with it?
(test_bitbakelayers_setup in meta/lib/oeqa/selftest/cases/bblayers.py)

This is clearly fixing a problem you saw in local testing, and it
would be good to ensure the problem does not silently reoccur in the
future.

Alex

On Sun, 15 Jan 2023 at 01:54, Chuck Wolber <chuck.wolber@boeing.com> wrote:
>
> The effect of subsequent setup-layers executions is now either a NOOP
> or the minimal set of changes required to ensure layers precisely match
> the JSON configuration.
>
> This change allows setup-layers to be incorporated into a team's
> configuration management strategy. In particular, the configuration
> JSON manages a "pinning policy" that documents the oversight of sources
> of change (a requirement for embedded development in highly regulated
> industries).
>
> One model for this strategy would work as follows. Team level policy is
> developed to regularly review upstream commits that occur between the
> current upstream HEAD and the previously pinned revision. The JSON
> configuration is periodically updated after a review, test, and approval
> process. In the rare instance that an upstream change is considered
> problematic, the bbappend mechanism can be used to make relevant
> changes in the team's project repository. This approach also requires
> that team developers regularly run the project repository copy of
> setup-layers. This is most easily accomplished by including setup-layers
> in a wrapper script that all team developers use to interact with the
> bitbake tool suite (e.g. "bb bitbake foo-image"). Project level policy
> and oversight is effectively "contained" within this wrapper script,
> thereby reducing a significant source of human error.
>
> It is also worth noting that, where project level policy cannot be
> asserted on layers with the bbappend mechanism (e.g. bbclass files), a
> patch set can be checked in to the project repository and automatically
> managed by the wrapper script. Patch management against local layer
> clones would be superficial in nature (not pushed upstream). This
> enables projects to "pull in" functionality and manage bug fixes on an
> as-needed basis.
>
> Left unstated, but acknowledged here, are a number of nuances required
> to successfully implement this strategy e.g. setup-layers does not work
> so well if your layer clone is dirty from locally applied patches, etc.
> The details are out of scope for this explanation. What should be
> clear is that a larger configuration management strategy can now benefit
> from the utility provided by setup-layers.
>
> Note: Neither the above configuration management strategy example nor
> the change itself is intended to alter the original intent to use
> "bitbake-layers create-layers-setup destdir" to keep pace with upstream
> activity for those who wish to use it that way.
>
> Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
> ---
>  scripts/oe-setup-layers | 55 +++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
> index 7fe250c..a042a6c 100755
> --- a/scripts/oe-setup-layers
> +++ b/scripts/oe-setup-layers
> @@ -10,12 +10,42 @@
>  # bitbake-layers create-layers-setup destdir
>  #
>  # It is recommended that you do not modify this file directly, but rather re-run the above command to get the freshest upstream copy.
> +#
> +# This script is idempotent. Subsequent runs only change what is necessary to
> +# ensure your layers match your configuration.
>
>  import argparse
>  import json
>  import os
>  import subprocess
>
> +def _is_layer_git_repo(layerdir):
> +    git_dir = os.path.join(layerdir, ".git")
> +    if not os.access(git_dir, os.R_OK):
> +        return False
> +    try:
> +        return subprocess.check_output("git -C %s rev-parse --is-inside-git-dir" % git_dir, shell=True, stderr=subprocess.DEVNULL)
> +    except subprocess.CalledProcessError:
> +        return False
> +
> +def _is_layer_at_rev(layerdir, rev):
> +    try:
> +        curr_rev = subprocess.check_output("git -C %s rev-parse HEAD" % layerdir, shell=True, stderr=subprocess.DEVNULL)
> +        if curr_rev.strip().decode("utf-8") == rev:
> +            return True
> +    except subprocess.CalledProcessError:
> +        pass
> +    return False
> +
> +def _is_layer_at_remote_uri(layerdir, remote, uri):
> +    try:
> +        curr_uri = subprocess.check_output("git -C %s remote get-url %s" % (layerdir, remote), shell=True, stderr=subprocess.DEVNULL)
> +        if curr_uri.strip().decode("utf-8") == uri:
> +            return True
> +    except subprocess.CalledProcessError:
> +        pass
> +    return False
> +
>  def _do_checkout(args, json):
>      oesetupbuild = None
>      layers = json['sources']
> @@ -37,23 +67,30 @@ def _do_checkout(args, json):
>          remotes = l_remote['remotes']
>
>          print('\nSetting up source {}, revision {}, branch {}'.format(l_name, desc, branch))
> -        cmd = 'git init -q {}'.format(layerdir)
> -        print("Running '{}'".format(cmd))
> -        subprocess.check_output(cmd, shell=True)
> +        if not _is_layer_git_repo(layerdir):
> +            cmd = 'git init -q {}'.format(layerdir)
> +            print("Running '{}'".format(cmd))
> +            subprocess.check_output(cmd, shell=True)
>
>          for remote in remotes:
> -            cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
> +            if not _is_layer_at_remote_uri(layerdir, remote, remotes[remote]['uri']):
> +                cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
> +                print("Running '{}' in {}".format(cmd, layerdir))
> +                subprocess.check_output(cmd, shell=True, cwd=layerdir)
> +
> +                cmd = "git fetch -q {} || true".format(remote)
> +                print("Running '{}' in {}".format(cmd, layerdir))
> +                subprocess.check_output(cmd, shell=True, cwd=layerdir)
> +
> +        if not _is_layer_at_rev(layerdir, rev):
> +            cmd = "git fetch -q --all || true"
>              print("Running '{}' in {}".format(cmd, layerdir))
>              subprocess.check_output(cmd, shell=True, cwd=layerdir)
>
> -            cmd = "git fetch -q {} || true".format(remote)
> +            cmd = 'git checkout -q {}'.format(rev)
>              print("Running '{}' in {}".format(cmd, layerdir))
>              subprocess.check_output(cmd, shell=True, cwd=layerdir)
>
> -        cmd = 'git checkout -q {}'.format(rev)
> -        print("Running '{}' in {}".format(cmd, layerdir))
> -        subprocess.check_output(cmd, shell=True, cwd=layerdir)
> -
>          if os.path.exists(os.path.join(layerdir, 'scripts/oe-setup-build')):
>              oesetupbuild = os.path.join(layerdir, 'scripts/oe-setup-build')
>
> --
> 1.8.3.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175861): https://lists.openembedded.org/g/openembedded-core/message/175861
> Mute This Topic: https://lists.openembedded.org/mt/96278464/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

