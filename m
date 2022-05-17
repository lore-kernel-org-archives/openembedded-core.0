Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81ACDC433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 14:07:03 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.7699.1652796417278873416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 07:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4WAcTf3s;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id n23so7637436edy.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C+SCU8jIFsafX5ERINmq/kIuaUhBkJBBqpv16Ps0dBg=;
        b=4WAcTf3sIeaJE5rEKLggbUKM0XQ12K04GlLbfdiv3ki1P6zqyCXzi5M8iRXYsGIcN1
         CF+NbGD56T5TwAlM+bOfutwVvMToJ0J2YrF2reZ3lBpddn66bjj4RxKCWFL1R2P1lvp+
         jf1PKxhDyIwUZd0NEQxvvu0MK+B/0O4O++L6POoDJFARBG0EI9widwef4iqo+ztwp9Eq
         +2G59vgYrh5iBz1zTuz4Y5yxkAxcgDkIHQIAyLbnaDtP3pN0G2w9PdTmJFBg4uaB3lI4
         LhTcGwHfeLchgJXE8yJXYAnmoBRHmEfew4AqAnkAjn/r70JZSIEz1BMBTix2xFf7+fYt
         BoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C+SCU8jIFsafX5ERINmq/kIuaUhBkJBBqpv16Ps0dBg=;
        b=HhKhPsE6J/aBmJTNQyikIgNiL9CO/2G3z23cvDK7pjMBbKmPawSjBsh1hz4gFflOF8
         QYkXuzKBrFlxsRBNDkHhsJg/z/wDHAL8BJ3weRbcQ/pJhBJVQoosrDALIy7OPwqJBFWc
         Ep5jmCDp7ATTvXEGBBzw+q2Q8E1wAaI+adGLlDQF7wx0EvKzctmu294FhTpQgO3oaE9h
         kETDBNI6nRvRIPlEj8HweMHlgbdl4NUFmTnlEziBKLxlZYVkh8guKn28Y80sM2sC6QoE
         iJA6woLPKoOIKld/f3iTGZRd4aXaxZbUqimGqdjfg2tashuyZtRm1b1CyPJmjDgNHtkB
         NnUA==
X-Gm-Message-State: AOAM533ggz5zEpHXIVv3EE5LjiNbramZBmQv5ZsFNJIKomKqHjGd6x5j
	GF2pJ+RExi0gaCDMa6So18/84DwsVTLhbfuZdgtGHg==
X-Google-Smtp-Source: 
 ABdhPJwNxO+bxhVMZl4UuvCEWJatJBD+RynpuMt6W0qRAazOvZ6bGgPpXwNXYvHOyYOLM6ONGH5OXjiNd1ldoL4mXyI=
X-Received: by 2002:a05:6402:5244:b0:42a:c1e1:8547 with SMTP id
 t4-20020a056402524400b0042ac1e18547mr5831974edd.269.1652796415450; Tue, 17
 May 2022 07:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220517111500.735-1-ranjitsinhrathod1991@gmail.com>
 <YoOJ9E7KS3A2O1NY@korppu>
 <3360807bec6071b77bba9c3fff23e55bb5bbb9e3.camel@linuxfoundation.org>
In-Reply-To: 
 <3360807bec6071b77bba9c3fff23e55bb5bbb9e3.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 17 May 2022 04:06:44 -1000
Message-ID: 
 <CAOSpxdZyFnTuCz5GVAaT0h5UDN8n-c4_f98Ndz-v+ud4a8tm7Q@mail.gmail.com>
Subject: Re: [OE-Core][dunfell][PATCH] git: Use CVE_CHECK_WHITELIST instead of
 CVE_CHECK_IGNORE
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>, ranjitsinhrathod1991@gmail.com,
	openembedded-core@lists.openembedded.org, Steve Sakoman <sakoman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 14:07:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165735

On Tue, May 17, 2022 at 1:57 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-05-17 at 11:41 +0000, Mikko Rapeli wrote:
> > Hi,
> >
> > On Tue, May 17, 2022 at 04:45:00PM +0530, Ranjitsinh Rathod wrote:
> > > Use CVE_CHECK_WHITELIST as CVE_CHECK_IGNORE is not valid on dunfell
> > > branch
> >
> > Good finding, thanks. I think it makes sence to support both CVE_CHECK_WHITELIST
> > and CVE_CHECK_IGNORE variables in dunfell as patches will be cherry-picked and
> > this issue may creep in again silently.
> >
> > Other opinions?
>
> I wondered if we backport the BB_RENAMED_VARIABLES functionality to
> older bitbakes but use it differently - have it error if the new names
> are detected?
>
> That way we solve this for the other variable names too.
>
> Steve: Any thoughts?

First of all, sorry this slipped by me :-(

I support the approach of having bitbake error if the new names are
detected and would gladly take such a patch.

I think this is much better than having a mix of old and new variable
names in dunfell.

Steve

