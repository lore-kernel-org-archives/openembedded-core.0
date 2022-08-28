Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB4FECAAA2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 19:14:01 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.62465.1661714031128229134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ikHZ3TTe;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id w19so3229348ljj.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2pBgYXk75j2kF2GnAn+9AA5OexPpsx/xxzKf2sh3X48=;
        b=ikHZ3TTe7zh4s78UaWPPRDk+CmmfuWKhXFtU4dcxxQG5FtsOO+0bIEcb1vMGf9ZYdA
         IGy96VzNidXJA4zKW4qAKfq6SIhbcqSoMhWxKDclj/PZAJtC2sO3pQ15ZYi9+g6g8nzy
         7elfWKg8y+UbnTv7jou3zi7i1gVgF2786BCMo8QwS8rRLEJ1UwQfkLHcbfkCa5apqTmu
         tk/YCn6gAY9tCJF7JFOb0OZ6GABD5YkqTY2wUKl7cNQuUXazX8yYLbb7oC5IDdmuPrp7
         gZCzH1fcxRSyR6rIlKqYgzs3T6fERchiLRN//uZlOW2PmG7/H3T3VdDw7wC/vBaQp7+P
         esdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2pBgYXk75j2kF2GnAn+9AA5OexPpsx/xxzKf2sh3X48=;
        b=RqG2uPY+MoEVF5mArZn3DVdgKolJxq2QSP56l8zq2jfNis6vxcFsOxK+UP+knoKlNO
         g7uYT6pj/9XY/uE2UCf5V+CvZNd9eY0pST+Sj6geLpZZEiW3/LRkEKsLvpkit2N+MIX+
         fMfhngtZeo9oY6slubY+3VRIAM2o6SPYGdRAy6rVwjR1JJ711JF6hPjJLi9m+nhSABBH
         V5fHTquVu3fgYzgUuTbKYriOFI9V84MUg/WEN5rrVJENu56qRo6XPnkC/hrz4ELZX8vb
         26/QRxa4vgt1BojIZF7VoJgk/Z23qFBYm6GrRdaiETkUJKFskVkHHPKXRKnYl/CHPcQU
         fqsg==
X-Gm-Message-State: ACgBeo1Q2jxZVZvqTgdxe/R8iWx8AtmSvIhPFFA/MuxVSmEXDE5cU/l2
	CuNb+Q+jza+kod7rid3xgdpGiel6sj2H2VWwERY=
X-Google-Smtp-Source: 
 AA6agR418Q7UV6d+f5TnNfkIyJJ9krvO7IWYptzuRR5NsMmZLuqPjUmklTk9mJLBXGJd/g1iIUnC3HVaQYa4SkMS2VE=
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id
 h9-20020a2e3a09000000b0025e42125628mr4457926lja.68.1661714029328; Sun, 28 Aug
 2022 12:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220828174356.3074391-1-ptsneves@gmail.com>
 <20220828174356.3074391-2-ptsneves@gmail.com>
In-Reply-To: <20220828174356.3074391-2-ptsneves@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Aug 2022 21:13:37 +0200
Message-ID: 
 <CANNYZj-ZWKaM4vjaf8ZWX5GsS=wH5Kxv1g5mFBYR-=++0SQkzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] nfs-ganesha: Replace unfs3 with
 nfs-ganesha
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 19:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169996

On Sun, 28 Aug 2022 at 19:44, Paulo Neves <ptsneves@gmail.com> wrote:
> +gcc incorrectly decides that pos_len and pos_end are used
> +unninitialized. It is incorrect because the condition of their
> +use is the same as their early initialization. Apparently
> +gcc does not pick this fact and with Werror, emits an error
> +
> +Upstream-Status: Inappropriate [reason above]

This needs to be submitted upstream anyway; compiler errors are not
oe-core specific fixes.

> +Subject: [PATCH] Make nfsv3_optype guarded by _USE_NFS3
> +
> +-Wunused-variable will trigger when NFS3 is not enabled.
> +
> +Upstream-Status: Submitted [https://github.com/nfs-ganesha/nfs-ganesha/pull/846]

I do not see this patch at this link, where is it actually?

> +Upstream-Status: Submitted [https://github.com/nfs-ganesha/nfs-ganesha/pull/354]

This was re-submitted through gerrit; probably this and all other
patches need to link directly to gerrit instead.

All newly added or removed patches need an adjustment to
maintainers.inc in conf/distro/include.

Alex

