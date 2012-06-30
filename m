Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Skw5U-0006Mk-MO
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 13:43:40 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:34154 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Skvuu-00072D-BV for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 07:32:44 -0400
Date: Sat, 30 Jun 2012 07:32:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206300725040.15690@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: poky ref variable glossary seems to define IMAGE_ROOTFS_SIZE inaccurately
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
X-List-Received-Date: Sat, 30 Jun 2012 11:43:40 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  here's the current definition:

http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.html#var-IMAGE_ROOTFS_SIZE

but if you look at the formula that's used in
meta/classes/image_types.bbclass:

ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 *
${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -=
base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size >
${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) +
${IMAGE_ROOTFS_EXTRA_SPACE}) }'`

  the value of IMAGE_ROOTFS_SIZE is simply one of the (possibly
user-supplied) values that is combined to produce the *actual* rootfs
size that is stored in ROOTFS_SIZE (and used later).  i don't think
that's abundantly clear from the glossary entry, which initially
implies that IMAGE_ROOTFS_SIZE is the eventual size of the image.

  or am i just reading this the wrong way?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


