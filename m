Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ED03272D28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 23:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0GNWkSt017067; Fri, 16 Jan 2015 23:32:46 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kpzgQUHPRC2m; Fri, 16 Jan 2015 23:32:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0GNWTBl017064
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 16 Jan 2015 23:32:41 GMT
Message-ID: <1421451149.1798.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
Date: Fri, 16 Jan 2015 23:32:29 +0000
In-Reply-To: <7805B0FACE4FCC4E84636AB320CBA4AC360C5160@ALA-MBB.corp.ad.wrs.com>
References: <1421339471-11486-1-git-send-email-daniel.dragomir@windriver.com>
	,<1421340029.18703.0.camel@linuxfoundation.org>
	<7805B0FACE4FCC4E84636AB320CBA4AC360C5160@ALA-MBB.corp.ad.wrs.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Remove libgfortran data from receipe
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
X-List-Received-Date: Fri, 16 Jan 2015 23:32:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-01-16 at 18:31 +0000, Dragomir, Daniel wrote:
> >On Thu, 2015-01-15 at 18:31 +0200, Daniel Dragomir wrote:
> >> Remove libgfortran packages from PACKAGES list and skip them at compiling
> >> and installing as long as libgfortran has separate receipe since commit
> >>
> >> 5bde5d9b39ea67f19a1a6aedd0c08c6cfedcbe5f
> >> gcc: Allow fortran to build successfully in 4.8
> >>
> >> Otherwise, when fortran support will be enabled in the compiler, both
> >> lingfortran and gcc-runtime receipes will create the same files and will
> >> try to install them. This will cause errors:
> >>
> >> ERROR: The recipe libgfortran is trying to install files into a shared
> >> area when those files already exist. Those files and their manifest
> >> location are: ...
> >> Please verify which recipe should provide the above files.
> >>
> >> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> >> ---
> >>  meta/recipes-devtools/gcc/gcc-runtime.inc | 41 ++++++++++++-------------------
> >>  1 file changed, 16 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> index 167869e..c3b4a46 100644
> >> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> @@ -22,28 +22,34 @@ do_configure () {
> >>       target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
> >>       hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
> >>       for d in libgcc ${RUNTIMETARGET}; do
> >> -             echo "Configuring $d"
> >> -             rm -rf ${B}/$target/$d/
> >> -             mkdir -p ${B}/$target/$d/
> >> -             cd ${B}/$target/$d/
> >> -             chmod a+x ${S}/$d/configure
> >> -             ${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> >> +             if [ "$d" != "libgfortran" ]; then
> >
> >Why would libgfortran be in RUNTIMETARGET? Surely it would be better
> >just to ensure it isn't rather than ignore it?
> >
> >Cheers,
> >
> >Richard
> 
> My mistake.
> I didn't noticed that I had in my layer, in a bbappend for gcc-runtime this line
> 
> RUNTIMETARGET += "libgfortran"
> 
> because I added fortran support in dora branch.
> And in dora the receipes (gcc-runtime and libgfortran) were not splited.
> 
> That's why I added those "if" statements to skip libgfortran.
> 
> I remove the line and iny layer I added "libgfortran" in DEPENDS for image to build it.
> 
> Do you thing that we still need to ensure libgfortran is not in RUNTIMETARGET?
> Or I should remove the "if" statements and create a patch just with the other changes?

I think a patch with just the other changes should be fine now I
understand how you reached this point.

Cheers,

Richard




