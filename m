Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id F29856D123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 03:45:49 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id qd12so12934355ieb.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=lbwwl49nLLAFxTYYkP5mxQ0zZDeVVuntSObzT8QmhPg=;
	b=BelYvFvErebQglHsbEdO0TMWglpAu+cGAVd2Xva2+v+AuumO0obW8N2pe5fouvDpKE
	MWykuMZbw3v+8QrplYAEx7ru9Yv5N0+aVktWWbSRqnDr7pGgJ8+jHPpY7AJzyHINvBe2
	eUzaM23musi4Cs5f1wY5+5NR+6hl0ySqBrZ9y3nHp1RUMQu7OaANDt33n4sz/DOAEcCD
	TeSiKQdAQJooE0GMQH39uPYOfQjtdQnymvE8Wx8Hc0OgrRo7nK0SODl8kMwVc/hX8di/
	BPLKm+pSXO0gx+NgI/kJUWbi4OpAGrODJVnPUMC5d4onk714AkNbelXmv93EAsY/Lm3u
	pFmA==
X-Received: by 10.43.58.141 with SMTP id wk13mr15623899icb.1.1383018351789;
	Mon, 28 Oct 2013 20:45:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 20:45:21 -0700 (PDT)
In-Reply-To: <20131028151004.34b2af21@e6520eb>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2013 20:45:21 -0700
Message-ID: <CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SRC_URI computing order
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
X-List-Received-Date: Tue, 29 Oct 2013 03:45:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2013 at 7:10 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi Richard,
>
> I saw your patch fixing FILESPATH's and Kergoth's one fixing
> PACKAGECONFIG processing order and I think I'm also facing an order
> problem when SRC_URI is computed.
>
> So when building SRC_URI when two layers have bbappend which apply
> patches : the SRC_URI seems to be built using an order I fail to
> understand somewhere instead of priority or the overrides' order.
>
> The use case is a System on Module and its custom motherboard :
> - meta-fsl-arm :
> * linux-imx_xyz.bb :
> SRC_URI =3D "patchgeneric1 ..."
>
> - meta-som-support :
> * conf/machine/mysom.conf
>
> * linux-imx_xyz.bbappend :
> SRC_URI_append_mysom =3D "patchsom1 patchsom2 ..."
>
> - meta-custommotherboard (SOM + Cunstom Motherboard) :
> * conf/machine/myproduct.conf
> MACHINEOVERRIDES_prepend =3D "mysom:"
> include conf/machine/mysom.conf
>
> * linux-imx_xyz.bbappend :
> SRC_URI_append_myproduct =3D "patchproduct1 patchproduct2 ..."
>
> in the end I get :
> SRC_URI =3D "patchgeneric1 ... patchsoc1 ... patchproduct1 ...
> patchsom1 ..."
>
> and of course as patchproduct* are supposed to apply on top of
> patchsoc* the patch fail to apply.
>
> I didn't found a way to build SRC_URI in the order I would like (I
> tested : changing MACHINEOVERRIDES 's order, changing layers' priority,
> changing machine's name to see if that was an alphabetical order ...).
>
> In the end the only thing which worked was to add an (empty by default)
> variable in som's SRC_URI and filling this variables from the
> custommotherboard's bbappend.
>
> Is the behaviour I'm seeing expected or is there something wrong in my
> setup ?

what is your OVERRIDES order.

>
> Thanks,
> Eric
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

