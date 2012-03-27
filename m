Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCeoh-0001n9-NB
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 00:24:40 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCefz-0000Wo-HC for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 18:15:39 -0400
Date: Tue, 27 Mar 2012 18:15:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203271800130.9171@oneiric>
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
Subject: how to properly set up a local premirror?
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
X-List-Received-Date: Tue, 27 Mar 2012 22:24:40 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  only recently did i run across what appears to be the proper way to
define a local premirror where i've collected source tarballs over the
years, by adding the following to my local.conf:

SOURCE_MIRROR_URL ?= "file:///home/rpjday/dl/"
INHERIT += "own-mirrors"
BB_GENERATE_MIRROR_TARBALLS = "1"
# BB_NO_NETWORK = "1"

and every time i do a build, i check my downloads directory to see if
anything newer was downloaded, at which point i just copy any new
tarballs back to my "dl" directory.  seems pretty straightforward,
does that sound about right?  and now, some questions.

  i'm going to mention doing a "bitbake -c fetchall <imagename>" if
one just wants to get all necessary software before disconnecting from
the net.  so i used to know this: what's the difference between
"bitbake -c fetch" and "bitbake -c fetchall"?

  next, if i want to see what would need to be downloaded, would i
use:

$ bitbake -c fetchall --dry-run ...

or is there a better way?

  finally, i can see the current definition of own-mirrors.bbclass:

PREMIRRORS() {
cvs://.*/.*     ${SOURCE_MIRROR_URL}
svn://.*/.*     ${SOURCE_MIRROR_URL}
git://.*/.*     ${SOURCE_MIRROR_URL}
hg://.*/.*      ${SOURCE_MIRROR_URL}
bzr://.*/.*     ${SOURCE_MIRROR_URL}
svk://.*/.*     ${SOURCE_MIRROR_URL}
p4://.*/.*      ${SOURCE_MIRROR_URL}
osc://.*/.*     ${SOURCE_MIRROR_URL}
https?$://.*/.* ${SOURCE_MIRROR_URL}
ftp://.*/.*     ${SOURCE_MIRROR_URL}
}

are all of those fetchers still meaningful?  is there any chance that
OE will ever actually use svk?  or perforce?  or osc?  i'm not sure
svk is even maintained anymore.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


