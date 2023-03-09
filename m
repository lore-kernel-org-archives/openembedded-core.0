Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBEBC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:32:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.16421.1678375962869151129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BmjsdO9S;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id n2so2766154lfb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375961;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fudfvsA5eeiTTA5iRCcbEqys1EsMnydotycFpguunFw=;
        b=BmjsdO9SUSG6Mns6D70O0Jfu4xzeUwreoo8q6qmtLhF12k4Gd8QKd31fqKevbzD+xH
         q3kqRHD3KChOnKMna5ATd4IynLUFVGla8KY8wu3UuvRhHb0tsyaSE7xstMkjXmxVYk7D
         D2iaYnyNnyYwbtdbemnGn/C6E2/MthW1JYnImbM3sFAbCdtJLAMQEldXnFppf+/g+Xew
         4xdQ3KuY3e10H7FnvgLezzdXf4EbHW4XqQyZ0Z6Zhs68a0d8HNWxppoqkjF21LNPZhAd
         4yEsU0zUsJWs2k1lWX0F8GV7Zr+T7UFsva53E+Tc1tbPWJamu4E4mSCQQfhF02ulMN1R
         jRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375961;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fudfvsA5eeiTTA5iRCcbEqys1EsMnydotycFpguunFw=;
        b=TNcikhkT09aVgkiLDfrpavfsxSL83ps+vs41PZ56j6Bgr6qRDF8d5xOrpZ1cJ3l3Ja
         ECjwZ56crJD0afRbdaHnVpJiH7PODy+XpjntDbu4sb+N3Bx2OL/L9NHmYxEpDCwLuuli
         dBGNqLZDBRUoR7Nv0azoS9cCU8XZnO+ynUZgeO8xRW6/p2ev6XgfNNWxLiRzlDjHXDOE
         rBWqZybCOalhfmWRmy1VpF0XCRbiNCo37bUq3F4Tk7Dqonl50DmkV5pmDYhmFUFTIXf4
         Z+oiL+FonbKXklbjCloUaAVASTJFWC1wfIY4//K+vd5aj4N/2uFlafQBemOnjlji2MI/
         aNIQ==
X-Gm-Message-State: AO0yUKWwRIJynutL0IhzEFKyu13B6gG/JFIyaVO0m0gtS2cmiOjV403o
	3HvChspKpMZ24oiLKF3ATnrzi5mPvs9een6KCovQwjUf
X-Google-Smtp-Source: AK7set9PomFbjRdrgHg5exq0YvS94y4K0vXpF0oW3y/yRnIbVm1pvWZIzUJr6zJE8aguLXP5qkXjYSlU8PpKDSiBCOI=
X-Received: by 2002:a19:740e:0:b0:4db:345d:4f8a with SMTP id
 v14-20020a19740e000000b004db345d4f8amr6999213lfe.11.1678375960721; Thu, 09
 Mar 2023 07:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20230309151958.3619193-1-alex@linutronix.de>
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Mar 2023 16:32:29 +0100
Message-ID: <CANNYZj-qNvbg+ZA4OpW--VQibXOdySfmPEY3vg1A58s2H2CJMw@mail.gmail.com>
Subject: Re: [PATCH 01/26] devtool/upgrade: do not delete the
 workspace/recipes directory
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178254

Just to make sure: this set (like all of my big patchsets) did get an
all-clear from a-full test matrix, so I believe it's not particularly
risky to take in, despite the feature freeze.

Alex

On Thu, 9 Mar 2023 at 16:20, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> If it exists, there is no need to delete it, and if it does not,
> devtool prints an ugly traceback.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/lib/devtool/upgrade.py | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
> index 967d157077..6c4a62b558 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -125,11 +125,8 @@ def _write_append(rc, srctreebase, srctree, same_dir, no_same_dir, rev, copied,
>      return af
>
>  def _cleanup_on_error(rd, srctree):
> -    rdp = os.path.split(rd)[0] # recipes folder
>      if os.path.exists(rd):
>          shutil.rmtree(rd)
> -    if not len(os.listdir(rdp)):
> -        os.rmdir(rdp)
>      srctree = os.path.abspath(srctree)
>      if os.path.exists(srctree):
>          shutil.rmtree(srctree)
> --
> 2.30.2
>

