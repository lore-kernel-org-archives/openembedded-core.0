Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 666D778AB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:48:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2018 21:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,249,1531810800"; d="scan'208";a="73471086"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.195])
	([10.221.21.195])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2018 21:48:27 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180816062633.29868-1-anuj.mittal@intel.com>
	<CAJ86T=Wzi5hzFUfChDLKTDyKf+X9_EUjFvPE9wfSp5UXaQycaA@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <188b139f-5d52-b2e3-fdd7-e231deb56052@intel.com>
Date: Fri, 17 Aug 2018 12:48:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Wzi5hzFUfChDLKTDyKf+X9_EUjFvPE9wfSp5UXaQycaA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: enable profile optimized builds
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
X-List-Received-Date: Fri, 17 Aug 2018 04:48:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/17/2018 03:31 AM, Andre McCurdy wrote:
> On Wed, Aug 15, 2018 at 11:26 PM, Anuj Mittal <anuj.mittal@intel.com> wrote:
>> Enable profile guided optimization (pgo) for python3. Enabling pgo in
>> python is generally as simple as invoking the target profile-opt which:
>>
>> - builds python binaries with profile instrumentation enabled,
>> - runs a specific profile task using that python to get the profile
>> data and,
>> - feeds the compiler with this profile data and rebuilds python.
>>
>> This change invokes qemu-user for the second step of running a profile
>> task using target python. Depending on how long profile task takes to
>> run, this might add a significant time to compilation (which would be
>> true for native builds too). The default profile task can be changed by
>> the users depending on what makes sense for their use case (or can be
>> left empty). In case qemu-user isn't supported, profile task won't be run.
> 
> Is it important to re-create the profile data during every build or
> would we get most of the same benefits from using reference data which
> is generated offline? 

We should get the same benefit using the data generated offline as long
as the source code/configure options/flags are same I believe. I have
only tried with data generate offline using the same build configuration
though.

It would however need tweaking of the Makefiles to pass
-fprofile-dir=<path> while using the profile data among other things.
Please see this if you'd like an example that works:

https://git.yoctoproject.org/clean/cgit.cgi/poky-contrib/commit/?h=anujm/9338&id=e57654cb51b121e9dfa76e66432c4d37fd339d42

> How big is the data file? Is it binary or text?

gcc -fprofile-generate generates .gcda files which are used only for
profile use and can be deleted later and aren't installed. For more
information:

https://gcc.gnu.org/onlinedocs/gcc/Gcov-Data-Files.html

> Is the data expected to be target architecture specific?>
> If reference data were used, what are the consequences of the data not
> corresponding exactly to the current build configuration? A build
> failure? Or just a decrease in the effectiveness of the optimisation?

From gcc man page:

"By default, GCC emits an error message if the feedback profiles do not
match the source code. This error can be turned into a warning by using
-Wcoverage-mismatch. Note this may result in poorly optimized code."

> 
> Does the profiling instrumentation measure execution timing? Or only
> the frequency / order in which functions are called? ie is there any
> concern that data generated from running under qemu may not be optimal
> for running on the target?

It tries to identify code hot spots, how many times each branch and call
is executed and how many times it is taken or returns etc. so I don't
think it should matter. I did try on target hardware and using qemu as
well and at least performance wise, I didn't see any difference. I
didn't perform any exhaustive analysis though.


