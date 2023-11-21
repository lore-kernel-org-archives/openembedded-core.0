Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCBCC54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:21:19 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.37549.1700565675165368831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 03:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VATOY28d;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50aaaf6e58fso3427357e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 03:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700565673; x=1701170473; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U/z5o0oxd4mvGcZFZf9lj/i1K7ffMxO6vZpz9hQwbxk=;
        b=VATOY28dx7NuuW3K5nO3dJYZYS/Umm7zLXsoz7WoV5wqd0mtP2UFtFh5C64aHaBYrw
         omHRqD634ln9C42aSmd5EeZvwOQnZRpEvh/9WmynO1uDWFDt/0S8qB517tx+a/8WEzR6
         dIOzplSTxiJjNA3k04cWqj3X/uFKBe/ix8uOkrrTmZ9juOtVoT5sQWZxZf9ByLXo55i2
         uyWa9o1UsfPTy8I9OBr5ugPzqay476JFc8rJM40qoViJh83b0nFeON0ITJbayA9S+1nq
         qNchmuYXAgu+n2OUcBSKTfqX2CMNjC34IcULC3F3Vv2mfEfYOdyA0eRhpql80tJucyRD
         Yl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700565673; x=1701170473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/z5o0oxd4mvGcZFZf9lj/i1K7ffMxO6vZpz9hQwbxk=;
        b=q0NVgWvquuG6Z8/4zXZ09/axp4glxQKuwmw4Dvu7165gLlfIKTyAdvZYFqJ7eNZtl4
         +rcRiP2lklzftqLfmbOXvOcQKL3+GsI5/5nFjGwSr6y9MDnK5tNAp3IiSv1pUFL6d1JZ
         mw7PPWe7wuakqRyigEhq3ljFHAa35PklTT0ZM5EZ8qWLI+XzZgdyy59cUa0JpgVFLU61
         cKI/9qn3dPmJKbeC+NgRs1XK0ze82OnT1MkQ7dFHA9Zcya9Cx6OAGrFKou1/TDkWH3sq
         mizTK9Zsep299xVFi3CnbHjVSOrMQEH6H72Lq3Sn0DnaqG+QKegpDxmOqXbpYPBfsW4X
         LA8w==
X-Gm-Message-State: AOJu0Yxq+rpR/AZKSDQKlSRV0vuofiFHK4jzhPRH2PT2H/X62ti2SJA9
	lxxccKwbrZlQwcK1RNi2Rh5lud4A4gKpGjWvtY8=
X-Google-Smtp-Source: AGHT+IFuD6by9sfOuKRYwrstGR9x8v7PdYSVqn9MvgpIKisC7rM7noDY3XUQs6GVvqDDlNkkISdxVKyABzrDhM4DqBI=
X-Received: by 2002:a2e:b816:0:b0:2c5:23f8:1111 with SMTP id
 u22-20020a2eb816000000b002c523f81111mr6205030ljo.41.1700565673007; Tue, 21
 Nov 2023 03:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
 <20231120144628.52664-3-adrian.freihofer@siemens.com> <17996456E4E8A103.7061@lists.openembedded.org>
 <CANPvuRkN=exsjS1EUiM-MKDc+HN_LT2vNrsOSYuBsnP4jmzZFw@mail.gmail.com>
 <d9c8d5ec4c8ae98f8b065501292fbe2d32fbbfe6.camel@gmail.com> <CANPvuRnvgaH1_RMhcgSXcWen-+Dz6dv2RbqBNyMq0bsGQVTQMQ@mail.gmail.com>
In-Reply-To: <CANPvuRnvgaH1_RMhcgSXcWen-+Dz6dv2RbqBNyMq0bsGQVTQMQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Nov 2023 12:21:01 +0100
Message-ID: <CANNYZj8_mfVEY5Q6LMAdifXcFnMYJ-y-UekpZRpVzuyqpg76qQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cmake.bbclass: optionally support qemu
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190965

On Tue, 21 Nov 2023 at 12:12, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>> I was using it for running Unit Tests on the host before I deployed
>> them to the target device as ptest. This worked well. It is well
>> integrated with cmake and therefore also with IDEs. So I thought that
>> there are certain use cases where it would be nice to have it opt-in.
>>
>> meson offers qemu-user as well (because of gobject). So if qemu-user is
>> not usable there will be other challenges as well.
>>
>> There is also a MACHINE_FEATURE which allows to support it for ARCHs
>> where it works well but not for ARCHs where qemu-user is known to be
>> broken.
>>
>> I think it would be a nice optional feature.
>
>
> I agree without any doubt on that part.
>
> But I believe this doesn't work for applications that are using the fork system call.
> So consider this will also break any ptest using fork, giving the wrong impression the test is failing.

I think this needs to be double checked. I find it odd that qemu
usermode would fail on such a basic thing, and it would not show up
anywhere in places where it's used in core (not just g-i - all the
various postinst utilities for generating indexes etc.).

Alex

