Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A601F62252
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 09:15:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8G9FE8V000565
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 02:15:14 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 16 Sep 2014 02:15:13 -0700
Message-ID: <5417FF9E.20803@windriver.com>
Date: Tue, 16 Sep 2014 17:15:10 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <1410536356.14624.0.camel@ted> <5417FC26.3080503@windriver.com>
	<5417FE7C.9070400@windriver.com>
In-Reply-To: <5417FE7C.9070400@windriver.com>
X-Originating-IP: [128.224.163.186]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: Fix incorrect return value handling
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
X-List-Received-Date: Tue, 16 Sep 2014 09:15:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/16/2014 05:10 PM, Robert Yang wrote:
>
>
> On 09/16/2014 05:00 PM, Ming Liu wrote:
>> On 09/12/2014 11:39 PM, Richard Purdie wrote:
>>> The use of [ and && here means $? is reset and the exit 1 error
>>> interception wasn't working, leading to "file changed as we read it"
>>> errors from sstate_create_package when heavily using hardlinks.
>>>
>>> Fix this by placing $? into a variable.
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>>> index 0cb5235..1145a63c 100644
>>> --- a/meta/classes/sstate.bbclass
>>> +++ b/meta/classes/sstate.bbclass
>>> @@ -599,7 +599,8 @@ sstate_create_package () {
>>>       if [ "$(ls -A)" ]; then
>>>           set +e
>>>           tar -czf $TFILE *
>>> -        if [ $? -ne 0 ] && [ $? -ne 1 ]; then
>>> +        ret=$?
>>> +        if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
>> Would changing the line to "if [[ $? -ne 0  &&  $? -ne 1 ]] " be a 
>> better fix?
>
> I'm afraid not, "[[" and "&&" in test are bashism.
Thanks for pointing it out, please ignore my suggestion then, sorry for 
the noise.

//Ming Liu
>
> // Robert
>
>>
>> the best,
>> thank you
>>>               exit 1
>>>           fi
>>>           set -e
>>>
>>>
>>
>
>


