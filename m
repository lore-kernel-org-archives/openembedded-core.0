Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.1953.1616699285080000058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 12:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=OIYu/Log;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id o16so3441981wrn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 12:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PqOGzZmX1eaj2+0uIZAGSwJRqDw/2wKm59UL7gmlvv4=;
        b=OIYu/LogwCKZew8PNCJhHnWdxdN9LvBP+JDeSkInu6goopXN/Q/auYybOd148k/BB9
         Cly4619T+1O0C1D/tb2ZajJHaIZrEiwz4CsGHUqyqwFM73IJuG2wOmjm6q152lsQ/wjl
         4cx8eIUbV14mOabs7i42hcL925/LqJEkS9uP+f18xaQ3mjsf6wV3Nf7PZR4+t7qIe4F+
         TF7+FgYXmyDzd/BIZQkmKASeJ/bFyvZbLkXlZfjTCvnB28a5UO0xVbpi/o4VuI+JvhYF
         ZeogZWR2HstxrvmIKDjYMjnzLRQwowGs80+LX1ruLz5V6J0O13PzfmnltuCzhSPRSYWF
         4a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqOGzZmX1eaj2+0uIZAGSwJRqDw/2wKm59UL7gmlvv4=;
        b=Se9InvhCuQTb/n83oSqGKuXm8fSwr4yJd8vcq+D/SPCk0VdsmdxgDwKUlz9syxSbNE
         YQFMCVVtLwnrergHa9xD06vR85KIa8Qt/G75skTyfMzIVXRYXykemIBhN95Cn8d70z1O
         RbvF5kvUG95hkoUEkyGYA+ukVvVDFvr4E87UbJoZjWvMFTdtBN7oisa4SgkvJ1LYUBVa
         v9Hc/C+hAk2SqsPcKbPXQV6uqkdFHKhfVMOOtNpmN2r/0F2C4XNWsj0i2jIDREK+pzLy
         Kgah8gU8YrXrpfrfF6rjHRekgvqY9dkukT1ihdxhNj+ukb4iAW5JuCKLJKC62j+nmiOg
         hOqQ==
X-Gm-Message-State: AOAM530juNGALzrfxob9tO6Lk94wBA5EEBdtK4Vmx+J9gXYGHVofY4zj
	IGIaG6C+GsFF/YAFITJl6qzOv4jxx6BGxvrVF47Dxw==
X-Google-Smtp-Source: ABdhPJzsg4GZHqJj4EKZg4OEugZM2s5RetZppg+OR/V5MqjEtSrk9sQ6HUSsduueB5NWvFvQAhbgtv/4yc2SYLOYc20=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr10739235wrs.395.1616699283594;
 Thu, 25 Mar 2021 12:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210325173901.3057180-1-ross.burton@arm.com> <CANNYZj_mMCVjamiimbWki=r4GFAOXkRPjH6xm3rcSbYkmpewWw@mail.gmail.com>
In-Reply-To: <CANNYZj_mMCVjamiimbWki=r4GFAOXkRPjH6xm3rcSbYkmpewWw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 25 Mar 2021 19:07:52 +0000
Message-ID: <CAAnfSTvXHyX_MvHbtpcUso92K=DQT1_7hMwAGCDPJ9RMW0zVPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] meson: fix native/host confusion in gobject-introspection
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Mar 2021 at 18:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> I don't think I fully understand this. Is g-i in meson projects already broken for a while (there was a bit of refactor in the latest meson version, which I tested, but perhaps not well enough), or is this necessary for the other patches in your set?

I just sent a mail which sort-of answers this question without seeing it.

Basically, the change is that Meson now knows that it should call
pkg-config-native for native pkgconfig lookups.  Before, it was using
pkg-config.

As far as I can tell there is very little code which hits that
codepath, so we didn't notice.  When setting pkgconfig-native
correctly, this broke.

Ross
