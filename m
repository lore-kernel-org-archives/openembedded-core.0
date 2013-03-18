Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UHdgf-0003BD-FU
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 18:17:30 +0100
Received: by mail-la0-f46.google.com with SMTP id fq12so6229038lab.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=VZmHXF9jJJK95u2YtEedKcjOKurc4++xdtO3DI4v8r0=;
	b=FijmS0v4NVlPGWgMnor8RyIclJic9DPA2uIhjwQrZij4SMBZ1RTKKInYyuySnjViQw
	SL/u6ZRB46GOUTabdnc2jc2TcWXZ1VI1otyeKGSb3YeGsZTzYeAudgK8WhZMzU+oOIyB
	jxc9P72sg9V+Cfc28OLTTcmq2UXH+mwdWN0SfXK7BhvMYXyWIppoes2R2Hvj6+Xzl3HP
	QCUlXTmgStQvz16iTX2eGSUQRFHb3M8TIWbao7RWSxWyhHIh0AWK9LT1SVAfsyTpHD0m
	WG5/DYuy+YcnFyZeEyp+j1HHXf/2QBFORW+DjJpiJsMInnCjILlAiLdVa31JYnoUzOD1
	9hTg==
X-Received: by 10.152.105.109 with SMTP id gl13mr15206318lab.40.1363626040912; 
	Mon, 18 Mar 2013 10:00:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.25.195 with HTTP; Mon, 18 Mar 2013 10:00:20 -0700 (PDT)
In-Reply-To: <1363625236.16482.59.camel@ted>
References: <1363625236.16482.59.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 18 Mar 2013 10:00:20 -0700
X-Google-Sender-Auth: RkJBN0R0-VxU41ho-M8_vdjqQcE
Message-ID: <CABcZANniUBa-RY5PHKAhuyeYuuHo4MRRrgCruAc=jZCeYsbx_Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] package: Add cachedpath optimisation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 17:17:33 -0000
Content-Type: multipart/alternative; boundary=f46d04089215c6fb4f04d835edc8

--f46d04089215c6fb4f04d835edc8
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 18, 2013 at 9:47 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Currently, various standard library operations like os.walk(),
> os.path.isdir() and os.path.islink() each call stat or lstat which
> involves a syscall into the kernel. There is no caching since they could
> conceivably have changed on disk. The result is that for something like
> the do_package task of the kernel we're spending over two minutes making
> 868,000 individual stat calls for 23,000 files. This is suboptimal.
>
> This patch adds lib/oe/cachedpath.py which are a set of replacement
> functions for these operations which use cached stat data rather than
> hitting the kernel each time. It gives a nice performance improvement
> halving the build time of the kernel do_package.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

Looks good, nice job.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-- 
Christopher Larson

--f46d04089215c6fb4f04d835edc8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Mar 18, 2013 at 9:47 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1n1">Currently, various standard=
 library operations like os.walk(),<br>
os.path.isdir() and os.path.islink() each call stat or lstat which<br>
involves a syscall into the kernel. There is no caching since they could<br=
>
conceivably have changed on disk. The result is that for something like<br>
the do_package task of the kernel we&#39;re spending over two minutes makin=
g<br>
868,000 individual stat calls for 23,000 files. This is suboptimal.<br>
<br>
This patch adds lib/oe/cachedpath.py which are a set of replacement<br>
functions for these operations which use cached stat data rather than<br>
hitting the kernel each time. It gives a nice performance improvement<br>
halving the build time of the kernel do_package.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br></div></blockquo=
te></div><br>Looks good, nice job.</div><div class=3D"gmail_extra"><br></di=
v>

<div class=3D"gmail_extra">Signed-off-by: Christopher Larson &lt;<a href=3D=
"mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>-- <br>=
Christopher Larson</div></div>

--f46d04089215c6fb4f04d835edc8--
