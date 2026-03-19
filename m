Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C253107526F
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 07:29:54 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5703.1773905380982790721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 00:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OmIAfv2N;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12732e6a123so273495c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 00:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773905380; cv=none;
        d=google.com; s=arc-20240605;
        b=Oqs1/nX3JBEeuodXGHh36z3hI2Rnwlcmzlx7KLJiwQtQENHaZhCA/hLNW5ocgCvDpT
         7sdM1PPbwopzmcHyI3TIerlb2swRR7mCi6iSgFBmSoqicv77/1BKy6TRZn5n/R2kbDAb
         QmbOMKWvsdcKzsjjG7I33Rdy4xjlbH2r9TsJ9bWP5HcA7gwTUxW8/F3VDbc0qDLVsXsk
         hcQg9weZYHD7dW1o9auGYDXvdXEp1hzUE+DR7ygcJHDdKjz48L+dkXku0NowNJDZlAf3
         J1gkmz7jr/Bc2pt8M+kwyIVUZiZXWqyx99pPy/YduCPoWET2HyH9S1TgBIF7X6uzLgWW
         Ab3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XNQ+kYlrBkQNN4MFzODTW1PpjLw2xifrqyufPP0mhlo=;
        fh=Z7fw4Qo8jS9hER93igQcrY+JtPIiAZWhr8uVn3LxkF8=;
        b=YuunZq3VQftYGZSlI0h/pN9m0dfrsNGr8Z6qjzuQrHs1oON12h7BGGaBM5kkLHrt7n
         f5nyV0uiaQVEuZJ/i3ofz0/LxH3sE8O9uW0HeIGUsDDu2hKwymALpT6kRi21R24NifyZ
         16XChigvFViR63NNBEgO0sPjhfmRIPBuMH+2FxMORWqndxplwi66U258vjPrP75ZKu5P
         Vnpuhlfz/UlU1t+PgrNkGKYINb7VPIWtIxCSz21jZETERY95JT58q4r8xEGj9/ExvlkN
         0KNiRTGoJcFEb8Xf0L+quUP1quoHlxHpMJFVTsTv7/TN9cdyQRtCVyvX1N4ebQvvbKNN
         7s+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773905380; x=1774510180; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XNQ+kYlrBkQNN4MFzODTW1PpjLw2xifrqyufPP0mhlo=;
        b=OmIAfv2N2RvD1qROXeZQfdqOU3f+CRi4U2FlvMbTLjzLybvJNz8aOl0g2f4t0ujs2C
         pZbqDIgrfGSM7j25g2D7yUO/otDtsFxhHki9are+5fe4vI5ygPZdYqmO/Hzo2UIqeG2O
         cr6IlOsQ6Nek9x7VWdoSQ08BfaD3OKcrrEKkiJ8MnefG0q8cVUEVAAEBCPkycTUNOz0r
         pTi+mUnydWLN6uy5uQJKBI7zd7Cr+raa4vtwv1gMmKZ/xEdLD335lUcd5YTigBFZFWQI
         FQikl2KuA2EC21KdB1WnJtg6Es+JbwnGGFr0TLZbYJu29zZyVXQ55zXv0e790wYxFgzL
         nx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773905380; x=1774510180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNQ+kYlrBkQNN4MFzODTW1PpjLw2xifrqyufPP0mhlo=;
        b=NdPFJ7g0/iN3eMdzbINovDXfG6003BjbfVuJgWQjzD/IK9MNVgyPghdqFkzyxmsdQG
         I5OfhXA5ZU3aUImsHlsqp1A5RBSt/Bj9LfmLxMnx4ZeACIt4TvehzApxQO74M8gsW52q
         +duZB+dqx+Qa4c54IhkMmFu7nNbxzpClZtQwIVJYL/NOi8tux0531HbSKenITc/J/YNq
         bcOomcscDC1f3/QCd57hVhlT5Y0acwkZKSRP6EwrSLXa4d1dS/XM6lf5uPXOyciY9Xxz
         0YqtOi01QAH6xBvU+dTIsB3udzZLhdTsUqUiUGMXULR066aJPh3CjodSdx4yJSTZPbdZ
         G6QA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Cj4Zji/OKLTgTh8iMz0o3FHf1iwcQMYMbhsytNcvSpziSEz++FtX0VN7doX7EJ6KMFe9JHMOnqteaz0v9ZthiA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy438MPc7/Drm4tueo1mRKcog3p5l2VCthxSLZ0gIAxR8wukFry
	Xi29DFPYINZdw6vdwZx4kNpDZ9hV/428In/kk3RghzPAFzZmhhtf5nKPsyoJw2LqEHL6ubuVzMF
	jl1VqQUaMEOjFY76zpSfxHLfysTJZAN8=
