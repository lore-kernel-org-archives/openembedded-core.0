Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B50FC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.29973.1650895072719086258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 06:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YnUo31gh;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id z99so18497015ede.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dc/qQHxZ1U4Ie2L7OcXAw23FVyZoSUxm8LB5GlCCNyg=;
        b=YnUo31ghmwZVrAfV1j1lSLivNsGTU0OAUXsCnufN5cXAVCeIgi/utkyrEBf7OK3KD5
         EfewX4Lgwr4uzB+iAq/riGS6d3Mzi1phmKLEk/6ptcLDhW7vCdJ7boLJGu/BOU6VqPk3
         6UCoVp8g3ckRe4WMtNA6Qg6TF8/4D6yMWVenwbRo2SLPlSdOcjL/01U8DTBYY9CcLFVI
         H/ifBRa9olRnz2ao2mmA5coQbVNyZLsTEf+Uk2M05nBTa3AUjI9c5TVVgIPqXEWzB+UQ
         LJxYZOLW/ZSExgvzP1F3XfxqFw03ZHPN204CHSkKeP1LEZjTPS3gFonzxh9zodX3u6Lg
         vGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dc/qQHxZ1U4Ie2L7OcXAw23FVyZoSUxm8LB5GlCCNyg=;
        b=qknPdW0MAKjpvZHe5czCGeGau4r8Zgm4QRtzEnkcsMsQSyZ5znATrD6dCKTYWG2m5P
         JujKPGsHbdELpkyLSP2nTCCfc5c9iBSEHAqLIfMzvOi9egCdpvHDeF+3KReJF1HAPOfd
         dHL/PBZN7qLYX+1EN7dAVJje1QakmIOWIk6iyRMrnMFHGMjXv9n9hgWkeQZiC+X8YDFz
         ZhWmn69gCJLdtP5KEqiFvG3CItgwMa+xnhzFGYc+6hO9qEk0BzHHEkk06iEJgpUaDaPu
         Ev/zruhvnW0/5gP6S8GpQ8mrUZzh4zvfaAXevuGB0IRz0xwHgvaQvC+1a4MX7VZOZO4i
         uIAA==
X-Gm-Message-State: AOAM5319T6iK5aaDC1i+mFJt373+s19da/9KsrPTAnQYzp+NGVVM6YQX
	p3o3ynd0Vvg3t/ZbSsjEAyDvkFvS8DBfNrujL+KcAA==
X-Google-Smtp-Source: 
 ABdhPJzqgBBapOeh8zZM5FqlYO4ZgzhJbbzDTHySp52dl6M/81XN//2f8tLVOiv8PIRhCZrrf6/m++56tLBsn6KXB4o=
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr18973727edb.364.1650895070817; Mon, 25
 Apr 2022 06:57:50 -0700 (PDT)
MIME-Version: 1.0
References: 
 <9d7e2301b84cc6cd46bdd831fdac6debfb3ee512.camel@linuxfoundation.org>
 <18138.1650867331399896737@lists.openembedded.org>
In-Reply-To: <18138.1650867331399896737@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 25 Apr 2022 03:57:37 -1000
Message-ID: 
 <CAOSpxdakhd5UZkChheg8E4jsn5hKGgigi29-2oD_OwNnEsYqGw@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone] lua: fix CVE-2022-28805
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164822

On Sun, Apr 24, 2022 at 8:15 PM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> Hi Steve,
>
> Can you please cherry-pick this on the dunfell branch as well for this Lua CVE? or should I send a patch for this?

Yes, of course!  Thanks for the reminder.

Steve

