Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1T0B9Z-0003t3-2s
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 14:50:53 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:42352 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1T0Ay6-0004Mf-1K for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 08:39:02 -0400
Date: Sat, 11 Aug 2012 08:38:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1208110826510.17432@oneiric>
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
Subject: wanting to clarify ASSUME_PROVIDED and SANITY_REQUIRED_UTILITIES
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
X-List-Received-Date: Sat, 11 Aug 2012 12:50:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  recently, i know that the entry "git-native" was added to the
entries in ASSUME_PROVIDED in bitbake.conf:

ASSUME_PROVIDED = "\
    bzip2-native \
    git-native \
    grep-native \
    diffstat-native \
    patch-native \
    perl-native-runtime \
    python-native-runtime \
    tar-native \
    virtual/libintl-native \
    "

ostensibly because it's now reasonable to assume that any sane distro
should be able to provide an oe-compatible version of git.  so far, so
good.  but there's this in sanity.bbclass:

SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo git
bzip2 tar gzip gawk chrpath wget cpio"

how do those two relate to one another?

  sanity.bbclass appears to list the native tools that *must* exist on
the dev host, but what if one doesn't?  is it then downloaded and
built unless it's in "ASSUME_PROVIDED"?

  as an example, consider "cpio".  sanity.bbclass suggests it *must*
exist natively, but it's not part of ASSUME_PROVIDED so i had
originally understood that to mean that it would necessarily have to
be downloaded (as source), then built so it was available natively.

  but i just ran "bitbake -c fetchall core-image-minimal" and there is
no cpio source in my downloads directory.  yes, of course i have it
installed natively, but based on the above, i had assumed it would be
downloaded and built.  so what am i misunderstanding here?

  also, is there any convenient way to examine my current dev host to
see what native utilities are candidates for adding to my local
ASSUME_PROVIDED?

rday



-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


