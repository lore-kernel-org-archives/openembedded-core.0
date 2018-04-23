Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 143C872F01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 22:05:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3NM5h8B022549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 23 Apr 2018 23:05:45 +0100
Message-ID: <1524521143.18865.174.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Hongxu Jia
	<hongxu.jia@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 23 Apr 2018 23:05:43 +0100
In-Reply-To: <df7a7e3b-09a9-26ac-8969-bc369f9bc2c4@windriver.com>
References: <1524471238-4908-1-git-send-email-hongxu.jia@windriver.com>
	<df7a7e3b-09a9-26ac-8969-bc369f9bc2c4@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V2] perf: make a copy of kernel source to perf workdir
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
X-List-Received-Date: Mon, 23 Apr 2018 22:05:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-04-23 at 13:51 -0400, Bruce Ashfield wrote:
> On 2018-04-23 4:13 AM, Hongxu Jia wrote:
> > 
> > Since perf modify kernel source which shared by multiple
> > recipes, it probably caused kernel-devsrc compile failure
> > at world build.
> > ...
> > > 
> > > 0 blocks
> > > cpio: ./tools/perf/arch/arm/util/sedr7ORqk: Cannot stat:
> > No such file or directory
> > > 
> > > 0 blocks
> > ...
> > cpio tried to find a file at ${S}/tools/perf and failed
> > if the input list is not valid.
> > 
> > Make a copy of kernel shared source directory into a perf workdir
> > could fix the issue.
> > 
> > Drop `Fix for rebuilding' which is obsolete
> > 
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   meta/recipes-kernel/perf/perf.bb | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> > kernel/perf/perf.bb
> > index 872b5f0..8b40806 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -61,7 +61,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OW
> > N_DIR}/perl/${@get_perl_version
> >   
> >   inherit kernelsrc
> >   
> > -B = "${WORKDIR}/${BPN}-${PV}"
> > +S = "${WORKDIR}/${BP}"
> >   SPDX_S = "${S}/tools/perf"
> >   
> >   # The LDFLAGS is required or some old kernels fails due missing
> > @@ -119,11 +119,12 @@ do_install() {
> >   	fi
> >   }
> >   
> > -do_configure_prepend () {
> > -    # Fix for rebuilding
> > -    rm -rf ${B}/
> > -    mkdir -p ${B}/
> > +do_configure[prefuncs] += "git_clone_kernel_source"
> > +git_clone_kernel_source () {
> > +    git clone --single-branch ${STAGING_KERNEL_DIR} ${S}
> I probably would have used "cp -a -r", or similar. Since it
> is possible that a kernel may not actually be a git repo (linux-yocto
> always is, but that is just one data point).
> 
> Also, did you try just copying the tools SRC dir + whatever
> infrastructure is needed to build ? That will save us a LOT
> of i/o when moving the source around for perf to build.
> 
> But outside of those details/mechanics, the approach is sound.

Our "copy hardlink tree" function, whatever its called is sometimes of
use in these cases...

I think I'm the current owner of a bug in this area which I've sadly
not gotten to yet :(.

Also, have we considered the alternative - not copying tools/perf for
the kernel devsrc?

Cheers,

Richard

