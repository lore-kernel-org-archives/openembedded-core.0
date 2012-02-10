Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rvqon-00014d-Gl for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 14:47:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1ADdBtj031199
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:39:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29766-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:39:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1ADd39S031193
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:39:04 GMT
Message-ID: <1328881152.13434.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 13:39:12 +0000
In-Reply-To: <4F347F9A.5090007@linux.intel.com>
References: <1328832638.10451.52.camel@ted> <4F347F9A.5090007@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] package.bbclass: Optimise the per file rpm handling
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
X-List-Received-Date: Fri, 10 Feb 2012 13:47:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-09 at 18:23 -0800, Joshua Lock wrote:
> On 09/02/12 16:10, Richard Purdie wrote:
> > Currently a process was being forked off for each individual file
> > this class wanted to inspect with rpmdeps. This converts it to use
> > rpmdeps-oecore which allows batch processing of these dependencies.
> >
> > For do_package for perl, this reduced the time by about 1 minute (33%).
> 
> Awesome! Sounds like this addresses #1718
> 
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1718

It will certainly help with that issue, yes.

> > @@ -1136,7 +1136,7 @@ RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps --macros ${STAGING_LIBDIR_NA
> >   #  FILERDEPENDS_filepath_pkg - per file dep
> >
> >   python package_do_filedeps() {
> > -	import os, re
> > +	import re, subprocess
> 
> Was this accidentally left in? I don't see any calls to subprocess?

It was indeed from a different experiment, well spotted. I've removed
that.

Cheers,

Richard



