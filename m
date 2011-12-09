Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZ1Nn-0002VS-Ty for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 15:25:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9EIA7i001125
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 14:18:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00484-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2011 14:18:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9EI4LN001118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 14:18:05 GMT
Message-ID: <1323440295.5309.164.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2011 14:18:15 +0000
In-Reply-To: <1323427912-10122-1-git-send-email-otavio@ossystems.com.br>
References: <1323427912-10122-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] connman: update to 0.78
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
X-List-Received-Date: Fri, 09 Dec 2011 14:25:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 10:51 +0000, Otavio Salvador wrote:
> Updates the package to 0.78 bringing changes done on meta-oe to
> OE-Core. This also removes unrequired build-depends and makes the
> package to respect wifi and bluetooth distro features.
> 
> Following patches were removed:
> 
>  * xtables_version.patch: merged upstream
> 
>  * dbusperms.patch: dropped in favour of using sed to make the change
>    in do_compile_append
> 
> Another important change is the addition of ppp in depends that is
> used by some plugins.
> 
> This uses PR as "r1" since it was previously available on meta-oe.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Acked-by: Joshua Lock <josh@linux.intel.com>

This patch appears to:

a) Remove multilib support from the recipe
b) Drop the git version of the recipe (no mention of this above?)
c) Add a pointless rdepends = d.getVar( "RDEPENDS_%s" % package)
d) Remove the dnsproxy, dhclient and test options
e) Add the tools, fake and ntpd options
f) Reorder variables in the file so as to make the diff unreadable and 
   hard to review
g) Change the contents of the ${PN}-scripts package
h) Add tools and tests packages
i) Add a dependeny on ntp
j) Uses bitbake master funtionality (d.expand()) which will break on
older versions of bitbake (we need to increase the bitbake minimum
version)
k) Drops the python scripts dependency

So all things considered, this kind of change is a nightmare to review
in this form and the commit message only covers half the changes it
makes. We need to do better than this...

Cheers,

Richard




