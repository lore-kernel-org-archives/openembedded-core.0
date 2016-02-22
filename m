Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A23F9771B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 17:27:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 Feb 2016 09:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; d="scan'208";a="891891247"
Received: from bitbang.jf.intel.com (HELO [10.7.199.60]) ([10.7.199.60])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2016 09:27:06 -0800
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<99d32b8b8e7d0422dfa5f89a30e86668d88ef77f.1456153260.git.anibal.limon@linux.intel.com>
	<56CB2F1D.4050605@linux.intel.com> <56CB32C1.9040308@linux.intel.com>
	<56CB35E8.6060301@linux.intel.com> <56CB3949.5030804@linux.intel.com>
	<CAJTo0LZ+onCXJXw74VJSJkaOGdYi=qwBeXCnBtz0jvkpdrybJQ@mail.gmail.com>
	<56CB3FBE.50906@linux.intel.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <56CB44EA.5000303@linux.intel.com>
Date: Mon, 22 Feb 2016 09:27:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56CB3FBE.50906@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] classes/testsdk: Move the removal of bitbake PATH to eSDK context only
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
X-List-Received-Date: Mon, 22 Feb 2016 17:27:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/22/2016 09:05 AM, Aníbal Limón wrote:
>
>
> On 02/22/2016 10:48 AM, Burton, Ross wrote:
>> On 22 February 2016 at 16:37, Aníbal Limón <anibal.limon@linux.intel.com>
>> wrote:
>>
>>> I agree with you to modify avoid_paths_in_environ for return the new
>>> PATH variable is better than only modify it internally but for
>>> simplicity i will maintain the os.environ['PATH'] set/restore instead of
>>> generate the environment line.
>>>
>>
>> Totally agree with Randy here for what it's worth.  The environment-munging
>> code in avoid_paths... should return the strings instead of manipulating
>> the current environment so the caller has the choice whether to modify the
>> current environment or pass a new environment to subprocess.  And in
>> general I'd say that passing modified environments to subprocess is a
>> cleaner solution as it means that there's no way cleanup can fail to
>> happen.  Whilst that's just a try/except now, the code could get copied and
>> extended and end up with codepaths that don't hit the right cleanup.  By
>> having an explicit environment passed in, this isn't possible.
>
> Agree, now modified at,
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=alimon/esdk_update_v2&id=3143bf09130c52cd71e3f2f9795208e17152005d

If you either convert path to a dict or have avoid_paths_in_environ() return a 
dict you can do:

+            output = subprocess.check_output(". %s > /dev/null; %s;" % \
+                (self.tc.sdkenv, cmd), env=path, shell=True)

It's not quite obvious in the docs that you can pass that in, they refer you to 
the Popen docs.

> Cheers,
> 	alimon
>
>>
>> Ross
>>
>


