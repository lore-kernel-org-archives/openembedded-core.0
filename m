Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TF06B-0008AN-Kv for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 12:04:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8L9ps2K017929;
	Fri, 21 Sep 2012 10:51:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11861-08; Fri, 21 Sep 2012 10:51:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8L9phVk017923
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 10:51:44 +0100
Message-ID: <1348221103.10108.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 21 Sep 2012 10:51:43 +0100
In-Reply-To: <505A9D84.5070501@windriver.com>
References: <cover.1345431102.git.wenzong.fan@windriver.com>
	<5a92968e29ead46bff1edf963d1f9cef3732e8b1.1345431102.git.wenzong.fan@windriver.com>
	<50365A14.4050601@linux.intel.com> <505A9D84.5070501@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] coreutils: fix do_configure error with long TMPDIR
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
X-List-Received-Date: Fri, 21 Sep 2012 10:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-20 at 12:37 +0800, Robert Yang wrote:
> 
> On 08/24/2012 12:28 AM, Saul Wold wrote:
> > On 08/19/2012 07:55 PM, wenzong.fan@windriver.com wrote:
> >> From: Wenzong Fan <wenzong.fan@windriver.com>
> >>
> >> By default the 'm4/*' files will be extended with absolute path while
> >> autoreconf running, if the length of TMPDIR is too long such as 410
> >> which is the maximum value allowed by 'sanity.bbclass', autoreconf
> >> will fail with error:
> >>
> >>      Can't exec "/bin/sh": Argument list too long ...
> >>
> >> Fix this issue by specific the 'acpaths' to '-I ./m4'.
> >>
> >> [YOCTO #2766]
> >>
> >> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> >> ---
> >>   meta/recipes-core/coreutils/coreutils_8.14.bb |    4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb
> >> b/meta/recipes-core/coreutils/coreutils_8.14.bb
> >> index 9a714a9..c7c8e13 100644
> >> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> >> +++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
> >> @@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
> >>   LICENSE = "GPLv3+"
> >>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> >>
> >> file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
> >> -PR = "r5"
> >> +PR = "r6"
> >>   DEPENDS = "gmp libcap"
> >>   DEPENDS_virtclass-native = ""
> >>
> >> @@ -36,6 +36,8 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo
> >> false kill ln ls mkdi
> >>
> >>   sbindir_progs= "chroot"
> >>
> >> +acpaths = "-I ./m4"
> >> +
> > This is a poor work-around to the problem, and does not give any idea as to what
> > your fixing.  Please investigate a proper fix not just a work-around.
> >
> 
> Hi Saul,
> 
> This is because the aclocal's argument list is very long when building
> coreutils, it has many arguments (378 m4 files under 'coreutils-8.14/m4'),
> when the length of the TMPDIR is short this is OK, but when it is longer,
> there would be a argument list too long error.
> 
> I think that we have two solutions to fix this problem:
> 1) Make aclocal accept longer arguments, unfortunately, the native aclocal is
>     running on the host, the length of the argument depends on the host's kernel
>     (The ARG_MAX which is defined in '/usr/include/linux/limits.h'), so this way
>     doesn't work.
> 
> 2) Make coreutils' acpaths shorter, this is what this patch does, it changes the
>     absolute path to the relative path, so it doesn't care the length of the
>     TMPDIR anymore.

There is solution

3) Fix autotools.bbclass to use relative paths for acpaths instead of
absolute ones. Something like:

for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| grep
-v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u | sed -e 's,${S},
\.,'`; do
					acpaths="$acpaths -I $i"

The reason this hasn't gone in yet as it hacks around it on a per recipe
basis rather than fixes an underlying problem.

Cheers,

Richard



