Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SnSUz-0001ON-Pd
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 12:44:26 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:51944 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SnSKG-0006da-EB for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 06:33:20 -0400
Date: Sat, 7 Jul 2012 06:33:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207070629090.18029@oneiric>
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
Subject: FETCHCMD versus FETCHCOMMAND
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
X-List-Received-Date: Sat, 07 Jul 2012 10:44:26 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just noticed the following as i was still poking around with
fetchers:

$ grep -r FETCHCMD * | grep -v pyc
bitbake/lib/bb/fetch2/hg.py:        basecmd = data.expand('${FETCHCMD_hg}', d)
bitbake/lib/bb/fetch2/svn.py:        ud.basecmd = d.getVar('FETCHCMD_svn', True)
bitbake/lib/bb/fetch2/osc.py:        basecmd = data.expand('${FETCHCMD_osc}', d)
bitbake/lib/bb/fetch2/git.py:        ud.basecmd = data.getVar("FETCHCMD_git", d, True) or "git"
bitbake/lib/bb/fetch2/git.py:        basecmd = data.getVar("FETCHCMD_git", d, True) or "git"
bitbake/lib/bb/fetch2/git.py:        basecmd = data.getVar("FETCHCMD_git", d, True) or "git"
bitbake/lib/bb/fetch2/bzr.py:        basecmd = data.expand('${FETCHCMD_bzr}', d)
bitbake/ChangeLog:	  (requires new FETCHCMD_svn definition in bitbake.conf)
meta/conf/bitbake.conf:FETCHCMD_svn = "/usr/bin/env svn"
meta/conf/bitbake.conf:FETCHCMD_cvs = "/usr/bin/env cvs"
meta/conf/bitbake.conf:FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --no-check-certificate"
meta/conf/bitbake.conf:FETCHCMD_bzr = "/usr/bin/env bzr"
meta/conf/bitbake.conf:FETCHCMD_hg = "/usr/bin/env hg"
$

  i can see that FETCHCMD represent the "base" fetch command for each
fetcher, i also notice that there isn't a perfect correspondence
between the fetchers and bitbake.conf.

  for example, there's no definition of FETCHCMD_osc even though
osc.py checks for it.  conversely, bitbake.conf sets FETCHCMD_cvs even
though the cvs.py fetcher never bothers to check it.

  nothing wrong with any of that, just an observation about
consistency.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


