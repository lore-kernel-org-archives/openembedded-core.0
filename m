Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BADDECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 10:33:10 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.23863.1661941984708778533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SUGYMfeG;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id z6so19310711lfu.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 03:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=sanLVZeQ/rBDb6GlZ3OgHKDwbCM8Oe6o04cU4OXXveo=;
        b=SUGYMfeG0FJzOBwCs5nBRSyXoEWxdP69i6C8J9nTA88L3WDRiOLZ6eUWPaRwQrwDO8
         nPmlP0D8RYgl0zJZP6EJZ39JsC5QVJi9TP7WskrdiOzDaGj9CCn8Zf8IFWMtLT9DEO79
         bCgeZpQhYXt2VJOvbZINlrIg6Ox2OsKNyGl9ZPOWGUpCeXHQwzPH4g6FkcseSMvHMaGq
         S+nrFgeZDQ8P0PrWiySlp/fWj7vpIq/WLiDkPsZ20B/yivFgged2TkDe/lshzGZknAkA
         boWGWNNddquuXINHGxs+S8seNCNBqSZX4vOjv1pW9U7DJ/R6+EJen81aQ5cvlo7eeWPU
         j+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=sanLVZeQ/rBDb6GlZ3OgHKDwbCM8Oe6o04cU4OXXveo=;
        b=O+MQUfoRWcwampcJsrwmHbrpY7TAjEtGtzsoqLIBjfgbmhSQIYHTjeP0pc3JC2/lEc
         TP75NUpAEOgZCNJygLVL9mBmPepgXl5SRrufVdppUj9SGQEFu03XhJkmiIaDtchfBdCl
         pp9fZTiozRE4B2a+Rsqrt5zIzYYj9Dy7Hj4UHvd6JispAhwqPnmPg76khAAkOf2R3XBQ
         v+JjsohxTNQCXikQ4cz/dn1yMyngXxMHk4HU6oNhX5no5XHdQrOy/+oomMO1bzJNOTYm
         kwmKrvmwMDHOaBP01y69ZLbzwSsOu9rIlCXTsV7MLSiK1ysuCv52ZD2jExwsxgv4ERMV
         a5ag==
X-Gm-Message-State: ACgBeo20gdEGns8GKWKAbH3ik9RbSRthmoK09+aED0rfJm21wYhNSO/4
	ElJJ4NUsUzG3ak2Urbacxihe5OXfZIQaZ+YAZrI=
X-Google-Smtp-Source: 
 AA6agR6BcZIxzn93BckyH+vvg4RDiv2eIKfIsDDPZIAV60Hqp5yoQq8B3pGkCj4e3lzL20jvd03HpMPBgfrWm0ShSek=
X-Received: by 2002:a05:6512:33c9:b0:494:79c1:8ea1 with SMTP id
 d9-20020a05651233c900b0049479c18ea1mr2098580lfg.26.1661941982936; Wed, 31 Aug
 2022 03:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220831091906.3310501-1-alex@linutronix.de>
 <fda8f7dcbb044964be8ee272af4f4e3b@axis.com>
In-Reply-To: <fda8f7dcbb044964be8ee272af4f4e3b@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 Aug 2022 12:32:51 +0200
Message-ID: 
 <CANNYZj9m887i7L+qiT8AybTO1Lxmf-wrBOKj17fWKAreEpOSew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: run builds from a pristine source tree
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 10:33:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170098

On Wed, 31 Aug 2022 at 12:24, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> > -S = "${WORKDIR}/perl-${PV}"
> > +B = "${WORKDIR}/perl-${PV}-build"
>
> Any reason not to just set B = "${WORKDIR}/build" ?

'build' is a convention set by cmake/autotools/etc classes, not
globally, and it implies the original source is not in it, which is
not the case here.

Alex

