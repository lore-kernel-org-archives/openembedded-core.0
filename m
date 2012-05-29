Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZM0m-0003Kt-9c for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 14:58:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4TCmexv012944;
	Tue, 29 May 2012 13:48:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12185-04; Tue, 29 May 2012 13:48:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4TCmXR5012938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 May 2012 13:48:34 +0100
Message-ID: <1338295711.20169.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 29 May 2012 13:48:31 +0100
In-Reply-To: <4FC4C2D4.1090608@windriver.com>
References: <1338294584.20169.103.camel@ted> <4FC4C2D4.1090608@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ccache: Separate out into its own class
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
X-List-Received-Date: Tue, 29 May 2012 12:58:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-29 at 07:36 -0500, Jason Wessel wrote:
> On 05/29/2012 07:29 AM, Richard Purdie wrote:
> > Currently, ccache is used if it is present. When building from scratch it gives
> > no performance improvement and creates a ton of empty directories even when its
> > not in use.
> >
> > This change moves ccache support to a bbclass file which the user can choose to
> > enable. This should make builds more determinstic and make it easier/clearer
> > to the end user when its being used and when it is not.
> 
> Are the sstate sums the same with and without the use of the new bbclass ccache?
> 
> It is not clear to me that this is or is not the case based on this single commit header.

There is a problem with the existing sstate checksums since CCACHE
itself is not being excluded, only CCACHE_DIR so you'd end up with
sstate built using ccache and sstate built without using cccache with
different checksums. This change unifies those to have matching sstate
checksums.

So with and without use of the class, the checksums should now be the
same.

Cheers,

Richard



