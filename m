Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TYdrF-0004gf-K2
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 15:22:25 +0100
Received: by mail-lb0-f175.google.com with SMTP id j7so393059lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 06:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=IhbyhHzEzjobNXyDHWCI1DC7ek4zCsJNvLhFGACdKls=;
	b=0o549d2WUOh9LJoHC6DLac5+BY0JmnzhaFZPhzjM32Ucr4fZE0Gc67H3hcOcgSz3Hw
	MhvHyE1Dc8FTcLatdvvZIw//R2RmfiSuNQ1Xn3rZVFsj/fIzTba+9rJ9LfT3qL8ukjg3
	TfhBK722//E4QAqG1LkDx3tjzBNYb6QQe17dqJcah+qFC2vZm82z60X67/jyqWrDCt5M
	g+b18t9PpHrp9fOGovdD/4SkdUV0KHg/35ajeP/M9OYWomxXsasedUE4sFIlw89oh2gz
	c9bxeBvxdKcc5rl/Ang3/30Q2kU+VKNFTTCaT2xKfTG6mYCRx2N1+avqNYz273smXcXj
	oIBw==
Received: by 10.112.28.98 with SMTP id a2mr10593076lbh.110.1352902110026; Wed,
	14 Nov 2012 06:08:30 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.18.239 with HTTP; Wed, 14 Nov 2012 06:08:09 -0800 (PST)
In-Reply-To: <1352898069.11419.2.camel@ted>
References: <1352815159.24487.122.camel@ted>
	<CABcZANkMe=Bxfr5=PJkDUDT0LS1uN3AL=Sigo9OXS-rQyaexzQ@mail.gmail.com>
	<1352898069.11419.2.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 14 Nov 2012 07:08:09 -0700
X-Google-Sender-Auth: UteeiWdrqhyp9ka8OxOq0ZRZrko
Message-ID: <CABcZAN=sRNMPhR=FAWKyObYZt1XVnyr6tjj1ceg9Tf0bw8pjPg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Add fix for cross compile issues
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
X-List-Received-Date: Wed, 14 Nov 2012 14:22:25 -0000
Content-Type: multipart/alternative; boundary=bcaec554de46af1c6d04ce75116f

--bcaec554de46af1c6d04ce75116f
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 14, 2012 at 6:01 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > The reason for this failure has to do with a particular set of
> > circumstances. A header in the bash source tree defines STRING() based
> > on HAVE_STRINGIZE. This define overwrites the unistd.h define of the
> > same macro. The unistd.h definitions of read() and open() wrap the
> > call to the real functions to implement FORTIFY_SOURCES, and those
> > wrappers use STRING() to do it. As a result, for any host that
> > defaults to -DFORTIFY_SOURCES, STRING() returns 'x' resulting in a
> > concatenation rather than an assembly level rename of the function
> > being called.
> >
> > If we add -DHAVE_STRINGIZE in the CROSS_COMPILE case, then STRING()
> > will be defined to something useful, and therefore the FORTIFY_SOURCES
> > wrappers don't get hosed.
> >
> > See
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/commit/?id=da0ff91for an alternative fix which may be more likely to be accepted upstream.
> >
> This is better, yes. Is there a reason this is in meta-mentor and not
> OE-Core? I'd really like to pull it into OE-Core...


Nope, it's just in the pending upstream pile. I'll send a patch against
oe-core to the list today if you'd like.
-- 
Christopher Larson

--bcaec554de46af1c6d04ce75116f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Nov 1=
4, 2012 at 6:01 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">&gt; The reason for this f=
ailure has to do with a particular set of<br>
&gt; circumstances. A header in the bash source tree defines STRING() based=
<br>
&gt; on HAVE_STRINGIZE. This define overwrites the unistd.h define of the<b=
r>
&gt; same macro. The unistd.h definitions of read() and open() wrap the<br>
&gt; call to the real functions to implement FORTIFY_SOURCES, and those<br>
&gt; wrappers use STRING() to do it. As a result, for any host that<br>
&gt; defaults to -DFORTIFY_SOURCES, STRING() returns &#39;x&#39; resulting =
in a<br>
&gt; concatenation rather than an assembly level rename of the function<br>
&gt; being called.<br>
&gt;<br>
&gt; If we add -DHAVE_STRINGIZE in the CROSS_COMPILE case, then STRING()<br=
>
&gt; will be defined to something useful, and therefore the FORTIFY_SOURCES=
<br>
&gt; wrappers don&#39;t get hosed.<br>
&gt;<br>
&gt; See <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/c=
ommit/?id=3Dda0ff91" target=3D"_blank">http://git.yoctoproject.org/cgit/cgi=
t.cgi/meta-mentor/commit/?id=3Dda0ff91</a> for an alternative fix which may=
 be more likely to be accepted upstream.<br>


&gt;<br>
</div>This is better, yes. Is there a reason this is in meta-mentor and not=
<br>
OE-Core? I&#39;d really like to pull it into OE-Core...</blockquote></div><=
br>Nope, it&#39;s just in the pending upstream pile. I&#39;ll send a patch =
against oe-core to the list today if you&#39;d like.<br>-- <br>Christopher =
Larson<br>


</div>

--bcaec554de46af1c6d04ce75116f--
