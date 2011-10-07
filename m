Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCJ1U-00074L-LW for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 00:36:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97Mb3bA032497 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 23:37:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g+c0YYZ1yIP3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 23:37:03 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97MaxOs032493
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 23:37:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 23:30:21 +0100
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F0177E5@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F0177E5@NAEMMAIL01.na.leapfrog.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318026629.8533.57.camel@ted>
Mime-Version: 1.0
Subject: Re: Use for filedeps/rpmdeps data?
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
X-List-Received-Date: Fri, 07 Oct 2011 22:36:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-07 at 21:21 +0000, Daniel Lazzari wrote:
> Hey everyone,
> 
> I noticed today that one of our recipes takes a very long time to get
> through the do_package task. The recipe has a couple of binaries and a
> whole lot of assets (thousands of audio files). It takes over 20
> minutes for the do_package task to complete on my local desktop. I
> finally tracked it down to the package_do_filedeps function which
> appears to be running an rpmdeps process for each file in each
> package. As far as I can tell, it just then dumps that data to text
> files in pkgdata and only seems concerned with the binaries. Can
> anyone shed some light on what this info is used for? Should it only
> be concerned with executables and libraries (there is currently no
> filter on it)? Do I even need that data if we are using ipkg instead
> of rpm?

This is why there is a line in package.bbclass which says:

		if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
			continue

since those are packages we know we're not going to get useful
information from. It finds perl and python module dependencies so its
not just executable binaries/libraries unfortunately :/.

It would probably be useful to have a way of flagging other packages as
uninteresting though. The idea is the information is used by all the
package backends. At present it is used more by some than by others and
the ipk backend is limited in its use iirc. That will be changing over
time though.

Cheers,

Richard




