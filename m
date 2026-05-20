Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5756CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:24:39 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8245.1779269074398000754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 02:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iABNZZef;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50e5ad864a6so55291881cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 02:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779269073; cv=none;
        d=google.com; s=arc-20240605;
        b=Kzp1XL4Cc+jVJyzgV34RfJy8oj6OlWDXVn5tmxY9TBLUKR5IHPw3da0oV2I7RU9sPr
         J+A9Uwgg8qoprE4+7MzfP7pafxBLK6AWtpU8qTo+wtUiXZcLH+NNZf79ejq1eZFu/gz1
         VPRVLfIfj4KK/Sjx2S3Zk0IycWIcbUH9N5UGlbue5Fd5ntloGilTWvGgIGfK0ceV2YC4
         C++tUzUHIJrZohxcZKM/EVHd2YfA/+MES/ZCthDJVl1LtQAy4e1MuHSQtaTPlJCWeZ4u
         r3wZlrxkfSOv21X15YRpAxZDXvmB3+uH2CoCP/0cbJ0lWK22NaFiVH2YgbTSpF82oMB/
         F8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lDqSthtbm8zP4TA4cQnfo9/nUfUznP8faKiMsV7NAVI=;
        fh=yhT5l7IQjYfvIAKfBtNG10j44QdTws+JShOfIQwGZ/w=;
        b=Nt4zWbK4oRNhVe5zIa2GOlvAZ6XMd0lOkklaPFGyGQFABa6hVIx55XxAB5IzlYtuQn
         3R3jAa441enMba42g5Fy16FrGV8SR91f2UEUz3VmEPt0QT0S0Xipm0XDt6iCnYI8gB15
         ea7jzLNzv/tU1QDX9YdklBQHlRxqHMUxm0cPWEARBfwQPAqe8bUv+2mQ2hQMwiRKgoxr
         2mjIOAD6gJrLaV0fej735sf1/xzXtQ9mnIwIEZvNwcDxpXsUzx4/GrpMWuRIOT8Ta+vD
         rtp4oNYMufmDA4pNuYNawIjHBuRRDx3PUftcnnPEN2Q8kgALnX6rMpSMOMWMnEV0aOFb
         3T9Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779269073; x=1779873873; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lDqSthtbm8zP4TA4cQnfo9/nUfUznP8faKiMsV7NAVI=;
        b=iABNZZef2soEJK5h/f3e4g3E72mNYOe/wg+VrG5SxufT3e2InxTC30X8iZ/4pLD+zj
         zQh7QhuV/UfMXZJQYovJh9R/TI1OqyNQQoEnrtTjBlmn8GCnwd/4Bf5Fomu/HPiaR3zO
         qTo9RpDCpOsxO7vOakLenKGmPskfMpcP4FcTrf4Q3tD90ll5J2ywjZpfoBmiZux1CYF6
         GccoOzHywtRGoaMc3FxPcQQBUG+oT31W/b0w7a19PsOsxIWyx01e7sgRFd52lWLHCldG
         J0LLGiYoCrdzT2D34EPdzRdl2T4Bgf4YuQe9YNk86jqtu5vlceXs5PbzdnT4VoeM8rI4
         2aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269073; x=1779873873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDqSthtbm8zP4TA4cQnfo9/nUfUznP8faKiMsV7NAVI=;
        b=dPnCtg1AfR04vxh3NWLil0M/ba2Ws5NcfNih3ZuDB+QO6eH8nv9gY8IcsmLo0Yv9ZA
         T+Qwlr1VoYeo1Z0HWzmZUjEwHQw0vmqLj/XxW/vcF7Teu+SQ2h//wDmJIVf6cr9RGpRF
         sciE+kGmbOvhtk3WlfHczcAXz/RgfcUSHEw6H5vH/iFUILUxoTAcB+VESdNbqbztE2PI
         U33IgSjhhM7xI8V45eFZSv7yNxg28MNONGTzssPbcNaOfVjUPX9bAbZBJv98kZmSLYtm
         /tbIgINfqSulqLaI7HrH31wEGdPZdQy24M9HL9WEDi1Pc1XaG/wP3AIMrULsddrXsyEv
         VWfQ==
X-Gm-Message-State: AOJu0YywA3XKOKhOdVDCrgZ6JNcYQC6BXLUlGGgdGmyhuiNUUytiIu7P
	bC//tReK8DJe9M5GwHBl/KudGqSymWpo0PTtEbUFMzDgNmXsCukZ6HQHmOnc5+9aeQGKGbBnYYU
	YoMzTWagbvuw+KF3tPWhbS2qTmH5Gqu4=
X-Gm-Gg: Acq92OExlsRvqK2RnXo3hcZdt6K0X3XqBIFGYB4B1w3Y/Lm2VDBIoGWndwioWoTu5Qw
	AMfkOAYb2QQzXMGwrUXHtw83xUPJRfXh/dRs1Lp25c/KH+OMCjjyLHzqIfP9NfxyYKWROleeBBT
	LmsXnK5k28IxiqiWkzM9IfMzRjiWpKUwZdPfn9U1EFhRN+8iqYRO/7q1Mzx7+eE2DYFDTGnxzBf
	VKthGsEDiD6JhuMWfWHvwj91vX7QOB8XnsDApDIkVPrpNFcpCA/aYMZ4LGAZfHzIX4jHrCXn1ER
	ZXuBv0hv0c2XcSmscokV4Fv1X7SGQmyegCzCwmbQswwwzI4wrSZf
