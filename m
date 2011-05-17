Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMLeH-0006et-Oe for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:53:25 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMLbW-0005c8-HX
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:50:34 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305642273.3424.244.camel@rex>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 15:50:33 +0100
Message-ID: <1305643833.2429.264.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Tue, 17 May 2011 14:53:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 15:24 +0100, Richard Purdie wrote:
> What's wrong with:
> 
> ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> 
> as used in the minimal image? The nice thing about this is it works over
> several package backends too...

Well, conceptually it seems a bit nicer to have the rootfs constructor
obey the same variable that is used to control package management
functionality elsewhere (not that oe-core currently has any "elsewhere",
but oe master does and I would like to backport that functionality to
oe-core as well). 

There's also the minor issue that rootfs_ipk's implementation of
remove_packaging_data_files() does leave an empty directory behind,
which I don't especially want in the O_P_M=none case, so I'd end up
having to do some further cleanup of my own.

I guess I could teach remove_packaging_data_files() to not create the
empty directory if O_P_M=="none".  Would you be happier with that?

p.




