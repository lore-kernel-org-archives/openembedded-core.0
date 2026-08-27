Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4F1C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 15:37:36 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.161.1787845048731102918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 08:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=PNykhgPi;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Frbkzjic;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C19BD14000F0;
	Thu, 27 Aug 2026 11:37:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 27 Aug 2026 11:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787845047;
	 x=1787931447; bh=mBC2hc3erKB4YjDGQVZ1f3zf0mkX0nnB4AM5EoOKEdY=; b=
	PNykhgPi2RnVGrClDCumXGbEwU/6U/8ewGLbOWmnNLG6chGuMQax8JwhkOZtl7UL
	Yb1i2TAzXweMe/thn9C8gt4hjXVSJR34r/LgGmw87Kv1KermVf0ZWu6Wc5w9UvBp
	gqgTFPgAKGH8EAJOvYp3O19vLHti1vPArNDfGCgLhB+JNaEPXab/xrdaPcsiBJiQ
	zjIk3gSXpcIlD/Sr3OuUIWV0QVs6+76p0YPuNVgiRRBRT38o54iwXeMru1IYz3eN
	GeyuNftgxWrWDn2YtGog0RSa4nep8/jBs0pPKShImIOE0IWLZghPnt7+sSXPNvop
	2B69yc3ODvwrbGb2QMIJqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787845047; x=1787931447; bh=m
	BC2hc3erKB4YjDGQVZ1f3zf0mkX0nnB4AM5EoOKEdY=; b=FrbkzjicvVRSVl7l2
	cCjpcZGSjVNZbstf585wzclnTHEOiWayYHaq80Z2jmmB64B8E67VIAPy6WPMcsVH
	NZx7EQMVC/jcnfpYSEcSiPH2pSUYiqcmvHZzuyp5Lu6POJDIC2XmAyQXfNNBBkDS
	tuHRmucP+EstKkgOor1L7oJzSXJM40giFOIah6XblMMJg1WNXodpczetdh7Q6iDR
	Ifrmv4qcxVjoIIY7JAJGJBsfT0W5d3McbSmnmrHINu6j9fhBLmwi81IZDnM1+VrH
	uzXGmZI01wQsWL7EuqnpuXg9FZn1su0TUzwa5vn+0/8oTULn4yzMO53rULokO5AP
	xr8Qw==
X-ME-Sender: <xms:t1mQagxnC_Q43mgYBNeCTLTBJXrzu48c4h_ickV75wToyDvNAZdqIw>
    <xme:t1mQaqRHE2edl3I8CqVcrTKgFq7WsA3QLyfRMDmbutS4n8mZvoozojztYg0gyECsl
    bQexfvmqoR3ypdrL0qxuCwLWWAM_cziTRU6Ch73gfRYs_UI5tg77cE>
X-ME-Received: <xmr:t1mQav_OC61t7szmjXIWBAlSzfrxVgSD447zU4sGEgbGx7mBPoQXuaqR-AECJMs301C0pEVQxeOm81icZyaHMf9JfW60NB4mlZZ0V_w>
X-ME-Proxy-Cause: dmFkZTGg6bNw1hvzdFO4tNKmR4zExGYAk/I6rdjPhrOACohqQ5FSdOKI11jpjiXV7F/AZC
    UEbHNAws4LFDn3Y9/GlNYhZBgMM/rJRQI6Nb7812guJ+WDLcJsmTFPNONrdN7k5sGqhB4X
    /VnoayUtYc/+80ZrUiDmGR2uo+1cIfuJRlWI5rzsGTk0G5xo6hC0f4Mb1NrgsHCGv5HFU3
    3UcAPEf0zQkvP8YLLxJPt1R3b7Nlg8G5fZ2Ds3NzG76jMD4tUCM0+t7Nc7axfrTs9Qo0nf
    O+I4LPOR/peNEng8sZjl1NZKmjcwv0nJiBRuVddBYfN61+Py+Ps7hs8BUYznfFMSICEJi0
    fLgoHRzPNe7/W8I75INDw5ennkUnOzd9lS6wmZH+fXmoZYu7mLqu4PuiEbfmItdLWmWBD8
    XeyXyb4U5MqgkFac+0EsO0w5DdZEa8jawwU6BdpzzzGRYeppttG4aG6c7KTrxdb+ix1dCb
    tORVyGwSpRGOXjkJY+4+R63J9QVeASLiL9h3Qmr0KXaBet3O/YXOg8+9g6OOwqJuAKQOEo
    4Lp+2YjH7FtJ2j6ocu0zwAhUlFmyf3s84R+cvW4ga77ChvJ0mJF2WZHwI4vbONVeBVU8s/
    EmSmZvamQIoht0qGUpYiB9HvO2/4PFGVF9uRH+lSxbjmbS3nhkx4GM6jPOwA
