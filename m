Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfCUN-0000aX-Kj for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 16:57:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Er9bD021052
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 15:53:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20817-01 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 15:53:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Er0Bu021046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 15:53:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E1698CE.4070207@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
	<c55e57619344a0ddff4444e1a4403c9516089e5b.1310081443.git.sgw@linux.intel.com>
	<1310081883.20015.862.camel@rex>  <4E1698CE.4070207@linux.intel.com>
Date: Fri, 08 Jul 2011 15:52:21 +0100
Message-ID: <1310136741.20015.869.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/8] rootfs_rpm: Add 50Meg to image size for zypper
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
X-List-Received-Date: Fri, 08 Jul 2011 14:57:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 22:42 -0700, Saul Wold wrote:
> On 07/07/2011 04:38 PM, Richard Purdie wrote:
> > On Thu, 2011-07-07 at 16:31 -0700, Saul Wold wrote:
> >> [YOCTO #1171]
> >>
> >> Add /var space for zypper due to its space usage for db maintence
> >
> > This hasn't been tested for opkg/deb and is missing something like:
> >
> > ZYPPER_VAR_DB_SPACE ??= 0
> >
> > I'd suggest we just change this to append " + 51200" to
> > IMAGE_ROOTFS_EXTRA_SPACE. I'd also like this only to happen when we're
> > actually installing zypper so the minimal images are unaffected...
> >
> I can do the + 51200, but I have not figured out how to do the check for 
> zypper, maybe it's something straight forward, but I am not finding a 
> way to do it easily.

How about something like:

IMAGE_ROOTFS_EXTRA_SPACE += "${@base_contains("PACKAGE_INSTALL", "zypper", " + 51200", "" ,d)}"

?

Not perfect but should basically work for what we need until we find a
bettr fix for zypper itself.

Cheers,

Richard



