Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rdn5b-00052C-GR for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 19:09:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMI2nJP026946
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 18:02:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26256-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 18:02:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMI2g0N026940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 18:02:43 GMT
Message-ID: <1324576964.24604.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 18:02:44 +0000
In-Reply-To: <4EF3524B.6040601@windriver.com>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
	<20111222091041.GI12791@jama.jama.net>
	<20111222131753.GJ12791@jama.jama.net> <4EF3524B.6040601@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Regression bug: dbus messagebus user generation is wrong
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
X-List-Received-Date: Thu, 22 Dec 2011 18:09:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-22 at 09:52 -0600, Mark Hatle wrote:
> On 12/22/11 7:17 AM, Martin Jansa wrote:
> ...
> 
> > /********* logs *************/
> > Checking ERRORs in log.do_rootfs files
> > ============== correct om-gta02:
> > Installing base-passwd (3.5.22-r9) to root...
> > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv4t/base-passwd_3.5.22-r9_armv4t.ipk.
> > Running groupadd commands...
> > /usr/sbin/nscd: Only root is allowed to use this option!
> > /usr/sbin/nscd: Only root is allowed to use this option!
> > /usr/sbin/nscd: Only root is allowed to use this option!
> 
> We need to track down that error above and figure out what it means.  It could 
> be that groupadd is attempting to run a system helper that it shouldn't be. 
> (nscd should never be consulted when we are running through pseudo for 
> password/group calculations...)
> 
> ...
> 
> > ============== wrong nokia900:
> > Installing dbus-1 (1.4.16-r2) to root...
> > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/dbus-1_1.4.16-r2_armv7a-vfp-neon.ipk.
> > Running groupadd commands...
> > grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-2.0-r20/rootfs//etc/group: No such file or directory
> > groupadd: cannot open /etc/group
> > Running useradd commands...
> > grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-2.0-r20/rootfs//etc/passwd: No such file or directory
> > useradd: group '1000' does not exist
> > useradd: the GROUP= configuration in /etc/default/useradd will be ignored
> > useradd: cannot open /etc/passwd
> > ...
> 
> Ya, that is definitely broken.  W/o the files then the groupadd/useradd won't 
> function properly and the install is likely a failure.
> 
> On other systems I work with, we -always- install the passwd/group files onto 
> the system -first-.  Then we perform the regular installation procedure.  I 
> wonder if we may have to do something like that within oe-core to force the 
> proper ordering.
> 
> It would be interesting to me to see the install order that was selected in this 
> case.  It could be that opkg either is missing some critical dependency 
> information -- or perhaps what we need simply can't be specified.
> 
> In other systems I've worked with, the base-passwd packages has been a 
> requirement of the libc package.  Since libc generally gets installed early in 
> the process it usually enforces it to be first.  I'm not sure if OE-core has 
> that same dep.  (Maybe we simply need any package that has files != root:root 
> have a dep on the passwd files?  Just thinking outloud here.. I'm not sure thats 
> really a good idea.)

FWIW the useradd class is adding dependencies and those dependencies
should now be being honoured by opkg after the recent changes.

Martin: If you could share the full do_rootfs log for a broken image
I'll take a look and see if I can spot anything...

Cheers,

Richard



