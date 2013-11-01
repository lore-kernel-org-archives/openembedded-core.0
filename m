Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF086D503
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 01:10:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA11ADad007455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Oct 2013 18:10:13 -0700 (PDT)
Received: from [128.224.163.210] (128.224.163.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 31 Oct 2013 18:10:13 -0700
Message-ID: <5272FF73.40606@windriver.com>
Date: Fri, 1 Nov 2013 09:10:11 +0800
From: Xufeng Zhang <xufeng.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5 ThunderBrowse/3.82
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1383182680-20871-1-git-send-email-xufeng.zhang@windriver.com>
	<20131031082625.GE32015@jama>
In-Reply-To: <20131031082625.GE32015@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Delay rm_work to run after do_bundle_initramfs
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
X-List-Received-Date: Fri, 01 Nov 2013 01:10:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 04:26 PM, Martin Jansa wrote:
> On Thu, Oct 31, 2013 at 09:24:40AM +0800, Xufeng Zhang wrote:
>    
>> From: "Signed-off-by: Xufeng Zhang"<xufeng.zhang@windriver.com>
>>
>> Since kernel will build twice when we are trying to bundle kernel
>> and initramfs together after commit 609d5a9ab("kernel.bbclass,
>> image.bbclass: Implement kernel INITRAMFS dependency and bundling"),
>> thus, the second building for kernel would fail if rm_work is done
>> previously.
>>
>> To fix this problem, we need to delay the rm_work task for kernel
>> to run after do_bundle_initramfs task.
>>
>> [YOCTO #5416]
>>
>> Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>> ---
>>   meta/classes/kernel.bbclass | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index dedfab7..6154df0 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -29,6 +29,9 @@ python __anonymous () {
>>       image_task = d.getVar('INITRAMFS_TASK', True)
>>       if image_task:
>>           d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>> +
>> +    if image or image_task:
>> +        d.appendVarFlag('do_rm_work', 'depends', " %s:do_bundle_initramfs" % d.getVar('PN', True))
>>   }
>>      
> Why not add "before" param to addtask?
>
> addtask bundle_initramfs after do_compile before do_build
>
> could do the trick
>    

Yes, this works better than my fix, thanks a lot!
I'll send a V2 patch.


Thanks,
Xufeng

>    
>>   inherit kernel-arch deploy
>> -- 
>> 1.8.3.3
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>      
>    


