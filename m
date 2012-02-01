Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Rscfm-00071B-9w
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 17:04:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q11Fuel1013151
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Feb 2012 07:56:40 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 1 Feb 2012 07:56:40 -0800
Message-ID: <4F2960AB.9060409@windriver.com>
Date: Wed, 1 Feb 2012 10:56:27 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1328107366-22541-1-git-send-email-bruce.ashfield@windriver.com>
	<1328107366-22541-2-git-send-email-bruce.ashfield@windriver.com>
	<1328111578.13744.91.camel@ted>
In-Reply-To: <1328111578.13744.91.camel@ted>
Cc: chris_larson@mentor.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/patch: return "other" elements found on the SRC_URI
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
X-List-Received-Date: Wed, 01 Feb 2012 16:04:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-01 10:52 AM, Richard Purdie wrote:
> On Wed, 2012-02-01 at 09:42 -0500, Bruce Ashfield wrote:
>> commit:
>>
>>    patch.bbclass: abstract out logic that determines patches to apply
>>
>> gives the ability for other clases to emit series files for use outside
>> of a build system, or even within the build system. There are sometimes
>> elements on the SRC_URI that while not directly applicable to patching,
>> can be related to patching the package. For example, the yocto kernel
>> class would like to know about these 'other' items on the SRC_URI to
>> locate out of tree kernel features.
>>
>> This change keeps the default the same, but adds the ability to query
>> for anything 'non-patch' that may be on the SRC_URI. Additional filtering
>> is left up to the caller of the routine.
>>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>>   meta/classes/patch.bbclass |   11 +++++++++--
>>   1 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
>> index 1ea4bc5..d664215 100644
>> --- a/meta/classes/patch.bbclass
>> +++ b/meta/classes/patch.bbclass
>> @@ -7,13 +7,17 @@ PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
>>
>>   inherit terminal
>>
>> -def src_patches(d):
>> +def src_patches(d, type = "patches"):
>
> Knowing "magic" strings to pass to functions isn't very intuitive. You
> could do:

I disliked it as well, but was stumped for something better at the
time :)

>
> +def src_patches(d, all = False):
>
>
>>   	workdir = d.getVar('WORKDIR', True)
>>   	fetch = bb.fetch2.Fetch([], d)
>>   	patches = []
>> +	others = []
>>   	for url in fetch.urls:
>>   		local = patch_path(url, fetch, workdir)
>>   		if not local:
>> +			if type == "others":
>> +				local = fetch.localpath(url)
>> +				others.append(local)
>>   			continue
>>
>>   		urldata = fetch.ud[url]
>> @@ -43,7 +47,10 @@ def src_patches(d):
>>   		localurl = bb.encodeurl(('file', '', local, '', '', patchparm))
>>   		patches.append(localurl)
>>
>> -	return patches
>> +	if type == "others":
>> +		return others
>> +	else:
>> +		return patches
>
> if all:
>      return others
> return patches
>
> You might want to call it sources instead of others too.

Yep. Works for me. I'll do those fixups here.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>