X-Received: by 2002:ac8:57cd:0:b0:50f:b1e6:a901 with SMTP id
 d75a77b69052e-5165a035e73mr331006701cf.24.1779269073350; Wed, 20 May 2026
 02:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260520051800.1951624-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260520051800.1951624-1-jamin_lin@aspeedtech.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 May 2026 11:24:21 +0200
X-Gm-Features: AVHnY4LnETATv3pTUF7tPQwEzo6wRJPmqCNGbHOYOlAfxksuybYXvXqOVvWc5co
Message-ID: <CANNYZj-i4hzB9XdtwYQmuB073mxSaLTLU+CCqZWRQi+XbYR-7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1] scripts/scriptutils: Convert nested git
 repos to standalone clones in devtool workspace
To: jamin_lin@aspeedtech.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Troy Lee <troy_lee@aspeedtech.com>, Vince Chang <vince_chang@aspeedtech.com>, 
	"paul@pbarker.dev" <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 09:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237438

There have been patches fixing similar issues, for which oe-core has
no tests or ways to reproduce. Rather than ask reviewers to set up
zephyr builds so they can observe the issue, can you add a testcase
for this to devtool's oe-selftest?

Alex

On Wed, 20 May 2026 at 07:18, Jamin Lin via lists.openembedded.org
<jamin_lin=aspeedtech.com@lists.openembedded.org> wrote:
>
> When a recipe uses multiple git SRC_URI entries with different destsuffix
> values (e.g. Zephyr-based recipes with separate repositories for the
> kernel, modules and application), do_unpack clones each source tree with
> 'git clone -n -s'.
>
> The -s flag uses git's shared-object mechanism:
> instead of copying objects locally it writes a .git/objects/info/alternates file
> pointing back to the bare repository under the downloads directory (DL_DIR/git2/).
>
> git_convert_standalone_clone() is called by devtool_post_unpack to make
> the workspace standalone: it runs 'git repack -a' to copy all objects
> into the local object store and then removes the alternates file.
>
> However it only processes the top-level source directory.  Each nested
> git repo created by a separate SRC_URI entry retains its own alternates
> file still pointing into downloads/.
>
> Steps to reproduce:
>   1. devtool modify <recipe-with-multiple-git-SRC_URI>
>   2. bitbake -c cleanall <recipe>
>   3. bitbake <recipe>
>
> At step 2, 'bitbake -c cleanall' calls fetcher.clean() which deletes
> the bare repositories from downloads/git2/. The top-level workspace
> repo is standalone (alternates already removed by the original code),
> but the nested repos still hold alternates pointing to the now-deleted
> paths.
>
> At step 3, srctree_hash_files() runs 'git add -A .' with a custom
> GIT_INDEX_FILE. Git internally calls 'git status --porcelain=2' on
> each nested repo to check for changes; this fails with exit 128 because
> the nested alternates are broken:
>   error: unable to normalize alternate object path:
>          .../downloads/git2/github.com.zephyrproject-rtos.acpica//objects
>   fatal: bad object HEAD
>   fatal: 'git status --porcelain=2' failed in submodule modules/lib/acpica
>
> This halts the BitBake parse phase with a CalledProcessError and leaves
> the workspace in an unrecoverable state without manual intervention.
>
> Fix by extending git_convert_standalone_clone() to walk the source tree
> and apply the same 'git repack -a' + remove-alternates treatment to
> every nested git repository found, making the entire workspace fully
> standalone at devtool modify time.  The walk uses dirs[:] = [] to stop
> at each git boundary so it never descends into already-converted repos.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  scripts/lib/scriptutils.py | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> index 32e749dbb1..0a83470373 100644
> --- a/scripts/lib/scriptutils.py
> +++ b/scripts/lib/scriptutils.py
> @@ -100,16 +100,36 @@ def load_plugins(logger, plugins, pluginpath):
>
>
>  def git_convert_standalone_clone(repodir):
> -    """If specified directory is a git repository, ensure it's a standalone clone"""
> +    """
> +    If specified directory is a git repository, ensure it's a standalone clone.
> +    Also converts any nested git repositories (created by multiple SRC_URI git
> +    entries with different destsuffix values) so that none of their contents
> +    depend on the shared downloads directory via alternates.
> +    """
> +
>      import bb.process
> -    if os.path.exists(os.path.join(repodir, '.git')):
> -        alternatesfile = os.path.join(repodir, '.git', 'objects', 'info', 'alternates')
> +
> +    def _convert(gitdir, workdir):
> +        alternatesfile = os.path.join(gitdir, 'objects', 'info', 'alternates')
>          if os.path.exists(alternatesfile):
>              # This will have been cloned with -s, so we need to convert it so none
>              # of the contents is shared
> -            bb.process.run('git repack -a', cwd=repodir)
> +            bb.process.run('git repack -a', cwd=workdir)
>              os.remove(alternatesfile)
>
> +    if os.path.exists(os.path.join(repodir, '.git')):
> +        _convert(os.path.join(repodir, '.git'), repodir)
> +
> +    # Also handle nested git repos created by multiple SRC_URI git entries
> +    # with different destsuffix values. Each nested repo is cloned with -s
> +    # and has its own alternates pointing to the downloads directory.
> +    for root, dirs, files in os.walk(repodir):
> +        if root == repodir:
> +            continue
> +        if '.git' in dirs:
> +            _convert(os.path.join(root, '.git'), root)
> +            dirs[:] = []  # don't recurse into nested repos
> +
>  def _get_temp_recipe_dir(d):
>      # This is a little bit hacky but we need to find a place where we can put
>      # the recipe so that bitbake can find it. We're going to delete it at the
> --
> 2.43.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237382): https://lists.openembedded.org/g/openembedded-core/message/237382
> Mute This Topic: https://lists.openembedded.org/mt/119403462/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

