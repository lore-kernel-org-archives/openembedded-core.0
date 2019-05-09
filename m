Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 93AA87DF75
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 11:04:23 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p2so1278900iol.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 04:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UY/gwFhzDzhWjN/8uy41EFA/tlILX0UhCttaf9yQMI4=;
	b=VC5xgCBF5JLIE70qfvolxNS9oc02w12LJlC6zwvWX07MShJoRfzuI0qMYDErOjbGd4
	/86/5E/WcbsODIl9b2/ea627WmYY1TpBtuWsY45e2AF2qaEP6RigXd6udBQ3R1Dw9E1s
	6YTkW1SiOTqcWoBCDwVYku44iQiB4JB0tonle+hI6avgXr1ZffmS1Hv+lBRPt0xjYgTI
	Ga82HlE7teycoiImjVx2MlmbDqwbp3tGiXc5N+cCqIkds5FLS2qpFrk3knF5lWV5tdff
	MVpFiqSda6/E2KgEcTut+/+HN8GwkpHdS/SZIqWCCSeIes7PyKGs7FyXFKGylnktcflM
	XtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UY/gwFhzDzhWjN/8uy41EFA/tlILX0UhCttaf9yQMI4=;
	b=CNN82s/tNmTWoPNWnwTWDjFK0SUgCiiHjPwEjPua2IklZuan7tu0+EMF2n5sUhSRgv
	pGJ/b0Ta1a2ckHkJ0Ky1AZk90fqcOG1BCz4S+gL8IqtS13qsp8NrQv26jcomjUTQQYBC
	/5IXRn1gyFL7heMUX4yf5K3PJA1mnXJC1ur/ScgRdwB+IxQn/lZy8E9oJnEePS7/9idc
	uXVTVIrkcf2jYd76cT2sirYMIULv561X6IZ0REnhG1H0kTxYDo8if/fgcG4eMS3gLUEv
	eVu2dysLHUe0H+w5adYcSpCUFv204+ADBOiK2XuZO4Qs1sraVw+N+CrnxbwejBI9HwUT
	z1WA==
X-Gm-Message-State: APjAAAWknHpKJPt5eObcrmaWgfy+dMULh8MieRNECdqecMPtzNlP26Ok
	sX2XJeca/8Uxm1qXHh7HtZb/sEdcfEKvkc2yh6ub9g==
X-Google-Smtp-Source: APXvYqxotq6R2UQw5CPfRIc6JznQFv4rn3gCORq7Y4fyelPh7G+scWgl0bg5jqAomcqE5XIeCyWHtPispucN844Isi0=
X-Received: by 2002:a05:6602:11a:: with SMTP id
	s26mr1984241iot.201.1557399864826; 
	Thu, 09 May 2019 04:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190508201335.1732-1-schnitzeltony@gmail.com>
In-Reply-To: <20190508201335.1732-1-schnitzeltony@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 May 2019 12:04:13 +0100
Message-ID: <CAJTo0LYRyARnYkRfumy_hXXNb6otVKhr0di0fyptBb208wQ4mA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: add MESON_CROSS_EXTRA_PROPS to inject properties into meson.cross
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
X-List-Received-Date: Thu, 09 May 2019 11:04:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 May 2019 at 21:14, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:
> Some projects rely on (cross)specific properties e.g [1]. By setting
>
> MESON_CROSS_EXTRA_PROPS=3D"var1=3D'value1' var2=3Dtrue"
>
> the required properties can be passed to meson.build. The contents of
> MESON_CROSS_EXTRA_PROPS behave same as known by e.g EXTRA_OEMESON.
>
> [1] https://gitlab.gnome.org/GNOME/tracker/blob/master/meson.build#L91

Or see https://git.openembedded.org/openembedded-core/commit/?id=3De04e0a20=
cab04966698c50dc79195a8f159248d3
for an example of how this is done already.

Ross

