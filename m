Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CE00A60746
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 15:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1SFxZoF023713; Sun, 28 Feb 2016 15:59:46 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qnOGKxgTZGxx; Sun, 28 Feb 2016 15:59:46 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1SFxgEL023738
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 28 Feb 2016 15:59:43 GMT
Message-ID: <1456675182.11498.163.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Sun, 28 Feb 2016 15:59:42 +0000
In-Reply-To: <CALbNGRTTAz=UfaXLEOjzdc5K_v7R3=OL8abzQQXq=97YkcofUA@mail.gmail.com>
References: <1456656801.11498.158.camel@linuxfoundation.org>
	<CALbNGRTTAz=UfaXLEOjzdc5K_v7R3=OL8abzQQXq=97YkcofUA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: Improve configuration upgrade capabilities (support meta-yocto -> poky transition)
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
X-List-Received-Date: Sun, 28 Feb 2016 15:59:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-02-28 at 13:20 +0100, Andreas Müller wrote:
> On Sun, Feb 28, 2016 at 11:53 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Right now, only one configuration file can be processed
> > (conf/bblayers.conf)
> > and it can only have one version number. This is a cause of immense
> > friction
> > between OE-Core and Poky since if one needs a version change, it
> > shouldn't
> > be forced on the other.
> > 
> > We'd like to rename the meta-yocto layer (within the meta-yocto
> > repository)
> > to meta-poky. To do this, we need to correct the bblayers.conf file
> > and that
> > means changing the sanity version. After the pain this caused the
> > last time,
> > Paul made me promise never to have them out of sync between OE-Core
> > and Poky,
> > equally, having every distro changing config update OE-Core isn't
> > scalable
> > either.
> > 
> > This patch changes the sanity upgrade method to list a more generic
> > format:
> > 
> > <config file>:<current version variable name>:<required version
> > variable name>:<upgrade function>
> > 
> > This in theory allows us to support upgrades to any of the core
> > configuration files, and allow layers to extend them as needed.
> > Files
> > with the same name can be handled in different layers by setting a
> > unique
> > version name variable in the file itself. The upgrade code is only
> > called
> > if the version variable is set.
> > 
> > To allow us to make the poky name change and use a new
> > configuration file
> > name, one last version bump is included for poky to handle the
> > transition.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta/classes/sanity.bbclass
> > b/meta/classes/sanity.bbclass
> > index 49693e7..a0553ee 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> 
> I think this breaks parsing. Have reverted it and can build again.

Sorry, I missed a version number change. I've pushed a fix.

Cheers,

Richard

