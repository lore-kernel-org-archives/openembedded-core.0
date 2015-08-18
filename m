Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1943975E7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 15:18:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Aug 2015 08:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,702,1432623600"; d="scan'208";a="544129379"
Received: from unknown (HELO [10.219.16.37]) ([10.219.16.37])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2015 08:18:12 -0700
Message-ID: <55D34CB3.8060505@linux.intel.com>
Date: Tue, 18 Aug 2015 10:18:11 -0500
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1439815302-12812-1-git-send-email-mariano.lopez@linux.intel.com>
	<3297628.6dWWSbZelC@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3297628.6dWWSbZelC@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] testimage: Run commands in target and host when test fails
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
X-List-Received-Date: Tue, 18 Aug 2015 15:18:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

On 08/18/2015 03:33 AM, Paul Eggleton wrote:
> Hi Mariano,
>
> On Monday 17 August 2015 12:41:42 mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> This patch modify three files altought two of them
>> are minimal modifications:
>>
>> testimage.bbclass:
>>      Create new vars for easy modification of the dump
>> directory and commands to be run on host and target
>> when a test fails
>>      TESTIMAGE_DUMP_DIR: Directory to save the dumps
>>      TESTIMAGE_DUMP_TRG: Commands to run on target
>>      TESTIMAGE_DUMP_HST: Commands to run on host
> Can we please use full names (i.e. "...HOST" and "...TARGET")? We're not short
> of space here ;)

Sure, no problem

>   
>> targetcontrol.py:
>>      Extract vars from the datastore for later use
>>
>> oetest.py:
>>      - Allow to use the vars defined in testimage class
>>      - Now able to run commands in the host and dump the
>>        results
>>      - Fix an issue with the condition where to run the
>>        dump commands (Before it run the commands every
>>        test after a failure, now it runs the commands only
>>        in tests that failed)
>>      - Fix the output to stdout
>>
>> [YOCTO #8118]
>>
>> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>> ---
>>   meta/classes/testimage.bbclass |  9 +++++++++
>>   meta/lib/oeqa/oetest.py        | 42
>> +++++++++++++++++++++++++++--------------- meta/lib/oeqa/targetcontrol.py |
>>   3 +++
>>   3 files changed, 39 insertions(+), 15 deletions(-)
>>
>> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
>> index 140babe..1580a4e 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -56,6 +56,15 @@ TESTIMAGEDEPENDS_qemuall =
>> "qemu-native:do_populate_sysroot qemu-helper-native:d TESTIMAGELOCK =
>> "${TMPDIR}/testimage.lock"
>>   TESTIMAGELOCK_qemuall = ""
>>
>> +TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests/"
>> +
>> +python () {
>> +    target_cmds = ["top -bn1", "ps", "free", "df", "_ping", "dmesg",
>> "netstat -an", "ip address", "_logs"] +    host_cmds = ["top -bn1", "ps",
>> "free", "df", "memstat", "dmesg", "netstat -an"] +
>> d.setVar("TESTIMAGE_DUMP_TRG", target_cmds)
>> +    d.setVar("TESTIMAGE_DUMP_HST", host_cmds)
>> +}
> This is isn't how I would recommend doing this. What I suggested earlier when
> we talked about this was:
>
> testimage_dump_target() {
> 	top -bn1
> 	ps
> 	free
> 	df
> 	...
> }
>
> Then you'd just d.getVar('testimage_dump_target', True), and treat the
> contents as a complete shell script to be run - i.e. write it to a file with
> #!/bin/sh as a prefix and run it. As a bonus, the value can be overridden or
> appended to from elsewhere. (This is similar to how we deal with
> pkg_postinst_<packagename> for postinstall scripts.)

Implement this for the host wouldn't be a problem, it gets
interesting for the target.These commands would be run from
  the serial console, when the network fails, so it would be
difficult to run as a shell script. And also would be difficult
to install the scripts on the image because testimage would
run after do_rootfs takes place.

What would be the best approach for the target case?

>> +        self.dump_trg = d.getVar("TESTIMAGE_DUMP_TRG", False)
>> +        self.dump_hst = d.getVar("TESTIMAGE_DUMP_HST", False)
>> +        self.dump_dir = d.getVar("TESTIMAGE_DUMP_DIR", False)
> As a general note - for this kind of thing, you need to be specifying True not
> False for the expansion parameter - the value may well contain references or
> other expressions (such as ${TMPDIR}) that need expanding. In fact, it's
> relatively uncommon for False to be what you want - most of the time the value
> should be expanded if you're about to use it for something.

You are right, I will change that.

>
> Cheers,
> Paul
>

-- 
Mariano Lopez

