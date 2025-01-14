Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8E4E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 11:00:14 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.42099.1736852409809277343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 03:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AP7vCvJl;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso45663136d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 03:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736852409; x=1737457209; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JCUK29XlITJq0rT017E3xPmB4IEFRVxEbovnwiJnkvQ=;
        b=AP7vCvJltDeFHPu5HradOI3lGlMP7fWb708HYqPPP8ZA1srS/rDBogzCSvMLM8lZj/
         T45uKmzKu0Z4jwismdI+VsGjlIRmk6EGVzbGaBAZTNFqHtmuMMnOL1DRy4/I4NlDn2gi
         8z10VRsTRFkxN133WsmxmbyCRT+5Ngsm9uqbvpPll2MeuApIQ2ksDxDTKnLo88KeUnNx
         carLbw5Hl/GGPEeKVekSq81H9SaCM0HCY8E3Iy2CxCfXOr6VitbUjr1jd0h0/EM852Ak
         59Alo9EvdAppT64i1pObWLfaZXJSFgpGrjio8uG40a7zCTJec71p2Nt6CHsGbR822o2l
         oZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852409; x=1737457209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCUK29XlITJq0rT017E3xPmB4IEFRVxEbovnwiJnkvQ=;
        b=kmssMVtl75xCzFY8jTDIGQ2sx3kNoduHNLbHN5ViCPfXeXc94nKP5gs4TULc3o0RWK
         AngStY/thWmkREEMnilgM2iXH8yI++nPSpKzjz8YMLvqOGCRy5q67e+Yzs2eXdvt6wJM
         eqxJpGOVkftD8SwWEsR8CtvDAbaZCiW+6TyPkFMF+fPNfJWe6HEbRwpn1TIr2JVxmKjk
         /ynxH6qFjyXMnn/BIBEa1V7sM/Mh12x0m/gdYafXjRJp8YNQm2OcYxFlEplMj6ybeKdU
         mrSeeb5nI0jpMp6rfgZX6NeTv6ocX8gd+WbjBGVQEQyP6p+mAlh82a5PlBa4BS7EaaD9
         bPoA==
X-Gm-Message-State: AOJu0YzHeluYumAdHQIUGZXiZhBlnipqkEsgefw7mYOShSotK9RlbyfZ
	I7SXjt5IE2B3lWkaQQ28iKoZb3H4bVyZ8RRXkN+3KhiXqoEKDQ1No5/gkm4hkMq8agb8Q8vAlf3
	mBOn3+Fo63+0jrB+n7XYzohau8L4=
X-Gm-Gg: ASbGncuQRY9PbEIjEeT+t7GJTYknc9ppbmo/hASZ5fRAEx22cC7Dn6NZOh//s8kEyzG
	n4GHpMjlYQpiXVnxNosSHU5doEbJOuuW2OzOP
X-Google-Smtp-Source: AGHT+IFXao0wR1cY3IjTIluXBH5uf/hstmQ4TrtvdqUL357Lb9KJRuTfw2Yx+GOECAen0mlEtvxLg6mYriEobwvnuUk=
X-Received: by 2002:a05:6214:1d0a:b0:6d8:9e9d:c223 with SMTP id
 6a1803df08f44-6df9b1cee68mr444772276d6.7.1736852408891; Tue, 14 Jan 2025
 03:00:08 -0800 (PST)
MIME-Version: 1.0
References: <1736843308-4094-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1736843308-4094-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jan 2025 11:59:58 +0100
X-Gm-Features: AbW1kvZuk_GBcpf7Mj8qvQmtdjIM_PBAh2WD_QbtVuJiqgLb_Q6LGQ5cDAF0Hjk
Message-ID: <CANNYZj_=sCFxY83eCUzSVu5e7HXwB-pk1r4RS26LovYT=i6q8A@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH v2] ncurses: Fix install conflict when
 enable multilib.
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org, 
	Lei Maohui <leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 11:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209787

On Tue, 14 Jan 2025 at 09:28, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> After consulting with the upstream of ncurses, it is possible to specify kbs by setting --with-xterm-kbs=XXX.
> Based on the instructions in https://github.com/ThomasDickey/ncurses-snapshots/blob/master/configure#L9810,
> it is appropriate to add --with-xterm-kbs=del.

I'd like to dig a little bit deeper into this, because I'm not sure
how the mismatch could happen. The configure script does this
autodetection:

case $host_os in
(*linux-gnu|*cygwin|*mingw32|*msys)
    want_xterm_kbs=DEL
    ;;
(*)
    want_xterm_kbs=BS
    ;;
esac

Presumably it chooses BS option in one of your multilib
configurations, but I do not understand why would that be. Can you
share log.do_configure for both of them, particularly interesting
would be the part where it sets host_os:

checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-poky-linux-gnu
checking target system type... x86_64-poky-linux-gnu
Configuring for linux-gnu

Thanks,
Alex

