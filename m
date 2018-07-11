Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1D875534
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:09:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6BA985v001006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Jul 2018 03:09:08 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 11 Jul 2018 03:09:07 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1531287598.git.Qi.Chen@windriver.com>
	<b1371780446f2631111d6df7952720d721584fd3.1531287598.git.Qi.Chen@windriver.com>
	<CAJTo0LYEjefNuJzNfwn-8crekwcEK_04SsG=9oEaxXMwd2zyEw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ced3a2dd-da13-edf1-7d10-8708a2f50308@windriver.com>
Date: Wed, 11 Jul 2018 18:12:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYEjefNuJzNfwn-8crekwcEK_04SsG=9oEaxXMwd2zyEw@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] oeqa/runtime/cases/rpm.py: workaround race condition
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
X-List-Received-Date: Wed, 11 Jul 2018 10:09:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/11/2018 06:01 PM, Burton, Ross wrote:
> Can we integrate the systemd fix, instead of working around it?
>
> Ross

Hi Ross,

There's only a PR. And the PR is not merged yet.

I'll backport the patch if it's merged and drop this workaround.

Best Regards,
Chen Qi

> On 11 July 2018 at 09:05, Chen Qi <Qi.Chen@windriver.com> wrote:
>> With the recent change in new systemd version, it's possible that
>> a user is deleted before stopping user-runtime-dir@xxx.service.
>> See link below.
>>
>>    https://github.com/systemd/systemd/issues/9541
>>
>> Workaround this issue by delay for 1 second before deleting user.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/lib/oeqa/runtime/cases/rpm.py | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
>> index 1e5e463..2f9dcad 100644
>> --- a/meta/lib/oeqa/runtime/cases/rpm.py
>> +++ b/meta/lib/oeqa/runtime/cases/rpm.py
>> @@ -87,6 +87,12 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
>>               self.assertEqual(status, 0, msg=msg)
>>
>>           def unset_up_test_user(u):
>> +            # Due to recent change in systemd, we need to sleep for a while
>> +            # to avoid unexpected failure of user-runtime-dir@1000.service
>> +            # See https://github.com/systemd/systemd/issues/9541
>> +            if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
>> +                self.target.run('sleep 1')
>> +
>>               status, output = self.target.run('userdel -r %s' % u)
>>               msg = 'Failed to erase user: %s' % output
>>               self.assertTrue(status == 0, msg=msg)
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



