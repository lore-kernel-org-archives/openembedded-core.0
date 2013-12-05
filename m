Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0496DF6D;
	Thu,  5 Dec 2013 10:10:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5AABW4032261; Thu, 5 Dec 2013 10:10:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UdQKksGmqhV7; Thu,  5 Dec 2013 10:10:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5AA77K032257
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Dec 2013 10:10:08 GMT
Message-ID: <1386238202.25847.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Thu, 05 Dec 2013 10:10:02 +0000
In-Reply-To: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] cmake: respect ${S} and ${B}
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
X-List-Received-Date: Thu, 05 Dec 2013 10:10:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-12-05 at 00:38 +0000, Ross Burton wrote:
> Hi,
> 
> This is a Request For Comments because it changes behaviour of the cmake class
> and I'm not entirely knowledgeable in cmake.
> 
> For some reason, cmake.bbclass doesn't use ${S} and ${B}, but instead has it's
> own variables OECMAKE_SOURCEPATH ("." by default) and OECMAKE_BUILDPATH ("" by
> default).  Those defaults meant that the build happened in the source directory,
> which conveniently was ${S}.  Unless ${B} was also set, in which case it all
> broke.
> 
> I don't see a good reason for cmake.bbclass having it's own special versions of
> ${S} and ${B}, so this patch drops them and replicates some of the logic in
> autotools.bbclass: specifically the part where if ${S} and ${B} are different,
> delete ${B} before building.  This ensures that switching machine doesn't re-use
> the same build directory, which was the cause of me going back to look at this
> (libproxy trying to use the nuc sysroot when I'm building for qemux86-64).
> 
> Some open questions:
> 
> 1) As I understand it cmake has more reliable support for out-of-tree builds
> than autotools.  If this is the case should cmake.bbclass set B ?=
> "${WORKDIR}/build", or leave setting of B to separatebuilddir.inc?  Are there
> known recipes using cmake that fail with out-of-tree builds?

separatebuilddir.inc was really a stopgap solution to see how widespread
potential issues were. Ideally I'd like to get to the point where
recipes flag themselves are broken with out of tree builds rather than
having a list of ones which are compatible.

Doing this for OE-Core is straightforward now but what about meta-oe?

Would there be interest in trying to change that default or is it going
to be too painful?

This means I'm in favour of changing the cmake default if we can, it
looks like a simpler problem space than autotools.bbclass

Cheers,

Richard


