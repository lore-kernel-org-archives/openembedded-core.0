Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAE970A61
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 00:55:22 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id z11so4880368lbi.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 17:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=MbdBWemaP9P0Pc1hGbp51Pc4Q8mAXH+4Mqk88oDEs38=;
	b=DSjfUgrG9apHJingJpBaGCRCkj1Uu91iBf6McSMeziV5/OVARute6BR6VMHY7aR0s5
	m1QoWzxa4VNhl4hGxtmsmZ1llauBlZEkl1Uwav1VamADfZbT9FGn39iASI2/+wr2B9de
	Zbl4MK372c2y749XBK8vNvVU+FmEyFcG8ljrJmmwBifotCIORE7hoyN8YKpOZHlYcE0X
	DityXAha9+g3ahvR86sq82rSFtHo5qUfqbMVlQKUNCy1y9LbnRTakZp0dXJMxE2HrAVA
	/lBG+lc/K5r5ZIoReB7A8+eXvqbai2x8aXNVuufbbnqwuiAsBa6mGldc3hmUhLBAI6wl
	ne/A==
X-Received: by 10.112.134.169 with SMTP id pl9mr49182lbb.75.1407632123079;
	Sat, 09 Aug 2014 17:55:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Sat, 9 Aug 2014 17:55:02 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1408092040350.15077@localhost>
References: <alpine.LFD.2.11.1408092040350.15077@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 9 Aug 2014 17:55:02 -0700
X-Google-Sender-Auth: DdQsiMOpQcjhtK7pTcgKH0APFbY
Message-ID: <CABcZANk=3QXtjBcisCTqZVbK-2f29NVwdoj7j9HeGrh9-0XngQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: puzzled about definition of "build" task
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
X-List-Received-Date: Sun, 10 Aug 2014 00:55:24 -0000
Content-Type: multipart/alternative; boundary=089e011767e9abb0b805003be44a

--089e011767e9abb0b805003be44a
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 9, 2014 at 5:42 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   first time i noticed this in base.bbclass:
>
> addtask build after do_populate_sysroot
> do_build = ""             <--- ????
> do_build[func] = "1"
> do_build[noexec] = "1"
> do_build[recrdeptask] += "do_deploy"
> do_build () {
>         :
> }
>
>   what's with the lines
>
> do_build = ""
> do_build[func] = "1"
>
> i've never seen that construct with any other tasks.
>

I believe this was a remnant, from before bitbake started disliking empty
tasks. The "" and func = 1 bit defined it as a function but whose contents
were the empty string, but that's not something bitbake likes anymore,
hence the new definition with the :. See the git-blame info for those lines
to see the commits that last touched them: `git blame '-L/^do_build/,/^}/'
meta/classes/base.bbclass`
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e011767e9abb0b805003be44a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Aug 9, 2014 at 5:42 PM, Robert P. J. Day <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.c=
a</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D":8v" class=3D"=
" style=3D"overflow:hidden">=C2=A0 first time i noticed this in base.bbclas=
s:<br>
<br>
addtask build after do_populate_sysroot<br>
do_build =3D &quot;&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;---=
 ????<br>
do_build[func] =3D &quot;1&quot;<br>
do_build[noexec] =3D &quot;1&quot;<br>
do_build[recrdeptask] +=3D &quot;do_deploy&quot;<br>
do_build () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 :<br>
}<br>
<br>
=C2=A0 what&#39;s with the lines<br>
<br>
do_build =3D &quot;&quot;<br>
do_build[func] =3D &quot;1&quot;<br>
<br>
i&#39;ve never seen that construct with any other tasks.</div></blockquote>=
</div><br></div><div class=3D"gmail_extra">I believe this was a remnant, fr=
om before bitbake started disliking empty tasks. The &quot;&quot; and func =
=3D 1 bit defined it as a function but whose contents were the empty string=
, but that&#39;s not something bitbake likes anymore, hence the new definit=
ion with the :. See the git-blame info for those lines to see the commits t=
hat last touched them: `git blame &#39;-L/^do_build/,/^}/&#39; meta/classes=
/base.bbclass`<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e011767e9abb0b805003be44a--
