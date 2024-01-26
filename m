Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F76C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 15:00:24 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.112.1706281222307538831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 07:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NplE+yNR;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cddb2c2b54so4611171fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706281220; x=1706886020; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9+36knBKLlGBBw7JM8BcoQdgyj+MccsnEsNgF8+/MCc=;
        b=NplE+yNRSK6tSxBLGeYUs9IZY3+XdUDejmqLgvMKpLXppPJtfqQBgYaElpkzij5jwA
         a47i7+vx98oH7llML70p9WoF+2rO5b5FdQHkHE+V3wb9aBW9jBemFdeZ7BabAoP7RO4g
         I+Nm76Q5XIGXH0aSCkxWHWZfhTkzPgw7rk/PNm7OUN/3cGpTzqCDoUP/kun8v5Ja1bpK
         TGFUy70WC/V9Sg5gXLPTNZ6q2BoRhpDn09BbX9Na0bUpUuiZo7B7Qa8CWUg9NbIxSfDg
         YoRxt+E6MUJpTzQCAHwRRVqtOe4mQJBF13IP4yLKQbYiHjRs6LsBPiyyxrcdb/nj/IZN
         1vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706281220; x=1706886020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+36knBKLlGBBw7JM8BcoQdgyj+MccsnEsNgF8+/MCc=;
        b=JVVHBuoKt5IzZHGnrQB9RKL6ISMElPE4Xe2+y4OBW504TB3moKAkeQES8w8gyVr1uy
         l+JHUoXnYZFqTNjiBquCKkG6YFGwfWMx0WIJ8+2/6Rra9uX+DZcCZq6xHCS00rB6QUwG
         ZA1QXgn3Oqi8Cwf9zJbrYrXJj+pvLgblpJL2URBKUdh+hmHlASK30gzRG3/kq6x2fP+m
         3j4EJHnEwV/tpytLYoBE6gns3qrWQA1hb6ofXlCpQlikN6gYVvkIm3mfGgag7ExGfw1l
         IDQtttVdfGRKo8gsHAPBhHuxKZd5dOQtKl+JGVmjIoBEoCxtmkbE4ZVokAuakjz0dIe1
         ZdGQ==
X-Gm-Message-State: AOJu0YxUPuEGWtfHuTv7YliVxAdu0lkExTI2QjVrXqYePudbCmNqVoVH
	l06JvfOJbx1PVN0m+/TRUXEYBk+977n6OFqUy1J8WqXu0VCj37hDn8J2M/b1xszM1vEjCx39kgG
	v1BeDlx84efjt1qm70TfOXBFyd1+IwSnbNQU=
X-Google-Smtp-Source: AGHT+IGhukhxLhkWiqvx6ius+FM/SAuT/O+V8HC31mrqahXQKK0aBYjgxuPtY7wC7UyO1zTn1NBJWrBANZmm7yP8QwQ=
X-Received: by 2002:a05:651c:1693:b0:2cd:16fe:da22 with SMTP id
 bd19-20020a05651c169300b002cd16feda22mr1565676ljb.3.1706281220333; Fri, 26
 Jan 2024 07:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20240122052926.1962273-1-Qi.Chen@windriver.com> <5b996521185e01326f83773135047dca0e946477.camel@linuxfoundation.org>
In-Reply-To: <5b996521185e01326f83773135047dca0e946477.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jan 2024 16:00:08 +0100
Message-ID: <CANNYZj_BdzBG1WjoAvgWwUvS_9Ys_HhOSc6s=0UbR5Bi2rZSYQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] oeqa/selftest: add test case to cover 'devtool
 modify -n' for a git recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 15:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194388

On Fri, 26 Jan 2024 at 15:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> > +    def test_devtool_modify_git_no_extract(self):
> > +        # Check preconditions
> > +        testrecipe = 'psplash'
> > +        src_uri = get_bb_var('SRC_URI', testrecipe)
> > +        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
> > +        # Clean up anything in the workdir/sysroot/sstate cache
> > +        bitbake('%s -c cleansstate' % testrecipe)
>
> I'm afraid we can't use cleansstate inside oe-selftest as it may race
> against other copies of oe-selftest running against the same sstate
> cache (or other builds using psplash in this case).
>
> We'll need to find another way to make this work.

There's a number of existing tests in
meta/lib/oeqa/selftest/cases/devtool.py which do rely on cleansstate;
I can only presume they do it with utmost care, and can be used as
examples for how things could be done.

Alex

