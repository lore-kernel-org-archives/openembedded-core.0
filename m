Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A22C369D1
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 11:44:34 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.12924.1745495067134951069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 04:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4LcZRtt;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so9364936d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745495066; x=1746099866; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MOM9v+m7ke1k1MKiZgML+Nmkz1hlY9fXzzOxP9anH7k=;
        b=D4LcZRtt+Cd2b69j5X750wPkiu/hhDhA6WEqjxK+R/X6YS8PxEmQL67OlCaIv+GOnm
         KG1jUc6A6jKwxWn0IBdRuBT/gkOh4Zl0zBvo9/jfIQw3UT70JCfjqrXKkSDVZ1A1Iew2
         mrzexy8UZfbH47lyIQ16YIEOQANqB66vKR3k3FmVKiNIhRWKQ/5aoW8I4GvoZbuWUeTi
         ywgNZAXvBgwfk7fMvwqmpdXgFA1LTPqb6vLth+dCbNt3/CWvUjwhm74MtJb4FKvWQnlv
         /oK/fdPFS+/WIDijzfUorhe5ogdmb4XRORiORGq2NLvvnPOmNtDUomwCencEoOMl+sA7
         FOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495066; x=1746099866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOM9v+m7ke1k1MKiZgML+Nmkz1hlY9fXzzOxP9anH7k=;
        b=BnmWANpEE+i6KDx1Aog+qGvym1dARA6Ez5F6ZtIORlwxjcrCcwyZcGzqfszLMb+Dn1
         /q0PixEXgXIY2CdEqOpt/f/29Uc8+DJU+jnZVZmRGCtE+PHXDELSK3ZOzhdg/mbq1ESi
         H7i7q2fqSG/paH8fnSbwDBGu9OBbUqC7HfZOxRaCQVdCT33aazV4dVb1lE9hNconvuI/
         UHBeLCWLZWMGsJnWQzY3gXF7z1PjWPOaqp96/s5bNpcq/RGwsXEvM0S32K+iweArH8ze
         jI59vo7IMo+yehLUaN6wHO5sJHT+rB1+eFbU6Vot8s8FDZirTwOLD87o0BMpN+M6gwqr
         IIUw==
X-Gm-Message-State: AOJu0YzZcDPEsQ/BkxYS0YrHIOb2CmHmZJVkddWUmEyJHExjcTapMLsX
	GCCE8qjzxDitKlHmmuFbKc/+CbI6Y6bRxFc9h8NWo0o3wG2LzEU1CKEcAxM6sWx8VG9SjuogwQr
	IS4JViO4ugS7f3KWNMOJwL+4V64c4ag==
X-Gm-Gg: ASbGnct/Bsb/6aQpSMsfBLQ0nxMGbrbR1Lj40AmHMfDt6apoHdqcxrf5Mv79Td+cl+v
	s5+pnue4qFeWTgzsFL/6KC8Xuhq/2Xi+54IxWZ6m6JR3oZRyFc70qxay7N9dXcVfMgv+3Wj0RLD
	VCow7JNgKL94HHTYdm+/WBeR0bDaWhdONGBbvqRKmfnmTmAOAkyiVJNm5j
X-Google-Smtp-Source: AGHT+IE3jewpjEA/jkruKAI9BUZEJr4OuC9QQ/tetHKYJY3rmY+E8G1YFSiEBeoq7i48G72GeY5PKr4vi4SDiSabtbM=
X-Received: by 2002:a05:6214:2029:b0:6ed:15ce:e33e with SMTP id
 6a1803df08f44-6f4bfc276e3mr43583366d6.27.1745495065962; Thu, 24 Apr 2025
 04:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250424111014.905507-1-alex.kanavin@gmail.com> <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
In-Reply-To: <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Apr 2025 13:44:13 +0200
X-Gm-Features: ATxdqUE_3WKytlmOjyl1s_Tq-UgNrju_Q7YRI_KRt2bYsxTcmQdSECv2wcBHtHM
Message-ID: <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215365

On Thu, 24 Apr 2025 at 13:32, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> UNPACKDIR was meant to help with this. If devtool is changing the
> location, can't it just change UNPACKDIR and leave everything else
> alone? S will still be under UNPACKDIR/git even after devtool moves it?

Some recipes use
S = /path/to/workdir/git/sub/path
and some use
S = /path/to/workdir/unpackdir/git/sub/path

It's that 'git' part in the middle that needs to be extracted from the
final value of S and appended to UNPACKDIR (or WORKDIR), and then the
resulting path is moved by devtool to a workspace with shutil. I
probably don't fully understand the suggestion?

Alex

