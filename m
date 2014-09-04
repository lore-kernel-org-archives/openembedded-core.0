Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD7671465
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 08:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8487dfs017869; Thu, 4 Sep 2014 09:07:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RKxlq3voe0xo; Thu,  4 Sep 2014 09:07:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8487ba3017855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 4 Sep 2014 09:07:38 +0100
Message-ID: <1409818059.12482.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Thu, 04 Sep 2014 09:07:39 +0100
In-Reply-To: <5408146B.4060903@windriver.com>
References: <cover.1409735063.git.Chong.Lu@windriver.com>
	<ff575b1b7622194f6e15d1b38c191df729a80f47.1409735063.git.Chong.Lu@windriver.com>
	<1409740959.12482.4.camel@ted> <5408146B.4060903@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] perf: fix issue about package splitting
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
X-List-Received-Date: Thu, 04 Sep 2014 08:07:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-09-04 at 15:27 +0800, Chong Lu wrote:
> On 09/03/2014 06:42 PM, Richard Purdie wrote:
> > On Wed, 2014-09-03 at 17:05 +0800, Chong Lu wrote:
> >> Currently, perf can't split to perf-archive, perf-tests, perf-python and
> >> perf-perl. All files are included in perf package. Change the files paths to
> >> make split successfully and add PACKAGECONFIG to make main pkg depends on sub
> >> pkgs as default.
> >>
> >> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >> ---
> >>   meta/recipes-kernel/perf/perf.bb | 17 ++++++++++++-----
> >>   1 file changed, 12 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> >> index bfd210c..baf0077 100644
> >> --- a/meta/recipes-kernel/perf/perf.bb
> >> +++ b/meta/recipes-kernel/perf/perf.bb
> >> @@ -149,20 +149,27 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>   
> >>   PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
> >>   
> >> +PACKAGECONFIG ??= "archive perl python tests"
> >> +PACKAGECONFIG[archive] = ",,, ${PN}-archive"
> >> +PACKAGECONFIG[perl] = ",,, ${PN}-perl"
> >> +PACKAGECONFIG[python] = ",,, ${PN}-python"
> >> +PACKAGECONFIG[tests] = ",,, ${PN}-tests"
> >> +
> >>   RDEPENDS_${PN} += "elfutils"
> >>   RDEPENDS_${PN}-archive =+ "bash"
> >>   RDEPENDS_${PN}-python =+ "bash python"
> >>   RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
> >> +RDEPENDS_${PN}-tests =+ "python"
> > I now realise the trick you're playing with PACKAGECONFIG here. Instead
> > can we just define a package (say ${PN}-all but I'll accept a better
> > name) which has dependencies on archive perl python tests so then the
> > user can choose ${PN}, ${PN}-all or some other combination depending on
> > their needs?
> 
> OK, I will put archive perl python and tests in ${PN}-full.
> 
> >   
> >>   RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
> >>   RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
> >>   
> >> -FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
> >> +FILES_${PN} += "${libdir}/traceevent"
> >>   FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
> >> -FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
> >> -FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
> >> -FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
> >> -FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
> >> +FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
> >> +FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
> >> +FILES_${PN}-python = "${exec_prefix}/libexec/perf-core/scripts/python"
> >> +FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"
> > Can we use ${libexecdir} here please rather than hardcode it?
> 
> I checked environment, the variable libexecdir is "/usr/lib/perf". If I 
> use this variable, package can't be split successfully.

Perf should be putting the files into ${libexecdir}. We therefore
probably need to set perfexecdir correctly, then use ${libexecdir} in
FILES above.

Cheers,

Richard



