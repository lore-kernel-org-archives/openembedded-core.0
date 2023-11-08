Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A8CC4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 11:24:06 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.11231.1699442641371013607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 03:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MUYMLwFA;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507bd19eac8so8820137e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699442639; x=1700047439; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FjoGqouYT8VVjeMulsWOLh7iR/+emHG/TctxpGeTehc=;
        b=MUYMLwFAOOSXOsviq6ejtVo+9xUtAqO/S67Co7Gj/5trtIxGAc+KRL26JuWOAJnIU/
         Ml6q4+J9yL3tgRKKXE4L7qKLsH3K8kDM7mPmosDdYBfE2NO65RYieFU03aN6CwFdu/OC
         FRxGkz9tIsQWo2sxoBg4LpjnVMNh5JWWeRBLB4EhuCtOwwMmZifoQgQvUm8PnIir6BqY
         gkx9nepq+bzNT31d/iiWsc0ixfiBoCCV5uUc7P8SHSNaqGATlP4cQ0zXWIm0qZxEu9KZ
         2unmVwuK7l9AoUI5lblUusq9p/gEXR4DXfUoO0itM3pxW+NB2qiI4LFTjZuP1Pp6aEkj
         Xpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699442639; x=1700047439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjoGqouYT8VVjeMulsWOLh7iR/+emHG/TctxpGeTehc=;
        b=tYl4gVtJ1sNk+NxbhKyGgxqSAjp7uC7IiNiDIX7KJrc3d/KBQ/ZaKqShx26O6dJloW
         9IT8lJ7U9NA87tsM+V4FOaTn/LfaAqpIZsbP6R0XYdBZbb503YduDuSV3lqvbu7hbRN2
         IMH3OOU7mMjrrE860J1Ci+g05BrnBSuKhBZQC8mWY2mrCSRUzlGuAzl9uxUBNbtSoMB4
         sGXERbELh4RApjIXy0+6exW4alRMrrAGkPzjs4SdYxbWvXyJJk1m47TwVbP3rzjJKba3
         fSPcMt6dZMd8xJL9WiKjSUYiL2dRkbWzGGbHe09X5rgN/P4VKP9R38Nq2AY1Beyl0IG7
         c0kg==
X-Gm-Message-State: AOJu0YyUsaWnug8bQj5DAO4n3LmJ8dCJRdPWJ2bKVwFIiiaewROO4hM8
	w94hGXp4z4h1xsGW+Dv+7uch+oyjd9JxSmKSEz6LSIiR
X-Google-Smtp-Source: AGHT+IFZ2ToCYM0ni8HGB+Suvsb61L9OyULXkJ5NOEOLMElujF8x4li8lSqX7ZTQg1S0qHxMjiPzQyWKmdbh8IDLkns=
X-Received: by 2002:a05:6512:108b:b0:500:b42f:1830 with SMTP id
 j11-20020a056512108b00b00500b42f1830mr1275549lfg.63.1699442639310; Wed, 08
 Nov 2023 03:23:59 -0800 (PST)
MIME-Version: 1.0
References: <20231107152641.1043-2-jermain.horsman@nedap.com> <20231107152641.1043-8-jermain.horsman@nedap.com>
In-Reply-To: <20231107152641.1043-8-jermain.horsman@nedap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Nov 2023 12:23:47 +0100
Message-ID: <CANNYZj_KbgyoEnXe1F815bcjMO+H_s9k1RbPzbpcxOxfNwpQBQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC 6/7] bitbake-layers: Add default remote to layers-setup.json
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 11:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190318

I think adding this field can be avoided if remote and branch are
combined with / separator in the already existig 'rev' field?

E.g. 'git checkout poky-contrib/master' and 'git checkout
origin/master' both work here. The idea is that 'rev' contains
basically what we give to 'git checkout' in the setup-layers script.
Can be a tag too.

Will that cause issues?

Alex

