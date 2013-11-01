Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C6B186D62A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 18:16:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1IGQv7012099; Fri, 1 Nov 2013 18:16:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id z-yBzOaldc8P; Fri,  1 Nov 2013 18:16:26 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1IGNCe012086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 18:16:24 GMT
Message-ID: <1383329778.6271.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Fri, 01 Nov 2013 18:16:18 +0000
In-Reply-To: <20131101163611.37a8c084@e6520eb>
References: <1381358545.29912.50.camel@ted>
	<20131028151004.34b2af21@e6520eb> <20131101163611.37a8c084@e6520eb>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 01 Nov 2013 18:16:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2013-11-01 at 16:36 +0100, Eric Bénard wrote:
> Hi,
> 
> Le Mon, 28 Oct 2013 15:10:04 +0100,
> Eric Bénard <eric@eukrea.com> a écrit :
> > I saw your patch fixing FILESPATH's and Kergoth's one fixing
> > PACKAGECONFIG processing order and I think I'm also facing an order
> > problem when SRC_URI is computed.
> > 
> > So when building SRC_URI when two layers have bbappend which apply
> > patches : the SRC_URI seems to be built using an order I fail to
> > understand somewhere instead of priority or the overrides' order.
> > 
> > The use case is a System on Module and its custom motherboard :
> > - meta-fsl-arm :
> > * linux-imx_xyz.bb :
> > SRC_URI = "patchgeneric1 ..."
> > 
> > - meta-som-support :
> > * conf/machine/mysom.conf
> > 
> > * linux-imx_xyz.bbappend :
> > SRC_URI_append_mysom = "patchsom1 patchsom2 ..."
> > 
> > - meta-custommotherboard (SOM + Cunstom Motherboard) :
> > * conf/machine/myproduct.conf
> > MACHINEOVERRIDES_prepend = "mysom:"
> > include conf/machine/mysom.conf
> > 
> > * linux-imx_xyz.bbappend :
> > SRC_URI_append_myproduct = "patchproduct1 patchproduct2 ..."
> > 
> > in the end I get :
> > SRC_URI = "patchgeneric1 ... patchsoc1 ... patchproduct1 ...
> > patchsom1 ..."
> > 
> > and of course as patchproduct* are supposed to apply on top of
> > patchsoc* the patch fail to apply.
> > 
> > I didn't found a way to build SRC_URI in the order I would like (I
> > tested : changing MACHINEOVERRIDES 's order, changing layers' priority,
> > changing machine's name to see if that was an alphabetical order ...).
> > 
> > In the end the only thing which worked was to add an (empty by default)
> > variable in som's SRC_URI and filling this variables from the
> > custommotherboard's bbappend.
> > 
> > Is the behaviour I'm seeing expected or is there something wrong in my
> > setup ?
> > 
> do you need more details concerning this problem ?

I sent a reply asking for more info. I think there is a typo above which
isn't helping...

Cheers,

Richard


