Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TggB1-0007iL-5Y
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 19:28:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB6IDbZt007750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 10:13:37 -0800 (PST)
Received: from msp-dhcp50.wrs.com (172.25.34.50) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 6 Dec 2012 10:13:36 -0800
Message-ID: <50C0E055.4070105@windriver.com>
Date: Thu, 6 Dec 2012 12:13:41 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1212061253340.15222@oneiric>
In-Reply-To: <alpine.DEB.2.02.1212061253340.15222@oneiric>
Subject: Re: slightly confused about .bbappend file and FILESPATH
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
X-List-Received-Date: Thu, 06 Dec 2012 18:28:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/12 12:03 PM, Robert P. J. Day wrote:
>
>    currently writing a tutorial page on how .bbappend files and
> FILESPATH work, and i wanted to use a live example, but now i'm
> confused.

The way it works is the same way as PATH in the shell.  It's just a set of 
search paths.

>    using meta-ti layer, i chose to build core-image-minimal for a
> beagleboard, for which the meta-ti layer has the following under
> recipes-core/netbase/ that i want to use as an example:
>
> $ find
> .
> ./netbase_5.0.bbappend
> ./netbase-5.0
> ./netbase-5.0/beagleboard
> ./netbase-5.0/beagleboard/interfaces
> $
>
> where the .bbappend file contains only:
>
> THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"

I believe this is the default value of 'THISDIR' already, so there is no reason 
to specify it in the .bbappend itself.

> FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"

In this example, it's incorrect.  As you have a directory named "netbase-5.0", 
so your FILESPATH should be: ${THISDIR}/${PN}-${PV}

--Mark

>
>    so my *understanding* is that this should result in nothing more
> than the "interfaces" file from the original oe-core recipe being
> overridden, based on the enhanced entries at the front of FILESPATH
> that should search in the meta-ti layer first.
>
>    but here's the problem -- for fun, i used chris larson's bitbake-env
> to print the value of FILESPATH for that recipe when building for
> beagle, and formatted to get:
>
> FILESPATH="/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/linux-gnueabi
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/arm
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/build-linux
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/pn-netbase
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/beagleboard
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/omap3
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/armv7a
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/class-target
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/forcevariable
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/libc-glibc
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/linux-gnueabi
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/arm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/build-linux
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/pn-netbase
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/beagleboard
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/omap3
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/armv7a
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/class-target
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/forcevariable
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/libc-glibc
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/linux-gnueabi
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/arm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/build-linux
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/pn-netbase
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/beagleboard
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/omap3
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/armv7a
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/class-target
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/forcevariable
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/libc-glibc
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/linux-gnueabi
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/arm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/build-linux
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/pn-netbase
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/beagleboard
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/omap3
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/armv7a
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/class-target
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/forcevariable
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/libc-glibc
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/"
>
>    see the oddity?  the first few entries will *not* find the
> interfaces file in the meta-ti layer, as they don't refer to the
> "netbase-5.0" directory (as do the ones in oe-core).
>
>    am i just not understanding something basic here?  i'm building a
> core-image-minimal for a beagle right now to see what i end up with,
> but given the FILESPATH above, how is the build supposed to pick up
> the beagle-specific "intxgerfaces" file without a reference to that
> meta-ti directory "netbase-5.0"?
>
> rday
>



