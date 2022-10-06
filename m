Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BE5C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 14:01:58 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web08.6149.1665064911240004411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 07:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jZpPfk+8;
 spf=pass (domain: gmail.com, ip: 209.85.167.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id w70so2136038oie.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 07:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTCwByiNeRch5qK7oha5wLvDYgmoP0+1WAx12e9zU2U=;
        b=jZpPfk+8jrkbuKsfNj9q5c14n6GyMeXa4lr0IncVcWwTYa+YVVCEzoIou/8nwIe0GA
         mujC0BlP+u2qPEjaDXfMpe6UVt0goEiiO0KzqhOqs4fpelpva6Y4eLDzQHuf0eJg5mrR
         JqKeZwFt94gvbs7jK0SuXaFXFoXmSYsXpdhLFomFSpJ70X0DZNg+TL8pqKdT1wcW1uBF
         y23RfHUQpruBvb9O9wNXWe45dO2+WBau+7ZRVojoqjrz5dKYO3fg4WB3RLVFgyI2ulcc
         SD73v7Zm4s9pKSCBXApr8qNfWaDwFQ41Uj46JbwjCQCvw7FBgX53jTn7fYVkviCKeGqt
         FDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTCwByiNeRch5qK7oha5wLvDYgmoP0+1WAx12e9zU2U=;
        b=6SQYh4UUvzmA2375hRHhJTWctotCz+6KnCZSzsjpFhajXAQu3KygtthK0OgPrIGM6G
         CTloVkz9GVsz4U5Y0vdDJBgsIeiyUq5hQ5OPzq7ZecPJNmluvfvoQptboftyVQcruq3S
         XT4kJNgnH2vesSKb0bm5ZaMru9JiBu7MDdla9JvYf7HqHtsZP4lFocq0fzRBXxyCICAD
         v/qgRbkqyPCgyD5iVl/JFNk8thaRQynaCOrAn2exGXgLJ4sxTM8+x/2muKGP1dvO+XCv
         eqO6XWngyznouGKXTKZ6uA8A9XhiWKlJBZj46tpT0t+6kcMDIkuBJ7pYd6NVVvAGGnDQ
         iSJQ==
X-Gm-Message-State: ACrzQf3eT69Lpc2eQxuXeOKQTuwTxOkQqx61PqzBMYh3ArBjRaZrDoqy
	2UoNiYwmlxMsXTMma8o52E77DTj7olVYKJBICu0=
X-Google-Smtp-Source: 
 AMsMyM52u+4ROss/vEfYlETMo+3+UQV/sWXxodS0Yq4nnFrG8HqRc4bA9ZgVBJ3w9jxhhBDKrQlDftW+DrXA6f7I59U=
X-Received: by 2002:a05:6808:1a08:b0:354:2875:3d63 with SMTP id
 bk8-20020a0568081a0800b0035428753d63mr17542oib.241.1665064910474; Thu, 06 Oct
 2022 07:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
 <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
 <401F2D51-AB9E-4D52-84D4-E15C18D6A88A@arm.com>
 <CADkTA4MXezS7rJBJmHsMDX2EEN4nu4HCwsGc=cEDgkLhz1PZuA@mail.gmail.com>
 <402BFFEF-566A-4A10-B374-E3C3BCFFEC72@arm.com>
In-Reply-To: <402BFFEF-566A-4A10-B374-E3C3BCFFEC72@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Oct 2022 10:01:39 -0400
Message-ID: 
 <CADkTA4NsnL2CJ_wRVcwrOwSfWjuWD3gQ4esxrYaieOv1h_Bzrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 14:01:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171507

On Thu, Oct 6, 2022 at 9:43 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 6 Oct 2022, at 14:29, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > I'm not particularly concerned if the extra RDEPENDS arrives with
> > this, since if it is acceptable for other packages inheriting the
> > setuptools (I thought it was build support only!), it really should be
> > ok for perf as well. In particular since perf is debug/optional. Or am
> > I missing something there ?
>
> With this change the base perf package will always runtime-depend on pyth=
on3, even if perf-python isn=E2=80=99t installed.  That sounds suboptimal.
>

But is triggered on the 'scripting' packageconfig, which does mean we
want the support, so it is at least somewhat conditional .. but yes, I
agree that once we've built and packaged, it does make sense to keep
the python dependencies in the dedicated package.

Let me re-work this and do the remove of the RDEPENDS and send a v2.

Bruce


Bruce

> Ross



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

