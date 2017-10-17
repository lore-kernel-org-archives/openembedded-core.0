Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3984577E87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:02:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Oct 2017 09:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,391,1503385200"; d="scan'208";a="1206788345"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.27.30])
	by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2017 09:02:07 -0700
To: openembedded-core@lists.openembedded.org
References: <20171017150506.17803-1-joshua.g.lock@intel.com>
	<20171017110002.b1a3df797fdbf5767a5e6f57@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <2eb0d895-21c0-e1ef-f5ef-f12ed014ac6c@linux.intel.com>
Date: Tue, 17 Oct 2017 17:02:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017110002.b1a3df797fdbf5767a5e6f57@linux.intel.com>
Subject: Re: [PATCH] devtool: ensure temp directory is created
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
X-List-Received-Date: Tue, 17 Oct 2017 16:02:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 17/10/17 17:00, Leonardo Sandoval wrote:
> On Tue, 17 Oct 2017 16:05:06 +0100
> Joshua Lock <joshua.g.lock@intel.com> wrote:
> 
> I would be nice that we keep the bugzilla ticket open (and included the tag on this patch) and investigate further  this issue. Seems like in some distros, the temfile.mkdtemp is not doing what it is supposed thus we have this workaround (perhaps strace may lead the real reason)

Agreed. I meant to write more before sending this patch (and copy Paul). 
  It's clearly not the right fix as the tempfile.mkdtemp() call should 
create the directory, but I wanted to share my simple findings (that the 
directory doesn't appear to be reliably created by the mkdtemp call, as 
expected).

FWIW the failure has been observed on multiple host distros (Ubuntu 
16.04, Fedora 26, Tumbleweed) and I could replicate it very easily on my 
Fedora 26 host with an use of devtool modify -x.

Joshua

> 
>> We often see nightly-oe-selftest on the Yocto Project Autobuilder fail in
>> test_devtool_modify_native with:
>>
>>       'devtool modify apt-native -x /tmp/devtoolqahlptvsfq/apt-native' returned
>>       non-zero exit status 1
>>
>> and the following traceback:
>>
>> Traceback (most recent call last):
>>    File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/scripts/devtool", line 331, in <module>
>>      ret = main()
>>    File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/scripts/devtool", line 318, in main
>>      ret = args.func(args, config, basepath, workspace)
>>    File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/scripts/lib/devtool/standard.py", line 714, in modify
>>      initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
>>    File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/scripts/lib/devtool/standard.py", line 545, in _extract_source
>>      with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
>>
>> Ensure the tempdir is created before we try and create any files there.
>>
>> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>> ---
>>   scripts/lib/devtool/standard.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
>> index beea0d4c274..38197251b42 100644
>> --- a/scripts/lib/devtool/standard.py
>> +++ b/scripts/lib/devtool/standard.py
>> @@ -494,6 +494,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
>>       tempbasedir = d.getVar('WORKDIR')
>>       bb.utils.mkdirhier(tempbasedir)
>>       tempdir = tempfile.mkdtemp(prefix='devtooltmp-', dir=tempbasedir)
>> +    bb.utils.mkdirhier(tempdir)
>>       try:
>>           tinfoil.logger.setLevel(logging.WARNING)
>>   
>> -- 
>> 2.13.6
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