X-Gm-Gg: ATEYQzzbgcUQBvSsyv3Gi2SMMmLX3HIlV3USjIxVcCmi7/DxUT/IzsGx0D3nCh0o2A5
	h6Pnj9cvgbgkaXLYeqoAkfG+uUaKNP2OSq/rtVxuuhrDdREpUHJ+y3pspsAu1KyXz0WfA/cdkL8
	IfarK9oXZJTEho4c6tZ7aHXyb+cQZJZUoKzMj5CZ/0o06nBwYL4W1i65PpwCifqjcdIgfM11oSP
	Q3LsppBnboKPAtzldq179AisI1kTeVmlcCq8TSE46KnGm4FTE6anvekxWrg3/pVcR/mwBp2QYvE
	AfjlPJYDgXn4s5qnP4wLW7+2WxjCm8wK+SfUtXe0h5P1AETVgrg=
X-Received: by 2002:a05:701b:4282:20b0:128:d386:4bbb with SMTP id
 a92af1059eb24-129a7111de4mr2354822c88.13.1773905380044; Thu, 19 Mar 2026
 00:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com> <64a1484a196d4e9c603ec6dda598c6a8c4b91606.camel@linuxfoundation.org>
In-Reply-To: <64a1484a196d4e9c603ec6dda598c6a8c4b91606.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 19 Mar 2026 08:29:27 +0100
X-Gm-Features: AaiRm50jDim42nrU5pyxRxxLoQJ6V5pkr8Fs96LraPkejkq6oWRGn_vNSUde4BA
Message-ID: <CAApg2=T6f1yQ8qQFF+V3K+0yhpZWscDUqO+pXA2MK0jik3C4Yw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using
 BitBake fetcher
To: richard.purdie@linuxfoundation.org
Cc: benjamin.robin@bootlin.com, openembedded-core@lists.openembedded.org, 
	ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
	olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000000af5f1064d5b8876"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 07:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233464

