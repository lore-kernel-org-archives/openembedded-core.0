Return-Path: <jobol@nonadev.net>
Received: from erza.lautre.net (erza.lautre.net [80.67.160.89])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3E1730E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 16:48:20 +0000 (UTC)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by erza.lautre.net (Postfix) with ESMTPSA id 4E41CF6BC0;
	Thu,  9 Mar 2017 17:48:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1489078100;
	bh=dbudun5xVrNKUREbMMclP5iwM7Fo1IvQBKr3Csp9/yw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=r8lLoSYtL5XM1QmcwHImyI7DS5KlGPSqWX0j6BfOpHMgKbVmndHFgG0dODri8hru7
	gw3rmnaUM9WjuVKmvgGERPAIvWHcYAhqczd65t8UAPGegpdoNHTA+npH5IswE5afae
	DC9k+pXsQhzodQYYJYH2TN429MvE3OoSrI5tgDVI=
Date: Thu, 9 Mar 2017 17:48:15 +0100
From: =?UTF-8?B?Sm9zw6k=?= Bollo <jobol@nonadev.net>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170309174815.056bc5a2@d-jobol.iot.bzh>
In-Reply-To: <1489075674.7785.368.camel@intel.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: =?UTF-8?B?Sm9zw6k=?= Bollo <jose.bollo@iot.bzh>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Thu, 09 Mar 2017 16:48:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 09 Mar 2017 17:07:54 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Thu, 2017-03-09 at 15:07 +0100, jobol@nonadev.net wrote:
> > From: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
> >=20
> > The copy of extended attributes is interesting for
> > Smack systems because it allows to set the security
> > template of the user's home directories without
> > modifying the tools (useradd here). But the version
> > of useradd that copies the extended attributes doesn't
> > copy the extended attributes of the root. This can make
> > use of homes impossible! This patch corrects the issue
> > by copying the extended attributes of the root directory:
> > /home/user will get the extended attributes of /etc/skel. =20
>=20
> Makes sense to me.
>=20
> > This includes 2 patches to implement the behaviour:
> > one for the target and one for the native.
> >=20
> > The patch for the target was submitted upstream (see
> > http://lists.alioth.debian.org/pipermail/pkg-shadow-commits/2017-March/=
003804.html)
> >=20
> > The patch for the native couldn't be submitted upstream
> > because it applies after the patch specific to open-embedded
> > that creates the parent directories:
> >   0001-useradd.c-create-parent-directories-when-necessary.patch =20
>=20
> Can't you reorder and rebase the patches so that this
> 0001-useradd.c-create-parent-directories-when-necessary.patch applies
> on top of the patch which was submitted upstream?

I agree that it would be better to reorder. Better but less
conservative because an existing patch must be upgraded.

> "devtool modify shadow-native" might be useful for that. "git rebase
> -i" in workspace/sources/shadow-native", then finish with "devtool
> update-recipe shadow-native". I haven't tried whether "update-recipe"
> handles re-ordering patches. If it doesn't, just fix it manually.

I'll do and propose the new version soon.

