Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYdk2-0006ur-MA for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 14:10:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8D3Z3j028023
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 13:03:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26934-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 13:03:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8D3RRl028016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 13:03:29 GMT
Message-ID: <1323349418.971.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 13:03:38 +0000
In-Reply-To: <20B8F1DB-384B-41D7-B219-EFCF6F70C822@dominion.thruhere.net>
References: <cover.1323160412.git.Martin.Jansa@gmail.com>
	<822c669a79e5f30bda467bc3a6f7b3c92377af22.1323160412.git.Martin.Jansa@gmail.com>
	<1323262134.30601.7.camel@ted>
	<20B8F1DB-384B-41D7-B219-EFCF6F70C822@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][oe-core 1/3] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Thu, 08 Dec 2011 13:10:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 13:50 +0100, Koen Kooi wrote:
> Op 7 dec. 2011, om 13:48 heeft Richard Purdie het volgende geschreven:
> 
> > On Tue, 2011-12-06 at 09:35 +0100, Martin Jansa wrote:
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> meta/recipes-extended/sysstat/sysstat.inc       |    7 ++++++-
> >> meta/recipes-extended/sysstat/sysstat_10.0.3.bb |    2 +-
> >> 2 files changed, 7 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> >> index 2936f96..ca40ab5 100644
> >> --- a/meta/recipes-extended/sysstat/sysstat.inc
> >> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> >> @@ -22,7 +22,12 @@ do_install() {
> >> }
> >> 
> >> pkg_postinst_${PN} () {
> >> -        /etc/init.d/populate-volatile.sh update
> >> +        if [ -n "$D" ]; then
> >> +                exit 1
> >> +        fi
> >> +        if [ -e /etc/init.d/populate-volatile.sh ]; then
> >> +                /etc/init.d/populate-volatile.sh update
> >> +        fi
> >> }
> > 
> > The subject commit message and the code match now, thanks :)
> > 
> > My only other question is whether we need to run this at first boot
> > time? At first boot after rootfs, populate-volatile will run anyway. We
> > therefore don't need to run the update as a postinst on device as part
> > of first boot as well as it will always be covered if present.
> 
> How does that interact with the volatiles caching logic?

It should be fine as far as I can tell...

Cheers,

Richard



