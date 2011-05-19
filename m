Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN0Iz-0005kM-Tq for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:18:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JAFEKT006894;
	Thu, 19 May 2011 11:15:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06246-10; Thu, 19 May 2011 11:15:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JAF6Ec006885
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 19 May 2011 11:15:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305733061.18415.98.camel@lenovo.internal.reciva.com>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
Date: Thu, 19 May 2011 11:15:03 +0100
Message-ID: <1305800103.3424.464.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 10:18:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 16:37 +0100, Phil Blundell wrote:
> On Tue, 2011-05-17 at 17:22 +0100, Richard Purdie wrote:
> > On Tue, 2011-05-17 at 15:50 +0100, Phil Blundell wrote:
> > > I guess I could teach remove_packaging_data_files() to not create the
> > > empty directory if O_P_M=="none".  Would you be happier with that?
> > 
> > Mostly. The question remains what happens if there are postinstalls that
> > are expecting to run on the device. I'm guessing that is why the mkdir
> > is there since at present we don't want to break the postinstalls.
> 
> The comment says something about ensuring that the lock directory
> exists, presumably for future invocations of opkg.  I guess this is to
> support O_P_M="add" kind of semantics.  
> 
> As far as I know there's no other reason that postinsts should
> expect/require the opkg directory to exist.  So I think it should
> probably be safe just to delete it if O_P_M="none".

Let me put this another way:

We have postinstalls that require to run on the target device. If
they're present, we need opkg there to run them, or at least some kind
of script to handle that and I think both cases have a requirement on
that directory (the rpm backend has a suitable script).

So the current patches which just don't create it don't really address
the problem. At the very least the image generation should error if
these types of postinstall are present which I guess is my real concern.

Cheers,

Richard





