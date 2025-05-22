Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B215C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:33:19 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.22645.1747917195810596927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kmnbEqya;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so99993606d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747917195; x=1748521995; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/7KEZr0bwc0PslCXPGiaYHfOW7CCTZO57Cjyw2ILfs=;
        b=kmnbEqyaguoB6kcPblK/xgWoQ4JZ5Qng16CorDYpEFqWg+cuOmKq607AipfwxSYBAr
         6QdQcQFSmhhKP8/c/NVlUzG9AhxflOhTJNvX32W2anwhNOu1twWCGBYeB9kDPiiZ2FWS
         QcxIc7X8kWtSG/8KKcAPbxXCEKz0nyzAMdVLqyFITWDMpRNhe9Hi7JJwKdW+XkmmJE9S
         IzcZjwp9jOE16+4tqdYnfwCiRNel7b6+Ru6elowh53bNnMzYm6t4VXgB72zb5bDYkZUm
         QDD6FHpkyfLeUMH2MkB/l6wDIYiYGGG4E0FlUHID3i90k0fWXInjF9krRNr/1C05O+tW
         j7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917195; x=1748521995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/7KEZr0bwc0PslCXPGiaYHfOW7CCTZO57Cjyw2ILfs=;
        b=tAZpVggGY9+zJhUfesLXeJfX7A0C2ldQuzL01LdPBMOjC7xfBA/te6pA74FBaHK/ys
         QcaEJzsRHKftwM+YC4tYkvzkyb6wRV15TB8rzoCqwJiNgjiL4bU00e9kZo5Z7m30+AQZ
         q7mb+D9Ia8ZpVmgBAtCMebntqDSeom8/Dy3qvI4QuAOfmoPNoy9smPW9NsXsuD8NZ0HX
         tASY/+oBkKsY7FzmMPnPkzqb+9Q8J8Lo7sWAq6NrxN/BPe9OJhrH3njseD5ZCvGh1Mlq
         fPUYtfqi4o18z+c/1Qob2tJKK9xD6iisYmD+tEl8FHdRqiqwrHuDVBa/aA0q65s9ZA06
         tlhg==
X-Forwarded-Encrypted: i=1; AJvYcCVJwEXrYTAwP253lwh+S8VSVXCobkdBejEyWYiD90j639ZRhf4imzawFzdoU2Tu9JN5QgSWG6+3m4sHqFsNjd9DYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzr9jrcRgK/6MSx1yAu61CCqjPG3DttUB3DTrqbg5fdmBt3j0Zj
	ewQ7EFXqzddn1CVt4UrD1R5i8vT3VMsAC692+U+c456yl5TftoI4zH7EFa2VcQS7kb2AHOvggGj
	Ib/dO+dBLbcJg5bnIi+js7jnm0DpdqYY=
X-Gm-Gg: ASbGncvYyZygYnCmCaqDgArjhuxw8ZRt0rzPxRKYbd7M+Z2lvDrnsJyX44m3iCdiKpl
	s4z1Z5ardwFAXm+GCE+xbsJ5mZdplXCIORrDxeFrcYT2t720svUFmfn49PWxT29+mJ4Fh6YtO5d
	HIseAqTVtEp3NMDpM+TR2AFlsvbN/UwSvQKg==
X-Google-Smtp-Source: AGHT+IGc8J+E7ZkIBb3XtQw00U/qjsDvg3ycNR4irIPbwDGzWSUH78fKDBwKCSvVJjWqeK0VKwn0McXIaceRbYBiBn0=
X-Received: by 2002:a05:6214:19c5:b0:6e6:668a:a27f with SMTP id
 6a1803df08f44-6f8b0869e2amr387369326d6.17.1747917194816; Thu, 22 May 2025
 05:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250521191449.1486927-1-ross.burton@arm.com> <20250521191449.1486927-2-ross.burton@arm.com>
 <001eb60e-fbb0-43ad-92aa-8f47dc32ef32@cherry.de>
In-Reply-To: <001eb60e-fbb0-43ad-92aa-8f47dc32ef32@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 14:33:03 +0200
X-Gm-Features: AX0GCFsyitxcjEUNNpbLo6rwnveIxH1lHPpFD0thrzNqTkxAXa0O86AnrjceVvo
Message-ID: <CANNYZj_=k0DULp3-7_kScNB8OGRQaVMEbR+jQCqANCMrObJsQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] rust: consolidate rust-llvm dependencies
To: quentin.schulz@cherry.de
Cc: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217097

On Thu, 22 May 2025 at 14:29, Quentin Schulz via
lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
> > -DEPENDS += "rust-llvm (=${PV})"
> > -
>
> We do lose the force version dependency here, would that be an issue?
>
> I assume this would be if we forget to sync rust recipe with rust-llvm
> recipe or if someone decides to port/override only one or the other
> recipe (but then, do we care :) ?)?

This is already enforced through sharing of rust-sources.inc between
all the rust recipes. They all refer to the same upstream tarball,
with the same checksum.

Alex

