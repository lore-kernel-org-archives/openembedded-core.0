Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C759CCFA04
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 10:17:29 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17368.1762165047483558258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 02:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GfFsI4Xb;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88033f09ffeso31526226d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 02:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762165046; x=1762769846; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9RLNcwAwOrFyxFBRgXERghz0R/j2X7pSoSDVhxvYFB4=;
        b=GfFsI4XbK6eHgkuAyOgJY920rnH/SR3DUgJfUuccfFaTFrjHxaJHL94OLmDMQ4LDaA
         p52e7/KV/VgRfIiK4Q5+UDgj877mrkHmXL7JBs0CRa6dJxGg9LC0mKBnb3HBKJhSlbl/
         BmJYFaDIuYBSaHuXJOcPvJ/vUetqUJSvm1LlGdzPnhI3+8iLzYsmEEApE3SsRqwzoYCT
         sm3QqduUdqcnyn3ciZgFKEcgAOlvBcGEMV+k3oBJqXnUL9KHWij2lfVXN0gaXIjcNQEq
         wPKX2e3N2m/AdLX1ha3aqzceUDcBGdDoMtjeQ4YqBKJhsxm8FKgVYTDhnImmwMlrMzYN
         MTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165046; x=1762769846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RLNcwAwOrFyxFBRgXERghz0R/j2X7pSoSDVhxvYFB4=;
        b=kygCxDqAKYxpyhDWCtEQrB1UhXxxRWlAc3BMJn87QUgrf9yT8E7u+3HhrpoJCOOmPd
         QliYWr8f0MMcxgwalOhrh4i+1eRcUUdGprNNuqwkZuCwei+oJcNkD7xFCq0YE0GsJFTZ
         iAcX98vyhGFFv7fvEa6XkK3FjyX+6neW/7bpKcR75JUszTXXR/Mgu1/8F3/Zxs1hsrM5
         6XKMvuzXKddZq2CvAWXUoZNt8x24WflW2fmouxTz4GWDA4PBllvS1ggquyGrSpor/SEO
         PvJTFJleb31KoSUFIOSkksX2Rrw0Muv8IwkAkiLlg3eHdtGgZX3KEnFdpNfNAUQ0XsP2
         Yt1Q==
X-Gm-Message-State: AOJu0YyZCk39PkAIH4ZZi0AeE6zIOTPthZrTZOOSU/PFZhloFnAfy576
	fDLQEeJFjCH217AfBPCA22wOTWJc0lYi5TQSRDujKxgMXcz9I3twOgcqyWESsythunbLubhMiQW
	jOIPNMy8VP3SDSAY5MWapvhUl2bNyyBdYBQ==
X-Gm-Gg: ASbGncvc6KFq3dfUe3eRIyUqeKxzORiWxNYkC6zS4PTIS2YdhMk0XUYioHFb7NuO7aN
	Tyyw3NhJ/ETMYbL5+kDWIHKc4DTSIw5TY/JaKaHbbomPpIxfXCC5tWWL3FahktYTuEXgsDVnZWm
	kpMPFh4J/NZUCQdNjjfEMEi1DL2xq70wGkUNdHhhJujRpBKtC5+lGiC6ff9M3NLfbcR6E3bNGEj
	pRqnqkZ7UfUFJViJ/HU/RiZqz6pDdNDe51TyoNXxckNTce71pfCux07mLQAU3XHhBLomkDY9p1F
	0NMOzNIOfD8LIsDtd0d/MDMHrOyEKdxJJelkXDGZ
X-Google-Smtp-Source: AGHT+IEP1vJdA2BMZGpahGjRB1MVi6UpsWZP93Qcwcr1daaaE+tMec5VhLrQHtFAsviphgQX+2YEBMIGpNGYwICfVLo=
X-Received: by 2002:ad4:5c4d:0:b0:880:4a49:75c7 with SMTP id
 6a1803df08f44-8804a498153mr96581796d6.39.1762165046175; Mon, 03 Nov 2025
 02:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20251101225744.3856186-1-yoann.congal@smile.fr>
In-Reply-To: <20251101225744.3856186-1-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Nov 2025 11:17:14 +0100
X-Gm-Features: AWmQ_bm1QLPM4y1jYRG-QAsczVp9rU9rhZQqp1CAWnEaTFYgaHEsZJEeQq1dljA
Message-ID: <CANNYZj-zwr2qLTD1LaA-FoYHKrgSi0Ez6pnVx3rG69hoQgbbPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-layers: make "path" optional
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 10:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225640

Thanks, lgtm.

Alex

On Sat, 1 Nov 2025 at 23:58, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Layer names and path are often redundant. Allow users to omit the path
> key when it is equal to the layer name by using the layer name as a
> default value for its path.
>
> For example, from layers.example.json:
>   "sources": {
>       "meta-alex": {
>           "path": "meta-alex"
>       },
>       "meta-intel": {
>           "path": "meta-intel"
>       },
>       "poky": {
>           "path": "poky"
>       }
>   },
>
> Update the schema to stop requiring "path" and remove it in example for
> "meta-intel".
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/files/layers.example.json | 3 +--
>  meta/files/layers.schema.json  | 3 ---
>  scripts/oe-setup-layers        | 2 +-
>  3 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
> index 0a6a6a7b489..f3b65220831 100644
> --- a/meta/files/layers.example.json
> +++ b/meta/files/layers.example.json
> @@ -24,8 +24,7 @@
>                      }
>                  },
>                  "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
> -            },
> -            "path": "meta-intel"
> +            }
>          },
>          "poky": {
>              "git-remote": {
> diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
> index 659ee8da498..b5c13fdb5c9 100644
> --- a/meta/files/layers.schema.json
> +++ b/meta/files/layers.schema.json
> @@ -17,9 +17,6 @@
>                  "type": "object",
>                  "description": "The upstream source from which a set of layers may be fetched",
>                  "additionalProperties": false,
> -                "required": [
> -                    "path"
> -                ],
>                  "properties": {
>                      "path": {
>                          "description": "The path where this layer source will be placed when fetching",
> diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
> index 6fbfefd656f..31cb9632515 100755
> --- a/scripts/oe-setup-layers
> +++ b/scripts/oe-setup-layers
> @@ -66,7 +66,7 @@ def _do_checkout(args, json):
>      oesetupbuild = None
>      for r_name in repos:
>          r_data = repos[r_name]
> -        repodir = os.path.abspath(os.path.join(args['destdir'], r_data['path']))
> +        repodir = os.path.abspath(os.path.join(args['destdir'], r_data.get('path', r_name)))
>          repodirs.append(repodir)
>
>          if 'contains_this_file' in r_data.keys():
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225566): https://lists.openembedded.org/g/openembedded-core/message/225566
> Mute This Topic: https://lists.openembedded.org/mt/116073776/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

