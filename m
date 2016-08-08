Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 419D377188
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 14:12:44 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id f6so6230133ith.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 07:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=mzKxcyObYFLPH8u3beIHhXZZ3qXKap9oZQvLApMs8jI=;
	b=a5lPQm4EJ4JU5BAWW4Hu7S2i+wX1ujGnVWa2Meo7izNMtT33lXFKqld0hyo/8gP+9Q
	qYdDQJE2eVUl+rmSnylK5rO86IqX1Vn9slJnHQWMmivKL8Rexh3MwAUlsPVpuq/hx+bN
	PviavFAqzzRlVR7oxC5pSgWZMIGa2K+9eQD3gXW6Rc1dd4vVN5WGglcibuBjnLExBzZC
	2HISjwBfzt0Z1T1y70POjIDwN4ctRvuMMdkVaf09vEyAFBzy69fJtnsdxpr//LBT3Q/z
	JieD7VSmxyeqhVV7VhXuG/3CB2BJdJtr4gyHRYJD+3Umo48p6Osh7RUNy9BKDhI9eJcv
	ZmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=mzKxcyObYFLPH8u3beIHhXZZ3qXKap9oZQvLApMs8jI=;
	b=df3ZXthIAhBrtEyzpaO0Buk0HhS5qqki6ikCwz7Tyd4qrPnYZwFyG8859Yg/0eOrTW
	PGjz8Rlu3UlnSEXhAFY0RvWcq5zwq1KvAEl+//qvWbrjefDnd6lq+C0c7mWNEeRHU/US
	tpWK5944MPjOa2gA8vTkl7X643QnfkCBNcY0chiCGplUCAT15fzOLQolEgKkH+jSbJ2T
	OHgeNudPjUCgN949HBkqt1O/cdKn7XbRt+1moZT89bQ20Q/uto6Qh52L1de1lDeRVzlQ
	qvbWU9MPdMjXvhrvYjtBrPzXaL0Jiu2jMoawYnqnfo1xwIAFhaaJqze0pSGbNfIN4Zdq
	iaQg==
X-Gm-Message-State: AEkoousVgOoomZlhL1BolUY+SLwM2NRB0ERJBoXdxI8cds0aHEAvn4vzWPEslo9/WcLO8kbRDqxp+rZyY8T59g==
X-Received: by 10.36.77.145 with SMTP id l139mr18738754itb.19.1470665565484;
	Mon, 08 Aug 2016 07:12:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.21.197 with HTTP; Mon, 8 Aug 2016 07:12:25 -0700 (PDT)
In-Reply-To: <1470663448-5191-1-git-send-email-ejo@pengutronix.de>
References: <1470663448-5191-1-git-send-email-ejo@pengutronix.de>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 8 Aug 2016 07:12:25 -0700
X-Google-Sender-Auth: I8lagODrOFwDmn-MYo4TNE3GRr8
Message-ID: <CABcZANmAHYLCFWAZ4PTbocpnivgBMAOXbeNde2wFCx+ZDxGWOg@mail.gmail.com>
To: Enrico Jorns <ejo@pengutronix.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix useradd parameter generation
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
X-List-Received-Date: Mon, 08 Aug 2016 14:12:45 -0000
Content-Type: multipart/alternative; boundary=001a1144d0429d3e1605399002c6

--001a1144d0429d3e1605399002c6
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 8, 2016 at 6:37 AM, Enrico Jorns <ejo@pengutronix.de> wrote:

> Constructing the USERADD_PARAM_${PN} value with += (as done before)
> resulted in having a whitespace added for each entry not having its
> PACKAGECONFIG parameter activated.
>
> This is not only a cosmetical issue. The useradd class concatenates all
> useradd commands from all subpackages of a package by doing a
> ";".join(). When having a useradd command that ends with ";" and some
> extra spaces, concatenation will result in an empty useradd argument
> ("commandA;    ;commandB"). The useradd command will be called with this
> and make the Yocto build break by returning an error code.
>
> Fortunately, there is no problem when having a "commandA;;commandB" in
> the useradd string, this will be ignored. Thus using "_append" instead of
> "+=" is sufficient here.
>
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
>

Use .=, not _append. _append is a postponed operation, .= is immediate like
+= is.

Also, why not make useradd.bbclass sanitize the input / ignore empty
entries?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1144d0429d3e1605399002c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 8, 2016 at 6:37 AM, Enrico Jorns <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ejo@pengutronix.de" target=3D"_blank">ejo@pengutronix.de</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":18y" class=3D"=
a3s aXjCH m1566a6f2a5aae5e0">Constructing the USERADD_PARAM_${PN} value wit=
h +=3D (as done before)<br>
resulted in having a whitespace added for each entry not having its<br>
PACKAGECONFIG parameter activated.<br>
<br>
This is not only a cosmetical issue. The useradd class concatenates all<br>
useradd commands from all subpackages of a package by doing a<br>
&quot;;&quot;.join(). When having a useradd command that ends with &quot;;&=
quot; and some<br>
extra spaces, concatenation will result in an empty useradd argument<br>
(&quot;commandA;=C2=A0 =C2=A0 ;commandB&quot;). The useradd command will be=
 called with this<br>
and make the Yocto build break by returning an error code.<br>
<br>
Fortunately, there is no problem when having a &quot;commandA;;commandB&quo=
t; in<br>
the useradd string, this will be ignored. Thus using &quot;_append&quot; in=
stead of<br>
&quot;+=3D&quot; is sufficient here.<br>
<br>
Signed-off-by: Enrico Jorns &lt;<a href=3D"mailto:ejo@pengutronix.de">ejo@p=
engutronix.de</a>&gt;</div></blockquote></div><br>Use .=3D, not _append. _a=
ppend is a postponed operation, .=3D is immediate like +=3D is.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also, why not mak=
e useradd.bbclass sanitize the input / ignore empty entries?<br>-- <br><div=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher L=
arson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Ope=
nZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics<=
/div>
</div></div>

--001a1144d0429d3e1605399002c6--
