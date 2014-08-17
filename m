Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0D67860424
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:33:57 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id b17so3555659lan.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bbSfiJtkWHiYA66cD+UXCChDSAdUxOjsiUAbrBZhSY4=;
	b=JLhfDoOHRqEKrJbZAR6AMgyzk/zWGJEUevoRuYQtHjVG/iz1yXTiwS0jM38Dg2XDLq
	uM4X5Fgh10H9mSPbybP8Tz3/7uIqbmibC/bOp9CDUkFsc4TVlyXvSOfKtHa7JMgIYLsz
	4D7doLvkBTfDeHO7a0soOTVukjNRtvw1RGnZS5+gcSYKi52EErFsPHco5wi06Xj1Afn2
	UoPXTl4jyFkJDjljuZsXtJKaMcB21cE0B8U0fgu0FuyAwFSdKbZXVuX3mTwLgftgv87q
	5fijIdXI8hhJ5/W4W79H700GseKnDHCaZnle0D9ADdV0IZLrY+3uOB/ma3PJnvNncVoK
	fy6Q==
MIME-Version: 1.0
X-Received: by 10.152.5.102 with SMTP id r6mr20935522lar.81.1408264438382;
	Sun, 17 Aug 2014 01:33:58 -0700 (PDT)
Received: by 10.112.26.210 with HTTP; Sun, 17 Aug 2014 01:33:58 -0700 (PDT)
In-Reply-To: <1406969694.6981.22.camel@ted>
References: <1406969694.6981.22.camel@ted>
Date: Sun, 17 Aug 2014 10:33:58 +0200
Message-ID: <CAPbeDCnE1f7Hcu7OpHWJFE=Jr6-_P7eowweAMvV2Cm0wvBCHNA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] pixbufcache: Use sceneQueueComplete event to simplify usage
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
X-List-Received-Date: Sun, 17 Aug 2014 08:34:01 -0000
Content-Type: multipart/alternative; boundary=089e0122f36e9986ec0500cf1df2

--089e0122f36e9986ec0500cf1df2
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 2, 2014 at 10:54 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> [This is an RFC which depends on a patch to bitbake to operate]
>
> Currently, we have a mess of dependencies for pixbufcache and even then
> it breaks since they might be controlled by PACKAGECONFIG.
>
> Instead, this patch proposes an alternative approach where we allow
> "fixups" from a sceneQueueComplete() event at the end of the setscene
> process. We signal the need for these using simply stamp files.
>
> The one downside is that the processing code needs to be in a global
> event handler like base.bbclass rather than pixbufcache.bbclass but this
> is probably a price worth paying to avoid the dependency mess?
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
Instead of having the sstate_postinst() touch "needpixbuf", could we make
it write out the actual script that needs to be executed ?
Then base.bbclass could iterate over any scripts installed by any
sstate_postinst() and execute them. At least this would better isolate the
pixbuf-code to pixbufcache.bbclass, and make the snippet in base.bbclass
more generic.
/Jacob

--089e0122f36e9986ec0500cf1df2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Aug 2, 2014 at 10:54 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">[This is an RFC which dep=
ends on a patch to bitbake to operate]<br>
<br>
Currently, we have a mess of dependencies for pixbufcache and even then<br>
it breaks since they might be controlled by PACKAGECONFIG.<br>
<br>
Instead, this patch proposes an alternative approach where we allow<br>
&quot;fixups&quot; from a sceneQueueComplete() event at the end of the sets=
cene<br>
process. We signal the need for these using simply stamp files.<br>
<br>
The one downside is that the processing code needs to be in a global<br>
event handler like base.bbclass rather than pixbufcache.bbclass but this<br=
>
is probably a price worth paying to avoid the dependency mess?<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br></blockquote><div><br></div></div>Instead of having the sstate_postinst=
() touch &quot;needpixbuf&quot;, could we make it write out the actual scri=
pt that needs to be executed ?<br></div><div class=3D"gmail_extra">Then bas=
e.bbclass could iterate over any scripts installed by any sstate_postinst()=
 and execute them. At least this would better isolate the pixbuf-code to pi=
xbufcache.bbclass, and make the snippet in base.bbclass more generic.<br>
</div><div class=3D"gmail_extra">/Jacob<br></div><div class=3D"gmail_extra"=
><br></div></div>

--089e0122f36e9986ec0500cf1df2--
