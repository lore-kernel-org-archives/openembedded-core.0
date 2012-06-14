Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sf8z7-0003xQ-3F
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 14:17:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2012 05:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156317845"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 14 Jun 2012 05:06:30 -0700
Message-ID: <4FD9D3C5.8030309@intel.com>
Date: Thu, 14 Jun 2012 15:06:29 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1339514272-7427-1-git-send-email-laurentiu.palcu@intel.com>
	<1339514272-7427-2-git-send-email-laurentiu.palcu@intel.com>
	<4FD96838.20508@linux.intel.com>
In-Reply-To: <4FD96838.20508@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] sanity.bbclass: warn the user if BBPATH contains wrong entries
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
X-List-Received-Date: Thu, 14 Jun 2012 12:17:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/14/2012 07:27 AM, Saul Wold wrote:
> On 06/12/2012 08:17 AM, Laurentiu Palcu wrote:
>> If BBPATH references the working directory, the user is warned and asked
>> to fix the problem.
>>
>> [Yocto #1465]
>>
>> Signed-off-by: Laurentiu Palcu<laurentiu.palcu@intel.com>
>> ---
>>   meta/classes/sanity.bbclass |   11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index f79fc3f..6ed1e6f 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -387,6 +387,17 @@ def check_sanity(sanity_data):
>>       if "." in paths or "" in paths:
>>           messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
>>
>> +    bbpaths = sanity_data.getVar('BBPATH', True).split(":")
>> +    if "." in bbpaths or "" in bbpaths:
>> +        # TODO: change the following message to fatal when all BBPATH issues
>> +        # are fixed
>> +        bb.warn("BBPATH references the current directory, either through "    \
>> +                "an empty entry, or a '.'.\n\t This is unsafe and means your "\
>> +                "layer configuration is adding empty elements to BBPATH.\n\t "\
>> +                "Please check your layer.conf files and other BBPATH "        \
>> +                "settings to remove the current working directory "           \
>> +                "references.");
>> +
> This change seems to trigger in the default case of the standard 
> bblayers.conf file included in meta-yocto.  Is there a fix for this?  Do 
> we need to uprev the bblayers file?
There's no fix yet. I will take a look and come with a fix. That's the
reason I avoided throwing a fatal error and print just a warning. So we
have time to fix these existing BBPATH issues without affecting everybody.

Thanks,
Laurentiu

> 
> Sau!
> 
>>       if sanity_data.getVar('TARGET_ARCH', True) == "arm":
>>           # This path is no longer user-readable in modern (very recent) Linux
>>           try:


