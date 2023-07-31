Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8DCC04A94
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:59:25 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.1611.1690783163505755871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Y0WGTsav;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so3705572e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 22:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690783162; x=1691387962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bzfQrQupR6i5hKqUUa8CcLSpwjNZVOi9ZTikturMblQ=;
        b=Y0WGTsav7g5SnQFFVusLMh33zOu9u5qUek1/AJSpnKNjKecpP3UIA66WA+WUSTsv2r
         crI641Ps1N09XoZX5RTxVujjwJxE6YwYg04KMkiPRBYKi/w8fNY9fDjgKkzwZS0s6UMP
         zumHljcSuw/FfUa+FKuMfDtx6sM4n5RGWeVgwrOIh9nUmVRU+ClMWQp+Fb77IFt/O7G3
         YOl6OQfg7tsLHbygvvNl27rHaSvqUicWN3kyPbEd1tnGkgQ80h/uIFbzW33vomXkEHZa
         J6Sq7J8VMFnsRKXlMmoXBPw6EXnNNXARLnXqvGfxYH8BpmfU/jT1P0lTf9+A/qkhaawX
         BICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690783162; x=1691387962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzfQrQupR6i5hKqUUa8CcLSpwjNZVOi9ZTikturMblQ=;
        b=OQjLtX4LXGWK9FtevlJmrXMdTo23JuBDJzsjVa7K2cFxFQS3pdvf9OAS8eIRs88vtq
         StLaAF65NaJ4Pg7nAUeGUnmsr9NGQQsOfLV2d0XUIT4HTZ8pQ/bxXJWZPlPucwn9C3E7
         axi0mahtGLw6W04Nw4f1XmGp2wXHI+ZfwjL+rct8r4J3pyASYgwO3GoKrbHRBsAVseBP
         N7Uvcg3cJ1Du9Lw9DizAMGinGEhTg4neEVHXw1Z9iFX3s6e0TcS4VNic8z12duHFSH6P
         58QGa+A3cAbC+wAFA1oOqsa2px1vB+PasBmib0pnvhydpWetlfMGI1sVRIXFePxKTEAy
         fMOQ==
X-Gm-Message-State: ABy/qLb/K9zmYaXnj2vTQdnttogMF/9dnUm5tFRUGEjc6d5R2Y781YAp
	RECi1AIt7tWaGzBrDCl+Pt+ipV8WCW952Dl1qkA=
X-Google-Smtp-Source: APBJJlEe/5ifnjuH7FK+1+Os3c426Z9qH1NDY7W7SKtyuzfYq+1z3Ie8UoZAbVT+xfxc76ZvUx9c0gJxZk27b+vUssQ=
X-Received: by 2002:ac2:522b:0:b0:4fe:279b:7609 with SMTP id
 i11-20020ac2522b000000b004fe279b7609mr2597192lfl.17.1690783161347; Sun, 30
 Jul 2023 22:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-12-alex@linutronix.de>
 <20230728131317ca8fba29@mail.local> <17760BA193C3A223.27447@lists.openembedded.org>
 <CANNYZj_=kDrFgL8nEv8vJsu6zvOra+V92=GjCGj-j2YVhhiOSQ@mail.gmail.com> <202307302036342002024f@mail.local>
In-Reply-To: <202307302036342002024f@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 07:59:09 +0200
Message-ID: <CANNYZj83YD55624+LAOwa46DRbED0h+HhHd0gDS6GNUb9C3qvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/21] util-linux: upgrade 2.38.1 -> 2.39.1
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 05:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185118

On Sun, 30 Jul 2023 at 22:36, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> This is not 100% reproducible and so difficult to bisect. This is the
> log:
>
> diff-{{{
> --- /usr/lib/util-linux/ptest/tests/expected/lsfd/option-inet
> +++ /usr/lib/util-linux/ptest/tests/output/lsfd/option-inet
> @@ -5,10 +5,10 @@
>      3     TCPv6 state=listen laddr=[::1]:34567
>      4     TCPv6 state=established laddr=[::1]:23456 raddr=[::1]:34567
>      5     TCPv6 state=established laddr=[::1]:34567 raddr=[::1]:23456
> -    3       UDP state=close laddr=127.0.0.1:34567
> -    4       UDP state=established laddr=127.0.0.1:23456 raddr=127.0.0.1:34567
> -    3 UDPLITEv6 state=close laddr=[::1]:34567
> -    4 UDPLITEv6 state=established laddr=[::1]:23456 raddr=[::1]:34567
> +    3       UDP socket:[33864]
> +    4       UDP socket:[33865]
> +    3 UDPLITEv6 socket:[31413]
> +    4 UDPLITEv6 socket:[31414]
>  # --inet=4
>      3  TCP state=listen laddr=127.0.0.1:34567
>      4  TCP state=established laddr=127.0.0.1:23456 raddr=127.0.0.1:34567
> }}}-diff
>
> FAIL:          lsfd: --inet option                                 (lsfd/option-inet)
>
>
> All the occurrences are on the arm workers, ubuntu1804-arm-1 and
> ubuntu2204-arm-1 for now.

Thanks, I'll try to narrow it further. May be that it's the update
itself, and not interaction with something else in the branch. Does
look like a race condition as well.

Alex

