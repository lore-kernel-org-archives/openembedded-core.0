Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F62C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 17:43:46 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.1863.1645465425180588704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=lttH2IrG;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id u1so28377848wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IWKy0zeMweHfMWubUGbLL5Oe7Jr1F/O8XF+t1gR+oFQ=;
        b=lttH2IrGN5oE+ay7I+qXfS8uIUvzev4i9UpJZ4J2lz2ZAcbuX9xfeFdEnyWu1WTkGK
         OU+zwPvIYWhdkLREG89v/nqUpk0K1oiHnkIv4M7wh9nsQ1v6GIbbapF4UPEVJB7JEPpI
         FKkStErGF05thqfL0I9gB0i11TedOLhuiQpYzcqXHABV1KuchylzP6b7RenpFqnvkxup
         kOwX1jjMIaZgnGQqkiR73/fPqKCsXPdMEz7ElwBHGVkF2kUCdxYaK7gOpjSDmXugA+Az
         HAtelRrkVQwrllJz+VZ1TOOTeWuKIHOJNDxKfM82FDypxKO43K8s4VQfcoEESimmENba
         usUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IWKy0zeMweHfMWubUGbLL5Oe7Jr1F/O8XF+t1gR+oFQ=;
        b=KdM5GbWdgFhoQN10rnvZGQfwffWh4IVtA19SmdVEhBlrxK8xSnfmwFnlLKcAfrTgd+
         0Yvz8+5kqFAqRpPE1Zl4ICTG/Vox4Vedbm2kLUdeWOGIIViW25l927Cfki0WvYCfg5GO
         9a8/M24BV0SZEKoJ1i3bHd0HnejkRwtTfnXAi4EK5dA8rujYozHJZrBzn0bsb40m2a8g
         cq/e0qFkLXFMpXU2uOJK9fYtVuB2B0MgnuY9dYT+BBmWV2f7Nh/5g3J2UA3rZ6knNgF+
         SLaPISBe4gYaEj+IzdOuSXKvxkZloSl9jh/i2Hz7bwiYEPacu0HtIe6fTmVZtytQWkP9
         DOyw==
X-Gm-Message-State: AOAM532vEqmMlf0CH4hK5AzuQIqznaIx6TlAVcKlWngR3aPcOMms9x6g
	8Kg6wIA0pObbbx0Zvo2PwYkutXc4SslMdSSmg44BKQ==
X-Google-Smtp-Source: 
 ABdhPJxxauhzv0J+w3seKBkDrausxH8jsd4XLs/xBWmRawrZDxKyeDn6UdUOVXcKeJ1z+MA5x1EZmO6vldxWxCJMTzQ=
X-Received: by 2002:adf:ee0d:0:b0:1e3:f28:487f with SMTP id
 y13-20020adfee0d000000b001e30f28487fmr16511064wrn.620.1645465423588; Mon, 21
 Feb 2022 09:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20220221085118.2267900-1-quaresma.jose@gmail.com>
 <CAAnfSTuxOD2LVkod3wTk7K=w_Q_6KjbYoa_-FqD1WHy0hqy0jA@mail.gmail.com>
 <CANPvuRm1t9fn1Voa=yLL+MPogq2nGDu51AEEyubCxOwMY3j=ag@mail.gmail.com>
In-Reply-To: 
 <CANPvuRm1t9fn1Voa=yLL+MPogq2nGDu51AEEyubCxOwMY3j=ag@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 21 Feb 2022 17:43:32 +0000
Message-ID: 
 <CAAnfSTusWB=rT2d49XZg-gjixubVS1AX3z8geLYckbqLLrDy3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] meson.bbclass: add support for running
 the meson tests at build time
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 17:43:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162064

On Mon, 21 Feb 2022 at 15:00, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>> There are *so many* limitations of qemu-user I'm not sure this is
>> actually useful.
>>
>> (speaking as someone who tried this with Python a while ago).
>
> Can you please point me to your previous work if it is public,
> I would like to see what has already been done in this regard.

I doubt the branch is still around.  I was just running make check
inside a qemu-user, and noticed that so much broke.  I think at the
time it was fork/exec that wasn't usable under qemu-user, which breaks
most test frameworks.

Ross

