Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBAru-000674-NO for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 22:18:35 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1SL9Aev025638; Thu, 28 Feb 2013 21:09:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zs9rljDQsmXw; Thu, 28 Feb 2013 21:09:09 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1SL92s4025623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 28 Feb 2013 21:09:05 GMT
Message-ID: <1362085289.5119.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Zanussi <tom.zanussi@linux.intel.com>, Burton Ross
	<ross.burton@intel.com>
Date: Thu, 28 Feb 2013 21:01:29 +0000
In-Reply-To: <1362080697.2588.75.camel@empanada>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
	<4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
	<512EDDE0.2060907@linux.intel.com> <1362026705.2588.33.camel@empanada>
	<512FA8B6.4030909@linux.intel.com> <1362080697.2588.75.camel@empanada>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libaudit: new package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 21:18:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-28 at 13:44 -0600, Tom Zanussi wrote:
> On Thu, 2013-02-28 at 10:57 -0800, Saul Wold wrote:
> > On 02/27/2013 08:45 PM, Tom Zanussi wrote:
> > > On Wed, 2013-02-27 at 20:32 -0800, Saul Wold wrote:
> > >> On 02/27/2013 07:00 AM, tom.zanussi@linux.intel.com wrote:
> > >>> From: Tom Zanussi <tom.zanussi@linux.intel.com>
> > >>>
> > >>> Add libaudit, used by system call auditing applications.  From the
> > >>> sources:
> > >>>
> > >>>    "The audit package contains the user space utilities for storing and
> > >>>    searching the audit records generate by the audit subsystem in the
> > >>>    Linux 2.6 kernel."
> > >>>
> > >>> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> > >>> ---
> > >>>    .../libaudit/libaudit/build-lib-only.patch         |  33 ++
> > >>>    .../libaudit/libaudit/fix-host-gen.patch           | 461 +++++++++++++++++++++
> > >>>    meta/recipes-support/libaudit/libaudit_2.2.2.bb    |  25 ++
> > >>>    3 files changed, 519 insertions(+)
> > >>>    create mode 100644 meta/recipes-support/libaudit/libaudit/build-lib-only.patch
> > >>>    create mode 100644 meta/recipes-support/libaudit/libaudit/fix-host-gen.patch
> > >>>    create mode 100644 meta/recipes-support/libaudit/libaudit_2.2.2.bb
> > >>
> > >>>
> > >> <SNIP>
> > >>
> > >>
> > >>> diff --git a/meta/recipes-support/libaudit/libaudit_2.2.2.bb b/meta/recipes-support/libaudit/libaudit_2.2.2.bb
> > >>> new file mode 100644
> > >>> index 0000000..e28b619
> > >>> --- /dev/null
> > >>> +++ b/meta/recipes-support/libaudit/libaudit_2.2.2.bb
> > >>> @@ -0,0 +1,25 @@
> > >>> +DESCRIPTION = "libaudit is the dynamic library needed for applications to use the audit framework."
> > >>> +SECTION = "libs"
> > >>> +AUTHOR = "Steve Grubb <sgrubb@redhat.com>"
> > >>> +HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
> > >>> +LICENSE = "LGPLv2+"
> > >>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> > >>> +PR = "r0"
> > >>> +
> > >>> +SRC_URI = "http://people.redhat.com/sgrubb/audit/audit-${PV}.tar.gz \
> > >>> +           file://build-lib-only.patch \
> > >>> +           file://fix-host-gen.patch \
> > >>> +          "
> > >>> +
> > >>> +SRC_URI[md5sum] = "6641fde111cf5dfda6d4282ab8410df5"
> > >>> +SRC_URI[sha256sum] = "8bc2b45a5f08f5df6cebcd5543f24b7e68e28b64da4b23f08de2c6616384302b"
> > >>> +
> > >>> +S = "${WORKDIR}/audit-${PV}"
> > >>> +
> > >>> +inherit autotools
> > >>> +
> > >>> +EXTRA_OECONF = "--disable-dependency-tracking --disable-listener"
> > >>> +
> > >>> +do_configure() {
> > >>> +	       oe_runconf
> > >>> +}
> > >>>
> > >> Is this do_configure really needed?  Does the autotools default not work
> > >> correctly?  And if not why not?
> > >
> > > This is to avoid the autoreconf step, which ends up overwriting the
> > > lib/Makefile.in changes when it regenerates it from lib/Makefile.am.
> > >
> > > The Makefile.in is shipped with the source tarball, so I modified it
> > > directly instead of complicating things by trying to get autoreconf to
> > > generate the correct Makefile for the target part of the build vs these
> > > specific changes to Makefile.in for the set of programs generated to run
> > > on the host.
> > >
> > 
> > Tom,
> > 
> > I understand your approach here and while it has good intentions, is not 
> > the right way to go about this.  We want to enable upstream packages to 
> > cross compile (if they are open to the idea). So changing the 
> > Makefile.am would be the right way to do this and allow the standard 
> > automake and autoreconf to do their work.  This would also allow the 
> > patches to be possibly accepted up stream.
> > 
> 
> OK, makes sense, I understand - I did actually try digging into this and
> to do it by targeting Makefile.am, but got bogged down in the details of
> figuring out how to get everything generated properly for the target and
> these special cases of these other programs generated for the host.
> 
> Also, any patch that would likely be accepted upstream would have to
> address everything in the audit package, not just the small libaudit
> part that this recipe is interested in.   It doesn't seem worth the work
> to make it all cross-compileable it in order to simply to enable a
> single perf feature.
> 
> It may be that not much more is needed, but I did notice the same types
> of problems in other subdirs of the package when I neglected to filter
> them out.  In any case, I will take another look and consider some of
> the things you mention below...
> 
> > I understand there are examples of this type of patching in OE-Core, 
> > that does not mean they are good examples and they should probably be 
> > looked into for fixing also.
> > 
> > I know you have put effort in here, and we want to make sure the patches 
> > are correct and good example moving forward.
> > 
> > For example in the first build-lib-only patch you can just edit the 
> > SUBDIRS line to include lib.
> > 
> 
> Right, fixing the top-level Makefile.am was easy - changing the SUBDIRs
> line there was what I did in the -v0 branch, the more problematic case
> is the Makefile.am in /lib... 
> 
> > For the larger patch, are you selectively changing CCLD and CFLAGS or is 
> > it through out?  You should probably build these -native and use them 
> > instead of trying to tweak around the target build.
> > 
> 
> Selectively, just for the gen_* programs which are used to generate
> tables and structs on the host.
> 
> I'll try the -native route instead, which does make sense as an
> alternative...
> 
> Thanks for the input..

Firstly, let me back Saul here, I am not taking changes to Makefile.in
files which can't be generated from Makefile.am. Its a world of pain
later and causes other problems. We're not going there.

Secondly, let me point you at the _FOR_BUILD macros. I've cc'd Ross who
is probably our resident expert in this. And no, I've didn't know he
could run like that either ;-).

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=85bfe3c931d7ef5ee461251abb6772564733e072
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=7ea8496ce085d507166efbd3a5e4d20444d3c35f

We fixed some issues in mesa-dri and gtk+ using techniques with these
variables (all of which are now upstream in the appropriate sources).

Cheers,

Richard




