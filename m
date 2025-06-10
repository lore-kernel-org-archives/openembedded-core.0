Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97814C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:04:14 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.81166.1749542646371465557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 01:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+0N5BlW;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-407aac76036so3289992b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 01:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749542645; x=1750147445; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wAOyv/OaUmIffFG13accZhPTU5trmI690I4PhwAONgo=;
        b=A+0N5BlW1iEkDMl0UU1peSYNo+vA7WWf5zY/qk01lGCXe4DZtdBQVTWOqz2EJQhMkc
         aeXjkIZbngHUhEbeTsrDCfghQlhICWYKRcL4d3TEi1X0Nwg97Ed8v7m3Dbh0rLujQEm5
         Vva4CbmiogtGjFi3WvoIueIlsK4PO13MWf3XLWcazKwIgXtP/QcMGbuGu2JaqIMD2ugu
         2zQwMCk78tkcKfFKL0ECftMtNH+S3Dbx+Rg5qqvvwhus6T30CcNbDtmrvw39K2eRSYPO
         lHT9qj5fgL8fFInnwa+FTUS6vK4wpbVfvCrHFKXxuwdQUMi2RTlgSu15ziRd+UI2Ogz9
         mKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749542645; x=1750147445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAOyv/OaUmIffFG13accZhPTU5trmI690I4PhwAONgo=;
        b=xECFqJhwi/pdi6mw3LMbm7D0QaHfOffUc+InZWQ5RIBSd/F8bTxYLbUDKU7Suxq8bK
         aQ9y0OH2FQT+PyIYuNFgYD8GM917jN3J4KwtoZ39wYFzyRxbGT8NKkwk+0eXt/7Umdq4
         LCxizuAmNgF/hJYm6Q6L3RJ6o4IvZq9zPvTqXhyrAUH5i3aiR4O7TZJmMIz+hj5BnlB+
         1/tjUQAk8GqISOJJJn0udOB6GMC8OpNe5M//UPMxTtoMnM47Kdo+i+xFoD5ifAOi3Vz4
         G2lEp9iHQ4IgZwLfP2lBkLeJvA8aQNbMLz9Fg51/RuzGSourcm6thDu5xXyqP371GEBA
         dASw==
X-Gm-Message-State: AOJu0YxYczgyBUHB7iiDi2WU6uhJFWuKZ5ZuWRAgqfv4l3B7G/7HZj7r
	j/q/eya9kQfSbQz+bYDUyqzOtrV96bZ05OQWsjmgOKZf0PcOBoL/wBfRK6TvU5vQ3VFzuBXb1/e
	tiLLjUbt6MfjbVXSfaMKZtbEBfSevxcy/ehlb
X-Gm-Gg: ASbGncvEBEahpHKqOzpNOa6fEIckE76glxsWh9Q20t3TBqjYRWfRef48TfdpDHWqrEv
	21vbTfDEHzGxiQUJAUmVWSa9jbaFv0enrdwZesOoA+AoxxlPlEXe4EcVhujCxOI7I6J8n2qGW6H
	m3DAxjXYr2ilO7Fhj9YcmuEodE27K0RWt3reQwfZ6rGA==
X-Google-Smtp-Source: AGHT+IG690xhYKwT7D26pE03ji5Od0AL0qFQ12mIlNE0gxsLzudArBQ3KOe6tWJluVgRFomcN58ds5ZreJej0UUvwsA=
X-Received: by 2002:a05:6214:29c2:b0:6e6:9ce0:da9d with SMTP id
 6a1803df08f44-6fb08f69de4mr273524996d6.27.1749542634017; Tue, 10 Jun 2025
 01:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250606161630.4027025-1-skandigraun@gmail.com>
In-Reply-To: <20250606161630.4027025-1-skandigraun@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Jun 2025 10:03:42 +0200
X-Gm-Features: AX0GCFslzaQbYSUJHndYFfeoJaYPBGp3Z_zQXmnk_tVPS6WuCQRWQEUNN5q1j4Y
Message-ID: <CANNYZj9WWDqrpsmRkAM00=tcmeB1WuRDWsAmshbUvGq+z_xKSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] seatd: fix packaging error with systemd DISTRO_FEATURES
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218318

On Fri, 6 Jun 2025 at 18:16, Gyorgy Sarvari via lists.openembedded.org
<skandigraun=gmail.com@lists.openembedded.org> wrote:
>
> The systemd unit file for this recipe is only installed in case
> the target system's init system is not sysvinit (the recipe assumes
> that in this case it is systemd). It is achieved by inspecting the
> VIRTUAL-RUNTIME_init_manager variable.
>
> However the systemd class was inherited unconditionally. This caused
> a failure in do_package task, in case systemd is present in the
> DISTRO_FEATURES but the system's init manager is sysvinit: in this case
> the systemd unit file is not installed, however systemd.bbclass is
> still trying to register is as a startup service. At this point
> it failed:
>
> ERROR: seatd-0.9.1-r0 do_package: Didn't find service unit 'seatd.service', specified in SYSTEMD_SERVICE:seatd.
>
> To avoid this, inherit systemd bbclass only in case the init system is
> specified as systemd.

> +inherit meson pkgconfig update-rc.d useradd ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd',  d)}

Conditional inherits are best avoided. There are plenty of recipes
that inherit systemd unconditionally, and they do not require similar
fixes. Perhaps we should install the service file unconditionally?

Alex

