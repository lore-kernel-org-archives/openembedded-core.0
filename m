Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE220C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 10:08:16 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.28192.1701857289266769433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 02:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jZsTFwKs;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ca02def690so43022201fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 02:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701857287; x=1702462087; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PS8XdNRLKkfXISkUMYi7Lun1FcNPBRhG/zWrisZreNI=;
        b=jZsTFwKsF2+nMpM9oFmIQr1al8mPDlx+tg+DE1O7tcdaZzPGWP8iBlOfIryygELsOd
         2coAQEDvxpGmXhCvYo967FvngVVuNQUcgfbDz4aPFz9o41Q26niMQw02OSzBwFTQgTHJ
         kLSpOSM60EA4t4rZ7sIhh+PiXFjhbb/wDTkg3f953mctf41WGF8k2lRJ1mN9ksThKrq+
         /WEZ8AbI3BuTEsSm9ZU8NKIM1mX3FZTOvm/d3sJ8sPj6P4TXb98RXaDImp2Ou1a76vz6
         D1VUiyoxfIBvEBs11B4EhA1P2RBERkpT/dJaAiKbABmvUC5kh/hQqr8zXJYWoeD5tdAH
         4xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857287; x=1702462087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PS8XdNRLKkfXISkUMYi7Lun1FcNPBRhG/zWrisZreNI=;
        b=qywqvCNtNs6jWHxpvKUCE2+FbbPSXU7G9sAWsOcKgeaqGdWkrqNQy8Ku0VOL0uWLgS
         izjd6eZKdVSWXCrJsYouzU6qDLbVOO2yvDANzuTZo2Ga1TK6CkcCVUlryEfleujdkcHz
         2omBXuOWjvLe+KcKi+gmcOG6NCjgEYqQhjnvBz/5V+25vFOJ8kG9Ic3/zOhQTkh8zQdY
         sUsNG2LF8WGmfd7WEYY9jvg4aBV02AlL+Vsl/jrf9UGdCTUYYOW48vslsKCWu0PelaBT
         AinNZTQ0Ly1GrllWYY9+PeMf4ob3bFWbv2GOO/+MqMLeFhQaZ7opR7beg9h2t94OL8lj
         YerQ==
X-Gm-Message-State: AOJu0Yy2LXq/SbOJM8IkuejTrgRQSYKNSMjcsDez19fDa7CCYlaqSPsE
	NG/3hEqZ2AGvMkOuXIyd/UBrWbDBtUdOixEA/CQ=
X-Google-Smtp-Source: AGHT+IG3UzwTIVzwy7bYf1vGKHD1kXnykVsFtgCNvIi4u+eqnlg3e/0mnG6xZKP/O1nsJbmk1X3u9W9aCUvFv+WySX8=
X-Received: by 2002:a2e:7202:0:b0:2ca:5e:d16a with SMTP id n2-20020a2e7202000000b002ca005ed16amr461634ljc.17.1701857287136;
 Wed, 06 Dec 2023 02:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20231206092536.2874022-1-andrey.z@gmail.com>
In-Reply-To: <20231206092536.2874022-1-andrey.z@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Dec 2023 11:07:55 +0100
Message-ID: <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
To: Andrey Zhizhikin <andrey.z@gmail.com>, Jermain Horsman <jermain.horsman@nedap.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 10:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191881

Unfortunately I have to say no to this. The problem is that this will
update to latest revisions on all the layers, which I believe is not
what people would want, as everything including poky etc. will be
shifting uncontrollably.

Conceptually, I would not want oe-setup-layers to suffer from feature
creep and become bloated and difficult to maintain. Every little
enhancement is pushing in that direction. It has a json, it does what
the json prescribes, end of story.

We've previously discussed with Jermain how this can be solved on the
bitbake-layers side, e.g. that tool would write out a json where some
layers don't have a hardcoded revision. I think work to implement that
has stalled, not sure. But it's not difficult to add.

Alex



On Wed, 6 Dec 2023 at 10:25, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Current script implementation uses revisions recorded in JSON file to
> replicate previously recorded setup. While this is useful for complete
> layer setup reproducibility, this does not allow the setup "upgrade" where
> this script can be used to use remote branch information and latest HEAD,
> have the setup restored, and then saved using updated revisions.
>
> Add new '--skip-revs' parameter which can be used to obtain the updated
> layer setup.
>
> Following set of operations could be executed to achieve this:
> 1. Restore initial layer setup using remote branch HEAD instead of recorded
>    revisions by specifying --skip-revs.
> 2. After layer setup is created, JSON file containing updated revisions is
>    retrieved via `bitbake-layers create-layers-setup`
> 3. Updated JSON file can be checked in to bootstrap repository and used
>    later without '--skip-revs' to replicated updated setup.
>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> ---
>  scripts/oe-setup-layers | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
> index 6d49688a32..a4941450d3 100755
> --- a/scripts/oe-setup-layers
> +++ b/scripts/oe-setup-layers
> @@ -69,6 +69,13 @@ def _do_checkout(args, json):
>          remotes = r_remote['remotes']
>
>          print('\nSetting up source {}, revision {}, branch {}'.format(r_name, desc, branch))
> +        if args['skip_revs']:
> +            if branch and (branch != 'HEAD'):
> +                print('\nSkip revision option used, remote {} branch {} HEAD will be used instead of {}'.format(r_name, branch, rev))
> +                rev = branch
> +            else:
> +                print('\nBranch info is missing in json, --skip-revs option is not used')
> +
>          if not _is_repo_git_repo(repodir):
>              cmd = 'git init -q {}'.format(repodir)
>              print("Running '{}'".format(cmd))
> @@ -108,6 +115,7 @@ except subprocess.CalledProcessError as e:
>
>  parser.add_argument('--destdir', default=defaultdest, help='Where to check out the layers (default is {defaultdest}).'.format(defaultdest=defaultdest))
>  parser.add_argument('--jsondata', default=__file__+".json", help='File containing the layer data in json format (default is {defaultjson}).'.format(defaultjson=__file__+".json"))
> +parser.add_argument('--skip-revs', action='store_true', help='Skip revisions recorded in json manifest, and use latest revision on branch to restore setup')
>
>  args = parser.parse_args()
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191879): https://lists.openembedded.org/g/openembedded-core/message/191879
> Mute This Topic: https://lists.openembedded.org/mt/103009912/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

