Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D30FD65537
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 17:48:34 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web10.52448.1732643308470848199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 09:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vh7IQDrZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: danismostlikely@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51532deb867so631597e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 09:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732643307; x=1733248107; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLkER9vTRyXtOGrve3/hyRnsE+M55s+viHiAW9wNq2M=;
        b=Vh7IQDrZGcc5lgzM8il2ZlKOHIcBBvccLPRTHAl5qmBQDX4f+W8oNvqD1FGAst76O7
         otztFlpp6Oa3G11YA7l72YtXQMexL4KpNmcBPStcOjJa/cWBcHsy6lYJvUpXwPGMv4rP
         zWW5sjj6lNPZXc+m5FReTU0egeVpJEBlp3sYzgrl2LraCw3x84nJc2NXTlhoc6xX2qWD
         ZIDohr0TF2ZNNGahF+jpxmjALzwQL9QjmqJ5a0964k7LUBLQQUyuxDpfz8V8tsKm1LsU
         WU8/vtLe8Z4QaHYoVVd69WK8dgvuMF0P/zq0hVfIhUldDG7rhLK+PwEW4WCvH5JSETEQ
         iXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732643307; x=1733248107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLkER9vTRyXtOGrve3/hyRnsE+M55s+viHiAW9wNq2M=;
        b=F9MZ25XPd5h1DhWoN2RBSkWDhn2ICwtomD4Qa9YnVta5ne4AX9hX57fsYNYHiASIrr
         oA+2UZdC8HSrroyYJ26jAXxnBM05zhloAVo+tS9gtDvgKb6D2A4++0fg0tvsT9Vrzn0v
         yZ5iHX2FgOwobEVrip392bt5hznN1oNttC/7cL3GE0SIiTHQzp71H/7/UVLKZYGZDoci
         Yb5iDUfiyI1Oj31rGvEYgGYYRbyaFGGC0WoZh/VvaRlGdSeM2Z+P7ivbHci/ckX/n/xd
         yrhzFpOMFTXRZF86onx9dAycLsztJ7KkLS4nt1wDtRPVyVnIQ2FOamVWhw6iGREUZ9W7
         789A==
X-Gm-Message-State: AOJu0Yw9CDHo4x5y3dFolVt7Powq2lMUtpZ8ZF5LysuFthWzu2chaGUF
	aJeiPQBCFqPDd5inZarWQNHmR9PjDwUsem107bA4KG9ojiCAi2NxKFBhOdxZyPn8owtqpd21LyC
	cELEQSpOq4ev+oFdSCkqLmc+kZcyuPg==
X-Gm-Gg: ASbGncuWFWx/6cFgnnqT9fQ5qjLKt/y/zOunVSILB3yShDniVWwQve7jMNEkB1SO9/h
	U95bUoAsSy5JfhGk7E9LHz1HONq8SHr+0
X-Google-Smtp-Source: AGHT+IHzeijtPXGnd4lfS5cUyFkmh7OTc3TvApGv9wTioBJ+s7pTPLqkEi6nv0dGBOfQy7WUkKf6FXiBxKY0egPc6MY=
X-Received: by 2002:a05:6122:218a:b0:4f6:aa3e:aa4c with SMTP id
 71dfb90a1353d-515569abc33mr433346e0c.3.1732643307472; Tue, 26 Nov 2024
 09:48:27 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
 <180B91BA7D0ACFD7.7301@lists.openembedded.org> <CACS+7ZQmmD8G2jomCq0313=83EuYy9Ekhz=bNXrzdLDX+ktk2Q@mail.gmail.com>
 <CANNYZj8FMNf3ZscHhqGPdKn38ULtdZkSXWr_hmUc8m=URgWX8A@mail.gmail.com>
 <CACS+7ZQksvu_DFJ-rphq1TmMPznCZHKbeJfCJ=AUUevJDVLKvA@mail.gmail.com> <CANNYZj_ii_qZ3XrhjTXqaZzJodp_f_0zUioTbgbBpkmKXxc_FA@mail.gmail.com>
In-Reply-To: <CANNYZj_ii_qZ3XrhjTXqaZzJodp_f_0zUioTbgbBpkmKXxc_FA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 26 Nov 2024 11:48:15 -0600
Message-ID: <CACS+7ZTVvbxj9vUx_9n1QtchrSzuVoqZxZkPw4e89o0tYPZ0rQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: package tkinter's shared objects
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 17:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207874

On Tue, 26 Nov 2024 at 11:11, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 26 Nov 2024 at 18:06, Dan McGregor <danismostlikely@gmail.com> wrote:
> > > You need to find out why is that. FILES setting in a recipe should not
> > > be replaced by what's in the manifest but only added to it.
> >
> > Okay, that's actually obvious. It's resetting the FILES:${PN}...
> > variables explicitly in the manifest parsing. Didn't know the history
> > of that, so didn't want to touch it. If the intent is to append to
> > what's in the recipe then that's an easy change.
>
> Can you try that and use buildhistory to see how the packaging changes?

Yup, just did that. The packaging didn't change much. The only changes
were to the FILES values for python3-dev and python3-idle, in both
cases just restoring default value before the value added by the
manifest. The files lists for all packages remained the same, except
tkinter which added the shared object correctly. v3 incoming...

>
> Alex

