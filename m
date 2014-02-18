Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 2062B6E8DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 20:53:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,503,1389744000"; d="scan'208";a="56085153"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 18 Feb 2014 20:53:46 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>) id 1WFrfm-0005be-Ik
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Feb 2014 20:53:46 +0000
Date: Tue, 18 Feb 2014 20:53:46 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140218205346.GA21359@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: boost: Ineffective compileflags and linkflags in user-config.jam
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
X-List-Received-Date: Tue, 18 Feb 2014 20:53:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

boost.inc's do_boostconfig task contains:

 # D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
 if ! grep -qe "^using gcc : 4.3.1" ${S}/tools/build/v2/user-config.jam
 then
   echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
 fi

The compileflags and linkflags have no effect as far as I can tell when
passing -d+2 to bjam to display the command invocations. The "using gcc"
line appears to date back into the mists of meta-oe.

The correct syntax would appear to be:

 'using gcc ; 4.3.1 : ${CXX} : <compileflags>"-DBOOST_SP_USE_PTHREADS -I${includedir}" <linkflags>"-L${libdir}" ;'

(this syntax can be seen in the -sBUILD part of BJAM_TOOLS and is
documented at
http://www.boost.org/boost-build2/doc/html/bbv2/reference/tools.html .)

But, if those options have no effect then they can't be required so should they just be removed? i.e. just use:

 'using gcc ; 4.3.1 : ${CXX} : ;'

or should users of this recipe be given a convenient ability to override
the compileflags, with perhaps something like:

 'using gcc ; 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" ;'

I'm mainly interested in this because I wish to pass "-std=gnu++11". I can
confirm that the last suggestion solves my problem when I add this to my
bbappend:

CXXFLAGS += "-std=gnu++11"

Any advice gratefully received. Thanks.

Mike.


