Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0352561A8B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 21:48:11 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id c7so2289869uaf.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HZqYtSzl7jrw3scoBt41k/2aBKLr33q3v4KcHO+5PMo=;
	b=sh+rGag9/zTzv5r+M/GNs7Ng2ak3hlFBYT34e/GItrnf6FTjvMEX3FQGUBexerRWwB
	Cym2UxUylHh50K2zROikc1QSBMNg87jhD7n98EXVRlyU3wQLykQOL/yi4P2rEhRvav89
	IXYCoJwppieNcoI19csXSRnpo2R+Kf6pJCtJMEWc3qy79J3SeiTxNr1+xi3zkxdmxSEy
	sMCwX6LJOOpx3b+L0rEyJI0mhNxU7O/7zOLLjADJZvKKYdnQ4Fz0hOKZwPsUge6DJlBx
	qvQrO7LzLJehFMu9ThLcKwuE7+BbOu/aZ406fYSMxmJKYcwnmRGiX3EuRjQxu6ivhM03
	1Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HZqYtSzl7jrw3scoBt41k/2aBKLr33q3v4KcHO+5PMo=;
	b=kHYqV1NlzBSuCyi7gKZkYxT5YTWC6UbeaAXi7jQVeoA2M6Hs0reOiAzYnh+yjuFIPB
	U9t+hy/P8QQpXs8bMzO+TThu254MARm/ktyNUGa0Wcu0X0oYf2nvBCvQ6nXGqbPWcS8w
	/bME/IgKDG0do/1cc9hYOBUMkqamLk8xof1vRyshVcJH7xSbKSfMZT0UV2TypTFL9rPQ
	cVyjT4Ncy2/1VHSIQ2E93PNtmI/qA3RR2i9yHWDLdHkVuYk69DNuv+J6+H2t/dd3PDqv
	6iFWO4VVdmLcpSfu/TN5IQZ9GLTDwBrvTLeXiAHbpojaPrYQjYA7mtbF/hxtYT5zGjkV
	X0yQ==
X-Gm-Message-State: ANhLgQ0TCHEk7XZPxVEOomxaMVRLYKmqYT+32MYayT5SdkCEI4XOppin
	5leJ1rG1Rc+WsRBd4xb3B5BP6WB4Yz07+4okqibmhQ==
X-Google-Smtp-Source: ADFU+vu7vcpSMLTKOvFdup6Hi4G0WC+bErBLhvgBoTZGpA25OhBQxsqsf1XyU2oT7c+OfLs8ATlK64BuELDQXqI1VGc=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr4779300uak.22.1583012892859;
	Sat, 29 Feb 2020 13:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20200229194707.14400-1-alex.kanavin@gmail.com>
	<e4f0cc01dd0ed40905d8b8e2ed4b972215f94b67.camel@linuxfoundation.org>
In-Reply-To: <e4f0cc01dd0ed40905d8b8e2ed4b972215f94b67.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Feb 2020 22:48:00 +0100
Message-ID: <CANNYZj9o0NBfBjpPSZoSz5rrzi0qiaFX3Kj70zJEbEeqKQQaXA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/tinfoil: fix a race condition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Feb 2020 21:48:12 -0000
Content-Type: multipart/alternative; boundary="000000000000275f54059fbde946"

--000000000000275f54059fbde946
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Feb 2020 at 22:39, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I'm not sure its this simple unfortunately.
>
> The big question is whether injected changes from the first "session"
> should persist into the second "session" or whether things should be
> reset to a consistent state between them.
>
> Yes, this will fix the test but I'm not sure its fixing the underlying
> problem :(
>

There's nothing else that can be done on the test side, and what goes on in
the backend is way over my head, I'm afraid :-(

Alex

--000000000000275f54059fbde946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 29 Feb 2020 at 22:39, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m not sure its this simple unfortunately.<br>
<br>
The big question is whether injected changes from the first &quot;session&q=
uot;<br>
should persist into the second &quot;session&quot; or whether things should=
 be<br>
reset to a consistent state between them.<br>
<br>
Yes, this will fix the test but I&#39;m not sure its fixing the underlying<=
br>
problem :(<br></blockquote><div><br></div><div>There&#39;s nothing else tha=
t can be done on the test side, and what goes on in the backend is way over=
 my head, I&#39;m afraid :-(</div><div><br></div><div>Alex<br></div></div><=
/div>

--000000000000275f54059fbde946--
