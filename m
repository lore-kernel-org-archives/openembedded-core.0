Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6C07D6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 09:30:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w049UMih011026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jan 2018 01:30:22 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 4 Jan 2018 01:30:20 -0800
To: <openembedded-core@lists.openembedded.org>, <jobol@nonadev.net>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <da1819f4-e8e8-20a7-4dbd-35330aa3efff@windriver.com>
Date: Thu, 4 Jan 2018 17:31:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Thu, 04 Jan 2018 09:30:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 01/04/2018 05:28 PM, wenzong fan wrote:
> Hi José Bollo,
> 
> This will override the labels of user's home directories that set by 
> SELinux.
> 
> For example, if I run below command on SELinux enabled system:
> 
> $ useradd test
> 

Sorry for the typo: s/test/t1/g to match with strace logs.

// Wenzong

> SELinux will label it as "user_u:object_r:user_home_dir_t:SystemLow" 
> first, and then useradd will reset the label as 
> "system_u:object_r:etc_t:SystemLow".
> 
> I got strace logs below:
> 
> 723   openat(AT_FDCWD, "/proc/thread-self/attr/fscreate", 
> O_RDWR|O_CLOEXEC) = 11
> 723   write(11, "user_u:object_r:user_home_dir_t:"..., 35) = 35
> 723   close(11)                         = 0
> 723   mkdir("/home/t1", 000)            = 0
> 723   chown("/home/t1", 1000, 1000)     = 0
> 723   chmod("/home/t1", 0755)           = 0
> 
> # SELinux labelled it as "user_home_dir_t" here.
> 
> 723   llistxattr("/etc/skel", NULL, 0)  = 17
> 723   llistxattr("/etc/skel", "security.selinux\0", 17) = 17
> 723   openat(AT_FDCWD, "/etc/xattr.conf", O_RDONLY) = -1 ENOENT (No such 
> file or directory)
> 723   lgetxattr("/etc/skel", "security.selinux", NULL, 0) = 27
> 723   lgetxattr("/etc/skel", "security.selinux", 
> "system_u:object_r:etc_t:s0", 27) = 27
> 723   lsetxattr("/home/t1", "security.selinux", 
> "system_u:object_r:etc_t:s0", 27, 0) = 0
> 
> # useradd reset the label as "etc_t" here.
> 
> Do you agree to move the patch to Smack specific layer? Such as 
> meta-security?
> 
> Thanks
> Wenzong
> 
> On 03/15/2017 04:04 PM, José Bollo wrote:
>> On Thu, 09 Mar 2017 18:18:05 +0100
>> Patrick Ohly <patrick.ohly@intel.com> wrote:
>>
>>> On Thu, 2017-03-09 at 17:48 +0100, José Bollo wrote:
>>>> On Thu, 09 Mar 2017 17:07:54 +0100
>>>> Patrick Ohly <patrick.ohly@intel.com> wrote:
>>>>> Can't you reorder and rebase the patches so that this
>>>>> 0001-useradd.c-create-parent-directories-when-necessary.patch
>>>>> applies on top of the patch which was submitted upstream?
>>>>
>>>> I agree that it would be better to reorder. Better but less
>>>> conservative because an existing patch must be upgraded.
>>>
>>> If upstream merges the proposed patch, then rebasing will be
>>> inevitable at some point, so we might as well do the cleaner solution
>>> now, even if the diff becomes larger.
>>>
>>>>> "devtool modify shadow-native" might be useful for that. "git
>>>>> rebase -i" in workspace/sources/shadow-native", then finish with
>>>>> "devtool update-recipe shadow-native". I haven't tried whether
>>>>> "update-recipe" handles re-ordering patches. If it doesn't, just
>>>>> fix it manually.
>>>>
>>>> I'll do and propose the new version soon.
>>>
>>> Thanks!
>>>
>>
>> I pushed a new version of the patch this monday. I suppose that it is
>> waiting for approval.
>>
>> Best regards
>> José Bollo
>>
> 

