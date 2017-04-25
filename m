Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 540C072F5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 18:36:42 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id r190so104750575wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5xJhoZZUL5h1i/8V/KeBTscViQ7n+7zJe9Q7iu/OOnc=;
	b=thqqebFd/8zxJD9HC7SxMCkIVJNfif+UyucXEbS8FwNVhJyx/GxqSEd+99u9uoKaVm
	d5Ya2BFGu0vllrpahlNscoC51waxFe9dccbnCw4m4xyDf2q4SvQ71jtG0NPExSR4uZoi
	Ab0MzhD72OZEk7EdZpR64NmaTIzhjteV8BZSRJrFoi7DtVuu3TXQ6y2wlT6fN34ExakX
	DHiKvnC3+pxD6KNzj+aSVjyZRAWY/WGO/RMPCvQ24+5osIbjr5X5hZhiwgfZdWNpqI8r
	oosL1wg5jqiW4QiIEl0TCUpHGAzg1CdgXK4VZDgTL7B63+TJGvbIV7Oix/nnnce9S9ih
	rauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5xJhoZZUL5h1i/8V/KeBTscViQ7n+7zJe9Q7iu/OOnc=;
	b=dFWZo+mfPmZe/EYikNk5imvz8AvXNV8Rrn2svFKaJL9IGH7lorANmlMEglihxzRvFz
	135nc+fb3FQVB/mILM6XW8IizLHNOPAqAp0zOVcyXclWslY0svDEJ1xeZ6N7d68KGHqE
	d+EdmLxhy8fym5Jog/V110+CsaMXYSNeMYQeEbyuNOIeSthRo263IJNS7lFLKApKDRIW
	TjBYi/A+JlMvrvVpGQV5gjEFomVYb4zL9K2NvogvZEs8X7e0kNS00ufaOA+viI90ygAZ
	ugpoPnkk7ZG4rxbHOC9yZc7j8j//UraL/6qSgK1avBuwEqUSeFuK9dkqf+6TyYk5Dnd+
	s/eg==
X-Gm-Message-State: AN3rC/6irzQF3kOlGnHQ0vopBtLHZhgS7mSLF1NocG+KCgJ9Gzvg+suz
	6vYsfHgSPPpmv79+fDBewQ1NVBMNLg==
X-Received: by 10.80.136.74 with SMTP id c10mr6406986edc.168.1493145402966;
	Tue, 25 Apr 2017 11:36:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 25 Apr 2017 11:36:42 -0700 (PDT)
In-Reply-To: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Apr 2017 20:36:42 +0200
Message-ID: <CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Tue, 25 Apr 2017 18:36:42 -0000
Content-Type: multipart/alternative; boundary=f403045c212a5788de054e0201a1

--f403045c212a5788de054e0201a1
Content-Type: text/plain; charset=UTF-8

Is using the last commit really that useful?

I would like to be able to compare 2 subsequent builds (ideally performed
on 2 different hosts with some small modification in metadata layers) and
the binaries not affected by those small metadata modifications should be
the same - which is not the case if we feed them with the top commit date.

The real world use-case is that we're doing daily official builds (which
don't use sstate for some bad reasons) and just comparing
files-in-image.txt file from buildhistory shows that almost all binaries
are different every day (just their size fluctuating +- 2 bytes from the
linker mangling) and when something goes wrong, it's hard to find "the
significant diff" when it's always all different even when the 2nd build
only had very small change in image recipe.

On Tue, Apr 25, 2017 at 8:14 PM, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> This patch set contains several patches aimed to achieve reproducible
> binaries.
> Building reproducible binaries may remove certain intentional
> randomness intended for increased security. Hence, it is reasonable
> to expect there will be cases where this is not desirable.
> The user can select his/her preferences via the variable
> BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not
> build reproducible binaries) in order to minimize any potential
> regressions. (Once the reproducible binaries code is mature enough,
> it can be set to "1".)
>
> The patch set is rather simple, targeting the "low hanging fruit".
> For debian packages we get a lot of binary identical packages simply by
> exporting SOURCE_DATE_EPOCH.
> For rootfs we get much fewer differences by modified prelinking and by
> ensuring various timestamps are reproducible.
>
>
> Juro Bystricky (4):
>   bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
>   base.bbclass: initial support for binary reproducibility
>   image-preling.bbclass: support binary reproducibility
>   rootfs-postcommands.bbclass: support binary reproducibility
>
>  meta/classes/base.bbclass                | 82
> ++++++++++++++++++++++++++++++++
>  meta/classes/image-prelink.bbclass       |  9 +++-
>  meta/classes/rootfs-postcommands.bbclass | 18 ++++++-
>  meta/conf/bitbake.conf                   |  3 ++
>  4 files changed, 109 insertions(+), 3 deletions(-)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c212a5788de054e0201a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is using the last commit really that useful?<div><br></div=
><div>I would like to be able to compare 2 subsequent builds (ideally perfo=
rmed on 2 different hosts with some small modification in metadata layers) =
and the binaries not affected by those small metadata modifications should =
be the same - which is not the case if we feed them with the top commit dat=
e.</div><div><br></div><div>The real world use-case is that we&#39;re doing=
 daily official builds (which don&#39;t use sstate for some bad reasons) an=
d just comparing files-in-image.txt file from buildhistory shows that almos=
t all binaries are different every day (just their size fluctuating +- 2 by=
tes from the linker mangling) and when something goes wrong, it&#39;s hard =
to find &quot;the significant diff&quot; when it&#39;s always all different=
 even when the 2nd build only had very small change in image recipe.</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Apr =
25, 2017 at 8:14 PM, Juro Bystricky <span dir=3D"ltr">&lt;<a href=3D"mailto=
:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">This patch set contains =
several patches aimed to achieve reproducible binaries.<br>
Building reproducible binaries may remove certain intentional<br>
randomness intended for increased security. Hence, it is reasonable<br>
to expect there will be cases where this is not desirable.<br>
The user can select his/her preferences via the variable<br>
BUILD_REPRODUCIBLE_BINARIES. The variable defaults to &quot;0&quot; (do not=
<br>
build reproducible binaries) in order to minimize any potential<br>
regressions. (Once the reproducible binaries code is mature enough,<br>
it can be set to &quot;1&quot;.)<br>
<br>
The patch set is rather simple, targeting the &quot;low hanging fruit&quot;=
.<br>
For debian packages we get a lot of binary identical packages simply by<br>
exporting SOURCE_DATE_EPOCH.<br>
For rootfs we get much fewer differences by modified prelinking and by<br>
ensuring various timestamps are reproducible.<br>
<br>
<br>
Juro Bystricky (4):<br>
=C2=A0 bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES<br>
=C2=A0 base.bbclass: initial support for binary reproducibility<br>
=C2=A0 image-preling.bbclass: support binary reproducibility<br>
=C2=A0 rootfs-postcommands.bbclass: support binary reproducibility<br>
<br>
=C2=A0meta/classes/base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 82 ++++++++++++++++++++++++++++++<wbr>++<br>
=C2=A0meta/classes/image-prelink.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 9 +++-<br>
=C2=A0meta/classes/rootfs-<wbr>postcommands.bbclass | 18 ++++++-<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A04 files changed, 109 insertions(+), 3 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045c212a5788de054e0201a1--
