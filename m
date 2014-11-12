Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 51D2F7210A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 15:55:48 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id r5so1419143qcx.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 07:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7J2Bm1n51ctoUmSoTBbCxaZB6znNAndhRo01m88nGSI=;
	b=JrROvjoUmE1GuTKZCNQxoCRSCPBDDyzvpg7HQ5s6hQi34jOnbikg78dgk3bnjssbDN
	3WgwmDhQoaDHfPbquBrDyBu8+DrpJuPEa499s+tO0/6VuzDtLBtPhhOIXXrEVE3y92s3
	uO7PFKU0s3EBPqGhbBhVvh0cQ8NRwGQPJi3SRkFvAP8NkpSVh0PiUZ0DBkFig5qDMc7d
	NjW1tV80MAJm3XfTqiz07iDA4Nj50PdQ2rykZK+D/qRTvCJgIyBP6D0FIF6mF/vFlQ5h
	/zJ6WODREzNWpirJg++EbqYau40nSli/wvNB5FmXAZ+soD1QSCLUzlInVqBcpD7o5sx4
	86VQ==
X-Gm-Message-State: ALoCoQmuhLQiILpqLILzaLpUf07ZrEdRZ1SRtzJugxVeGqt3P9YrW+Ro5NBIfzSRRbHOGKrSLPDo
X-Received: by 10.140.94.246 with SMTP id g109mr59622046qge.77.1415807748913; 
	Wed, 12 Nov 2014 07:55:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 12 Nov 2014 07:55:28 -0800 (PST)
In-Reply-To: <a44b261f0031a4d82f8fae0e968522139f607f90.1415789100.git.Qi.Chen@windriver.com>
References: <cover.1415789100.git.Qi.Chen@windriver.com>
	<a44b261f0031a4d82f8fae0e968522139f607f90.1415789100.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 15:55:28 +0000
Message-ID: <CAJTo0LbDXrc=RK5zbE2z24K86Ti5eEcS1LRYCOHC7jfFeUOpFA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: add option for valgrind header checking
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
X-List-Received-Date: Wed, 12 Nov 2014 15:55:56 -0000
Content-Type: multipart/alternative; boundary=001a113a81d6f1d3f20507ab6d89

--001a113a81d6f1d3f20507ab6d89
Content-Type: text/plain; charset=UTF-8

On 12 November 2014 10:45, Chen Qi <Qi.Chen@windriver.com> wrote:

> +-AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h valgrind/valgrind.h])
> ++AC_ARG_ENABLE(valgrindheader, AS_HELP_STRING([--disable-valgrindheader],
> [disable valgrind header checking]))
> ++if test "x$enable_valgrindheader" != "xno"; then
> ++        AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h valgrind/valgrind.h])
> ++fi
>

If the user passes --enable-valgrindheader and valgrind isn't present, it
doesn't fail.  Combined with the lack of a valgrind build dependency in the
PACKAGECONFIG statement this isn't a very useful PACKAGECONFIG option as it
only works when not specified, and if it's specified is non-deterministic.

It appears that this valgrind support is for running the test suite under
valgrind for leak detection, which is something we're unlikely to do.  A
quick fix would be to comment out the check.

A proper fix would be to use AC_ARG_WITH(valgrind), default to "auto", use
the pkg-config macros and respect yes/no/auto as appropriate.  The mantra
here being to spend ten minutes fixing it properly upstream instead of
having to rewrite the patch often as upstream changes their configure
script.

Ross

--001a113a81d6f1d3f20507ab6d89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
2 November 2014 10:45, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.C=
hen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">+-AC_CHECK_HEADERS_ONCE([valgrind/m=
emcheck.h valgrind/valgrind.h])<br>
++AC_ARG_ENABLE(valgrindheader, AS_HELP_STRING([--disable-valgrindheader], =
[disable valgrind header checking]))<br>
++if test &quot;x$enable_valgrindheader&quot; !=3D &quot;xno&quot;; then<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h va=
lgrind/valgrind.h])<br>
++fi<br>
</blockquote><div><br></div><div>If the user passes --enable-valgrindheader=
 and valgrind isn&#39;t present, it doesn&#39;t fail.=C2=A0 Combined with t=
he lack of a valgrind build dependency in the PACKAGECONFIG statement this =
isn&#39;t a very useful PACKAGECONFIG option as it only works when not spec=
ified, and if it&#39;s specified is non-deterministic.</div><div><br></div>=
<div>It appears that this valgrind support is for running the test suite un=
der valgrind for leak detection, which is something we&#39;re unlikely to d=
o.=C2=A0 A quick fix would be to comment out the check.</div><div><br></div=
><div>A proper fix would be to use AC_ARG_WITH(valgrind), default to &quot;=
auto&quot;, use the pkg-config macros and respect yes/no/auto as appropriat=
e.=C2=A0 The mantra here being to spend ten minutes fixing it properly upst=
ream instead of having to rewrite the patch often as upstream changes their=
 configure script.</div><div><br></div><div>Ross</div></div></div></div>

--001a113a81d6f1d3f20507ab6d89--
