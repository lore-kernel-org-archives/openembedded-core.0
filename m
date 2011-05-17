Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMN59-00006M-E3 for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 18:25:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HGMM9a018444
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 17:22:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18079-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 17:22:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HGMCCA018438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 17:22:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305643833.2429.264.camel@phil-desktop>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
Date: Tue, 17 May 2011 17:22:11 +0100
Message-ID: <1305649331.3424.259.camel@rex>
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
X-List-Received-Date: Tue, 17 May 2011 16:25:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 15:50 +0100, Phil Blundell wrote:
> On Tue, 2011-05-17 at 15:24 +0100, Richard Purdie wrote:
> > What's wrong with:
> > 
> > ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> > 
> > as used in the minimal image? The nice thing about this is it works over
> > several package backends too...
> 
> Well, conceptually it seems a bit nicer to have the rootfs constructor
> obey the same variable that is used to control package management
> functionality elsewhere (not that oe-core currently has any "elsewhere",
> but oe master does and I would like to backport that functionality to
> oe-core as well). 
> 
> There's also the minor issue that rootfs_ipk's implementation of
> remove_packaging_data_files() does leave an empty directory behind,
> which I don't especially want in the O_P_M=none case, so I'd end up
> having to do some further cleanup of my own.
> 
> I guess I could teach remove_packaging_data_files() to not create the
> empty directory if O_P_M=="none".  Would you be happier with that?

Mostly. The question remains what happens if there are postinstalls that
are expecting to run on the device. I'm guessing that is why the mkdir
is there since at present we don't want to break the postinstalls.

The answer could be we ensure that directory exists if postinstalls
exist...

Cheers,

Richard





