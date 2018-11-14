Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 659B16C40F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 09:38:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAE9bJw8015304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Nov 2018 01:37:35 -0800
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 14 Nov 2018 01:37:27 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1542099878-266444-1-git-send-email-changqing.li@windriver.com>
	<54ebce2e5465961129b4740cba726f52c9e7d726.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <0565ae1b-8079-1a96-d31d-b3022912121a@windriver.com>
Date: Wed, 14 Nov 2018 17:37:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <54ebce2e5465961129b4740cba726f52c9e7d726.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] oepydevshell-internal.py: decode only when readdata is valid
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
X-List-Received-Date: Wed, 14 Nov 2018 09:38:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/13/18 6:03 PM, Richard Purdie wrote:
> On Tue, 2018-11-13 at 17:04 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below problem:
>> pydevshell raises exception when maximize the python shell window.
>> when click maximize, rlist of select return ready object, but the
>> pty.read is None, so throw exception of 'NoneType' object has no
>> attribute 'decode', change to only decode when readdata is valid.
>>
>> [YOCTO #11875]
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   scripts/oepydevshell-internal.py | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-
>> internal.py
>> index 04621ae..2d1bc77 100755
>> --- a/scripts/oepydevshell-internal.py
>> +++ b/scripts/oepydevshell-internal.py
>> @@ -63,7 +63,10 @@ try:
>>               (ready, _, _) = select.select([pty, sys.stdin], writers
>> , [], 0)
>>               try:
>>                   if pty in ready:
>> -                    i = i + pty.read().decode('utf-8')
>> +                    readdata=pty.read()
>> +                    if readdata == None:
>> +                        continue
>> +                    i = i + readdata.decode('utf-8')
> Usually you'd write this as:
>
> if readdata:
>      i = i + readdata.decode('utf-8')
>
> Is there a reason not to do that here?
>
> If you really want to test for None, you usually write:
>
> if readdata is None:
>
> which is a little more pythonic.
>
> Cheers,
>
> Richard
>
Thanks. I will correct the patch as suggested.

//Changqing

-- 
BRs

Sandy(Li Changqing)


