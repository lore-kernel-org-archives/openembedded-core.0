Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E833C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 12:43:33 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.11008.1737722604840117815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 04:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OUV7xq+P;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so18618656d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 04:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737722604; x=1738327404; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BtE1+iCfr/t1qpzsqa23pB+/F9MX7JIoplG9TEwcTaA=;
        b=OUV7xq+PdeCARl4gAmqveC8qjZL4StCSzKVNeNcKATb4LBdSnOmXH2GSRTEOBKB7F4
         ZL5xR2ORUOf4OjqzU4aCAXqve0zbzWrXZYE31ZGBkIEFcGjJWDr443Zp+EK8ueQu+XHz
         x3jQLgPY8eHDp3x3s5aPd/v1PLbVJPD2Oy588Tq3VFai2wW9PQIAqLlceb8XFFGjzKkm
         dDzJ6Wiw6hxn3cH2D+GsesAYfSJKIxNc1IKa+gkN2lqub4cZsfDIMkBknSeqDd4g7lWa
         jOEYvgG1Ck63bDGpEKCp9SqIlgiMYuFsrdPbfvOzHtPgd/i3Vx6Yq0awPWlsPhFK9IPV
         jfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737722604; x=1738327404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtE1+iCfr/t1qpzsqa23pB+/F9MX7JIoplG9TEwcTaA=;
        b=vWpzehX+fzL8ZwWbIYCrAqv6xHvoyQ6Uf96/bSNlpneUzF05WGOr9OQBhXRECCiijT
         GNmd5HpUNgKea1zLU3S8EmZ7e2LMSbFOgG4KjKughOZiCLr85r8HxTzFZte6Jj3lqkj6
         RpUNws1retXrpo0eWu5vbspTZJl9inQIm7ayER63f094LpbWPr3GJqUq3B6pcl6zGRhA
         RaU1weCsfPdl6TlZAoh/K2dwjD464G1SH+y8+84Z1zKME7VA87xPMY5XM2i1xqLOzcqZ
         qB/x0xcx8eOEoWvWLNkPVbzTZaTRBAMCGyUv1CJJUw9MyEr+JY1Y7GBO/KkMvNZldpxm
         Ayww==
X-Gm-Message-State: AOJu0Yy4IfKGYu6o68xSnoV4jacJ5WRvNDwCvdAvAfSr/Xtr7ZnK2FB8
	Ev8XcV6TT2XKLH0PC58ZMZKhdkh9tCrGl9RQb7nW+dJfJwE8hGbuUUBuWqXSeEdr7lGIWfu1NKy
	OfKY+dyL4y2JMpg45G7zCmiAkUoI=
X-Gm-Gg: ASbGncvSV58FkvPknt8Z4YqnMeEK7Y/aiS5KMdNo7ne4sxxFr/tYbM6E1HHkXk/kNUr
	MzZzgjHYeGNr8wmajoyUlJRI5gX7BU1CGeLi+PEXokrt0UgVpXXbpGnzf8ZGjZ28iSgh5bMql1I
	ZqSc4+8WQiE25s+Jfz8Qch
X-Google-Smtp-Source: AGHT+IGzcmhkrMbTkf7H46oLLINnl921rvBZDuzDMqvnv687qlSWSbcXegPGITfyyOtS4p5RR2KNCo3bd69ZK6Te9mw=
X-Received: by 2002:ad4:5e85:0:b0:6d8:8fbf:d1b7 with SMTP id
 6a1803df08f44-6e1b223ad9fmr417953906d6.43.1737722603898; Fri, 24 Jan 2025
 04:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20250123201229.182266-1-marex@denx.de>
In-Reply-To: <20250123201229.182266-1-marex@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2025 13:43:13 +0100
X-Gm-Features: AWEUYZlv3C8WUUsJOP-2B2i7q5mtYAHZjfpP51LrNL4kaeR7TZQV7Urtna--Hcc
Message-ID: <CANNYZj9B-ZY+L9Wk0DED5yMxSxMzFca1SOfKVH1ZgPfo2GG7Xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
To: marex@denx.de
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 12:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210220

On Thu, 23 Jan 2025 at 21:12, Marek Vasut via lists.openembedded.org
<marex=denx.de@lists.openembedded.org> wrote:

>  # Limit the RPROVIDES here to class target so that if usrmerge is enabled for nativesdk, it does not
>  # include host system paths in /bin/
> -RPROVIDES:${PN}:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
> +RPROVIDES:${PN}:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/bash', '', d)}"

This was added for a reason (that you can find in git history), if we
partially remove it, then the reason will come back and bite us.

What I'd like to understand is how bash's postinst is actually failing
when /etc/shells is not there yet:

grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo
${base_bindir}/bash >> $D${sysconfdir}/shells

Basically you either need to show me how to reproduce the issue, or
show an error message you're getting, or an incorrect outcome on the
rootfs.

Alex

