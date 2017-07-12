Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7710478164
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 15:01:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 08:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,350,1496127600"; d="scan'208";a="286015742"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.139])
	([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 08:01:18 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<0ba0ca75258dc5f62b1c79a7b87f85c136ca8ab7.1499803885.git.anibal.limon@linux.intel.com>
	<1499843714.20211.117.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <ec785117-31c8-db37-cfbe-b7bd34ce007f@linux.intel.com>
Date: Wed, 12 Jul 2017 10:01:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1499843714.20211.117.camel@intel.com>
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/30] oeqa/selftest/cases: runqemu enable thraded runs
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
X-List-Received-Date: Wed, 12 Jul 2017 15:01:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/12/2017 02:15 AM, Patrick Ohly wrote:
> s/thraded/threaded/ in the subject. There are more spelling mistakes
> elsewhere ("wrapper methos"). I don't know how important that is.
> 
> On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
>> - Update to use wrappers {bitbake,get_bb_var} from OESelfTestCase class.
> 
> s/OESelfTestCase/OESelftestTestCase/
> 
> Sorry to be pedantic, but I wanted to look up what these wrappers do and
> couldn't even find the class ;-}

Yes np,

> 
> I've found them in the "oeqa/selftest/case: Add wrappers to
> utils.commands modules" patch. I'm a bit worried that this entire patch
> series is introducing concepts and methods without any documentation or
> explanations why things are done this way. I suspect it will make it
> very hard to write selftests correctly.
> 
> For example, this patch and others like it seem fairly arbitrary. It
> doesn't explain why self.bitbake() is better than bitbake(). If in some
> future patch or test someone were to use bitbake() when they should have
> used self.bitbake() it's not going to be obvious either whether that is
> correct.
> 
> Perhaps all OE tests should have these wrappers and only
> OESelftestTestCase does something special with them? Then we can
> gradually replace the direct calls to oeqa.utils.commands completely.

You are right, the reason for add the wrappers is to be able to run
bitbake, runCmd, get_bb_var{,s}, in certain build directory.


For compatibility reasons the base class OESelftestTestCase is set to
use the main thread and the original builddir, and that's the reason to
don't delete the oeqa.utils.commands.

I guess the best way to address this is to include a README explaining
this situation into the meta/lib/oeqa/selftest folder.

> 
> Add also a wrapper for runqemu and we can get rid of "from
> oeqa.utils.commands import" completely.

Yes we can after the refkit and other selftest are adapted.


Cheers,
Anibal

> 
>> - Run into the main thread because it needs tinfoil to run.
>>
>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>> ---
>>  meta/lib/oeqa/selftest/cases/runqemu.py | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
>> index 4050a4123ba..e30cb24046f 100644
>> --- a/meta/lib/oeqa/selftest/cases/runqemu.py
>> +++ b/meta/lib/oeqa/selftest/cases/runqemu.py
>> @@ -6,12 +6,11 @@ import re
>>  import logging
>>  
>>  from oeqa.selftest.case import OESelftestTestCase
>> -from oeqa.utils.commands import bitbake, runqemu, get_bb_var
>> +from oeqa.utils.commands import runqemu
>>  from oeqa.core.decorator.oeid import OETestID
>>  
>>  class RunqemuTests(OESelftestTestCase):
>>      """Runqemu test class"""
>> -
>>      image_is_ready = False
>>      deploy_dir_image = ''
>>  
>> @@ -37,8 +36,8 @@ SYSLINUX_TIMEOUT = "10"
>>          )
>>  
>>          if not RunqemuTests.image_is_ready:
>> -            RunqemuTests.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
>> -            bitbake(self.recipe)
>> +            RunqemuTests.deploy_dir_image = self.get_bb_var('DEPLOY_DIR_IMAGE')
>> +            self.bitbake(self.recipe)
>>              RunqemuTests.image_is_ready = True
>>  
>>      @OETestID(2001)
> 

