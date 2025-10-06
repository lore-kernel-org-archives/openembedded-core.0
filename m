Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D156CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:49:19 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.34264.1759758547355836934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MhCsovb/;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-79390b83c7dso40641636d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759758546; x=1760363346; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rAY2mRc3wNjSkiuaSrpssg3GGN90EuLIOLNyRoVzukw=;
        b=MhCsovb/Zd73Uk0zWdvwRkZsjooN0jQd+4JPug4nc4vE7AF20OppTvZW+/z3w4tKTR
         +qh2Hgg5FEw4d6GQy4atTPylsxGX+WLcacp8kiqPiVw6Y9KAzn/qovRre7Y8s4suxlNm
         XRAOEnlgnhgSFgjtOiiXmae0MdF78LSUbtwJOtUV8zCI8t0iiC2P9rrgHq8pF+i4SbSm
         7Ol0gevx9deA0JspDEeGJ2nICxnXrMxQMzldnGtVeIb/W7ROnAeJdMuvJ2edM+aKD7iN
         veZ5Vd6sVGV1yh521YjKzowYgvTFJB51sVCxMfDxskjV3sA3rfKEhEXYa/wwgfWfr9eN
         aqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758546; x=1760363346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAY2mRc3wNjSkiuaSrpssg3GGN90EuLIOLNyRoVzukw=;
        b=F1iSdWxUZ95Ey7HGWnFhswfyP9X2/mpcUEgeYMnQyZuq5plWDLVd2BeVcgIz8vWSK7
         2LY4DYqkuu2PdCeFV2WiZiBhYWfParkvA7f6P8JUwucioRGDKAeMvEDkq7BJx/yzjlY7
         Ke/6wvSPys8AqCEclR2Mavta+zhvIZpVekjVk4vXwwW1glwDRYZ+aMCoQoglArwFWxvp
         21hu5lojW3T0WqJvrcDCFrNj8xYecCp9cZ/7u2Xuzn80cC+QM6WllZU4mJzTEGx2KV4q
         2piQNP8AkuCu7Lmkc/JjqXzjfsqOjrIHhqXm3lr0HssA98cisF6W0YXbNT+MNCJNPXSo
         MbhA==
X-Gm-Message-State: AOJu0YwpckKdzjWY0kbluaZpcO85Oko2i0nlTiJ+ichgJJ61VY5gp1uh
	vHo0NyGbHxmDqnZwmc+x0/+URvpfMxKNmcXtIEgIFkmBiScCqc0yBLlKZFQwXJn/UYiw7yfy80F
	4MS275+x7FLEbjXd6YL6oCmYLdWL1JJw=
X-Gm-Gg: ASbGncvT7sEth5mcrJWM5pk6dtyVUeX5x8KociXz3G7SXvaLBhaNcA21kFSRpoZ53Iy
	BB5ZyzCawokDTCFPmtRIKKSQsKEyzWcypD3c624m/UGk+xP7l72BXZw5NjP/LrxhDf11F+d7Ea7
	A1Go9AAWLBeEEntKx/a0odYW6q/h+LU8+r2v+SKOl+mZ5mha50EAq6Fz435qDCDyXcajKTg7y3I
	kJlx+bmkvpcj1Gtx7hl1WST1Tp0a2nUco2/R0epPej9WYFaZTyPX9LbHB7e2O+VvqfzUbCTMYxG
	xpKT+6K4/GTRadkhmshbQDIp8z50mkr4uS5/W65TWmSZ5LdbiHUASLxcdpMd1giA
X-Google-Smtp-Source: AGHT+IHbRErA/Q3fIH4ZFB7Buk9bKjLfijnmnCfHggBrkB+jIcTW9CjI373Nf+Sw+db3L1obW8R5IxH1YQ5go0hy8ZY=
X-Received: by 2002:a05:6214:1d29:b0:78e:271a:cc86 with SMTP id
 6a1803df08f44-879dc82d4ffmr165028626d6.31.1759758546196; Mon, 06 Oct 2025
 06:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251006132112.847125-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20251006132112.847125-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Oct 2025 15:48:54 +0200
X-Gm-Features: AS18NWDgzwitL2JPEu2FqX8wmXoprfvJW2p_ApbS7A-8v87f07bu9zXPYkrOJsg
Message-ID: <CANNYZj-b1DCipkYn_w1=Xbaeuxcp6gXYaGtgG+CPVEkTMOjSXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf,lib/configfragments: Use a new
 dedicated toolcfg.conf file
To: richard.purdie@linuxfoundation.org, 
	Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224487

I sent a ref-manual update to docs@ list that reflects this change.

Alex

On Mon, 6 Oct 2025 at 15:21, Richard Purdie via lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> Rather than using auto.conf which already has established use in CI, or
> local.conf which users expect to own/control, start writing "tooling"
> controlled settings to a toolcfg.conf.
>
> This frees CI to handle auto.conf as it wants, but avoids the tooling
> breaking users local.conf files.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf                    | 1 +
>  meta/lib/bbconfigbuild/configfragments.py | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index eebefc48406..8d1ea5491de 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -813,6 +813,7 @@ FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE
>  require conf/abi_version.conf
>  include conf/site.conf
>  include conf/auto.conf
> +include conf/toolcfg.conf
>  include conf/local.conf
>
>  OE_FRAGMENTS_PREFIX ?= "conf/fragments"
> diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
> index 34c6a3b4bcc..21baedc9a42 100644
> --- a/meta/lib/bbconfigbuild/configfragments.py
> +++ b/meta/lib/bbconfigbuild/configfragments.py
> @@ -115,7 +115,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
>      def create_conf(self, confpath):
>          if not os.path.exists(confpath):
>              with open(confpath, 'w') as f:
> -                f.write('')
> +                f.write('# Automated config file controlled by tools\n')
>          with open(confpath, 'r') as f:
>              lines = f.read()
>          if "OE_FRAGMENTS += " not in lines:
> @@ -184,7 +184,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
>              print("All fragments removed from {}.".format(args.confpath))
>
>      def register_commands(self, sp):
> -        default_confpath = os.path.join(os.environ["BBPATH"], "conf/auto.conf")
> +        default_confpath = os.path.join(os.environ["BBPATH"], "conf/toolcfg.conf")
>
>          parser_list_fragments = self.add_command(sp, 'list-fragments', self.do_list_fragments, parserecipes=False)
>          parser_list_fragments.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224485): https://lists.openembedded.org/g/openembedded-core/message/224485
> Mute This Topic: https://lists.openembedded.org/mt/115616756/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

