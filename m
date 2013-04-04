Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UNhNc-0000FU-3X
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 12:26:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Apr 2013 03:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,407,1363158000"; d="scan'208";a="280687237"
Received: from adinu-vostro-460.rb.intel.com (HELO [10.237.105.45])
	([10.237.105.45])
	by azsmga001.ch.intel.com with ESMTP; 04 Apr 2013 03:09:37 -0700
Message-ID: <515D5192.1040502@intel.com>
Date: Thu, 04 Apr 2013 13:10:26 +0300
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1365063634-1766-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<10041023.xxs08iTcih@helios>
In-Reply-To: <10041023.xxs08iTcih@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] Add file information to package information window
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 10:26:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

Thanks again! preparing for a V4 right now.

Cheers,

Andrei

On 04/04/2013 01:02 PM, Paul Eggleton wrote:
> On Thursday 04 April 2013 11:20:34 Andrei Dinu wrote:
>> Removed the package files parsing routine from the
>> packageinfo.bbclass file and added it to the
>> package.bbclass file.
>>
>> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
>> ---
>>   meta/classes/package.bbclass     |   12 ++++++++++++
>>   meta/classes/packageinfo.bbclass |   20 --------------------
>>   2 files changed, 12 insertions(+), 20 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 3479947..e859a65 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1130,6 +1130,15 @@ python emit_pkgdata() {
>>       workdir = d.getVar('WORKDIR', True)
>>
>>       for pkg in packages.split():
>> +        items = {}
>> +        for files_list in pkgfiles[pkg]:
>> +             item_name = os.path.basename(files_list)
>> +             item_path = files_list.split(os.path.basename(files_list))[0]
> [:-1]
>
> There is os.path.dirname() for this as well; alternatively you could use
> os.path.split() to get both at the same time.
>
>> +             if item_path not in items:
>> +                 items[item_path] = []
>> +                 items[item_path].append(item_name)
>> +             else:
>> +                 items[item_path].append(item_name)
> This could be simplified to:
>               if item_path not in items:
>                   items[item_path] = []
>               items[item_path].append(item_name)
>
> Cheers,
> Paul
>



