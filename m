Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD9C6BCB4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:02:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r84820Rs008036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Sep 2013 01:02:00 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Sep 2013 01:01:58 -0700
Message-ID: <5226E8D2.1050801@windriver.com>
Date: Wed, 4 Sep 2013 16:01:22 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Vali Cobelea <valentin.cobelea@enea.com>
References: <cover.1378208967.git.liezhi.yang@windriver.com>
	<de9091dfe0d902de86a95fa1856c44f7fc4e6544.1378208967.git.liezhi.yang@windriver.com>
	<5225DB39.80204@windriver.com> <5225DBC9.7040801@enea.com>
	<52268570.7050701@windriver.com> <5226DFBB.2080304@enea.com>
In-Reply-To: <5226DFBB.2080304@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] archiver.bbclass: exclude recursive symlink for diff
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
X-List-Received-Date: Wed, 04 Sep 2013 08:02:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/04/2013 03:22 PM, Vali Cobelea wrote:
> Hi,
>
> You can try even without the patch and see if you reproduce the issue.
> We do have the symlinks recursivity problem as I said but on random packages,
> "udev" was the first we noticed.

I can't reproduce the error, but it is really a problem, I've added a patch
in the bugzilla, and will send it here sooner.

// Robert

>
> Best regards,
> Valentin
>
> On 09/04/2013 03:57 AM, Robert Yang wrote:
>>
>> Hi Valentin,
>>
>> It hangs up when build acl (which means that I can reproduce the
>> problem as you have told), but it worked well without this patch,
>> maybe python version related, I will do more investigation.
>>
>> // Robert
>>
>> On 09/03/2013 08:53 PM, Vali Cobelea wrote:
>>> Hi,
>>>
>>> What seems to be the issue ?
>>>
>>> BR,
>>> Valentin
>>>
>>>
>>> On 09/03/2013 03:51 PM, Robert Yang wrote:
>>>>
>>>> Please hold this patch for a while, seems that it didn't fix all of the things.
>>>>
>>>> // Robert
>>>>
>>>> On 09/03/2013 07:51 PM, Robert Yang wrote:
>>>>> There would be errors if there are recursive symlinks in the ${S}:
>>>>>
>>>>> diff:
>>>>> /xxx/udev/182-r8/udev-182/test/sys/block/loop0/bdi/subsystem/0:16/subsystem:
>>>>> recursive directory loop
>>>>>
>>>>> We can check the recursive symlink and save it to the exclude file, then
>>>>> the diff's --exclude-from argument can exclude them
>>>>>
>>>>> [YOCTO #4986]
>>>>>
>>>>> Signed-off-by: Valentin Cobelea <valentin.cobelea@enea.com>
>>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>>> ---
>>>>>   meta/classes/archiver.bbclass |   18 ++++++++++++++++++
>>>>>   1 file changed, 18 insertions(+)
>>>>>
>>>>> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
>>>>> index 66efe7d..f5ad562 100644
>>>>> --- a/meta/classes/archiver.bbclass
>>>>> +++ b/meta/classes/archiver.bbclass
>>>>> @@ -493,6 +493,24 @@ def create_diff_gz(d):
>>>>>       for i in exclude_from:
>>>>>           f.write(i)
>>>>>           f.write("\n")
>>>>> +
>>>>> +    symlinks = []
>>>>> +    directories = []
>>>>> +
>>>>> +    # Add symlink and root dir to the separated lists for checking whether
>>>>> +    # there is recursive symlink
>>>>> +    for root, dirs, files in os.walk(os.getcwd(), followlinks=True):
>>>>> +        if os.path.islink(root):
>>>>> +            symlinks.append(root)
>>>>> +        elif os.path.isdir(root):
>>>>> +            directories.append(root)
>>>>> +
>>>>> +    # Check if there is a recursive symlink to a dir
>>>>> +    for sym in symlinks:
>>>>> +        if sym in directories:
>>>>> +            # write the 'sym' in the 'exclude-from' file
>>>>> +            f.write(os.path.basename(sym))
>>>>> +
>>>>>       f.close()
>>>>>
>>>>>       s=d.getVar('S', True)
>>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>
>
>

