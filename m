Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDB7608BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 20:03:52 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id m20so3304765qcx.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d43icysOQhNxKvnl0rlG7S8q4Bm4Xw3gUXaf4xUCJy8=;
	b=bMRZGHpTXOIu75r6BKIdnoHi5aOlqlTEjImEXoykhHbPSmgfuH/Uvsj+qRdXSMywLJ
	3eoKxi9iw1/diP9epEMsKfGzjD0Y0CvNmNIKlosXhqx4IQ26cBJtzPFHdxDkAsS0fsbS
	wpbfY43qc9cIxOSrTlSOUwkEnBiCYjm0S2nVZN6kOLh1J5ejVfh4Q/ULAWcuDyoMXUTc
	NPt/0rzs1zSXXrn2SMqVq84Kc7G80efyxbgGDcrXW/6sa7KSTL+AdUvMK1qbOysRZyiw
	suhe2igNN/ubNao4HgMhanNDJq/GUNtZ6C4RcSBjhF2rnkWpl1rC5lIa/FejA2tY666i
	TXmw==
X-Gm-Message-State: ALoCoQm+PkcAKwimf+nnLa1Bu5Dg0JIns2SRhNlQdvQGJlrGXKJbEJYUEvvJRmUo+29StEaPZygj
X-Received: by 10.224.2.135 with SMTP id 7mr685994qaj.64.1414008228676; Wed,
	22 Oct 2014 13:03:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 22 Oct 2014 13:03:28 -0700 (PDT)
In-Reply-To: <00f8984de62bbf66c7487bc854c4e5c10ce416fc.1413947830.git.wenzong.fan@windriver.com>
References: <cover.1413947830.git.wenzong.fan@windriver.com>
	<00f8984de62bbf66c7487bc854c4e5c10ce416fc.1413947830.git.wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Oct 2014 21:03:28 +0100
Message-ID: <CAJTo0LbMFw8TiZkn=nchFCmbA9ZgZhW2+yaQnhg99=g4i3n2=w@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Wed, 22 Oct 2014 20:03:56 -0000
Content-Type: multipart/alternative; boundary=001a11c3defa2e1a4d0506087282

--001a11c3defa2e1a4d0506087282
Content-Type: text/plain; charset=UTF-8

On 22 October 2014 04:23, <wenzong.fan@windriver.com> wrote:

> +-      @echo '#define  LSOF_CCV        "${CCV}"' >> version.h
> ++      @LSOF_CCV=`${CC} -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'` &&\
> ++      echo "#define   LSOF_CCV        \"${LSOF_CCV}\"" >> version.h
>

It seems that a better (and importantly, upstreamable) fix would be to pass
LSOF_CC correctly to ./Configure instead of overriding in do_compile(), and
change the LSOF_CCV assignment to run LSOF_CC if _CCV isn't already set.

(My general approach here is spend a little more time getting a fix
upstreamed so that we're not fixing our patch every few months)

Ross

--001a11c3defa2e1a4d0506087282
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 October 2014 04:23,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzong.=
fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":4fd" class=3D"a3s" =
style=3D"overflow:hidden">+-=C2=A0 =C2=A0 =C2=A0 @echo &#39;#define=C2=A0 L=
SOF_CCV=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${CCV}&quot;&#39; &gt;&gt; version=
.h<br>
++=C2=A0 =C2=A0 =C2=A0 @LSOF_CCV=3D`${CC} -v 2&gt;&amp;1 | sed -n &#39;s/.*=
version \(.*\)/\1/p&#39;` &amp;&amp;\<br>
++=C2=A0 =C2=A0 =C2=A0 echo &quot;#define=C2=A0 =C2=A0LSOF_CCV=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 \&quot;${LSOF_CCV}\&quot;&quot; &gt;&gt; version.h</div></bl=
ockquote></div><br>It seems that a better (and importantly, upstreamable) f=
ix would be to pass LSOF_CC correctly to ./Configure instead of overriding =
in do_compile(), and change the LSOF_CCV assignment to run LSOF_CC if _CCV =
isn&#39;t already set.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">(My general approach here is spend a little more time gett=
ing a fix upstreamed so that we&#39;re not fixing our patch every few month=
s)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div><div class=3D"gmail_extra"><br></div></div>

--001a11c3defa2e1a4d0506087282--
