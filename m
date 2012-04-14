Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIyQA-0006aK-NR for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 10:33:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3E8O0Lu012319;
	Sat, 14 Apr 2012 09:24:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09992-08; Sat, 14 Apr 2012 09:23:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3E8NmfJ012312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 14 Apr 2012 09:23:50 +0100
Message-ID: <1334391830.7309.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 14 Apr 2012 09:23:50 +0100
In-Reply-To: <CAMKF1so2tFrdJgQHEcTXmN8vU4KetHL0QUjv+3=Yhi=o3DjESg@mail.gmail.com>
References: <36ED13F3654AE54CA763E6821D93A5711043A0E3@szxeml534-mbs.china.huawei.com>
	<4F88A76C.2000308@linux.intel.com>
	<CAMKF1so2tFrdJgQHEcTXmN8vU4KetHL0QUjv+3=Yhi=o3DjESg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: Re: [PATCH] boost: fix re-execution of task
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
X-List-Received-Date: Sat, 14 Apr 2012 08:33:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-13 at 19:14 -0700, Khem Raj wrote:
> On Fri, Apr 13, 2012 at 3:23 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 04/13/2012 04:42 AM, Venkata ramana gollamudi wrote:
> >>
> >> After building boost package, re-execution of boostconfig task followed by
> >> re-execution of compile task is giving following error
> >> "error: duplicate initialization of gcc with the following parameters"
> >> during compilation
> >> It is because multiple entries of gcc are being added during boostconfig
> >> re-execution
> >> there by failing the compilation.
> >>
> >> The patch fixes adding multiple "Using gcc" entries into
> >> /tools/build/v2/user-config.jam
> >>
> >> [Yocto #2194]
> >>
> >> Signed-off-by: Venkata Ramana Gollamudi<ramana.gollamudi@huawei.com>
> >> ---
> >>  meta/recipes-support/boost/boost.inc |    6 +++++-
> >>  1 files changed, 5 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/recipes-support/boost/boost.inc
> >> b/meta/recipes-support/boost/boost.inc
> >> index d70a7e2..c9306df 100644
> >> --- a/meta/recipes-support/boost/boost.inc
> >> +++ b/meta/recipes-support/boost/boost.inc
> >> @@ -135,7 +135,11 @@ BJAM_OPTS    = '${BJAM_TOOLS} \
> >>  do_boostconfig() {
> >>        cp -f boost/config/platform/linux.hpp
> >> boost/config/platform/linux-gnueabi.hpp
> >>
> >> -       echo 'using gcc : 4.3.1 : ${CXX} : compileflags
> >> -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;'>>
> >>  ${S}/tools/build/v2/user-config.jam
> >> +       # D2194:Fixing the failure of "error: duplicate initialization of
> >> gcc with the following parameters" during compilation.
> >> +       if ! grep -qe "^using gcc : 4.3.1"
> >> ${S}/tools/build/v2/user-config.jam
> >> +       then
> >> +               echo 'using gcc : 4.3.1 : ${CXX} : compileflags
> >> -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;'>>
> >>  ${S}/tools/build/v2/user-config.jam
> >> +       fi
> >>  }
> >>
> >>  addtask do_boostconfig after do_patch before do_configure
> >
> >
> > Merged into OE-Core
> 
> I had some feedback on this patch series. I wonder if it was so meaningless.

I'd taken it before your feedback, the merge email was just a bit
later :(.

I'm really struggling to get fixes into the tree yet keep things
building and stable for -rc4 at the moment. I've been disappointed with
the lack of testing some patches have had. I accelerated getting some
things in so that they could get good exposure on the autobuilder at
least.

FWIW, D2194 is referencing the Yocto bugzilla, not any other internal
defect tracking system. I'll take patches to improve comments but I
really want to get some of the rebuilding issues fixed for release as
people keep hitting them and they're a pain.

Cheers,

Richard





