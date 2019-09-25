Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5577C6C129
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:28:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P2SuUp029901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 19:28:57 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 24 Sep 2019 19:28:56 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1569312737.git.liezhi.yang@windriver.com>
	<ba0e10441f900a47a504fbbc28579d5b2f6fc841.1569312737.git.liezhi.yang@windriver.com>
	<87234437-88b4-d70a-6bb4-41cc152278fb@windriver.com>
	<566509fb-9b85-d83d-c534-e841e9c5da5b@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6fe6e031-13fe-de92-2b29-2b20db2a2374@windriver.com>
Date: Tue, 24 Sep 2019 22:28:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <566509fb-9b85-d83d-c534-e841e9c5da5b@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH 1/1] cases/bbtests.py: test_bitbake_g(): Check core-image-minimal itself
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
X-List-Received-Date: Wed, 25 Sep 2019 02:28:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 9/24/19 9:41 PM, Robert Yang wrote:
> Hi Randy,
> 
> On 9/25/19 4:46 AM, Randy MacLeod wrote:
>> On 9/24/19 4:15 AM, Robert Yang wrote:
>>> It checked whether busybox is in pn-buildlist and task-depends.dot 
>>> after run
>>> "bitbake -g core-image-minimal", but busybox is not a must for
>>> core-image-minimal, 
>>
>> You should explain why busybox is not a must since
>> usually busybox is the key package in c-i-m.
>>
>> We have some images that deliberately exclude busybox and
>> I think this was found by using:
>> echo "BB_NO_NETWORK = \"0\"" >> conf/local.conf
>> echo "PNWHITELIST_LAYERS_remove = \"selftest\"" >> conf/local.conf
>> echo "SANITY_TESTED_DISTROS = \"\"" >> conf/local.conf
>> echo "DISTRO = \"wrlinux-graphics\"" >> conf/local.conf
>> echo "VIRTUAL-RUNTIME_no-busybox_forcevariable = \"\"" >> conf/local.conf
>> echo "PNWHITELIST_meta-layer0 += 'layerappendtest'" >> conf/local.conf
>>
>> so mention that in general and VIRTUAL-RUNTIME_no-busybox_forcevariable
>> specifically.
> 
> Thanks for the explanation, I think that the maintainers know busybox
> is not a must in oe-core, not matter for core-image-minimal or sato,
> so I didn't add very detailed explanations.

commit logs are for maintainers, developers and users all
of varying ranges of familiarity with oe-core so
it's better to over-explain, without going over the top, IMO.

> 
>>
>>> so the case may fail when busybox is not present, this case
>>> is used for checking "bitbake -g", so check core-image-minimal itself 
>>> is more
>>> reliable.
>>
>> It's true that busybox may not be present but we want to
>> test that some package is in the image, not just that the
>> task-depends.dot file exists and mentions c-i-m.
>> How about searching for 'base-files' ?
> 
> The base-files is my first thought, but it's not a must either, for testing
> "bitbake -g recipe", I think that check the recipe itself is more 
> reliable than
> others.

If you had explained that in the commit log,
I wouldn't have replied, eh? ;-)

Sure base-files might not be part of the image but I
haven't seen an image that has done that. Your check will
always work so it really depends on the intent of the original
check.

../Randy

> 
> // Robert
> 
>>
>> ../Randy
>>
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/lib/oeqa/selftest/cases/bbtests.py | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py 
>>> b/meta/lib/oeqa/selftest/cases/bbtests.py
>>> index 8e59baf..4103396 100644
>>> --- a/meta/lib/oeqa/selftest/cases/bbtests.py
>>> +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
>>> @@ -118,11 +118,12 @@ class BitbakeTests(OESelftestTestCase):
>>>               self.assertIn(task, result.output, msg="Couldn't find 
>>> %s task.")
>>>       def test_bitbake_g(self):
>>> -        result = bitbake('-g core-image-minimal')
>>> +        recipe = 'core-image-minimal'
>>> +        result = bitbake('-g %s' % recipe)
>>>           for f in ['pn-buildlist', 'task-depends.dot']:
>>>               self.addCleanup(os.remove, f)
>>>           self.assertTrue('Task dependencies saved to 
>>> \'task-depends.dot\'' in result.output, msg = "No task dependency 
>>> \"task-depends.dot\" file was generated for the given task target. 
>>> bitbake output: %s" % result.output)
>>> -        self.assertTrue('busybox' in 
>>> ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')), 
>>> msg = "No \"busybox\" dependency found in task-depends.dot file.")
>>> +        self.assertTrue(recipe in 
>>> ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')), 
>>> msg = "No \"%s\" dependency found in task-depends.dot file." % recipe)
>>>       def test_image_manifest(self):
>>>           bitbake('core-image-minimal')
>>>
>>
>>


-- 
# Randy MacLeod
# Wind River Linux

