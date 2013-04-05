Received: from mail-lb0-f169.google.com ([209.85.217.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UOF4m-0001W2-1Z
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 00:25:51 +0200
Received: by mail-lb0-f169.google.com with SMTP id p11so4221847lbi.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=BM/GHG+SZQk1YXNus7tfHYkOvIxZq59oJNtGQekD2M8=;
	b=CwAHxRmVaIRjK1etG9XwE7E17a6PW5M2Q/1rnWUtnrS1UIrrtL7s/HK6tvKW38x36H
	K4BUu5/TcbYbtZc1puD5yUfYg51cH09xcHB6BhaaM/VYAHaG4YrRUAWZc2sSpHxz6FFl
	1wO48gV1kJGA+6FL3JlHO7fueRBtyYgO3bIlRWAW6af52ElV1oFpb8ZHNnF3NxympjSd
	RqlUMfHssXQax/usT31cdgzYm/wn3A+7SHIL3OfOxlIV4dZPn8/py26acApemtsmttJI
	FPdljkdYcdHXXYTuguAdbIiR1hO3Lg5ZxFbAI/Ovi/LpIy2kjdYkMtVHgMol9LaSGjyp
	ms3Q==
X-Received: by 10.112.139.7 with SMTP id qu7mr7080846lbb.13.1365199705273;
	Fri, 05 Apr 2013 15:08:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.125.38 with HTTP; Fri, 5 Apr 2013 15:08:05 -0700 (PDT)
In-Reply-To: <20130405212038.GG3191@jama>
References: <515E976C.8060302@linaro.org> <20130405212038.GG3191@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 5 Apr 2013 15:08:05 -0700
X-Google-Sender-Auth: xRqr4qcUr5kOYXIgWdRb-kMQtcw
Message-ID: <CABcZANnvkcKCA14uuOjFcK6tRdNhy27m-+bPAjQbd=W2FK+HJw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does support for external toolchains working in current OE?
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
X-List-Received-Date: Fri, 05 Apr 2013 22:25:57 -0000
Content-Type: multipart/alternative; boundary=089e0112bfa67afc1e04d9a45349

--089e0112bfa67afc1e04d9a45349
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 5, 2013 at 2:20 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Apr 05, 2013 at 11:20:44AM +0200, Marcin Juszkiewicz wrote:
> > For last few months I am working on fixing Linaro binary cross
> > toolchains and their support in OpenEmbedded. Got to point when they
> > work (both AArch64 and ARMv7a ones) for single packages but problem
> > starts when I want to create image...
>
> Today I got different king of issue with external toolchain.
>
> systemd is using AC_PATH_TOOL(OBJCOPY, objcopy)
> but host prefix in OE is not the same as in binary toolchain (different
> TARGET_VENDOR)
> so it looks for configure:14545: checking for arm-foo-linux-gnueabi-objcopy
> while binary toolchain has only               arm-bar-linux-gnueabi-objcopy
>
> and because arm-foo-linux-gnueabi-objcopy wasn't found it continues:
> configure:14588: checking for objcopy
> configure:14606: found /usr/bin/objcopy
> and bam a lot later when it tries objcopy from host on some arm lib
>
> Interesting that systemd is first recipe in our image where I've noticed
> issues like this
>
> Any idea how to easily resolve this without checking every configure.ac
> how it's looking for e.g. objcopy?


export OBJCOPY in the environment to the one based on TARGET_PREFIX rather
than TARGET_SYS, and it'll use that.
-- 
Christopher Larson

--089e0112bfa67afc1e04d9a45349
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Apr 5, 2013 at 2:20 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Fri, Apr 05, 2013 at 11=
:20:44AM +0200, Marcin Juszkiewicz wrote:<br>
&gt; For last few months I am working on fixing Linaro binary cross<br>
&gt; toolchains and their support in OpenEmbedded. Got to point when they<b=
r>
&gt; work (both AArch64 and ARMv7a ones) for single packages but problem<br=
>
&gt; starts when I want to create image...<br>
<br>
</div>Today I got different king of issue with external toolchain.<br>
<br>
systemd is using AC_PATH_TOOL(OBJCOPY, objcopy)<br>
but host prefix in OE is not the same as in binary toolchain (different TAR=
GET_VENDOR)<br>
so it looks for configure:14545: checking for arm-foo-linux-gnueabi-objcopy=
<br>
while binary toolchain has only =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arm-bar-linux-gnueabi-objcopy<br>
<br>
and because arm-foo-linux-gnueabi-objcopy wasn&#39;t found it continues:<br=
>
configure:14588: checking for objcopy<br>
configure:14606: found /usr/bin/objcopy<br>
and bam a lot later when it tries objcopy from host on some arm lib<br>
<br>
Interesting that systemd is first recipe in our image where I&#39;ve notice=
d<br>
issues like this<br>
<br>
Any idea how to easily resolve this without checking every <a href=3D"http:=
//configure.ac" target=3D"_blank">configure.ac</a><br>
how it&#39;s looking for e.g. objcopy?</blockquote></div><br>export OBJCOPY=
 in the environment to the one based on TARGET_PREFIX rather than TARGET_SY=
S, and it&#39;ll use that.<br>-- <br>Christopher Larson</div></div>

--089e0112bfa67afc1e04d9a45349--
