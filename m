Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF64C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:56:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.2168.1703184997426168200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:56:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+oE9737;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33687627ad0so865498f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 10:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703184996; x=1703789796; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d3jCjCKtVCngJa7U71fShm0k7CDZUKkgIfgMijftEK4=;
        b=f+oE97373fbfsCdZwI1FPeRGx+vyI6z1YRg/mziPbe7RN8owwpJ2NE6pRS7s4hqoql
         gFj7tHGB+1Dy4Ezx/i6SWApXhb+B+PBIbUPUgpbxFQ76X+30YYpXhOYXLvb0Z/Vj+AAg
         5N2LUZ1jldWjVg5e3XABC2YSj3BGhHzzHWq8xWOW8nkgvO/4kg2WKf/mQFe3lO48m4x9
         Y0POBnJAHTpXaaNG0wWJ9wumewxbRmdpmh35sZAW3p7bs2X6aIWEH7sjcoSbIiJKxl7b
         t88NuFYwnPq79iV40VUYjUibf7vcwemrKTfV2QFW9EEGfAtcRLF8stlCUtmjro409TpP
         0jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184996; x=1703789796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3jCjCKtVCngJa7U71fShm0k7CDZUKkgIfgMijftEK4=;
        b=B3Mxwp6zZ2AaOYkoB7WtbmuaAJmWCHUnFkmQxrJBHzNsRjJ9P7g4V0cyEUV4a0s7CC
         J1Hbf+8c0gLR43ZJmsnG+NlKXshp78BFzGB6cdYLFfz+ZNXwmwejpTTRST6yQW0G9OCI
         ff8ZYFLLxCBbitwNwX5X27BDfRGcVhMv0nzNCMwgyiwJMOx2Ahohv6TboYCw7xxIL+fd
         uoKUga1pFSG0EM4UHi7gCrjG5jqC0L/1zS20P8YMQ3c0jPM4EQF1SBU7iSo29gbsL7LG
         bzG7yUaiArfMC9X9YJCqJg4wFpXQUs3ZVeWDEa4WMJdPhNUcXqLgXa4KQeJEVHHTNGC6
         MpwQ==
X-Gm-Message-State: AOJu0YzJdaY0XXu3klDi6JBK1dYyasZ11v9ODZfN/C7ukxZlsA3/6rNO
	VynFyMxxGUzVQzLmC0pzHiSQe/OAmHOUasgOsr0=
X-Google-Smtp-Source: AGHT+IEUC8x6zbFjiM8QO914JG0+WxEt6AyjKRy4YIvdTkCd26ufddMlguLKnDUoymJ/FpdPRVHEjpD/MWuz5xyJhRA=
X-Received: by 2002:a5d:6189:0:b0:336:6914:4f7e with SMTP id
 j9-20020a5d6189000000b0033669144f7emr126316wru.47.1703184995564; Thu, 21 Dec
 2023 10:56:35 -0800 (PST)
MIME-Version: 1.0
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com> <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com> <06070e71-e3a7-4a14-ae3e-68397f1cc0ff@windriver.com>
In-Reply-To: <06070e71-e3a7-4a14-ae3e-68397f1cc0ff@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Dec 2023 19:56:23 +0100
Message-ID: <CA+chaQcPNEQZSkwD6P9f0Xbf3q7jTp5NAPL56yow7bPAjSBngw@mail.gmail.com>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: zboszor@gmail.com, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5bff5060d09a84a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 18:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192845

--000000000000a5bff5060d09a84a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 7:47=E2=80=AFPM Randy MacLeod <randy.macleod@windri=
ver.com>
wrote:

> On 2023-11-28 4:26 a.m., Zoltan Boszormenyi via lists.openembedded.org
> wrote:
>
> So it's not just Fedora, but Python 3.12 in general.
>
> Googling for problem with threads + fork reveals that
> it is indeed an issue even in C / POSIX: only the thread
> executing fork() will become part of the new process,
> but not the main process starting the thread or any
> other threads from the original process.
>
> The warning is justified, and apparently the issue
> not occurring in bitbake with previous Python versions
> is pure luck.
>
> FYI: Fixed in Fedora 39 if you update to get python-3.12.1-1 or later.
>

But this fixes it only for bitbake master, right?

With bitbake 2.0 used in kirkstone I still see bitbake processes still
running after the build is finished.

--000000000000a5bff5060d09a84a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 21, 2023 at 7:47=E2=80=AFPM R=
andy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macle=
od@windriver.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <div>On 2023-11-28 4:26 a.m., Zoltan
      Boszormenyi via <a href=3D"http://lists.openembedded.org" target=3D"_=
blank">lists.openembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">So it&#39;s
      not just Fedora, but Python 3.12 in general.
      <br>
      <br>
      Googling for problem with threads + fork reveals that
      <br>
      it is indeed an issue even in C / POSIX: only the thread
      <br>
      executing fork() will become part of the new process,
      <br>
      but not the main process starting the thread or any
      <br>
      other threads from the original process.
      <br>
      <br>
      The warning is justified, and apparently the issue
      <br>
      not occurring in bitbake with previous Python versions
      <br>
      is pure luck.
      <br>
    </blockquote>
    <p>FYI: Fixed in Fedora 39 if you update to get python-3.12.1-1 or
      later.</p></div></blockquote><div><br></div><div>But this fixes it on=
ly for bitbake master, right?</div><div><br></div><div>With bitbake 2.0 use=
d in kirkstone I still see bitbake processes still running after the build =
is finished.</div></div></div>

--000000000000a5bff5060d09a84a--

