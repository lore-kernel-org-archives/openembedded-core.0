Received: from mail-la0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UGLB7-0004nN-B8
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 04:19:41 +0100
Received: by mail-la0-f44.google.com with SMTP id eb20so3291438lab.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 20:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=/dHMrU4H6CNz9184k7nf/UJt62z0zcG30dPzlBwo9mw=;
	b=0CX7BR2oLO50ODzExTx7Y4UwGNjy+OBe8QsDFMCLeCuJGUCfdFm70YLUpaudjkU7Me
	OalJbDKt0eNlgDfeO8Zn8+XXD8+7gTk7LWZ3fyTrCMWLrcaxD0VV++MrRjvlTDPRvlGz
	XsX7HT2WvPC0/LQz5wB9R49IyO7BcsnIIy5OqATo3w3y/ScU24LuqCqGzAKTv0x0IuB0
	mbL/dtoe8n6kLvRyR4ZTfuEdd6dOmj9PlRngauDi+rfgbiKXCpWnMsOMRxaKidcuFkp/
	peAIbsxGBIr9ca5sjr28qmy+le/FCq56IYiMF+Kg1LK/Uq367tkzQEtNHTA1vewXpf9E
	lbXg==
X-Received: by 10.152.48.45 with SMTP id i13mr4288477lan.11.1363316569892;
	Thu, 14 Mar 2013 20:02:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.25.195 with HTTP; Thu, 14 Mar 2013 20:02:29 -0700 (PDT)
In-Reply-To: <1363312663.14476.12.camel@ted>
References: <1363312663.14476.12.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Mar 2013 20:02:29 -0700
X-Google-Sender-Auth: CVTYQp4kB2KYbUSgcNHS2v3T21M
Message-ID: <CABcZAN=qcf7gxWoAyuArPVCSieiPejOazZX9BOPx03rNWEOCOg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: package: Add cachedpath optimisation
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
X-List-Received-Date: Fri, 15 Mar 2013 03:20:01 -0000
Content-Type: multipart/alternative; boundary=bcaec5523b26dd6cd004d7eddf5b

--bcaec5523b26dd6cd004d7eddf5b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2013 at 6:57 PM, Richard Purdie <
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

Have you considered having the initcache() return a cache object, either
with the rest as methods on it, or pass that in? I think it'd be
substantially cleaner than messing with globals, particularly given with
globals we tend to have issues with cache lifetime and invalidation =E2=80=
=94 if
the cache was returned, it would go away when the object gets collected.
--=20
Christopher Larson

--bcaec5523b26dd6cd004d7eddf5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Mar 14, 2013 at 6:57 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":2lm">Currently, various standard=
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
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;</div></blockquote><=
/div><br>Have you considered having the initcache() return a cache object, =
either with the rest as methods on it, or pass that in? I think it&#39;d be=
 substantially cleaner than messing with globals, particularly given with g=
lobals we tend to have issues with cache lifetime and invalidation =E2=80=
=94 if the cache was returned, it would go away when the object gets collec=
ted.<br>

-- <br>Christopher Larson</div></div>

--bcaec5523b26dd6cd004d7eddf5b--
