Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TsxrN-0005Jz-JB
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 16:46:40 +0100
Received: by mail-la0-f41.google.com with SMTP id em20so2024777lab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 07:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=ebApHENNW1txKiwcb49/Hjn4BZGISrkr3QystmmfPM8=;
	b=dJSnLG13BYdoEXi6AesIk4zN6kwLu082T9Qh/14j78z4UVvuJJD/U55CPS5z1rHVAD
	BpCzkjvw1HzdDxyaZRL2rMrBFRgY0bAo1G6HSIONVjbBCV1DgFIRPLKy/U5+2RZcd0jG
	nluiAZyb6kthxh7yD+xPl7LE6DH4TSUoyQWnimgADJn6U03bgMpk/jqgAiD55pXn1Qci
	MTkqUwynYbXsNCWxfbMK9u5Xz83xjha9pUcuBk2BGr1gV4F3OjMrKld00lp9dTwFJMWZ
	qyCe1xk0WuDbzQOf+R3fhlwgWH+zSnUC+WxGsbpcVVbXE8ETlHGoTBzFZqzHVajwqcmQ
	7AaQ==
Received: by 10.152.103.99 with SMTP id fv3mr64633415lab.16.1357745481234;
	Wed, 09 Jan 2013 07:31:21 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 9 Jan 2013 07:31:01 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301090807420.13682@oneiric>
References: <alpine.DEB.2.02.1301090807420.13682@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 Jan 2013 08:31:01 -0700
X-Google-Sender-Auth: sf4HZmVb1uxnNsh2I5l9RsFNMsc
Message-ID: <CABcZANmgHiXmeoZoa3VkoB1fGp2eLGUZCBApjiQJV3iAUJ0K=g@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: a style guide entry for using BBMASK?
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
X-List-Received-Date: Wed, 09 Jan 2013 15:46:42 -0000
Content-Type: multipart/alternative; boundary=f46d040716551ab87204d2dcc14f

--f46d040716551ab87204d2dcc14f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 9, 2013 at 6:09 AM, Robert P. J. Day <rpjday@crashcourse.ca>wro=
te:

>   is there a *preferred* format for setting BBMASK?  in my travels,
> i've seen variations such as:
>
>   "dir/dir"
>   "dir/dir/"
>   "dir/dir/*"
>   ".*/dir/dir"
>
> and so on.  is there an aesthetic preference of any kind?
>


It's just a regular expression, so as long as it matches, we're fine, but
that said, there are certain things to keep in mind:

- First, 'dir/dir' will also match 'foodir/dirbar', which while an unlikely
case, is something you should avoid, and this is what having the
leading/trailing slashes helps you avoid. It's not as unlikely as it seems,
also. Consider something like recipes/libfoo/ and recipes/libfoobar/
- It uses re.search, not re.match, so the leading .* is unnecessary
- /* will only match a series of slashes, not "anything" =E2=80=94 that sou=
nds like
a case of someone thinking it's a glob when it's actually a regex. further,
without a ^ to anchor the end of the expression, there's no need to match
anything past what you're searching for (that is, no need to do something
like dir/dir/.*)

So given those points, I'd suggest the form of BBMASK =3D "/dir/dir/" =E2=
=80=94 note
the leading and trailing slashes to ensure it doesn't match anything that
doesn't exactly match those directories.
--=20
Christopher Larson

--f46d040716551ab87204d2dcc14f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 9, 2013 at 6:09 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.c=
a</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":sl">=C2=A0 is there a *preferred=
* format for setting BBMASK? =C2=A0in my travels,<br>
i&#39;ve seen variations such as:<br>
<br>
=C2=A0 &quot;dir/dir&quot;<br>
=C2=A0 &quot;dir/dir/&quot;<br>
=C2=A0 &quot;dir/dir/*&quot;<br>
=C2=A0 &quot;.*/dir/dir&quot;<br>
<br>
and so on. =C2=A0is there an aesthetic preference of any kind?</div></block=
quote></div><br><br>It&#39;s just a regular expression, so as long as it ma=
tches, we&#39;re fine, but that said, there are certain things to keep in m=
ind:</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">- First, &#=
39;dir/dir&#39; will also match &#39;foodir/dirbar&#39;, which while an unl=
ikely case, is something you should avoid, and this is what having the lead=
ing/trailing slashes helps you avoid. It&#39;s not as unlikely as it seems,=
 also. Consider something like recipes/libfoo/ and recipes/libfoobar/</div>

<div class=3D"gmail_extra">- It uses re.search, not re.match, so the leadin=
g .* is unnecessary</div><div class=3D"gmail_extra">- /* will only match a =
series of slashes, not &quot;anything&quot; =E2=80=94 that sounds like a ca=
se of someone thinking it&#39;s a glob when it&#39;s actually a regex. furt=
her, without a ^ to anchor the end of the expression, there&#39;s no need t=
o match anything past what you&#39;re searching for (that is, no need to do=
 something like dir/dir/.*)</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So given th=
ose points, I&#39;d suggest the form of BBMASK =3D &quot;/dir/dir/&quot; =
=E2=80=94 note the leading and trailing slashes to ensure it doesn&#39;t ma=
tch anything that doesn&#39;t exactly match those directories.<br>

-- <br>Christopher Larson</div></div>

--f46d040716551ab87204d2dcc14f--