--0000000000000af5f1064d5b8876
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 6:45=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> Hi,
>
> On Mon, 2026-03-09 at 12:57 +0100, Benjamin Robin via
> lists.openembedded.org wrote:
> > This series is an RFC and a follow-up to patch 6/6 ("Add class for
> > post-build CVE analysis"), which was previously discussed [1].
> > I have prepared two RFC series, this one and another, each exploring
> > different approaches to handling the download of CVE databases.
> >
> > I explored using BitBake's internal fetcher instead of direct Git calls
> > for fetching CVE databases. However, I encountered two major issues:
> >
> > - No proper shallow clone support: I wanted to clone the repository
> >   without downloading the entire history (which is very large). While
> >   `BB_GIT_SHALLOW` exists, it creates multiple tarballs in the download
> >   directory, which is inefficient for updates.
> >
> >   In this series, we are going to do a full clone of the git repository=
,
> >   so this point is not going to be fixed.
> >
> > - Performance overhead for CVE databases deployment: The recipes
> >   downloading CVE databases must copy them to the sysroot or to the
> >   deploy directory. This requires copying the extracted databases
> >   multiple times, even with hard links, which is slow due to the
> >   combined size (~6 GB, ~672,000 small files).
> >
> >   In this series, we are using a custom deploy task that is going to
> >   copy the git repository using rsync directly in the final deploy
> >   directory, by-passing all the Bitbake logic.
> >
> > Additionally, there's no built-in way to control the interval between
> > CVE database fetches: In this series, we are going to use AUTOREV,
> > which imply to query the git repositories for each build, to check if
> > there is a new git revision.
> >
> > Moreover, this series ensures that the CVE analysis runs only when
> > the original SBOM changes or when the CVE databases are updated.
> >
> > Upon revisiting the class and its associated recipes, I identified
> > several areas for improvement, which were fixed in the first commit.
> > This series also includes a second commit making the VEX class optional
> > rather than mandatory.
> >
> > [1]
> https://lore.kernel.org/all/20260226-add-sbom-cve-check-v3-0-2e60423f4d35=
@bootlin.com/
>
> I've just been trying to work out where we're at with this coming up to
> release and we need to get this resolved.
>
> I feel quite strongly that we need to use the fetcher for obtaining
> this data. "fetching" isn't trivial and is full of
> license/auditing/sbom issues. Making any exception to that, even for
> cve data tends to become problematic later.
>
> The existing approach was only done as it was a sqlite database and we
> didn't have fetcher support for such a thing. If we need to improve the
> git fetcher in some way to better support this use case (e.g. shallow
> clone update efficiency), that is something we can work on.
>
> As such, I was wondering if you had never versions of these patches?
>
> I'd note that we can't set AUTOREV by default, we'll need to specify a
> revision, and document how the user can enable AUTOREV in their config
> (maybe even a config fragment?). Whilst it is annoying to do that, it
> is a requirement that the system doesn't touch the network outside
> mirrors unless configured to.
>
>
Fetching the complete git repos has a number of problems. Why not use
release
tarballs like those in  https://github.com/CVEProject/cvelistV5/releases ?
Fkie feeds also have them
https://github.com/fkie-cad/nvd-json-data-feeds/releases

CVE versions of those repositories are good for manual analysis, but a
simple
check does not need all of that.

Also, I'm worried about the size explosion with additional databases that
will be
needed in the 1-2 years time period. I also wouldn't assume all of them
will have
git mirrors.

For an analysis I think it would be better to integrate sources in a
database,
but not a relational one (like it was done with sqlite). An object database
corresponds
better to what the data contains.

Kind regards,
Marta

--0000000000000af5f1064d5b8876
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 18,=
 2026 at 6:45=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailt=
o:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi,<br>
<br>
On Mon, 2026-03-09 at 12:57 +0100, Benjamin Robin via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> wrote:<br>
&gt; This series is an RFC and a follow-up to patch 6/6 (&quot;Add class fo=
r<br>
&gt; post-build CVE analysis&quot;), which was previously discussed [1].<br=
>
&gt; I have prepared two RFC series, this one and another, each exploring<b=
r>
&gt; different approaches to handling the download of CVE databases.<br>
&gt; <br>
&gt; I explored using BitBake&#39;s internal fetcher instead of direct Git =
calls<br>
&gt; for fetching CVE databases. However, I encountered two major issues:<b=
r>
&gt; <br>
&gt; - No proper shallow clone support: I wanted to clone the repository<br=
>
&gt; =C2=A0 without downloading the entire history (which is very large). W=
hile<br>
&gt; =C2=A0 `BB_GIT_SHALLOW` exists, it creates multiple tarballs in the do=
wnload<br>
&gt; =C2=A0 directory, which is inefficient for updates.<br>
&gt; <br>
&gt; =C2=A0 In this series, we are going to do a full clone of the git repo=
sitory,<br>
&gt; =C2=A0 so this point is not going to be fixed.<br>
&gt; <br>
&gt; - Performance overhead for CVE databases deployment: The recipes<br>
&gt; =C2=A0 downloading CVE databases must copy them to the sysroot or to t=
he<br>
&gt; =C2=A0 deploy directory. This requires copying the extracted databases=
<br>
&gt; =C2=A0 multiple times, even with hard links, which is slow due to the<=
br>
&gt; =C2=A0 combined size (~6 GB, ~672,000 small files).<br>
&gt; <br>
&gt; =C2=A0 In this series, we are using a custom deploy task that is going=
 to<br>
&gt; =C2=A0 copy the git repository using rsync directly in the final deplo=
y<br>
&gt; =C2=A0 directory, by-passing all the Bitbake logic.<br>
&gt; <br>
&gt; Additionally, there&#39;s no built-in way to control the interval betw=
een<br>
&gt; CVE database fetches: In this series, we are going to use AUTOREV,<br>
&gt; which imply to query the git repositories for each build, to check if<=
br>
&gt; there is a new git revision.<br>
&gt; <br>
&gt; Moreover, this series ensures that the CVE analysis runs only when<br>
&gt; the original SBOM changes or when the CVE databases are updated.<br>
&gt; <br>
&gt; Upon revisiting the class and its associated recipes, I identified<br>
&gt; several areas for improvement, which were fixed in the first commit.<b=
r>
&gt; This series also includes a second commit making the VEX class optiona=
l<br>
&gt; rather than mandatory.<br>
&gt; <br>
&gt; [1] <a href=3D"https://lore.kernel.org/all/20260226-add-sbom-cve-check=
-v3-0-2e60423f4d35@bootlin.com/" rel=3D"noreferrer" target=3D"_blank">https=
://lore.kernel.org/all/20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootli=
n.com/</a><br>
<br>
I&#39;ve just been trying to work out where we&#39;re at with this coming u=
p to<br>
release and we need to get this resolved.<br>
<br>
I feel quite strongly that we need to use the fetcher for obtaining<br>
this data. &quot;fetching&quot; isn&#39;t trivial and is full of<br>
license/auditing/sbom issues. Making any exception to that, even for<br>
cve data tends to become problematic later.<br>
<br>
The existing approach was only done as it was a sqlite database and we<br>
didn&#39;t have fetcher support for such a thing. If we need to improve the=
<br>
git fetcher in some way to better support this use case (e.g. shallow<br>
clone update efficiency), that is something we can work on.<br>
<br>
As such, I was wondering if you had never versions of these patches?<br>
<br>
I&#39;d note that we can&#39;t set AUTOREV by default, we&#39;ll need to sp=
ecify a<br>
revision, and document how the user can enable AUTOREV in their config<br>
(maybe even a config fragment?). Whilst it is annoying to do that, it<br>
is a requirement that the system doesn&#39;t touch the network outside<br>
mirrors unless configured to.<br><br></blockquote><div><br></div><div>Fetch=
ing the complete git repos has a number of problems. Why not use release</d=
iv><div>tarballs like those in=C2=A0=C2=A0<a href=3D"https://github.com/CVE=
Project/cvelistV5/releases">https://github.com/CVEProject/cvelistV5/release=
s</a> ?</div><div>Fkie feeds also have them=C2=A0<a href=3D"https://github.=
com/fkie-cad/nvd-json-data-feeds/releases">https://github.com/fkie-cad/nvd-=
json-data-feeds/releases</a></div><div><br></div><div>CVE versions of those=
 repositories are good for manual analysis, but a simple</div><div>check do=
es not need all of that.</div><div><br></div><div>Also, I&#39;m worried abo=
ut the size explosion with additional databases that will be</div><div>need=
ed in the 1-2 years time period. I also wouldn&#39;t assume all of them wil=
l have</div><div>git mirrors.</div><div><br></div><div>For an analysis I th=
ink it would be better to integrate sources in a database,</div><div>but no=
t a relational one (like it was done with sqlite). An object database corre=
sponds</div><div>better to what the data contains.</div><div><br></div><div=
>Kind regards,</div><div>Marta</div><div><br></div></div></div>

--0000000000000af5f1064d5b8876--

