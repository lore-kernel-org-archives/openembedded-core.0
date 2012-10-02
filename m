Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJB20-0004PW-Kz for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 00:33:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92MKXSN021761;
	Tue, 2 Oct 2012 23:20:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21178-08; Tue,  2 Oct 2012 23:20:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92MKNKf021755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Oct 2012 23:20:24 +0100
Message-ID: <1349216426.18301.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Tue, 02 Oct 2012 23:20:26 +0100
In-Reply-To: <1349215253.4422.79.camel@x121e.pbcl.net>
References: <1349215201-30117-1-git-send-email-sgw@linux.intel.com>
	<1349215253.4422.79.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: Add detail to shared area warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 22:33:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 23:00 +0100, Phil Blundell wrote:
> On Tue, 2012-10-02 at 15:00 -0700, Saul Wold wrote:
> > -        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
> > +        bb.warn("The %s recipe is trying to install files into a shared area when those files already exist (please fix %s). Those files are:\n   %s" % (d.getVar('PN', True), d.getVar('FILE', True), "\n   ".join(match)))
> 
> That seems potentially misleading: the file that needs fixing isn't
> necessarily the one that triggers this warning.  What would be ideal
> would be to have it output the names of all recipes that have tried to
> stage the files in question so that the user can make an informed
> decision about which one ought to be putting them there.

*if* you can get that information. The python recipe is poking things
into the sysroot outside the knowledge of sstate, then triggering a
warning. We have no way to know who put files there if it wasn't done
through sstate.

This isn't to say we shouldn't improve the message and use the sstate
manifests to find any culprits, just that we can't find an answer in all
cases.

Cheers,

Richard



