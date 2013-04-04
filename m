Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UNfgp-0004pv-1V
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 10:38:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2013 01:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,405,1363158000"; d="scan'208";a="289208572"
Received: from adinu-vostro-460.rb.intel.com (HELO [10.237.105.45])
	([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2013 01:21:20 -0700
Message-ID: <515D3830.1030306@intel.com>
Date: Thu, 04 Apr 2013 11:22:08 +0300
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1365003047-10522-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<1912854.rCCW1yQxSL@helios>
In-Reply-To: <1912854.rCCW1yQxSL@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] Add file information to package information window
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
X-List-Received-Date: Thu, 04 Apr 2013 08:38:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

Thank you for your review!

I just submitted a V3 with the changes you suggested.

Thanks,

Andrei

On 04/03/2013 07:18 PM, Paul Eggleton wrote:
> Hi Andrei,
>
> On Wednesday 03 April 2013 18:30:47 Andrei Dinu wrote:
>> Removed the package files parsing routine from the
>> packageinfo.bbclass file and added it to the
>> package.bbclass file.
>>
>> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
>> ---
>>   meta/classes/package.bbclass     |   10 ++++++++++
>>   meta/classes/packageinfo.bbclass |   20 --------------------
>>   2 files changed, 10 insertions(+), 20 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 3479947..cafe339 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1130,6 +1130,13 @@ python emit_pkgdata() {
>>       workdir = d.getVar('WORKDIR', True)
>>
>>       for pkg in packages.split():
>> +        items = {}
>> +        for files_list in pkgfiles[pkg]:
>> +             if
>> files_list.split(files_list.split('/')[len(files_list.split('/'))-1])[0][:-
>> 1] not in items: +
>> items[files_list.split(files_list.split('/')[len(files_list.split('/'))-1])
>> [0][:-1]] = [] +
>> items[files_list.split(files_list.split('/')[len(files_list.split('/'))-1])
>> [0][:-1]].append(files_list.split('/')[len(files_list.split('/'))-1]) +
>>         else:
>> +
>> items[files_list.split(files_list.split('/')[len(files_list.split('/'))-1])
>> [0][:-1]].append(files_list.split('/')[len(files_list.split('/'))-1])
>> subdata_file = pkgdatadir + "/runtime/%s" % pkg
> I'd recommend the use of os.path.basename() here; additionally rather than
> repeating the same call several times (possibly expensive within a loop),
> assign the return value to a variable and then use that instead.
>
> Cheers,
> Paul
>



