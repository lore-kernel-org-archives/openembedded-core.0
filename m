Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B1CC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:09:02 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web11.78447.1705939739948786686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 08:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=CxG07Bgi;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=mJdSimSY;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.21, mailfrom: patrick@stwcx.xyz)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 1E55D3200ACF;
	Mon, 22 Jan 2024 11:08:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 22 Jan 2024 11:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1705939738; x=1706026138; bh=pzdYBIrxFd
	KJcJhpYpCWAH1+kYsjp1ccMfXuZpwf4/g=; b=CxG07BgimIv4OUWt/cX7vxwY63
	Kj5HB9+xbYDRUZnb8qG8LsOE81ddt1dqzVgmCOspInRyu+pW7GWKVRJEywuJskO0
	f0+eOLp3EZzZ+Eb4jzlIggUN4mUL/xSiZe0J+IeQDWFvs+/Ytt3gOQie1TLqZNhA
	fhCsxCr4v2AJuHswbQgWXAVa/AB+aaoz9kIYuMqEdOE+xNVC9Fe6DK4QPU3bx3Xa
	pUdfVW71oGubPe/hqP1L735t8ti2tdtfJTBl0OFCwHO9DzZl7LGPa0k08qey0ue/
	gMLuFc7X/mVzYUhtf89sSBvqn3wQ1c4yFPpPSaRWxVx5LnEvHFp6luNhQ6GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705939738; x=1706026138; bh=pzdYBIrxFdKJcJhpYpCWAH1+kYsj
	p1ccMfXuZpwf4/g=; b=mJdSimSY1P9uHda1+8TBfok4vUCO5XLLlsjuINQtG22d
	UXpDp+zLY+YlfY1a7XxVN+3iR/IOaQHLnWFsiZ/jwmuGBMGobO+vz6BM4ZSvARh7
	E9nTYu5aiG3zNI3Jqa6lVcZwKGNxxrG5bzRHR5/6ea5bOrK8+GHJfTyiCywjoxB1
	xd55yoyoiLdx7CMIlRa+u9dGkCnxvgnBJl9rxQzgwvI+V6W1NcRYNYXqePhod6Ze
	EcnqO/LCCVDd5RkfCHM4ZlvqMZoY6uzknthC1mL9rwUanXMR83Z/3v+PTtT/TgiD
	q25cErczxSdoPN0kb1szElpgXxQ5qWP3POUSPypbPA==
X-ME-Sender: <xms:GpOuZQsLdCwxSdN1QvoOjnoBsgXzbVpFdoMImGTKb_73m8YP-NSmsQ>
    <xme:GpOuZdexbi_llTjI6ASWRpvDsS5cV9wLHcLX2c1akdjiBE_XYt6zIc_lI26DyhFBh
    E0uWgQ6kFCtQtmCkbU>
X-ME-Received: <xmr:GpOuZbw6fQE5djl_LXRcEQGCPFtOpFdd4dkCL-eDkUiGSDmJxbcPnpM7b1F5gbeVnkCn7UroJNeLAPW-SFjTC-DIa0gi7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeukeelgffhtdehtdevgeekvdfg
    geekhedtueeiffevjedvffekvefguefhkeelieenucffohhmrghinhephihotghtohhprh
    hojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:GpOuZTNWSpdYi0LJhAvg6gxw_JpBxx9gCOpZ__l6juMRq-9uC4rfJQ>
    <xmx:GpOuZQ9KYCHhRs-NFz39IOze0Uhk3runnMAm7CWdPu4PkWEqHctSXA>
    <xmx:GpOuZbWeQ4GbEI5GCg81OLk4Bc3sTg4PtOKE81cPTbnFAZfZHXQviQ>
    <xmx:GpOuZVFzGGIZHeJTnIBCINho--CEp-GMKFGcl1CV14ajXRpAr_0p9g>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 11:08:58 -0500 (EST)
Date: Mon, 22 Jan 2024 10:08:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] classes/recipes: Switch to use inherit_defer
Message-ID: <Za6TGMUsZp19KFrB@heinlein.vulture-banana.ts.net>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
 <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pRR4b+cYGxyt7QjX"
Content-Disposition: inline
In-Reply-To: <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 16:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194181


--pRR4b+cYGxyt7QjX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2024 at 02:59:02PM +0000, Richard Purdie wrote:
>  meta/recipes-core/libxml/libxml2_2.11.5.bb                   | 2 +-

I'm seeing some issues after this commit with libxml and Python
PATH, etc. variables.  I opened a bugzilla but maybe I should have
reported it to this mailing list first.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15361

--=20
Patrick Williams

--pRR4b+cYGxyt7QjX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWukxYACgkQqwNHzC0A
wRmzww//UEsD6RK7aNKbxf/2q29OfBVDFQawGUfDnJkESW7jGpQbLOXNnzdt0xpi
1N8tN69FC4tTcMvsa5op2n0RPyh0XvDcuYDdf5+h4Ldz7AFuLY1o+BHkDYEO8/Wr
CBFLh6HyjZRDzoF5DDnI2lxo1nP5Zdte2uxr+oFz191zXdht0fmuRowhSGPG5J8H
O5w4EcKP8varyR7Q05ddZQFkxH3C1fPg52+lbQWVMp/AKikZMohRmYCRrMbU6zXA
vsbfUZfnCvhLY0pryrnM2RJh2KLfLAFcYmsn3Fq9a3uHz2reC9EzVuwOYitV5B2S
EBiTVRQGXoWT1u3/GwNo66eFYSfhczjP0jWPdGEcN0lnfD4j8ygcG/Ac6ybc1Qgf
erp6Zvp81LmpeTylvPYNPxYd8EJbuQ32lsXXmCVRskHCfX2PvNHw1J8k+03oVnem
2hxnOzwyMM5hGVAJTvaZ/ts5En410Bfgq6YLkb7v6xGLfo8w4Xy7pKStWk/cmtiN
zn0snW4jGxXjCRggS+8654QER/+8G0ATEuL3R1+yqN/fJ34uNsuaYfQY7p/dI+uc
ZovE3dYsC+Ga19lyoHIMNUpMOqSk7IHQMFf1Djce8T/gLXZmXV9UZOsd0dWbm4Np
xNwmJBDZRXQMwat1plNINGtvu0FOsIxcicGduPJk6iOdsfquqA8=
=ayWc
-----END PGP SIGNATURE-----

--pRR4b+cYGxyt7QjX--

