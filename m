Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 673987680A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 00:47:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u380l937015533
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Apr 2016 17:47:09 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 17:47:08 -0700
To: Dan McGregor <danismostlikely@gmail.com>
References: <cover.1460015043.git.liezhi.yang@windriver.com>
	<0186a488dc4ff5d3daf5ef0d1fd54bb0e79763a7.1460015043.git.liezhi.yang@windriver.com>
	<CACS+7ZQ55g1EQkWD5OQOH0zU=S1p9BRx_Nn8u5FKQmL3_-QEcw@mail.gmail.com>
	<570664CD.4090501@windriver.com>
	<CACS+7ZSOJg9gpWGKAKM2dA6Y6Se4wcj+DWFpjOdKS014fqZWYQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5706FF8B.1060706@windriver.com>
Date: Fri, 8 Apr 2016 08:47:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CACS+7ZSOJg9gpWGKAKM2dA6Y6Se4wcj+DWFpjOdKS014fqZWYQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fs-perms.txt: fix ROOT_HOME's permission
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
X-List-Received-Date: Fri, 08 Apr 2016 00:47:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2016 11:55 PM, Dan McGregor wrote:
> On 7 April 2016 at 07:46, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>
>> On 04/07/2016 09:30 PM, Dan McGregor wrote:
>>>
>>> On 7 April 2016 at 01:50, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>>
>>>> It should be 0700 rather than 0755.
>>>>
>>>> Reported-by: Charles Chan <charles.wh.chan@gmail.com>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    meta/files/fs-perms.txt | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
>>>> index 109cbe5..1d74da7 100644
>>>> --- a/meta/files/fs-perms.txt
>>>> +++ b/meta/files/fs-perms.txt
>>>> @@ -51,6 +51,7 @@ ${localstatedir}/lock link    /run/lock
>>>>    ${localstatedir}/tmp   link    volatile/tmp
>>>>
>>>>    /home                          0755    root    root    false - - -
>>>> +${ROOT_HOME}                   0700    root    root    false - - -
>>>
>>>
>>> I'd like to see this in the section labelled "Special permissions from
>>> base-files" around line 58. I think that makes it more clear that this
>>> is a special permission setting.
>>
>>
>> Thanks, updated in the repo:
>>
>>    git://git.openembedded.org/openembedded-core-contrib rbt/home
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/home
>>
>>
>> commit ccc59f44f5fc6c6ccef6b0fed58b0d582c9ee32b
>> Author: Robert Yang <liezhi.yang@windriver.com>
>> Date:   Tue Apr 5 22:34:25 2016 -0700
>>
>>      fs-perms.txt: fix ROOT_HOME's permission
>>
>>      It should be 0700 rather than 0755.
>>
>>      Reported-by: Charles Chan <charles.wh.chan@gmail.com>
>>      Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>
>> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
>> index 109cbe5..6c1083c 100644
>> --- a/meta/files/fs-perms.txt
>> +++ b/meta/files/fs-perms.txt
>> @@ -59,6 +59,7 @@ ${localstatedir}/local                0755    root    root
>> false - - -
>>   # Set 1777
>>   /tmp                           01777   root    root    false - - -
>>   ${localstatedir}/volatile/tmp  01777   root    root    false - - -
>> +${ROOT_HOME}                   0700    root    root    false - - -
>>
>
> Thanks, this is the right track, but this implies that ${ROOT_HOME}
> should be mode 1777, how about:
>
> +
> +# Set 700
> +${ROOT_HOME}                   0700    root    root    false - - -

Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/home
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/home


commit 5d0c64fd55edc957d8fb6340c9842bf8498a485d
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Apr 5 22:34:25 2016 -0700

     fs-perms.txt: fix ROOT_HOME's permission

     It should be 0700 rather than 0755.

     Reported-by: Charles Chan <charles.wh.chan@gmail.com>
     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index 109cbe5..3d00e86 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -60,6 +60,9 @@ ${localstatedir}/local                0755    root    root 
false - - -
  /tmp                           01777   root    root    false - - -
  ${localstatedir}/volatile/tmp  01777   root    root    false - - -

+# Set 0700
+${ROOT_HOME}                   0700    root    root    false - - -
+
  # Set 755-lsb
  /srv                           0755    root    root    false - - -


// Robert

>
>>   # Set 755-lsb
>>   /srv                           0755    root    root    false - - -
>>
>>
>> // Robert
>>
>>
>>>
>>>
>>>>    /srv                           0755    root    root    false - - -
>>>>    ${prefix}/src                  0755    root    root    false - - -
>>>>    ${localstatedir}/local         0755    root    root    false - - -
>>>> --
>>>> 2.8.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>
>

