Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJB47-0004Tc-TC for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 00:35:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92MMi7b021772;
	Tue, 2 Oct 2012 23:22:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21323-05; Tue,  2 Oct 2012 23:22:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92MMaOp021766
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Oct 2012 23:22:37 +0100
Message-ID: <1349216559.18301.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 02 Oct 2012 23:22:39 +0100
In-Reply-To: <20121002221141.GG15881@jama.jama.net>
References: <1349215201-30117-1-git-send-email-sgw@linux.intel.com>
	<1349215253.4422.79.camel@x121e.pbcl.net>
	<20121002221141.GG15881@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 02 Oct 2012 22:35:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 00:11 +0200, Martin Jansa wrote:
> On Tue, Oct 02, 2012 at 11:00:53PM +0100, Phil Blundell wrote:
> > On Tue, 2012-10-02 at 15:00 -0700, Saul Wold wrote:
> > > -        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
> > > +        bb.warn("The %s recipe is trying to install files into a shared area when those files already exist (please fix %s). Those files are:\n   %s" % (d.getVar('PN', True), d.getVar('FILE', True), "\n   ".join(match)))
> > 
> > That seems potentially misleading: the file that needs fixing isn't
> > necessarily the one that triggers this warning.  What would be ideal
> > would be to have it output the names of all recipes that have tried to
> > stage the files in question so that the user can make an informed
> > decision about which one ought to be putting them there.
> 
> Maybe something like master.list was before
> http://git.openembedded.org/openembedded-core/commit/?id=603daf343ad3f18c8adb799e3625ae2a18d94f56
> with added recipe name, but that doesn't detect files already 

We can list any sstate manifest files (tmp/sstate-control) also adding
that file which may or may not have a listing of it. We might as well
just grep those files and print matches.

We are not going back to a master.list file, its a performance headache.

Cheers,

Richard



