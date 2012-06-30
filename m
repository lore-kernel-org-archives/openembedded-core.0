Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Skuxe-00058Z-R7
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 12:31:31 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:33191 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Skun5-0004Je-FQ for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 06:20:35 -0400
Date: Sat, 30 Jun 2012 06:20:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CA+chaQfxRZkRJz=BM+57d2R_vbGCNtumVZMpjC6KdoF5o5-e+A@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1206300618250.14118@oneiric>
References: <alpine.DEB.2.02.1206300602360.13626@oneiric>
	<CA+chaQfxRZkRJz=BM+57d2R_vbGCNtumVZMpjC6KdoF5o5-e+A@mail.gmail.com>
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
Subject: Re: is the PRIORITY variable actually used anywhere?
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
X-List-Received-Date: Sat, 30 Jun 2012 10:31:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 30 Jun 2012, Martin Jansa wrote:

> http://git.openembedded.org/meta-openembedded/commit/?id=040f75eca217c79fed7b881589d9bb36358cffe1
> http://git.openembedded.org/openembedded-core/commit/?id=d122343362669c683acc4af295971a62cbc823fc
>
> so can be dropped from bitbake.conf too AFAIK

  actually, there are still a number of lines that refer to that
variable:

$ grep -rw PRIORITY *
meta/conf/bitbake.conf:PRIORITY = "optional"
meta/conf/documentation.conf:PRIORITY[doc] = "Importance of package, default values are 'optional' or 'needed'."
meta/classes/package_deb.bbclass:        fields.append(["Priority: %s\n", ['PRIORITY']])
meta/classes/package_ipk.bbclass:		fields.append(["Priority: %s\n", ['PRIORITY']])
meta/classes/oelint.bbclass:	# Test for valid PRIORITY
meta/classes/oelint.bbclass:	s = testVar("PRIORITY")
meta/classes/oelint.bbclass:				bb.note("PRIORITY '%s' is not recommended" % s)
meta/classes/oelint.bbclass:				bb.note("PRIORITY '%s' is not recommended, better use '%s'" % (s, newprio))
meta/classes/oelint.bbclass:			bb.note("PRIORITY '%s' is not recommended" % s)
meta/classes/oelint.bbclass:			bb.error("PRIORITY should only use lower case")
$

  if i can assume that all of that can be removed, i can do that as a
single patch, again unless someone else wants to handle it if there
are subtleties involved.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


