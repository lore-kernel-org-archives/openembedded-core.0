Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC8KU-0001lM-Ei for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:43:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QBYKwN024795;
	Mon, 26 Mar 2012 12:34:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24700-01; Mon, 26 Mar 2012 12:34:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QBY9bo024789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 26 Mar 2012 12:34:10 +0100
Message-ID: <1332761648.28414.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Mon, 26 Mar 2012 12:34:08 +0100
In-Reply-To: <4F6CDA62.3070908@opendreambox.org>
References: <1331345726-9577-1-git-send-email-obi@opendreambox.org>
	<4F5E1672.7090706@windriver.com> <1331567634.15192.20.camel@ted>
	<4F6CDA62.3070908@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_ipk: apply umask to control and conffiles
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
X-List-Received-Date: Mon, 26 Mar 2012 11:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 21:17 +0100, Andreas Oberritter wrote:
> On 12.03.2012 16:53, Richard Purdie wrote:
> > On Mon, 2012-03-12 at 10:29 -0500, Mark Hatle wrote:
> >> On 3/9/12 8:15 PM, Andreas Oberritter wrote:
> >>> * Explicitly set umask to 022. Otherwise the build system's
> >>>    umask leaks into the image.
> >>
> >> I'm surprised that do_package_ipk[umask] didn't work.  Perhaps its the way it's 
> >> being invoked that is the issue.  (If bitbake doesn't run it, but something else 
> >> does.. then the umask setting doesn't get used.)
> >>
> >> As for the change of the umask, the changes appear to be specific to the ipk 
> >> case.  Is this the desired behavior, or could deb and rpm suffer from similar 
> >> issues?  (I'm not familiar enough with opkg to know how it handles umask 
> >> settings during package install/rootfs construction..)
> >>
> >> I believe that RPM sets a default umask when it goes through it's package 
> >> installs/rootfs generation.  But does DEB?
> > 
> > I'm also a bit worried about this patch. I'd like to understand why a
> > task level umask doesn't work. That shouldn't even make any difference
> > since the permissions/owners/users from install should be getting
> > used...
>
> can you please give some advise on how to continue with this issue?

I understand half the problem now, the files with the issues are ones
created during the package_ipk task. That addresses one of my big
concerns.

The second thing I'd like to understand is why a task level umask
doesn't resolve this. Looking at what you tried, this might be as simple
as a typo:

do_package_ipk[umask] = "022"

when you really want:

do_package_write_ipk[umask] = "022"

If that works, lets set this for deb and rpm too so we're consistent and
I'll merge that patch :)

Cheers,

Richard





