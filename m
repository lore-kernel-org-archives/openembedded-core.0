Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4C80F61EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 12:40:23 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so6523764obc.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 05:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=S/UMPV65SHCKbL5mKZkK8MwpZF0UDGdk+Dhcektoc/8=;
	b=s7PYb0vbX2eeLFHohpnw2PB0YEaLj25BCruXVo6e4Q/igPkOsXcq01msM84AqVmBL5
	gEdvjFYU/mitF+DDCAAyWqsY/lpWo+nmUGujCNpJaYmix9Oqg0LzL7NJoXngUegSU7ap
	oNQfGWTO4w1FYCNMe7t251oDNovm+Da2CI/Mypjerw4f1e2M904nqquPjfIKWCBBGD59
	sQVQVCP19F41oTHY/cS5B+upP8lKExQXaY9/aMhw4V7ExOxucz8MK5SBPMHqf1mQQJZM
	OZdKG6Nmw7CXn1tIE8Vf5yq/bPqA36o8Z+ALEO49VnvRBy9eLBunOdaXGyTw5w6do6yo
	/xBw==
MIME-Version: 1.0
X-Received: by 10.182.236.104 with SMTP id ut8mr21091582obc.75.1370608823900; 
	Fri, 07 Jun 2013 05:40:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Fri, 7 Jun 2013 05:40:23 -0700 (PDT)
In-Reply-To: <1370602058.6864.24.camel@ted>
References: <1370602058.6864.24.camel@ted>
Date: Fri, 7 Jun 2013 09:40:23 -0300
X-Google-Sender-Auth: d2MNXdf7i_kb6YLmr3R_E5HCs9I
Message-ID: <CAP9ODKqaV1BaJFYO8YvMs+hkGDgdrjYeSUgCg0Avrv-Ej0QDiw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core and Bitbake wrapper changes (min 2.7.3 python version)
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
X-List-Received-Date: Fri, 07 Jun 2013 12:40:23 -0000
Content-Type: multipart/alternative; boundary=001a11c318381323d604de8fbc25

--001a11c318381323d604de8fbc25
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 7, 2013 at 7:47 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Its not secret that I hate the current bitbake wrapper script and want
> to remove it for 101 different reasons.
>
> I now have code which removes the need for the double execution of
> bitbake which was the only fundamental reason we had it. The question
> therefore remains, what to do with the other pieces of the wrapper,
> specifically the tar and git versions checks.
>
> As a reminder for those who don't remember the problem here, the git
> version is checked since we use certain parameters in the git fetcher
> which need certain versions of git and git is in ASSUME_PROVIDED these
> days. Its possible to trigger git operations at part time to resolve
> revisions. tar is even more ugly since the wrong version has issues
> extracting sstate archives. These issues mean injecting building them
> into the dependency chain at the right point is hard.
>
> Personally, I think we carry around a bit too much legacy these days and
> its starting to hurt us. I would therefore like to propose that we take
> this opportunity to do some spring cleaning and simply error on:
>
> * broken tar versions
> * too old versions of git
> * python < 2.7.3
>
> The python version check would move to the oe-init-build-env script, the
> git/tar versions to sanity.bbclass.
>
> The recommendation for anyone with these older versions would be to
> install our standalone tools tarball which would have python 2.7.3 and
> working versions of tar/git.
>
> The reason for the python version change is so we can embrace the
> unittest improvements in 2.7 and drop all of the workarounds for pre
> 2.7.3 bugs in bitbake. This starts to move us towards python 3, if this
> tarball works well, we'd use the same approach to move to python 3.
>
> Any objections?
>

I fully agree in error on these situations and providing a workaround
solution for old host systems seems perfect. This would clean a good amount
of legacy code and I also agree it is the way to go. So count me as a
supporter for it :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c318381323d604de8fbc25
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Jun 7, 2013 at 7:47 AM, Richard Purdie <span dir=3D"ltr">&l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Its not secret that I hate the current bitba=
ke wrapper script and want<br>
to remove it for 101 different reasons.<br>
<br>
I now have code which removes the need for the double execution of<br>
bitbake which was the only fundamental reason we had it. The question<br>
therefore remains, what to do with the other pieces of the wrapper,<br>
specifically the tar and git versions checks.<br>
<br>
As a reminder for those who don&#39;t remember the problem here, the git<br=
>
version is checked since we use certain parameters in the git fetcher<br>
which need certain versions of git and git is in ASSUME_PROVIDED these<br>
days. Its possible to trigger git operations at part time to resolve<br>
revisions. tar is even more ugly since the wrong version has issues<br>
extracting sstate archives. These issues mean injecting building them<br>
into the dependency chain at the right point is hard.<br>
<br>
Personally, I think we carry around a bit too much legacy these days and<br=
>
its starting to hurt us. I would therefore like to propose that we take<br>
this opportunity to do some spring cleaning and simply error on:<br>
<br>
* broken tar versions<br>
* too old versions of git<br>
* python &lt; 2.7.3<br>
<br>
The python version check would move to the oe-init-build-env script, the<br=
>
git/tar versions to sanity.bbclass.<br>
<br>
The recommendation for anyone with these older versions would be to<br>
install our standalone tools tarball which would have python 2.7.3 and<br>
working versions of tar/git.<br>
<br>
The reason for the python version change is so we can embrace the<br>
unittest improvements in 2.7 and drop all of the workarounds for pre<br>
2.7.3 bugs in bitbake. This starts to move us towards python 3, if this<br>
tarball works well, we&#39;d use the same approach to move to python 3.<br>
<br>
Any objections?<br></blockquote><div><br></div><div style>I fully agree in =
error on these situations and providing a workaround solution for old host =
systems seems perfect. This would clean a good amount of legacy code and I =
also agree it is the way to go. So count me as a supporter for it :)=A0</di=
v>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c318381323d604de8fbc25--