On Tue, 7 Nov 2023 at 16:28, Jermain Horsman <jermain.horsman@nedap.com> wrote:
>
> From: Jermain Horsman <jermain.horsman@nedap.com>
>
> Having a default remote present allows for the checkout of a
> branch in the case multiple remotes are available.
>
> This requires an update to the json-schema and associated checks.
>
> Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
> ---
>  meta/files/layers.example.json                    | 5 ++++-
>  meta/files/layers.schema.json                     | 8 ++++++--
>  meta/lib/bblayers/makesetup.py                    | 1 +
>  meta/lib/bblayers/setupwriters/oe-setup-layers.py | 2 +-
>  scripts/oe-setup-layers                           | 2 +-
>  5 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
> index 0a6a6a7b48..06ba196cf6 100644
> --- a/meta/files/layers.example.json
> +++ b/meta/files/layers.example.json
> @@ -4,6 +4,7 @@
>              "contains_this_file": true,
>              "git-remote": {
>                  "branch": "master",
> +                "default-remote": "remote-alex",
>                  "describe": "",
>                  "remotes": {
>                      "remote-alex": {
> @@ -17,6 +18,7 @@
>          "meta-intel": {
>              "git-remote": {
>                  "branch": "master",
> +                "default-remote": "origin",
>                  "describe": "15.0-hardknott-3.3-310-g0a96edae",
>                  "remotes": {
>                      "origin": {
> @@ -30,6 +32,7 @@
>          "poky": {
>              "git-remote": {
>                  "branch": "akanavin/setup-layers",
> +                "default-remote": "poky-contrib",
>                  "describe": "4.1_M1-374-g9dda719b2a",
>                  "remotes": {
>                      "origin": {
> @@ -44,5 +47,5 @@
>              "path": "poky"
>          }
>      },
> -    "version": "1.0"
> +    "version": "1.1"
>  }
> diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
> index 659ee8da49..06a34656e5 100644
> --- a/meta/files/layers.schema.json
> +++ b/meta/files/layers.schema.json
> @@ -7,8 +7,8 @@
>      ],
>      "properties": {
>          "version": {
> -            "description": "The version of this document; currently '1.0'",
> -            "enum": ["1.0"]
> +            "description": "The version of this document; currently '1.1'",
> +            "enum": ["1.1"]
>          },
>          "sources": {
>              "description": "The dict of layer sources",
> @@ -41,6 +41,10 @@
>                                          "description": "The git branch to fetch (optional)",
>                                          "type": "string"
>                                      },
> +                                    "default-remote": {
> +                                        "description": "The default git remote",
> +                                        "type": "string"
> +                                    },
>                                      "rev": {
>                                          "description": "The git revision to checkout",
>                                          "type": "string"
> diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
> index d24470dc83..0d0e42e1d0 100644
> --- a/meta/lib/bblayers/makesetup.py
> +++ b/meta/lib/bblayers/makesetup.py
> @@ -62,6 +62,7 @@ class MakeSetupPlugin(LayerPlugin):
>                          'rev':l_rev,
>                          'branch':l_branch,
>                          'remotes':self._get_remotes_with_url(repo_path),
> +                        'default-remote':oe.buildcfg.get_metadata_git_default_remote(repo_path),
>                          'describe':oe.buildcfg.get_metadata_git_describe(repo_path)}}
>                  if repo_path == destdir_repo:
>                      repos[repo_path]['contains_this_file'] = True
> diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
> index d5bc19a8cb..4e0c780eab 100644
> --- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
> +++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
> @@ -36,7 +36,7 @@ class OeSetupLayersWriter():
>          if not os.path.exists(args.destdir):
>              os.makedirs(args.destdir)
>          repos = parent.make_repo_config(args.destdir)
> -        json = {"version":"1.0","sources":repos}
> +        json = {"version":"1.1","sources":repos}
>          if not repos:
>              raise Exception("Could not determine layer sources")
>          output = args.output_prefix or "setup-layers"
> diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
> index ac9a9f139b..4622c264f9 100755
> --- a/scripts/oe-setup-layers
> +++ b/scripts/oe-setup-layers
> @@ -191,7 +191,7 @@ args = parser.parse_args()
>  with open(args.jsondata) as f:
>      json_f = json.load(f)
>
> -supported_versions = ["1.0"]
> +supported_versions = ["1.0", "1.1"]
>  if json_f["version"] not in supported_versions:
>      raise Exception("File {} has version {}, which is not in supported versions: {}".format(args.jsondata, json_f["version"], supported_versions))
>
> --
> 2.42.0.windows.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190296): https://lists.openembedded.org/g/openembedded-core/message/190296
> Mute This Topic: https://lists.openembedded.org/mt/102444611/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

