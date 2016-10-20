Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 859E771999
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:34:27 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161020093427993_0684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:34:27 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=55082 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bx9jx-0003nh-5k for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2016 05:34:21 -0400
Date: Thu, 20 Oct 2016 05:33:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610200526270.4275@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how to add "uninative binary shim" to local source mirror?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Oct 2016 09:34:28 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-2069421826-1476956007=:4275"

--587864349-2069421826-1476956007=:4275
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8BIT


i use a local source mirror to avoid massive fetching; my site.conf:

  SOURCE_MIRROR_URL ?= "file:///home/rpjday/oe/dist/tarballs/"
  INHERIT += "own-mirrors"
  BB_GENERATE_MIRROR_TARBALLS = "1"
  # BB_NO_NETWORK = "1"

and if anything did need to get downloaded, i have a script i run from
inside the downloads/ directory to copy new content into my source
mirror directory (the idea, of course, being to recognize every
possible format of new, fetched content):

  for f in *.gz *.tgz *.bz2 *.xz *.rpm *.zip *.bin ; do
        if [ -f $f -a ! -h $f ] ; then
                echo "Copying $f ..." ; cp $f ~/oe/dist/tarballs/
        fi
  done

i just noticed new fetched content:

NOTE: Fetching uninative binary shim from
http://downloads.yoctoproject.org/releases/uninative/1.4/x86_64-nativesdk-libc.tar.bz2;sha256sum=101ff8f2580c193488db9e76f9646fb6ed38b65fb76f403acb0e2178ce7127ca
--2016-10-20 05:22:59--
http://downloads.yoctoproject.org/releases/uninative/1.4/x86_64-nativesdk-libc.tar.bz2

but that fetched content ends up in downloads/ under the subdirectory:

  $ tree uninative/
  uninative/
  „€€
  101ff8f2580c193488db9e76f9646fb6ed38b65fb76f403acb0e2178ce7127ca
      †€€ x86_64-nativesdk-libc.tar.bz2
      „€€ x86_64-nativesdk-libc.tar.bz2.done

is it just a matter of copying that bz2 tarball to my local source
mirror? is there some reason that tarball isn't fetched directly into
the downloads/ directory? are there any other "special cases" like
this i should be aware of?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-2069421826-1476956007=:4275--
