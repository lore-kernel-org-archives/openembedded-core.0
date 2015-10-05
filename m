Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2D64465CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 14:16:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Oct 2015 07:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,639,1437462000"; d="scan'208";a="819734498"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.64])
	([10.219.16.64])
	by fmsmga002.fm.intel.com with ESMTP; 05 Oct 2015 07:15:59 -0700
Message-ID: <56128621.1000504@linux.intel.com>
Date: Mon, 05 Oct 2015 09:16:01 -0500
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1443517391.git.mariano.lopez@linux.intel.com>
	<764c3c1649362c7376ac70baecb6da1c9ddb6a6e.1443517391.git.mariano.lopez@linux.intel.com>
	<9A33E145-4BD6-4AD3-A3AD-ED1DBDE8E17A@gmail.com>
In-Reply-To: <9A33E145-4BD6-4AD3-A3AD-ED1DBDE8E17A@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] testimage: Added IO commands to dumps
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
X-List-Received-Date: Mon, 05 Oct 2015 14:16:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/29/2015 12:24 PM, Khem Raj wrote:
>> On Sep 29, 2015, at 2:05 AM, mariano.lopez@linux.intel.com wrote:
>>
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> This change just add two more commands to
>> the host dumps to get more information
>> related to the IO.
>>
>> [YOCTO #8412]
>>
>> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>> ---
>> meta/classes/testimage.bbclass | 2 ++
>> meta/lib/oeqa/utils/dump.py    | 2 ++
>> 2 files changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
>> index 2efab29..1f21c9e 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -80,11 +80,13 @@ testimage_dump_target () {
>>
>> testimage_dump_host () {
>>      top -bn1
>> +    iostat -x -z -N -d -p ALL 20 2
> Somewhere it needs to documented that build system now needs to have sysstat package installed.

Documentation has been updated:

http://www.yoctoproject.org/docs/2.0/dev-manual/dev-manual.html#qemu-image-enabling-tests.


>
>>      ps -ef
>>      free
>>      df
>>      memstat
>>      dmesg
>> +    ip -s link
>
> and iproute2
>
>
>>      netstat -an
>> }
>>
>> diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
>> index 3f31e20..63a591d 100644
>> --- a/meta/lib/oeqa/utils/dump.py
>> +++ b/meta/lib/oeqa/utils/dump.py
>> @@ -20,11 +20,13 @@ class BaseDumper(object):
>>          # to set some defaults.
>>          self.parent_dir = parent_dir or "/tmp/oe-saved-tests"
>>          dft_cmds = """  top -bn1
>> +                        iostat -x -z -N -d -p ALL 20 2
>>                          ps -ef
>>                          free
>>                          df
>>                          memstat
>>                          dmesg
>> +                        ip -s link
>>                          netstat -an"""
>>          if not cmds:
>>              cmds = dft_cmds
>> --
>> 1.8.4.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