X-ME-Proxy: <xmx:t1mQapqF7ma-Ta5tRBEbLcedWqiGltypBiPqNZ_dbCXRihGFdb2aRg>
    <xmx:t1mQakm8Vb8eLdUllLUzKtO1iALbgF_M7YWBVaQEhBZZhvcz6sZkpw>
    <xmx:t1mQaoKsjv2qAfCI2uQgUaDVuF-m6aaidTQ7rxxc2gDC9uD0SdwgPA>
    <xmx:t1mQahzyKMRKQ3MCLvHO4rWFHIudUVxUpfVl8re1VkBZ4QoUbB51vg>
    <xmx:t1mQagA6M-L70z9JyIHUkGPFSqd4xk3GytP-Wn6rLWZzR75GjglhsY5e>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 11:37:27 -0400 (EDT)
Message-ID: <9dbbe54a8b97a1ac82315b4c5f5da210e6294de3.camel@pbarker.dev>
Subject: Re: [PATCH v2 0/5] Handle an empty IMAGE_LINK_NAME consistently
From: Paul Barker <paul@pbarker.dev>
To: Thomas Roos <roosesweb@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2026 16:37:25 +0100
In-Reply-To: <20260819062208.680468-1-roosesweb@gmail.com>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
	 <20260819062208.680468-1-roosesweb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 15:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244500

On Wed, 2026-08-19 at 08:22 +0200, Thomas Roos wrote:
> v1 fixed the sbom-cve-check input path. Paul noted that 2a80840a4fe0
> ("sbom-cve-check: Fix breakage with empty IMAGE_LINK_NAME") had already
> touched this class, and that other classes make the same assumption. That
> commit guarded the export symlinks; the input path is separate and still
> built from IMAGE_NAME. Patch 1 now uses the shape Paul suggested, and
> patches 2-4 fix the other sites found by auditing meta/classes*,
> meta/lib/oe and meta/lib/oeqa.
>=20
> Read and write sites need opposite handling of an empty value: read sites
> fall back to IMAGE_NAME, write sites skip the link. A central default (pi=
n
> IMAGE_LINK_NAME to IMAGE_NAME when empty) does not work, as create_symlin=
ks
> and multiubi_mkfs have no link !=3D target check and IMAGE_NAME is itself
> derived from IMAGE_LINK_NAME.
>=20
> Tested on qemux86-64, each fix confirmed in both directions. Patch 5 cove=
rs
> patches 2-4 in one build; patch 1 was checked by hand, as a selftest woul=
d
> need the sbom-cve-check databases (~8.7G of git).
>=20
> AI-Generated: Uses Claude Opus 5

Hi Thomas,

I discussed this with Richard, we want to avoid increasing the
complexity of the code unnecessarily.

IMAGE_LINK_NAME is intended to always be valid, we need the link because
IMAGE_NAME is dependent on the date and time that an image was built. Do
we really need to support the case where IMAGE_LINK_NAME is unset?

If we don't need to support IMAGE_LINK_NAME being unset then perhaps we
should just print a better error message in that case and give up.

Best regards,

--=20
Paul Barker


