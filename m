Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55654738B6;
	Wed,  4 Mar 2015 02:26:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t242QF6r029422
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Mar 2015 18:26:15 -0800 (PST)
Received: from server.local (128.224.20.18) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Mar 2015 18:26:14 -0800
Message-ID: <54F66D45.8030702@windriver.com>
Date: Tue, 3 Mar 2015 21:26:13 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20150302220550.8A2F450367@opal.openembedded.org>
	<20150304022312.GF2337@jama>
In-Reply-To: <20150304022312.GF2337@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: improve patch application performance
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
X-List-Received-Date: Wed, 04 Mar 2015 02:26:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-03-03 9:23 PM, Martin Jansa wrote:
> On Mon, Mar 02, 2015 at 10:05:50PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 148c78e0f5de2689de3ad9beaa9f6de618d87758
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=148c78e0f5de2689de3ad9beaa9f6de618d87758
>>
>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Date:   Mon Mar  2 16:36:41 2015 -0500
>>
>> kern-tools: improve patch application performance
>>
>> Update the SRCREV for the following incremental improvement in patch
>> processing time:
>>
>>      kgit-meta: skip patches on non-leaf nodes
>>
>>      In a similar way as commit 0768d697 [kgit-meta: dont run kgit-s2q
>>      for
>>      non-leaf nodes], we can save even more processing time by not even
>>      analysing and linking patches if we aren't on the leaf node of the
>>      tree.
>>
>>      This early exit can save nearly 95% of the time required to "patch"
>>      a tree when no changes are actually applied.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Not sure if it's related to this, but today's world build is failing
> with:
>

Shouldn't be related, but I'll have a look. If you get past the patch
phase, that change doesn't come into play, and you are breaking on the
configuration gathering in this error.

Bruce

> ERROR: Function failed: do_kernel_configme (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401)
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401
> Log data follows:
> | DEBUG: Executing shell function do_kernel_configme
> | NOTE: kernel configme
> | [INFO] Configuring target/machine combo: "standard/qemux86"
> | [INFO] collecting configs in .meta/meta-series
> | mv: cannot move `/home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/linux-qemux86-standard-build/.tmp.config.PKIfLNkSVj' to `.meta/cfg/standard/common-pc/qemux86-standard-config-3.19': No such file or directory
> | creation of pre-processed config data failed
> | config of "standard/qemux86" failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_kernel_configme (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401)
> NOTE: recipe linux-yocto-3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0: task do_kernel_configme: Failed
> ERROR: Task 30091 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configme) failed with exit code '1'
>
>>
>> ---
>>
>>   meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index 80d26f9..131c5e9 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
>>
>>   DEPENDS = "git-native"
>>
>> -SRCREV = "cab17f884998b43692244a863dea6f505c7f67af"
>> +SRCREV = "0c51a3d02fa54726141f32824b11d0676960e0a5"
>>   PR = "r12"
>>   PV = "0.2+git${SRCPV}"
>>
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>


