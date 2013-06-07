Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8C761EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 13:31:34 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id ec20so3643975lab.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Tap7IGqcGVSwXf+FQFjyCvHcw2EwSeshNxDP4FaCetc=;
	b=DAp041itI6qRt6L9hn6RpORBEauAoVibhzXxPq9NsluklcPeglqF85DDdH+IQtEP5d
	5JuMVQnGh4huLYY70lJsF5Dqfp1Pb5TnpkSwsGIVxGpUJD660F4FhXkSr3yKnkkKSjyc
	Y7lAmQan30yYeJVD/WQNzvFkevQdzqp+I4iQ5SLYzqBy3t/qvsGO67jukOnIosOmQiUX
	MhXHX2045Nsw0Ll3ugBgxnFalaVLh+vlUaHQRgaXK2HM8pjKIRux2FkugHFMqsgwQFZ8
	H8qaj6DC/vbPVrAU+fYDjtkyIxcQPea1nfDClyGl2STtv+E0nrEIScfCzqmjvAT+bhK+
	jnuw==
X-Received: by 10.152.21.7 with SMTP id r7mr20068601lae.16.1370611895082; Fri,
	07 Jun 2013 06:31:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.4.66 with HTTP; Fri, 7 Jun 2013 06:31:14 -0700 (PDT)
In-Reply-To: <CAP9ODKqaV1BaJFYO8YvMs+hkGDgdrjYeSUgCg0Avrv-Ej0QDiw@mail.gmail.com>
References: <1370602058.6864.24.camel@ted>
	<CAP9ODKqaV1BaJFYO8YvMs+hkGDgdrjYeSUgCg0Avrv-Ej0QDiw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 7 Jun 2013 06:31:14 -0700
X-Google-Sender-Auth: Due7eF0Vk4ZAPZ7DtonsoUsfzDI
Message-ID: <CABcZANmas-jVj4=nVP2gveAEcPV_UUGZpL8-57S4iUjDmN_caQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 07 Jun 2013 13:31:35 -0000
Content-Type: multipart/alternative; boundary=089e0149417621a78104de907374

--089e0149417621a78104de907374
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 7, 2013 at 5:40 AM, Otavio Salvador <otavio@ossystems.com.br>wrote:

>
>
>
> On Fri, Jun 7, 2013 at 7:47 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> Its not secret that I hate the current bitbake wrapper script and want
>> to remove it for 101 different reasons.
>>
>> I now have code which removes the need for the double execution of
>> bitbake which was the only fundamental reason we had it. The question
>> therefore remains, what to do with the other pieces of the wrapper,
>> specifically the tar and git versions checks.
>>
>> As a reminder for those who don't remember the problem here, the git
>> version is checked since we use certain parameters in the git fetcher
>> which need certain versions of git and git is in ASSUME_PROVIDED these
>> days. Its possible to trigger git operations at part time to resolve
>> revisions. tar is even more ugly since the wrong version has issues
>> extracting sstate archives. These issues mean injecting building them
>> into the dependency chain at the right point is hard.
>>
>> Personally, I think we carry around a bit too much legacy these days and
>> its starting to hurt us. I would therefore like to propose that we take
>> this opportunity to do some spring cleaning and simply error on:
>>
>> * broken tar versions
>> * too old versions of git
>> * python < 2.7.3
>>
>> The python version check would move to the oe-init-build-env script, the
>> git/tar versions to sanity.bbclass.
>>
>> The recommendation for anyone with these older versions would be to
>> install our standalone tools tarball which would have python 2.7.3 and
>> working versions of tar/git.
>>
>> The reason for the python version change is so we can embrace the
>> unittest improvements in 2.7 and drop all of the workarounds for pre
>> 2.7.3 bugs in bitbake. This starts to move us towards python 3, if this
>> tarball works well, we'd use the same approach to move to python 3.
>>
>> Any objections?
>>
>
> I fully agree in error on these situations and providing a workaround
> solution for old host systems seems perfect. This would clean a good amount
> of legacy code and I also agree it is the way to go. So count me as a
> supporter for it :)
>

Agreed, I'm in favor as well.
-- 
Christopher Larson

--089e0149417621a78104de907374
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jun 7, 2013 at 5:40 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.co=
m.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"adM"><br></div><div class=3D"g=
mail_extra"><div class=3D"adM"><br><br></div><div class=3D"gmail_quote"><di=
v class=3D"adM">

<div class=3D"h5">On Fri, Jun 7, 2013 at 7:47 AM, Richard Purdie <span dir=
=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
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
Any objections?<br></blockquote><div><br></div></div></div><div>I fully agr=
ee in error on these situations and providing a workaround solution for old=
 host systems seems perfect. This would clean a good amount of legacy code =
and I also agree it is the way to go. So count me as a supporter for it :)=
=C2=A0</div>

</div></div></blockquote></div><br>Agreed, I&#39;m in favor as well.<br>-- =
<br>Christopher Larson</div></div>

--089e0149417621a78104de907374--
