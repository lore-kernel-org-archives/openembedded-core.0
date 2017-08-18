Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5157377DB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 14:16:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 18 Aug 2017 07:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,393,1498546800"; d="scan'208";a="891409032"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2017 07:16:09 -0700
Message-ID: <1503066302.28682.30.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Fri, 18 Aug 2017 09:25:02 -0500
In-Reply-To: <3A34D04D-CC68-4C5E-9238-DA363293E19D@linux.intel.com>
References: <20170815214002.55130-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<62f0c732-87f3-9af6-3380-b9fd863f216c@windriver.com>
	<716364F9-E9E1-4941-97FA-90D9434E518E@linux.intel.com>
	<1502899215.28941.50.camel@linux.intel.com>
	<200B9582-5A9D-411E-A5B1-B9824244EC26@linux.intel.com>
	<1502981523.28682.12.camel@linux.intel.com>
	<3A34D04D-CC68-4C5E-9238-DA363293E19D@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gpg_sign: perform rpm signing serially
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
X-List-Received-Date: Fri, 18 Aug 2017 14:16:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-08-18 at 11:04 +0300, Markus Lehtonen wrote:
> Hi,
> 

Ok so basically I wasted my time on this profiling exercise. Thanks for
the clarification.



> Using selftest to measure the signing performance is fruitless. The effect of using "chunks" really depends on the number of subpackages the recipe produces. Selftest uses one of the smallest recipes , i.e. "ed", so you won't see any difference. But with  hundreds of subpackages you get different figures.
>    - Markus
> 
> On 17/08/2017, 17.52, "Leonardo Sandoval" <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> 
>     On Thu, 2017-08-17 at 10:50 +0300, Markus Lehtonen wrote:
>     > Hi,
>     > 
>     > I quickly run some tests on a Xeon server, using glibc-locale as the recipe to build.
>     > 100: 154s 
>     > 10: 162s (+5%)
>     > 1: 234s (+51%)
>     
>     What I did to measure parallel versus serial is to run the corresponding
>     selftest (signing.Signing.test_signing_packages) several times for
>     chucks of 100, 20, 10 and 1. 
>     
>     Here are the results (Xeon machine also)
>     
>     100:
>     - Ran 1 test in 51.857s
>     - Ran 1 test in 52.148s
>     - Ran 1 test in 52.048s
>     - Ran 1 test in 52.397s
>     
>     20:
>     
>     - Ran 1 test in 54.068s
>     - Ran 1 test in 67.295s
>     - Ran 1 test in 52.608s
>     - Ran 1 test in 51.948s
>     - Ran 1 test in 53.283s
>     
>     10
>     
>     - Ran 1 test in 55.178s
>     - Ran 1 test in 56.468s
>     - Ran 1 test in 52.735s
>     - Ran 1 test in 53.530s
>     - Ran 1 test in 53.064s
>     
>     1:
>     - Ran 1 test in 52.604s
>     - Ran 1 test in 53.211s
>     - Ran 1 test in 53.020s
>     - Ran 1 test in 53.017s
>     - Ran 1 test in 53.029s
>     
>     
>     so at least at selftest level, there is not such an perf penalty as you
>     observed. This is the test involved:
>     
>     
>         @OETestID(1362)
>         def test_signing_packages(self):
>     
>     """                                                                                                                                                                                                                                    
>             Summary:     Test that packages can be signed in the package
>     feed                                                                                                                                                                      
>             Expected:    Package should be signed with the correct
>     key                                                                                                                                                                             
>             Expected:    Images can be created from signed packages      
>     
>     
>     
>     
>     
>     > 
>     > Even if signing is not parallel, the difference may be explained by the number of rpm processes that get spawned. I would drop the factor to 10 or use BB_NUMBER_THREADS as Andre suggested in another email.
>     >   - Markus
>     > 
>     > 
>     > 
>     > On 16/08/2017, 19.00, "Leonardo Sandoval" <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>     > 
>     >     On Wed, 2017-08-16 at 15:28 +0300, Markus Lehtonen wrote:
>     >     > I agree. I don't see reason for dropping parallelism completely. There is a real gain when running on beefier machines. Making it configurable would probably be best. Or just drop it to a saner value, like 20 or 10.
>     >     >    - Markus
>     >     > 
>     >     
>     >     I ran some tests with 100, 20 and 1 and I saw (I can rerun and provide
>     >     times) no difference on times. gpg may be intrinsically serial so
>     >     passing 1 or N files wont make much difference in type. The only gain
>     >     when using file chunks is that one one process is launched.
>     >     
>     >     I the other hand, I tried using multiprocessing.Pool, but failed
>     >     miserably due to file looking reasons.
>     >     
>     >     
>     >     
>     >     > On 16/08/2017, 2.53, "Mark Hatle" <openembedded-core-bounces@lists.openembedded.org on behalf of mark.hatle@windriver.com> wrote:
>     >     > 
>     >     >     It would probably be better if this was configurable with a 'safe' default.
>     >     >     
>     >     >     Moving from parallel to single will greatly affect the overall performance on
>     >     >     larger build machines (lots of memory and cores) that can handle the load vs a
>     >     >     typical development machine.
>     >     >     
>     >     >     --Mark
>     >     >     
>     >     >     On 8/15/17 4:40 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
>     >     >     > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>     >     >     > 
>     >     >     > gpg signing in file batches (which was default to 100) is a memory expensive
>     >     >     > computation, causing trouble in some host machines (even on production AB
>     >     >     > as seen on the bugzilla ID). Also, in terms of performance, there is no real
>     >     >     > gain when rpm signing is done in batches. Considering the latter issues, perform the
>     >     >     > rpm signing serially.
>     >     >     > 
>     >     >     > Log showing errors observed recently at AB workers:
>     >     >     > 
>     >     >     >     | gpg: signing failed: Cannot allocate memory
>     >     >     >     | gpg: signing failed: Cannot allocate memory
>     >     >     >     | error: gpg exec failed (2)
>     >     >     >     | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.5.29-r0/deploy-rpms/core2_64/base-passwd-dev-3.5.29-r0.core2_64.rpm:
>     >     >     > 
>     >     >     > [YOCTO #11914]
>     >     >     > 
>     >     >     > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>     >     >     > ---
>     >     >     >  meta/lib/oe/gpg_sign.py | 6 +++---
>     >     >     >  1 file changed, 3 insertions(+), 3 deletions(-)
>     >     >     > 
>     >     >     > diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
>     >     >     > index f4d8b10e4b..5c7985a856 100644
>     >     >     > --- a/meta/lib/oe/gpg_sign.py
>     >     >     > +++ b/meta/lib/oe/gpg_sign.py
>     >     >     > @@ -45,9 +45,9 @@ class LocalSigner(object):
>     >     >     >              if fsk_password:
>     >     >     >                  cmd += "--define '_file_signing_key_password %s' " % fsk_password
>     >     >     >  
>     >     >     > -        # Sign in chunks of 100 packages
>     >     >     > -        for i in range(0, len(files), 100):
>     >     >     > -            status, output = oe.utils.getstatusoutput(cmd + ' '.join(files[i:i+100]))
>     >     >     > +        # Sign packages
>     >     >     > +        for f in files:
>     >     >     > +            status, output = oe.utils.getstatusoutput(cmd + ' ' + f)
>     >     >     >              if status:
>     >     >     >                  raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
>     >     >     >  
>     >     >     > 
>     >     >     
>     >     >     -- 
>     >     >     _______________________________________________
>     >     >     Openembedded-core mailing list
>     >     >     Openembedded-core@lists.openembedded.org
>     >     >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     >     >     
>     >     > 
>     >     > 
>     >     
>     >     
>     >     
>     > 
>     > 
>     
>     
>     
> 
> 



