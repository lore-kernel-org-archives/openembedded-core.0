Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57A0C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 14:18:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.38842.1711549133397751631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 07:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0Tr+PUp;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513edc88d3cso7619748e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711549131; x=1712153931; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+LA0Ban+JcQY5GiayB+plEyHGYb3eSVw4ic5fSD27Q=;
        b=V0Tr+PUpnooSIrtj0DCw+TlmK00JphzMT2i8JHkZfnD9meZIMawNZrR7nrn020s2MS
         ry0fov6fli5Yyb5v+ydSlzN+CACcg5GaZevWEv0ljVei+dHyplDIksfOEZAcGDqyXAx+
         hUjnbOZoqC7Gf4g7Lb+82XIcOX4gZFEm39SI5aQ4MH1bWmHBUsDePMXo9nQi9QAh4Fji
         oolUwuL93hrDS80yNBTnudBWpIZ2oRFKe0mWMaHZPo3kLhpbYxCDXKWEoYE3EZ5sCKK+
         36AW1/yEK/45WRNMe8UNuKW9qAWHKUWRpmcsU3VH5Svv1ILrR1JFFY/rynhvdvivC+Ok
         b2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711549131; x=1712153931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+LA0Ban+JcQY5GiayB+plEyHGYb3eSVw4ic5fSD27Q=;
        b=sOpkTCSEhbCNhJSIlEyDCg6hMmypSddb9i5mMWzoO2KX/4UJBksVuAAmLe2N0HTn3l
         BBtKYlGTukkdQxuA+3+q+s9XBQtYieijnb+1CL5aicJ+0+jrDOXdPEzRcwzCes34Ic5i
         IH0JRvToCBmPyTjP1nJDXkcExidVlObLgEZXaJu23XND61XWhCVv9qbt+kwhONLgjLbJ
         CPlbUpxTU5sirRWPikGRj79IOnNmP5StfmQvejcsTm8L3/scpvMTDaTNCCfVKa4QlJpb
         ilZTXntxvYozoXdo01N9keDJeanUWdPHeTjzRrwCT2HC0TFusx/Y3ZWNwkoST5NXqeGQ
         t/rw==
X-Forwarded-Encrypted: i=1; AJvYcCVPsFg/52MTF9wY5iPM7FGw7zPJGoG3nFupP7rSrojUwnncbtjo1XebPhyLxMJpTJ+V29DdEZJY1/mq9S8Mpg+uXPL5inut4GpMA448gam94JyntykTwOLj
X-Gm-Message-State: AOJu0YzyGNex5uFpf7gVdz6eL413NkkA0qeQALijUefdGlmWRxrcmDrb
	IXno7qleluJGU/RQHc0wPhZfuSWRdz+MVsqw339MGjdckBqVEkaSLibJSQowQm9A7vT4Id4TooI
	jAAM2mJWeQuaw6m3f9zx4uebhaaQ=
X-Google-Smtp-Source: AGHT+IGyW9sMtkXf2butxERK3kCXsW995fqwufUVPAQ8APOtsz8WA+/Q+j8sVMdH1D4KjQe4uJp5NXRfRXHNo9Zl2Zc=
X-Received: by 2002:a19:8c5d:0:b0:515:ba67:ed85 with SMTP id
 i29-20020a198c5d000000b00515ba67ed85mr2988454lfj.19.1711549131294; Wed, 27
 Mar 2024 07:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240320104300.757486-1-f_l_k@t-online.de> <70D06732-17CB-4BF3-A35C-96C684E011E2@arm.com>
 <V29NAS.S84U42Y5BCDK@t-online.de> <6796AEC0-9AA0-4672-AF2C-ACEECEFFEBE6@arm.com>
 <17C062F07E88F314.6405@lists.openembedded.org>
In-Reply-To: <17C062F07E88F314.6405@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Mar 2024 15:18:39 +0100
Message-ID: <CANNYZj--NT+xw_JtuoM4n-jfNTurgj1_Ypn5-GtQHMxPuUs2Uw@mail.gmail.com>
Subject: Re: [oe-core][RFC][PATCHv2] glib-2.0: update 2.78.4 -> 2.80.0
To: alex.kanavin@gmail.com
Cc: Ross Burton <ross.burton@arm.com>, "f_l_k@t-online.de" <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 14:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197558

On Tue, 26 Mar 2024 at 19:10, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, 20 Mar 2024 at 12:43, Ross Burton <ross.burton@arm.com> wrote:
> > > and adding that depend (or using inherit gobject-introspection) cause=
d circular dependency
> >
> > Indeed.  My branch has a glib-initial to break that cycle, but it wasn=
=E2=80=99t quite working right (and upstream were still changing things).
>
> I just took a look at this and ugh. Upstream should just merge g-i and
> glib into one source tree, and then figure out the correct build
> sequence.
>
> I think we can avoid glib-initial by building and installing glib as
> usual (with introspection turned off), then building g-i, then
> building/installing only the introspection data from glib. This needs
> confirmation that the introspection flag only affects those parts, and
> not libraries themselves, and perhaps a new build flag
> 'introspection-only' or similar to avoid unneeded library builds.

Ok, I've poked at this a bit more, and arrived at the combination of
options and variants that builds world fully via the 'glib-initial'
approach:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-version=
-updates

You're welcome to test this. The key element is adding a mcextend
variant of glib that disables introspection, making g-i depend on
that, then building glib normally in a way that doesn't clash with the
mcextend target.

Alex

