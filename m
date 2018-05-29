Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F41CA746AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 01:41:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4T1f303020091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 18:41:04 -0700 (PDT)
Received: from [128.224.27.69] (128.224.27.69) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 May 2018 18:40:56 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<443f9e25b92e4c17bedc679894ba25f4746e7885.1527216285.git.liezhi.yang@windriver.com>
	<08a213e4-29e8-2d43-156f-5e51a1409b30@windriver.com>
	<943e9191-51f5-ab2e-b9b5-96956375d41c@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f0603f29-6e9b-efda-68b0-54e9def16b51@windriver.com>
Date: Tue, 29 May 2018 09:40:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <943e9191-51f5-ab2e-b9b5-96956375d41c@windriver.com>
Subject: Re: [PATCH 02/24] runqemu-extract-sdk: allow install debugfs on rootfs
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
X-List-Received-Date: Tue, 29 May 2018 01:41:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 05/29/2018 09:39 AM, Robert Yang wrote:
> 
> 
> On 05/29/2018 01:14 AM, Randy MacLeod wrote:
>> On 05/24/2018 10:48 PM, Robert Yang wrote:
>>> Usually, the debugfs' (-dbg.tar.*) work follow is:
>> s/work follow/workflow/
>>> 1) Install regular rootfs to dir_foo
>>> 2) Install debugfs (-dbg.tar.*) to the same dir_foo
>>>
>>> So we need allow install debugfs on rootfs.
>> So we need to allow installing the debugfs on top of the rootfs.
>>
>>
>> or at least, I think that's what you mean.
> 
> Thanks, done.

I meant updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/fix_from_wr
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/fix_from_wr

// Robert

> 
> // Robert
> 
>> ../Randy
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   scripts/runqemu-extract-sdk | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
>>> index 2a0dd50..f4286ef 100755
>>> --- a/scripts/runqemu-extract-sdk
>>> +++ b/scripts/runqemu-extract-sdk
>>> @@ -76,7 +76,9 @@ fi
>>>   pseudo_state_dir="$SDK_ROOTFS_DIR/../$(basename 
>>> "$SDK_ROOTFS_DIR").pseudo_state"
>>>   pseudo_state_dir="$(readlink -f $pseudo_state_dir)"
>>> -if [ -e "$pseudo_state_dir" ]; then
>>> +debug_image="`echo $ROOTFS_TARBALL | grep '\-dbg\.tar\.'`"
>>> +
>>> +if [ -e "$pseudo_state_dir" -a -z "$debug_image" ]; then
>>>       echo "Error: $pseudo_state_dir already exists!"
>>>       echo "Please delete the rootfs tree and pseudo directory manually"
>>>           echo "if this is really what you want."
>>>
>>
>>

