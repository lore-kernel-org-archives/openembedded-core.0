Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPnaj-0005af-UH
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 05:20:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2011 20:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="5661155"
Received: from unknown (HELO [10.255.12.184]) ([10.255.12.184])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 20:16:56 -0700
Message-ID: <4DDF17A7.4010807@linux.intel.com>
Date: Thu, 26 May 2011 20:16:55 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1306364294.git.dvhart@linux.intel.com>	
	<f2eb88161222a6df60739367d2f44342d3bfbbf2.1306364294.git.dvhart@linux.intel.com>
	<1306453593.27470.226.camel@rex>
In-Reply-To: <1306453593.27470.226.camel@rex>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] utils.bbclass: make FILESEXTRAPATHS colon delimited
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
X-List-Received-Date: Fri, 27 May 2011 03:20:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/26/2011 04:46 PM, Richard Purdie wrote:
> On Wed, 2011-05-25 at 16:05 -0700, Darren Hart wrote:
>> Fixes [YOCTO 1102]
>>
>> Path variables are typically : delimited. White space is allowed in paths, so
>> is not a good choice for separating paths. Currently utils.bbclass performs the
>> following:
>>
>>     extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
>>
>> This splits FILESEXTRAPATHS on whitespace. It later splits overrides on : and
>> reassembles them all together as : delimited.
>>
>> There is only one user of FILESEXTRAPATHS in oe-core (qt4-tools-native, which
>> uses : anyway) and none in oe.
>>
>> Change the split() in utils.bbclass to split on : instead of whitespace. When
>> splitting on a defined string (":") we must be careful to handle the empty
>> string case which returns [''] instead of [].
>>
>> Tested building qt4-tools-native and core-image-minimal for surgarbay from
>> meta-intel with a couple extra layers with FILESEXTRAPATHS modifications added.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> Cc: Phil Blundell <pb@pbcl.net>
>> ---
>>  meta/classes/utils.bbclass |    6 ++++--
>>  1 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
>> index e103351..9930a24 100644
>> --- a/meta/classes/utils.bbclass
>> +++ b/meta/classes/utils.bbclass
>> @@ -331,8 +331,10 @@ def explode_deps(s):
>>  
>>  def base_set_filespath(path, d):
>>  	filespath = []
>> -	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
>> -	path = extrapaths + path
>> +	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "")
>> +	# Don't prepend empty strings to the path list
>> +	if extrapaths != "":
>> +		path = extrapaths.split(":") + path
>>  	# The ":" ensures we have an 'empty' override
>>  	overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
>>  	for p in path:
> 
> This is being a little picky but I find the above hard to read and can't
> we just do:
> 
> -	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
> +	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split(":")

Unfortunately not (this is what I tried initially), python split() has a
rather annoying "feature", see:
http://docs.python.org/library/string.html

Where it states:
"
The behavior of split on an empty string depends on the value of sep. If
sep is not specified, or specified as None, the result will be an empty
list. If sep is specified as any string, the result will be a list
containing one element which is an empty string.
"

ie:
"".split() -> []
"".split(":") -> [""]

So by changing from split() to split(":") we change the behavior of
split when operating on empty strings, requiring us to special case the
output. Rather obnoxious wouldn't you say?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


