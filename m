Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1699B77D0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 19:41:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2017 12:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152437649"
Received: from unknown (HELO [10.219.128.142]) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 12:41:12 -0700
To: Patrick Ohly <patrick.ohly@intel.com>, Ross Burton <ross.burton@intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<27730e7982a21e192eaba5ab975ca8afd4105e0f.1499803885.git.anibal.limon@linux.intel.com>
	<1500025974.21921.38.camel@intel.com>
	<4317db53-7822-9b8a-c614-b925ee05bfce@linux.intel.com>
	<1500318869.5689.7.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5e179f7e-bf5a-0dd2-b569-7a118ec80c63@linux.intel.com>
Date: Mon, 17 Jul 2017 14:41:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1500318869.5689.7.camel@intel.com>
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/30] oeqa/core/loader: Switch method definition for _make_failed_test
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
X-List-Received-Date: Mon, 17 Jul 2017 19:41:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/17/2017 02:14 PM, Patrick Ohly wrote:
> On Fri, 2017-07-14 at 10:27 -0500, Aníbal Limón wrote:
>>
>> On 07/14/2017 04:52 AM, Patrick Ohly wrote:
>>> On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
>>>> This was a mistake of me to define wrong what methods needs
>>>> to be defined by certain python version.
>>>>
>>>> See rev d8380d098a290510b442a7abd2dd5a50cabf5844.
>>>
>>> This will fix this error that we see in Refkit with current OE-core
>>> master, right?
>>>
>>> 00:07:10.313 Traceback (most recent call last):
>>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/scripts/oe-selftest", line 70, in <module>
>>> 00:07:10.313     ret = main()
>>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/scripts/oe-selftest", line 57, in main
>>> 00:07:10.313     results = args.func(logger, args)
>>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/selftest/context.py", line 215, in run
>>> 00:07:10.313     rc = self._internal_run(logger, args)
>>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/selftest/context.py", line 176, in _internal_run
>>> 00:07:10.313     self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
>>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/core/context.py", line 51, in loadTests
>>> 00:07:10.313     self.suites = self.loader.discover()
>>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/core/loader.py", line 286, in discover
>>> 00:07:10.313     pattern='*.py', top_level_dir=path)
>>> 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 275, in discover
>>> 00:07:10.313     tests = list(self._find_tests(start_dir, pattern))
>>> 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 327, in _find_tests
>>> 00:07:10.313     yield _make_failed_import_test(name, self.suiteClass)
>>> 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 39, in _make_failed_import_test
>>> 00:07:10.313     return _make_failed_test(name, ImportError(message), suiteClass)
>>> 00:07:10.313 TypeError: _make_failed_test() missing 1 required positional argument: 'suiteClass'
>>>
>>> Can this particular patch please be merged into OE-core master
>>> independently from the patch series? It's not really related to it
>>> anyway.
>>
>> Yes this will fix that error, showing the error into the case.
> 
> The fix doesn't work for me:
> 
>   File "/usr/lib/python3.5/unittest/loader.py", line 41, in _make_failed_import_test
>     return _make_failed_test(name, ImportError(message), suiteClass, message)
> TypeError: _make_failed_test() takes 3 positional arguments but 4 were given
> 
> You need to mimic the exact same signature as in Python itself, and
> Python 3.5 seems to be different again:
> 
> /usr/lib/python3.5/unittest/loader.py:def _make_failed_test(methodname, exception, suiteClass, message):

This is strange, i tested on a python 3.5.x and python 3.4.3 versions.
I don't know why isn't working on your machine.

Cheers,
Anibal

> 
> You can probably get away with
> 
> if sys.version_info >= (3,4,4):
>     def _make_failed_test(classname, exception, suiteClass, message=None):
> 
> The actual problem in refkit is that we are hitting this
> _make_failed_test() at all. After fixing meta/lib/oeqa/core/loader.py, I
> am getting a more useful exception and know what to do about the actual
> problem.
> 

