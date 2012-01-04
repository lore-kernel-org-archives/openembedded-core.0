Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ria02-000351-Jg for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 00:12:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04N4dPc025654
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 23:04:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25623-01 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 23:04:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04N4W2S025648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 23:04:33 GMT
Message-ID: <1325718273.20759.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 23:04:33 +0000
In-Reply-To: <45F2E71B-A037-400A-9B76-01700C2030D0@dominion.thruhere.net>
References: <cover.1325101673.git.otavio@ossystems.com.br>
	<a4ffb960e298bf423adcda013c5b58c1db2f6b48.1325101675.git.otavio@ossystems.com.br>
	<1325697336.20759.40.camel@ted>
	<45F2E71B-A037-400A-9B76-01700C2030D0@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 14/16] udev: run depmod if modules.dep doesn't exist
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
X-List-Received-Date: Wed, 04 Jan 2012 23:12:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 19:51 +0100, Koen Kooi wrote:
> Op 4 jan. 2012, om 18:15 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2011-12-28 at 19:55 +0000, Otavio Salvador wrote:
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >> meta/recipes-core/udev/udev/init   |    5 +++++
> >> meta/recipes-core/udev/udev_164.bb |    2 +-
> >> 2 files changed, 6 insertions(+), 1 deletions(-)
> >> 
> >> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> >> index 322e7e7..8d89d51 100644
> >> --- a/meta/recipes-core/udev/udev/init
> >> +++ b/meta/recipes-core/udev/udev/init
> >> @@ -52,6 +52,11 @@ if [ "$DEVCACHE" != "" ]; then
> >> 	fi
> >> fi
> >> 
> >> +if [ -x /sbin/depmod ] && [ ! -e "/lib/modules/$(uname -r)"/modules.dep ]; then
> >> +	mkdir -p /lib/modules/$(uname -r)
> >> +	depmod -ae
> >> +fi
> >> +
> >> # make_extra_nodes
> >> kill_udevd > "/dev/null" 2>&1
> > 
> > Why does udev need to do this instead of the kernel module postinstalls?
> > This strikes me as the wrong thing to be doing here...
> 
> Udev runs before those installs get run on first boot.

but pkg_postinst_kernel-image from kernel.bbclass should be creating
this at rootfs creation time?

Cheers,

Richard



