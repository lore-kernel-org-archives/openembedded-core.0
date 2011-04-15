Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1QAfKj-0006oj-KK
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 11:28:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 02:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,217,1301900400"; d="scan'208";a="733767669"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 02:26:39 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1QAfBC-0008PG-1e; Fri, 15 Apr 2011 17:19:06 +0800
Date: Fri, 15 Apr 2011 17:19:05 +0800
From: Qing He <qing.he@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110415091905.GC21398@qhe2-db>
References: <cover.1302686656.git.qing.he@intel.com>
	<b94c6ce5656dd4bd312feda0eaf2423cae505ccd.1302686656.git.qing.he@intel.com>
	<BANLkTikg2Bb8bCrnjJU3JyP0mHTYHFoRgg@mail.gmail.com>
	<20110414020059.GA21398@qhe2-db>
	<BANLkTi=Y454r0KQuorJM2HxUafA+Gkzmag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTi=Y454r0KQuorJM2HxUafA+Gkzmag@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] quilt: fix test for target build
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
X-List-Received-Date: Fri, 15 Apr 2011 09:28:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 2011-04-14 at 23:23 +0800, Khem Raj wrote:
> > The reason to touch this part of code is that the test itself doesn't
> > work for newer versions of GNU patch, see:
> > ??http://lists.nongnu.org/archive/html/quilt-dev/2010-06/msg00002.html
> > This surely fixes the configure error, but is logically not suitable for
> > cross compiling.
> 
> As I understand you are trying to fix quilt target recipe. Then may it
> will be better to take the above
> patch for both target and native but apply this
> workaround conditionally only for target recipe

This was once backported, but subsequently reverted, see:
  http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=ec740ac770d2124cbae1ab936d85b8343076c53b

autoconf-native is not available at the point of quilt-native, so
autoreconf is not desirable. This is also the reason for separation
of quilt and quilt-native from the very beginning.

Apart from that, the workaround is solely for target recipe.

> 
> there are options --with-patch --with-diff also
> there to point these utilities

The problem still lies in cross building:
  --with-patch=${bindir}/patch          at build time, it's /usr/bin/patch
                                        which is host utility, if target
					${bindir} /= /usr/bin, the file
					may not exist.

  --with-patch=${STAGING_BINDIR}/patch  causes runtime error as
                                        ${STAGING_BINDIR} leaks into target scripts

  --with-patch=patch                    this may work, but may fail (in case
                                        the target scripts unset PATH)

This is the problem of such tests without the concept of a target
sysroot.

Thanks,
Qing


