Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61FEA6BF42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 10:38:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBKAc1Ox001525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Dec 2018 02:38:01 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 20 Dec 2018 02:38:00 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1545291716.git.liezhi.yang@windriver.com>
	<29e6785a8b38d49961aa7f1138d664336052dca8.1545291716.git.liezhi.yang@windriver.com>
	<53c222052c0da6a7db056bfa1318371c8b7db2dc.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <50ccbdb3-12b8-e381-5931-b52b5b5efdf5@windriver.com>
Date: Thu, 20 Dec 2018 18:43:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <53c222052c0da6a7db056bfa1318371c8b7db2dc.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] oeqa/concurrencytest: fix for locating meta-selftest
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
X-List-Received-Date: Thu, 20 Dec 2018 10:38:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/20/18 6:14 PM, Richard Purdie wrote:
> On Wed, 2018-12-19 at 23:43 -0800, Robert Yang wrote:
>> The previous code assumed builddir and meta-selftest are in the same
>> dir, but this isn't always true, builddir can be anywhere, use
>> bitbake to locate meta-selftest can fix the problem.
>>
>> The bb.fatal() doesn't work (no error message is print), so I use
>> raise Exception to print error messages.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/lib/oeqa/core/utils/concurrencytest.py | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py
>> b/meta/lib/oeqa/core/utils/concurrencytest.py
>> index f050289..ef1698c 100644
>> --- a/meta/lib/oeqa/core/utils/concurrencytest.py
>> +++ b/meta/lib/oeqa/core/utils/concurrencytest.py
>> @@ -139,6 +139,20 @@ def removebuilddir(d):
>>           delay = delay - 1
>>       bb.utils.prunedir(d)
>>   
>> +def get_selftestdir():
>> +    """
>> +    Use 'which bitbake' to locate meta-selftest dir
>> +    """
>> +    cmd = 'which bitbake'
>> +    retval, bitbake_path = subprocess.getstatusoutput(cmd)
>> +    if retval != 0:
>> +        raise Exception('Failed to run %s' % cmd)
>> +    topdir = os.path.realpath('%s/../../' %
>> os.path.dirname(bitbake_path))
>> +    selftestdir = os.path.join(topdir, 'meta-selftest')
>> +    if not os.path.exists(selftestdir):
>> +        raise Exception('Failed to run %s' % cmd)
>> +    return selftestdir
>> +
>>   def fork_for_tests(concurrency_num, suite):
>>       result = []
>>       test_blocks = partition_tests(suite, concurrency_num)
>> @@ -166,7 +180,7 @@ def fork_for_tests(concurrency_num, suite):
>>                   if 'BUILDDIR' in os.environ:
>>                       builddir = os.environ['BUILDDIR']
>>                       newbuilddir = builddir + "-st-" + str(ourpid)
>> -                    selftestdir = os.path.abspath(builddir +
>> "/../meta-selftest")
>> +                    selftestdir = get_selftestdir()
>>                       newselftestdir = newbuilddir + "/meta-selftest"
> 
> Sorry, but this change just swaps one problem for another. meta-
> selftest is part of OE-Core so its position relative to bitbake isn't
> fixed.

I always thought that bitbake must be in oe-core, otherwise it didn't work,
but seemed that it was incorrect?

> 
> How about we use
> 
> from oeqa.utils.commands import get_test_layer

Thanks, that is much better, Updated in the repo:

commit 9d03cf9e726232a9df544435cadfe520020ef631
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Dec 18 18:38:00 2018 -0800

     oeqa/concurrencytest: fix for locating meta-selftest

     The previous code assumed builddir and meta-selftest are in the same dir, but
     this isn't always true, builddir can be anywhere, use get_test_layer() to
     locate meta-selftest can fix the problem.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py 
b/meta/lib/oeqa/core/utils/concurrencytest.py
index f050289..6c403ac 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -25,6 +25,7 @@ from itertools import cycle
  from subunit import ProtocolTestCase, TestProtocolClient
  from subunit.test_results import AutoTimingTestResultDecorator
  from testtools import ThreadsafeForwardingResult, iterate_tests
+from oeqa.utils.commands import get_test_layer

  import bb.utils
  import oe.path
@@ -166,7 +167,7 @@ def fork_for_tests(concurrency_num, suite):
                  if 'BUILDDIR' in os.environ:
                      builddir = os.environ['BUILDDIR']
                      newbuilddir = builddir + "-st-" + str(ourpid)
-                    selftestdir = os.path.abspath(builddir + "/../meta-selftest")
+                    selftestdir = get_test_layer()
                      newselftestdir = newbuilddir + "/meta-selftest"

                      bb.utils.mkdirhier(newbuilddir)

// Robert

> 
> ?
> 
> Cheers,
> 
> Richard
> 
> 

