Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5D48861F27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 20:02:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UK6ANx013526; Thu, 30 May 2013 21:06:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K6XF81o8DSd5; Thu, 30 May 2013 21:06:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UK65BP013520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 30 May 2013 21:06:06 +0100
Message-ID: <1369944094.14887.330.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 30 May 2013 21:01:34 +0100
In-Reply-To: <1956799.LN9zTEVmsc@helios>
References: <1369834810-18927-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1956799.LN9zTEVmsc@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Thu, 30 May 2013 20:02:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-30 at 14:52 +0100, Paul Eggleton wrote:
> On Wednesday 29 May 2013 16:40:10 Bogdan Marinescu wrote:
> > guile needs to be able to convert strings from ISO-8859-1 in order
> > to work properly. This patch adds a runtime dependency to the required
> > convert package, but only when glibc is used. The fix for uClibc depends
> > on another bug (#4530).
> > 
> > [YOCTO #4019]
> > 
> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> > ---
> >  meta/recipes-devtools/guile/guile_2.0.9.bb |    5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb
> > b/meta/recipes-devtools/guile/guile_2.0.9.bb index 617f7ce..8ba7afc 100644
> > --- a/meta/recipes-devtools/guile/guile_2.0.9.bb
> > +++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
> > @@ -27,7 +27,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
> >  SRC_URI[md5sum] = "a69b575d4a633bdd9118f3a4a1e97766"
> >  SRC_URI[sha256sum] =
> > "f70a38c8d9751f442679bfe61852bba8545af4d4355d037630997c2f37f2895b"
> > 
> > -PR = "r0"
> > +PR = "r1"
> > 
> >  inherit autotools gettext
> >  BBCLASSEXTEND = "native"
> > @@ -36,6 +36,9 @@ DEPENDS = "libunistring bdwgc gmp libtool libffi"
> >  # add guile-native only to the target recipe's DEPENDS
> >  DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) !=
> > 'guile']}"
> > 
> > +RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
> > +RDEPENDS_${PN}_class-native = ""
> 
> The second line is erroneous, surely we only need the first to solve this 
> issue?

I merged this with the second line removed since it isn't needed afaict.

Cheers,

Richard


