Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5E878543
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 01:51:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v711p704008707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Jul 2017 18:51:07 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 18:51:07 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<81100738981ef9b5640b16f804f5f89a76ec2a0c.1501494496.git.liezhi.yang@windriver.com>
	<5041187.DqVND4ltU0@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <326c5e49-67e5-a87f-2f2f-07d41ea423f5@windriver.com>
Date: Tue, 1 Aug 2017 09:50:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5041187.DqVND4ltU0@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/10] buildhistory.bbclass: add ptest_log
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
X-List-Received-Date: Tue, 01 Aug 2017 01:51:07 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/31/2017 09:30 PM, Paul Eggleton wrote:
> Hi Robert,
>
> A few minor comments below.
>
> On Monday, 31 July 2017 11:50:09 AM CEST Robert Yang wrote:
>> The ptest log will be saved to buildhistory/ptest_log, we can easily get
>> the regression result between builds by:
>> $ git show HEAD ptest_log/pass.fail.skip.*
>>
>> [YOCTO #11547]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/classes/buildhistory.bbclass | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/
> buildhistory.bbclass
>> index a3e4c7a734a..26430a63d31 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -912,3 +912,31 @@ def write_latest_srcrev(d, pkghistdir):
>>      else:
>>          if os.path.exists(srcrevfile):
>>              os.remove(srcrevfile)
>> +
>> +do_testimage[postfuncs] += "write_ptest_result"
>> +do_testimage[vardepsexclude] += "write_ptest_result"
>> +
>> +python write_ptest_result() {
>> +    write_latest_ptest_result(d, d.getVar('BUILDHISTORY_DIR'))
>> +}
>> +
>> +def write_latest_ptest_result(d, histdir):
>> +    import glob
>> +    import subprocess
>> +    test_log_dir = d.getVar('TEST_LOG_DIR')
>> +    input_ptest_log = os.path.join(test_log_dir, 'ptest_log')
>> +    output_ptest_log = os.path.join(histdir, 'ptest_log')
>
> Would it be reasonable for this to just be "ptest"? To ask the question a
> different way, would you expect to save other types of ptest information into
> buildhistory, or is this likely to be it?

I'm not sure atm, so use "ptest" sounds reasonable. I will update it.

>
>> +    if os.path.exists(input_ptest_log):
>> +        # Lock it avoid race issue
>> +        lock = bb.utils.lockfile(output_ptest_log + "/ptest_log.lock")
>> +        bb.utils.mkdirhier(output_ptest_log)
>> +        oe.path.copytree(input_ptest_log, output_ptest_log)
>> +        # Sort test result
>> +        for result in glob.glob('%s/pass.fail.*' % output_ptest_log):
>> +            bb.debug(1, 'Processing %s' % result)
>> +            cmd = "sort %s -o %s" % (result, result)
>> +            bb.debug(1, 'Running %s' % cmd)
>> +            ret = subprocess.call(cmd, shell=True)
>
> As a matter of good practice and since it's easy to do here I'd suggest not
> using shell=True and passing the command as a list instead, that way there
> can't be any issues with spaces or other shell interpretations.

Thanks, I will update it.

>
>> +            if ret != 0:
>> +                bb.error('Failed to run %s!' % cmd)
>> +        bb.utils.unlockfile(lock)
>
> Shouldn't you be using try...finally here to ensure the lockfile gets unlocked
> in the case of exceptions?

Yes, good idea.

// Robert

>
> Cheers,
> Paul
>
>

