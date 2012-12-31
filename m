Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TpjO7-0008IS-V9
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 18:43:03 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so4097842lab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=ddE4ulXgkTnngbdddfLZtMGRH7sfc/6s31922JOjxYQ=;
	b=W3UHz2+MWQjYKd5ezj0KBRQHJg/TMT87xRR737BmWQ2xQguH/aIMeGuxed88ow4zM1
	Y1fIXMbNxmzLT7Z9XEms6jNPfylXtu2dUbQUo0nQTZf1P4j+TYmAESp9es13TOjm8Wj0
	5xY2zW0y++7D/HnbINcXMdlCiTyxUz57XPpQMcMTNd8lzm91b0ugGC6lZ/n4jNHEvCeS
	Baf/WDnGzyU4qJKCttlsSA+Uk7EzOD+3KexWQ+QucU4QGUf+cw54vmhUPMDA9PMjcStm
	gfFBciLOve1JbJYNA4Jz+gjqPL7ywA0djNs+n5bTr/h+q+ES3vnOykjNMhuGLwBsax46
	3HLw==
Received: by 10.112.16.69 with SMTP id e5mr16955216lbd.43.1356974879389; Mon,
	31 Dec 2012 09:27:59 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Mon, 31 Dec 2012 09:27:39 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1212311210590.8363@oneiric>
References: <alpine.DEB.2.02.1212311210590.8363@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 31 Dec 2012 10:27:39 -0700
X-Google-Sender-Auth: Ut2xwUrpIJNdU2aD2AgZuPWiUvo
Message-ID: <CABcZANnmfoZU5jF0qnqOmv6Kw89XPGPxYNZ7FP_5SMm+5DvizQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "Fetcher failure: SRCREV was used yet no valid SCM was found in SRC_URI"
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
X-List-Received-Date: Mon, 31 Dec 2012 17:43:05 -0000
X-List-Received-Date: Mon, 31 Dec 2012 17:43:05 -0000
Content-Type: multipart/alternative; boundary=f46d0401fb41a7b6d204d22955fe

--f46d0401fb41a7b6d204d22955fe
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 31, 2012 at 10:15 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>   i'm sure it's something i'm doing but i'm playing with an OE
> configuration for qemuarm and experimenting with "bitbake -e" and got
> this:
>
> $ bitbake -e core-image-minimal | grep SRCREV
> ... snip ...
> # expansion of SRCPV threw ExpansionError: Failure expanding variable
> SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered
> exception FetchError: Fetcher failure: SRCREV was used yet no valid
> SCM was found in SRC_URI
> # SRCREV=INVALID
> SRCREV="INVALID"
> ... snip ...
> $
>
>   i can appreciate *why* this is happening if the fetcher code thinks
> that's a valid value for SRCREV but there's no SRC_URI value for
> core-image-minimal.
>
>   i've googled a bit and perused the code but i'm guessing someone
> else can probably see what's happening in seconds.  the above doesn't
> appear to hurt anything, but it certainly seems like a bogus error.
>

This error is raised whenever SRCPV is expanded. When not using -e, that
only occurs if you set PV to include SRCPV. When using -e, it forces
expansion of every variable, including that one. It's essentially harmless,
as -e is only useful for inspection. Were we to silence all expansion
failures when using -e, it would be easy to miss an actual harmful failure
when trying to inspect a particular variable you require, which is why we
don't do that. In this case, however, you can safely ignore it.
-- 
Christopher Larson

--f46d0401fb41a7b6d204d22955fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">On Mon, Dec 31, 2012 at 10:15 AM, Robert P. J. Day <span dir=3D"ltr">&l=
t;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashco=
urse.ca</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1nk">=C2=A0 i&#39;m sure it&#39;=
s something i&#39;m doing but i&#39;m playing with an OE<br>
configuration for qemuarm and experimenting with &quot;bitbake -e&quot; and=
 got<br>
this:<br>
<br>
$ bitbake -e core-image-minimal | grep SRCREV<br>
... snip ...<br>
# expansion of SRCPV threw ExpansionError: Failure expanding variable<br>
SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered<br>
exception FetchError: Fetcher failure: SRCREV was used yet no valid<br>
SCM was found in SRC_URI<br>
# SRCREV=3DINVALID<br>
SRCREV=3D&quot;INVALID&quot;<br>
... snip ...<br>
$<br>
<br>
=C2=A0 i can appreciate *why* this is happening if the fetcher code thinks<=
br>
that&#39;s a valid value for SRCREV but there&#39;s no SRC_URI value for<br=
>
core-image-minimal.<br>
<br>
=C2=A0 i&#39;ve googled a bit and perused the code but i&#39;m guessing som=
eone<br>
else can probably see what&#39;s happening in seconds. =C2=A0the above does=
n&#39;t<br>
appear to hurt anything, but it certainly seems like a bogus error.</div></=
blockquote></div><br>This error is raised whenever SRCPV is expanded. When =
not using -e, that only occurs if you set PV to include SRCPV. When using -=
e, it forces expansion of every variable, including that one. It&#39;s esse=
ntially harmless, as -e is only useful for inspection. Were we to silence a=
ll expansion failures when using -e, it would be easy to miss an actual har=
mful failure when trying to inspect a particular variable you require, whic=
h is why we don&#39;t do that. In this case, however, you can safely ignore=
 it.<br>

-- <br>Christopher Larson</div></div>

--f46d0401fb41a7b6d204d22955fe--
