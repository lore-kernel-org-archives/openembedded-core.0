Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E347C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 08:18:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.69109.1674721100384063621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 00:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O8TG0Mqv;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id y9so1120991lji.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 00:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jFBqyCBy6FLvyRgjKYwV1bdJyxPhgo0HfWLf45BVdSA=;
        b=O8TG0MqvJkaA0e/QE+2nYnCPWR0YTtEwJnR3DL0MVDxU/HC2xq7N7KlvQnAscHA8HZ
         APLHkZ/mmQyJGkZW76xm9hfuOc13DuRYbFn/opZrK7l0uI9ij77kAM33zOZJNJ4hvu1c
         XSJG/vk7nKPZt+wlJJTdmaDcKj3+zh7O5oipXfXwWBBG5gxvlZgy9IajM3Ncbi1zx5sV
         RU8ylOPCWE6ta2CHp8Z9TjoaDqBmEuIm+1HY0XV+8EEXCGTE87jGBeMgZGIXYsQm058r
         T6x6kVPtKev1JKof83WNyjHK7RWbf/XYkmrkxF3k/3bQXpXOqoxcJQ8F3ifKCFRKzXiZ
         oygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFBqyCBy6FLvyRgjKYwV1bdJyxPhgo0HfWLf45BVdSA=;
        b=Xi+jOaJSjVEmhbo8n3C8UtmT82wM6zHuZsO84RQrdSGO3iHheVzB2wGbgcoBrnl1JO
         xNIkY9kfb7aipVDJ7pNW6w9mARhpC/9YHw59FE0HKFo8Qg4yNT8tmpRWZyY/uYAv+WaG
         f5VoaUQRJUVZ+WxzFj2JuGAXyCPJvD2Jbamo1yQ+A8Czvqp/aXv2Zr9R0Ksq/q5/OAvF
         11tTv9XEHfUYAl4fhhKsaw8VUEe6K16uZL5GG3TicRsKpCm21xQJyUrq5tBJYQOhC+tD
         nYeKo0mj0TdnVlbcvPzmbC+LjW07aWNbd/aAymj+E6/jZC9yQQn65XD+6HjGR3iSIcu7
         Veew==
X-Gm-Message-State: AFqh2kqqD7sHag43oTxtIgQAVIFuQjhmueropp/ZmAizSSnbAXh1PkUR
	oj9S9MIeeCLr/FPuIwjrIH/K2QU+Tj+gfDVZ3I8=
X-Google-Smtp-Source: AMrXdXvfDmpj5lR8TqFKi/Bh41o229jCpI8XsCMCQubUuEVxoHrI7Ev60r65px/t5LAJPuA9np+EFyR3pbd5Od5EQX8=
X-Received: by 2002:a2e:8ecb:0:b0:27f:b765:d0c1 with SMTP id
 e11-20020a2e8ecb000000b0027fb765d0c1mr1688554ljl.169.1674721098180; Thu, 26
 Jan 2023 00:18:18 -0800 (PST)
MIME-Version: 1.0
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
 <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma> <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma>
In-Reply-To: <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Jan 2023 09:18:06 +0100
Message-ID: <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
To: Ravineet Singh <ravineet.a.singh@est.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176384

On Thu, 26 Jan 2023 at 09:03, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > Also the newly added patch is missing Upstream-Status. Aren't you
> > getting a build failure with that?
> Sorry, I am new to openembedded/yocto hence I do not know where to find the build output/status. Could you point me to it?

I applied your patch, and run 'bitbake gnutls'. The following error occurs:
ERROR: gnutls-native-3.7.8-r0 do_patch: QA Issue: Missing
Upstream-Status in patch
/srv/work/alex/poky/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
Please add according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
. [patch-status-core]
ERROR: gnutls-native-3.7.8-r0 do_patch: Fatal QA errors were found,
failing task.
ERROR: Logfile of failure stored in:
/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/gnutls-native/3.7.8-r0/temp/log.do_patch.114509
ERROR: Task (virtual:native:/srv/work/alex/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
failed with exit code '1'

How did you test your work and get to the point where you can run the
ptest? Are you getting the same error?

> I will add 'Upstream-Status: Pending'.

Is there a reason to use Pending? If yes, you should say what it is,
otherwise please submit the patch upstream.

Alex

