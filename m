Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Rdl3g-0007TN-9U
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 16:59:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBMFqiJK021650
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 07:52:44 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 22 Dec 2011 07:52:44 -0800
Message-ID: <4EF3524B.6040601@windriver.com>
Date: Thu, 22 Dec 2011 09:52:43 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
	<20111222091041.GI12791@jama.jama.net>
	<20111222131753.GJ12791@jama.jama.net>
In-Reply-To: <20111222131753.GJ12791@jama.jama.net>
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
X-List-Received-Date: Thu, 22 Dec 2011 15:59:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/11 7:17 AM, Martin Jansa wrote:
...

> /********* logs *************/
> Checking ERRORs in log.do_rootfs files
> ============== correct om-gta02:
> Installing base-passwd (3.5.22-r9) to root...
> Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv4t/base-passwd_3.5.22-r9_armv4t.ipk.
> Running groupadd commands...
> /usr/sbin/nscd: Only root is allowed to use this option!
> /usr/sbin/nscd: Only root is allowed to use this option!
> /usr/sbin/nscd: Only root is allowed to use this option!

We need to track down that error above and figure out what it means.  It could 
be that groupadd is attempting to run a system helper that it shouldn't be. 
(nscd should never be consulted when we are running through pseudo for 
password/group calculations...)

...

> ============== wrong nokia900:
> Installing dbus-1 (1.4.16-r2) to root...
> Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/dbus-1_1.4.16-r2_armv7a-vfp-neon.ipk.
> Running groupadd commands...
> grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-2.0-r20/rootfs//etc/group: No such file or directory
> groupadd: cannot open /etc/group
> Running useradd commands...
> grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-2.0-r20/rootfs//etc/passwd: No such file or directory
> useradd: group '1000' does not exist
> useradd: the GROUP= configuration in /etc/default/useradd will be ignored
> useradd: cannot open /etc/passwd
> ...

Ya, that is definitely broken.  W/o the files then the groupadd/useradd won't 
function properly and the install is likely a failure.

On other systems I work with, we -always- install the passwd/group files onto 
the system -first-.  Then we perform the regular installation procedure.  I 
wonder if we may have to do something like that within oe-core to force the 
proper ordering.

It would be interesting to me to see the install order that was selected in this 
case.  It could be that opkg either is missing some critical dependency 
information -- or perhaps what we need simply can't be specified.

In other systems I've worked with, the base-passwd packages has been a 
requirement of the libc package.  Since libc generally gets installed early in 
the process it usually enforces it to be first.  I'm not sure if OE-core has 
that same dep.  (Maybe we simply need any package that has files != root:root 
have a dep on the passwd files?  Just thinking outloud here.. I'm not sure thats 
really a good idea.)

--Mark


