Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4EF278644
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 12:28:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 05:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,382,1498546800"; d="scan'208";a="300812042"
Received: from mlehtone-mac02.fi.intel.com (HELO [10.237.66.32])
	([10.237.66.32])
	by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2017 05:28:14 -0700
User-Agent: Microsoft-MacOutlook/f.20.0.170309
Date: Wed, 16 Aug 2017 15:28:17 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <716364F9-E9E1-4941-97FA-90D9434E518E@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] gpg_sign: perform rpm signing serially
References: <20170815214002.55130-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<62f0c732-87f3-9af6-3380-b9fd863f216c@windriver.com>
In-Reply-To: <62f0c732-87f3-9af6-3380-b9fd863f216c@windriver.com>
Mime-version: 1.0
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
X-List-Received-Date: Wed, 16 Aug 2017 12:28:15 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

I agree. I don't see reason for dropping parallelism completely. There is a real gain when running on beefier machines. Making it configurable would probably be best. Or just drop it to a saner value, like 20 or 10.
   - Markus

On 16/08/2017, 2.53, "Mark Hatle" <openembedded-core-bounces@lists.openembedded.org on behalf of mark.hatle@windriver.com> wrote:

    It would probably be better if this was configurable with a 'safe' default.
    
    Moving from parallel to single will greatly affect the overall performance on
    larger build machines (lots of memory and cores) that can handle the load vs a
    typical development machine.
    
    --Mark
    
    On 8/15/17 4:40 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
    > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
    > 
    > gpg signing in file batches (which was default to 100) is a memory expensive
    > computation, causing trouble in some host machines (even on production AB
    > as seen on the bugzilla ID). Also, in terms of performance, there is no real
    > gain when rpm signing is done in batches. Considering the latter issues, perform the
    > rpm signing serially.
    > 
    > Log showing errors observed recently at AB workers:
    > 
    >     | gpg: signing failed: Cannot allocate memory
    >     | gpg: signing failed: Cannot allocate memory
    >     | error: gpg exec failed (2)
    >     | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.5.29-r0/deploy-rpms/core2_64/base-passwd-dev-3.5.29-r0.core2_64.rpm:
    > 
    > [YOCTO #11914]
    > 
    > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
    > ---
    >  meta/lib/oe/gpg_sign.py | 6 +++---
    >  1 file changed, 3 insertions(+), 3 deletions(-)
    > 
    > diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
    > index f4d8b10e4b..5c7985a856 100644
    > --- a/meta/lib/oe/gpg_sign.py
    > +++ b/meta/lib/oe/gpg_sign.py
    > @@ -45,9 +45,9 @@ class LocalSigner(object):
    >              if fsk_password:
    >                  cmd += "--define '_file_signing_key_password %s' " % fsk_password
    >  
    > -        # Sign in chunks of 100 packages
    > -        for i in range(0, len(files), 100):
    > -            status, output = oe.utils.getstatusoutput(cmd + ' '.join(files[i:i+100]))
    > +        # Sign packages
    > +        for f in files:
    > +            status, output = oe.utils.getstatusoutput(cmd + ' ' + f)
    >              if status:
    >                  raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
    >  
    > 
    
    -- 
    _______________________________________________
    Openembedded-core mailing list
    Openembedded-core@lists.openembedded.org
    http://lists.openembedded.org/mailman/listinfo/openembedded-core
    



