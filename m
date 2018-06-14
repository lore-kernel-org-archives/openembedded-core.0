Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C492576017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 09:29:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5E9T07t009289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jun 2018 02:29:00 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 14 Jun 2018 02:28:59 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1528951773.git.Qi.Chen@windriver.com>
	<0273521858960b5e6bc63bd83284115dc97a566f.1528951773.git.Qi.Chen@windriver.com>
	<CANNYZj_Lj=bieGAFpzSU+U0TWKJyfiyL5r8OtgC+brYGVFn=fA@mail.gmail.com>
	<edf223f6-4bff-c460-1247-5289d9966157@windriver.com>
	<CANNYZj-tx3svh94xS8ZYoMKQqRV=+N2e_nv3Ag9_5A22WtvSzA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <05022c74-c917-09d1-32ca-951e52fa2612@windriver.com>
Date: Thu, 14 Jun 2018 17:31:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-tx3svh94xS8ZYoMKQqRV=+N2e_nv3Ag9_5A22WtvSzA@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/runtime/cases/rpm.py: change to use base-passwd-doc
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
X-List-Received-Date: Thu, 14 Jun 2018 09:29:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

In short, it's about setUpClass.
See details below.

In fact, if rpm is not installed, these test cases have been skipped.

See codes below from rpm.py:

     @OETestID(960)
     @OEHasPackage(['rpm'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_rpm_help(self):
         status, output = self.target.run('rpm --help')
         msg = 'status and output: %s and %s' % (status, output)
         self.assertEqual(status, 0, msg=msg)

     @OETestID(192)
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_help'])
     def test_rpm_install(self):
         status, output = self.target.run('rpm -ivh 
/tmp/base-passwd-doc.rpm')
         msg = 'Failed to install base-passwd-doc package: %s' % output
         self.assertEqual(status, 0, msg=msg)

You can see that if 'rpm' is not installed on target, the test cases are 
skipped.
The '@skipIfNotFeature' decorator you suggested will achieve the same 
effect that the above logic has already achieved.

The key problem here is that the copying action happens in setUpClass().
Even if the testcase is determined to be skipped via the decorator 
logic, this setUpClass function will still be called.

For the current OEQA's runtime testing design, we need to ensure 
setUpClass do not generate 'error'.

For the problem I described in this email, the simplest approach I see 
here is to change rpm-doc to base-passwd-doc.
Another apporach is to check whether 'rpm' is installed in setUpClass() 
function and if not skip. But this is more complex and kind of weird as 
we've checked it via @HasPackage and the test cases dependencies are 
correct.

You can do a quick test with the following configuration to reproduce 
the problem.
local.conf:
IMAGE_INSTALL_append = " openssh"
TEST_IMAGE = "1"
TEST_SUITES = "auto"

bitbake core-image-minimal

Best Regards,
Chen Qi


On 06/14/2018 04:55 PM, Alexander Kanavin wrote:
> Hello Chen,
>
> But the test still attempts to run rpm on the target. I can't
> understand how target rpm can be available on the image, but at the
> same time target rpm-doc package is not available in rpm deploy dir.
>
> The issue is probably that the test should simply be skipped (in the
> same way that dnf testcases are skipped - please refer to them), if
> there is no package management on target? Like this:
>
>      @skipIfNotFeature('package-management',
>                        'Test requires package-management to be in
> IMAGE_FEATURES')
>
>
> Alex
>
> 2018-06-14 10:29 GMT+03:00 ChenQi <Qi.Chen@windriver.com>:
>> On 06/14/2018 02:57 PM, Alexander Kanavin wrote:
>>> 2018-06-14 7:52 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
>>>> The test cases assume that rpm-doc is built out, as it says it its
>>>> comment. This is not always true. And it sometimes results in
>>>> following error.
>>>>
>>>>     |     cls.tc.target.copyTo(test_file, dst)
>>>>     | UnboundLocalError: local variable 'test_file' referenced before
>>>> assignment
>>> Wait, you need to explain this further. What is the situation when it
>>> isn't true?
>>>
>>> Alex
>>>
>> Hi Alex,
>>
>> For any image that does not have rpm installed, rpm package is not likely to
>> be built out.
>> Having PACKAGE_CLASSES set to "package_rpm" will only ensure rpm-native to
>> be built out.
>>
>> Best Regards,
>> Chen Qi



