Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE5D782E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 06:20:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O6Khb5025251
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 23:20:43 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 23:20:43 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
	<00ad9ee0ea4e4de1773220dfca8792819701092f.1503364879.git.liezhi.yang@windriver.com>
	<2904894.l3jg57PGWo@peggleto-mobl.ger.corp.intel.com>
	<1503494224.32591.156.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <17ece06c-2a8e-5dd8-0ec7-d7867b6ba1a6@windriver.com>
Date: Thu, 24 Aug 2017 14:19:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1503494224.32591.156.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 6/9] core/target/ssh.py: replace decode errors
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
X-List-Received-Date: Thu, 24 Aug 2017 06:20:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/23/2017 09:17 PM, Richard Purdie wrote:
> On Tue, 2017-08-22 at 22:55 +1200, Paul Eggleton wrote:
>> On Tuesday, 22 August 2017 1:23:10 PM NZST Robert Yang wrote:
>>>
>>> There might be wild strings when read from target (especially when
>>> reading ptest results), replace the errors to avoid breaking the
>>> test.
>>>
>>> Fixed: (Not always happen)
>>> $ bitbake core-image-sato -ctestimage
>>> [snip]
>>>     status, output = self.target.run('ptest-runner', 0)
>>>   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py",
>>> line 84, in run
>>>     status, output = self._run(sshCmd, processTimeout, True)
>>>   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py",
>>> line 55, in _run
>>>     status, output = SSHCall(command, self.logger, timeout)
>>>   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py",
>>> line 258, in SSHCall
>>>     run()
>>>   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py",
>>> line 236, in run
>>>     output = process.communicate()[0].decode("utf-8")
>>> UnicodeDecodeError: 'utf-8' codec can't decode byte 0xc3 in
>>> position 4906: invalid continuation byte
>>>
>>> [YOCTO #11547]
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>  meta/lib/oeqa/core/target/ssh.py | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/core/target/ssh.py
>>> b/meta/lib/oeqa/core/target/ssh.py
>>> index b80939c..a2eafcd 100644
>>> --- a/meta/lib/oeqa/core/target/ssh.py
>>> +++ b/meta/lib/oeqa/core/target/ssh.py
>>> @@ -211,7 +211,7 @@ def SSHCall(command, logger, timeout=None,
>>> **opts):
>>>                              process.stdout.close()
>>>                              eof = True
>>>                          else:
>>> -                            data = data.decode("utf-8")
>>> +                            data = data.decode("utf-8",
>>> errors='replace')
>>>                              output += data
>>>                              logger.debug('Partial data from SSH
>>> call: %s' % data)
>> Since we're dealing with partial data here, shouldn't we be using a
>> reader object? e.g.:
>>
>>   http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=bfd8c35c3
>> f917e3806c8dfe36c98c70fbccbb3c9
>
>
> I've decided to merge this series as it improves the ptest support
> substantially however I am expecting a follow up with the tweaks Paul
> suggests here please.

Thanks, sent:
[OE-core] [PATCH 0/1] core/target/ssh.py: use reader to handle partial data

// Robert

>
> Cheers,
>
> Richard
>
>

