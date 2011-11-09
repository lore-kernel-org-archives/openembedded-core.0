Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RO9Qq-0000ij-29
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 15:47:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Nov 2011 06:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72812717"
Received: from unknown (HELO envy.home) ([10.255.15.140])
	by orsmga002.jf.intel.com with ESMTP; 09 Nov 2011 06:40:59 -0800
Message-ID: <4EBA90FB.5010706@linux.intel.com>
Date: Wed, 09 Nov 2011 06:40:59 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1320779076.git.dvhart@linux.intel.com>
	<6e5f3af0ae4f9f99f27bf2c909eef951599ff381.1320779076.git.dvhart@linux.intel.com>
	<4EBA3ACC.3000907@linux.intel.com>
In-Reply-To: <4EBA3ACC.3000907@linux.intel.com>
X-Enigmail-Version: 1.3.2
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: refactor configure to avoid configuring widec when disabled
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
X-List-Received-Date: Wed, 09 Nov 2011 14:47:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/09/2011 12:33 AM, Saul Wold wrote:
> On 11/08/2011 11:08 AM, Darren Hart wrote:
>> The ENABLE_WIDEC variable can be used to disable ncurses wide character support
>> when your C library doesn't support it. Currently, the do_configure step
>> configures for both narrow and wide characters regardless and only checks
>> ENABLE_WIDEC during compilation. This leads to QA failures with host
>> contamination during configure if the C library doesn't support wide characters.
>>
>> Refactor do_configure with a new ncurses_configure helper function and only
>> configure for wide character support if ENABLE_WIDEC is true.
>>
>> Ensure that configure errors are propogated back through to do_configure.
>>
>> Tested with ENABLE_WIDEC as true and false via an ncurses bbappend on i586,
>> including basic error injection.
>>
>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>> ---
>>   meta/recipes-core/ncurses/ncurses.inc |   64 +++++++++++++++++---------------
>>   1 files changed, 34 insertions(+), 30 deletions(-)
>>
>> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
>> index be7d387..d3a9b1c 100644
>> --- a/meta/recipes-core/ncurses/ncurses.inc
>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>> @@ -26,6 +26,36 @@ ENABLE_WIDEC = "true"
>>   # builds.
>>   BUILD_CPPFLAGS += "-D_GNU_SOURCE"
>>
> No PR Bump!

Right, duh. Thanks for catching. I've pushed to the same location having
added:

-INC_PR = "r1"
+INC_PR = "r2"

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=dvhart/tiny&id=170541c552017ca784f395a9b52aae6b7c9f3592

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


