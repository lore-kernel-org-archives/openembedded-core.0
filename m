Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF7FC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 10:19:35 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7685.1786875572578963076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 03:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=gT9baJDM;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Uty8vtiE;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CECD87A00F5;
	Sun, 16 Aug 2026 06:19:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 16 Aug 2026 06:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786875571;
	 x=1786961971; bh=g0w8NccJXIhAsqapZzEZyfmo2ImnWlIOwyqwaICgEoU=; b=
	gT9baJDMWJoNI5Ven5hJ2fy+T90PLS2Fmj5+yP3QB3AqFjgLo5QK8YBhFogHhEza
	vVUy2l4t2lwofwxU2hvH/6cko3mQkgCBK48XUrqxE5vctC4IzBzPGCXKu9mVu8nM
	8hepkkAKU4sVaqZ0lkxh/vsiEI79uVkCugi/e5vcbu0BpV/sV5xZz7EhFX0V314N
	eWn74J0rJt0ExAKXY61y8SSsiCFqfO6osed/QgbYDHfwXVq1yiNYRaBp/q8VeWsy
	2rYDLgtHPXacinir1+zwblnCpC0m0MmANqDpGM8YH/UjjHNsrPdfyIct1HXsgIIZ
	KH2VUPW3FyGssdtkfXbDdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786875571; x=1786961971; bh=g
	0w8NccJXIhAsqapZzEZyfmo2ImnWlIOwyqwaICgEoU=; b=Uty8vtiEBU/prGGQH
	tKfdHTslHeYDQEgW9HbTdwVJ8s/USxIhvDNvTIMA28vXuKSjWMjqRQ72/V6cbS+n
	wkl1UiQ6Dqv5tZsUuIkpcfAkLX1AkzX006oCQfYxP0o/8zT228kqgu6bS23FhqBu
	RDBFxB17PzNhcKOUuT65gaUaihtWPR4qp4XDY8Xjgf+NDHfQdYKVtHN6Korrxdy1
	yTmiLJxffHCJ1ejjal3Wr4B9EzDRXbRJaAh4P3sbvKdB7cjD7ptTQTwWLQCB4Qu1
	t5KxR/aajMsxfT7efHlEZHQlL3paobLGolnWqsbgGWWW6SEabVxFT8Uq5gph1Ei5
	f5Ayg==
X-ME-Sender: <xms:s46BapMP1mpAlsh7NO2iOdhz4yetDGLmYJit9iapa8NtPRcWpKxQmg>
    <xme:s46Bah9TOn3O5LeHarbBVOX7_w6m83RVD3ieK7h_2hypsfIfb81uhWNawcI52RMW8
    Ca01i3ROPjQyvnEfIMc_C1GFxyVfs7cdsCNj6BKxDxiAuOWenoSYPs>
X-ME-Received: <xmr:s46Bal40YG-kpOcZ1ypmoYHx541O6yvMiiB59H_lcoCkl8uWdmO4PhP4IQYAVGQyvVs3Ko6URRwLtYZtZRukz7sMcS7WP5x3wr_VhObeXYKg>
X-ME-Proxy-Cause: dmFkZTGseWxfvK6qEhFO2gvEwe4RI/vvd5TgqJ2MYISEf1gkgXa5VGD6dmFb2zTEGpRPhr
    Rvw04Kz8g0EtC9+/U36w/riLw2SiVVIjgVMe3WNDDu+WK0Q3cgmJJwy8JLKkJRdAdRg89W
    hHON0I0+VII4adsgeNeYo5xjjbO213qaN1KK2/U3ad6m7Ig8Wb3/hvT6k4KjtFnx85zlja
    M/y7S11Sm87oY+lDvBKyxEhXcb0FfeHlkJMMmTNc8QRtVNu87AFatJN/4KMEXeAsBVL1KW
    QebybVau4hLdPkgVwa9jS1mc2aNSpKS/MOl7+h+7egyAHr2O849GhDnlEccZKDcum1aLdA
    7J4UqR5VmFqndJF3CAnW0EcASJJe8MLm397aDT/yK0J5ZdST9fBdPyFcs+BddBBVq2Nz4a
    FDhZ7yh3Ewtd4PeWu3WCGkpoo+PLQWeiEX6bXhSh88Yx4r9bVIDHMveMpkW5c+0aylh0kC
    ZJoYlhh9A3OaIezJchcZtjWLVcE7vW2m/tXhU2VBy9Qy5xF9e1l9LfeA1085RvoVIW2MFp
    3xFPVXWeNe9zbkbH8hUoK40fUnXpMyk/1aC+1ZGm0iZGoDpE2aFBzcScvUJVqUJT0XhtVa
    SB9af5KY7ZwaZryiBPkh2rGuAkyNtSLxno6k9cruuK4jlGwolUUc9OJmaNLw
X-ME-Proxy: <xmx:s46Bag0Jhc04SdEcsrZctsfdUW8KA1QtIIJd0-dqmsdQzlNUR1y7_g>
    <xmx:s46BakAGiY-2iufp4LYq3TSVGh_8YMwVWV5xsNp2RVNf72gTR4rndQ>
    <xmx:s46Baq0UjRnCdESVP5cBPFWt-PZjKjM-8db8G2NwvHjacC5JVczeow>
    <xmx:s46BamvutZKXDjK8jvLaJfVTPK6xk73GQOzkunPinf0gOj5xnNiywA>
    <xmx:s46BavyfXBgG3jA4Cxr7IL4kvaA9wwAOx1qagRFSYj0XVLP6k9f-L5M_>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 06:19:31 -0400 (EDT)
Message-ID: <1d72f768ffe412a45227e6f38d5fc485a86d811b.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose 10/17] glibc: CVE-2026-5358 add CVE_STATUS
From: Paul Barker <paul@pbarker.dev>
To: Fabien Thomas <fabien.thomas@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 11:19:30 +0100
In-Reply-To: <75d7aa9f43395c673a5a41511cee34c5bb62d199.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
	 <75d7aa9f43395c673a5a41511cee34c5bb62d199.1786633048.git.fabien.thomas@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 10:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243510

On Thu, 2026-08-13 at 17:22 +0200, Fabien Thomas wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>=20
> CVE-2026-5358 has been marked rejected.
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D34067#c6
>=20
> https://inbox.sourceware.org/libc-alpha/20260421164416.4031726-1-carlos@r=
edhat.com/T/#mf76c27025e603294611196b90e428769c9fc5a4e
>=20
> Add CVE-2026-5358 to CVE_STATUS_RECIPE group as the CVE is disputed
> by upstream glibc maintainers.
>=20
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>

Hi Fabien,

This patch was not accepted on master, please drop it from the here and
from the scarthgap queue in line with Peter's message [1].

[1]: https://lore.kernel.org/openembedded-core/AS8PR10MB50735F0BDABDFCA84EA=
8283AFDC82@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM/

Best regards,

--=20
Paul Barker


