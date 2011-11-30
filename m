Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVssk-0001wg-Ow
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:44:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Nov 2011 14:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,273,1320652800"; d="scan'208";a="80836912"
Received: from unknown (HELO envy.home) ([10.255.12.165])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2011 14:37:20 -0800
Message-ID: <4ED6B025.1060705@linux.intel.com>
Date: Wed, 30 Nov 2011 14:37:25 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1322689519.git.darren@dvhart.com>
	<e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
	<6e118d2846f5606561b4ae1f3c3ae93fd69bc360.1322689519.git.darren@dvhart.com>
	<CAMKF1sotPRfvMtbMYRBCtqpAj7CfYMzOzh1EORaOtBajzywwkA@mail.gmail.com>
In-Reply-To: <CAMKF1sotPRfvMtbMYRBCtqpAj7CfYMzOzh1EORaOtBajzywwkA@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] autotools.bbclass: Report the missing configure path
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
X-List-Received-Date: Wed, 30 Nov 2011 22:44:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/30/2011 02:31 PM, Khem Raj wrote:
> On Wed, Nov 30, 2011 at 1:49 PM, Darren Hart <darren@dvhart.com> wrote:
>> From: Darren Hart <dvhart@linux.intel.com>
>>
>> If the configure script isn't found, report the explicit path tried.
>> This can help debug subtle errors where the ${S} sourcedir may not
>> be exactly what is expected.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> ---
>>  meta/classes/autotools.bbclass |    9 +++++----
>>  1 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
>> index 37e7d4b..7536bac 100644
>> --- a/meta/classes/autotools.bbclass
>> +++ b/meta/classes/autotools.bbclass
>> @@ -70,11 +70,12 @@ CONFIGUREOPT_DEPTRACK = "--disable-dependency-tracking"
>>
>>
>>  oe_runconf () {
>> -       if [ -x ${S}/configure ] ; then
>> -               bbnote "Running ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
>> -               ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
>> +       cfgscript="${S}/configure"
>> +       if [ -x "$cfgscript" ] ; then
>> +               bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
>> +               $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
>>        else
>> -               bbfatal "no configure script found"
>> +               bbfatal "no configure script found at $cfgscript"
> 
> why not just do one line change something like
> 
> bbfatal "configure script ${S}/configure not found"

I prefer to use a variable when I need a value more than once. It avoids
future bugs where one is changed and the others were missed. As this
string is used 4 times, it seemed like the right call.

--
Darren

> 
>>        fi
>>  }
>>
>> --
>> 1.7.6.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


