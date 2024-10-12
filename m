Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8B7CF2568
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 12:18:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.9740.1728735508505572137
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 05:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X6Tz0yXL;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539d0929f20so1987802e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728735506; x=1729340306; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dWziNk+FsWlQ9XnS8CWAo8i8DtNrJ74w05TefANTd08=;
        b=X6Tz0yXLoWQ5Lp/POTno+iH/xAy8aYCaoEasrQQHPt7GWYFkFwOl2wZLj0SjK+h0Ox
         4hSA6t3STE/De+68Mg2fYkGE7+0/+VLZI1cnizB84Y5P09TDezOQh6iZHBXvPw0REePQ
         tx92zAxi/IBm5jJX0UiHEEwyLkfk5w6GraI9V2Toc+Xsx5ZQjGoFv45xfrcbX1/fAT+V
         kxlUmJGVWakvUORxawcc+rp+UTpKLLNhvj1c43Z7qC1fkabnXgzqDsJw9kofF/iY+r9b
         eiOB5PH6RIay/16sxVVt6lcGAjoZaXe/in6j98zag/rW4BFFSUIFTbjtfV5Dc3A3cJlL
         gy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728735506; x=1729340306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWziNk+FsWlQ9XnS8CWAo8i8DtNrJ74w05TefANTd08=;
        b=wCStL7oAnwPeV8Pdpu8ADKOgyu6vuko69dd/3BCv7r+SGY4k0bLyj9l/Ks+D6sbgGf
         K/CAOuIqG4AedS6Z34iW24P658mBavVzTESC2VIQOYCUndc65SD/mdQb5S6YgNp8diuA
         0L+KqM3hucVmIswi7f2ONnM53QlOFw8/tW1lsqEc9NEGIYJfyplH74fvYk4qKMzR5Qdi
         5EmKUhduW3WO/GmmCgZlGUK0eTF3mkLYuXhIm9EeDJnOi6zdBT5C2CmIXeeaeibjGav/
         FI+HRwGIKqKYh96sDCQ8iGqRtX+g0KhUvyXMF3K+jKltt8aOMxwU1/n8Qm3m2xzA5RVz
         bl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLZPmLfZZDqIEilL/tSjLR9woZCWgJLgKmSQHa3EHKcnJXvZOUV/e3/7Kikmnva5oRkMeCTLGb4cYpvPnZWyJWZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyODbe/9yElsBDLxIXThplIOL5toDV6s0N/UatPLYEZy+Ip+KH4
	1wfYr5+YzQ4wnriv6Uc31W0lXFB3snIAE9Iy87td124MS/7LvsPa5kIc28jZ2zEbfSVu3IGJb0V
	gIzfBjIs0myH+MXRWBre7ZiSEPbY=
X-Google-Smtp-Source: AGHT+IGX3rDJH7erS2OOTGZME0xjNYtf0O40xprc5OPi4FJAQjJpTMAcAf6nowMOOr376cHda5nF1RZvEDqDeZ5b4H4=
X-Received: by 2002:a05:6512:1296:b0:52c:ad70:6feb with SMTP id
 2adb3069b0e04-539d6ebc8acmr1606105e87.20.1728735505868; Sat, 12 Oct 2024
 05:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
 <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
 <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com>
 <2b4615fffa3c131e9795255c4884d6b9eea98c86.camel@gmail.com>
 <CANNYZj-LcppbLy4bsHH6oRJeK6pPVXgVB_oq1UPik9B5wO2oGg@mail.gmail.com>
 <41e5d235b97218e65737069ea5f541ae2114dbc9.camel@gmail.com>
 <CANNYZj_-phKSj0smbkC=n5UVgDzmB5zxoOsOSnVhA=unGaJzRg@mail.gmail.com> <84989466800399ebfc139396b659573edb7570c5.camel@gmail.com>
In-Reply-To: <84989466800399ebfc139396b659573edb7570c5.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 12 Oct 2024 14:18:14 +0200
Message-ID: <CANNYZj-9acLWa+1LRmnwOfcFSjBBygqaMz1nT6O_8PJ9-uhHOw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
To: claus.stovgaard@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205706

On Sat, 12 Oct 2024 at 11:41, <claus.stovgaard@gmail.com> wrote:
> I am working more with it, and I think there might be a solution in
> sight. Though if you have any ideas please share.

I think you need to run it through package name translation function,
the same one that package.bbclass is using to do 'debian-style library
package renaming'. I can't remember what it's called though.

Alex

