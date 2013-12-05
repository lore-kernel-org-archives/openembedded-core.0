Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 63E966DF66
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 09:43:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1VoVSb-0008JP-QJ for openembedded-core@lists.openembedded.org;
	Thu, 05 Dec 2013 10:43:05 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 10:43:05 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 10:43:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 05 Dec 2013 10:43:26 +0100
Message-ID: <l7phqj$ssp$1@ger.gmane.org>
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.6
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 05 Dec 2013 09:43:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ross Burton schreef op 05-12-13 01:38:
> Hi,
> 
> This is a Request For Comments because it changes behaviour of the cmake
> class and I'm not entirely knowledgeable in cmake.
> 
> For some reason, cmake.bbclass doesn't use ${S} and ${B}, but instead has
> it's own variables OECMAKE_SOURCEPATH ("." by default) and
> OECMAKE_BUILDPATH ("" by default).  Those defaults meant that the build
> happened in the source directory, which conveniently was ${S}.  Unless
> ${B} was also set, in which case it all broke.
> 
> I don't see a good reason for cmake.bbclass having it's own special
> versions of ${S} and ${B}, so this patch drops them and replicates some
> of the logic in autotools.bbclass: specifically the part where if ${S}
> and ${B} are different, delete ${B} before building.  This ensures that
> switching machine doesn't re-use the same build directory, which was the
> cause of me going back to look at this (libproxy trying to use the nuc
> sysroot when I'm building for qemux86-64).
> 
> Some open questions:
> 
> 1) As I understand it cmake has more reliable support for out-of-tree
> builds than autotools.

Next to toolchain files it's the only positive think I can say about cmake.

> If this is the case should cmake.bbclass set B ?= "${WORKDIR}/build"

In opencv I set it to ${WORKDIR}/build-${TARGET_ARCH} to match the autotools
class, but that was a while ago. All the other meta-oe recipes seem to use
what you propose.

> , or leave setting of B to separatebuilddir.inc?  Are there known recipes
> using cmake that fail with out-of-tree builds?
> 
> 2) Is dropping OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH acceptable?
> Nothing in oe-core uses them and there's three (IIRC) recipes in meta-oe
> that use them. Assuming the answer to (1) is "separatebuilddir.inc" then
> the only fallout should be these recipes using in-tree builds until
> OECMAKE_BUILDPATH is replaced with B.

I'm not sure, but I think I favour the cmake.bbclass path, it's only a
handfull of recipe that need straightforward changes.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSoEq+MkyGM64RGpERAuXDAJ9T+TbAii88x2r9PQ5XCRbP5x5pYgCgltNm
4rXcZm+/l/sMnSNiPbFbRrI=
=6oHW
-----END PGP SIGNATURE-----


