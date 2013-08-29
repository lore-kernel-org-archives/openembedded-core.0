Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55D636BD54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 07:16:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7T7G6HH003214
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2013 00:16:06 -0700 (PDT)
Received: from [128.224.162.220] (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 29 Aug 2013 00:16:05 -0700
Message-ID: <521EF533.2040001@windriver.com>
Date: Thu, 29 Aug 2013 15:16:03 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<521D0495.203@windriver.com> <20130827200817.GB3544@jama>
	<1377646160.32502.25.camel@ted> <521D737D.4000706@windriver.com>
In-Reply-To: <521D737D.4000706@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Thu, 29 Aug 2013 07:16:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/2013 11:50 AM, Randy MacLeod wrote:
> On 13-08-27 07:29 PM, Richard Purdie wrote:
>> On Tue, 2013-08-27 at 22:08 +0200, Martin Jansa wrote:
>>> On Tue, Aug 27, 2013 at 03:57:09PM -0400, Randy MacLeod wrote:
>>>> On 13-08-23 05:48 AM, Laszlo Papp wrote:
>>>>> Signed-off-by: Laszlo Papp <lpapp@kde.org>
>>>>> ---
>>>>>    meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb | 27
>>>>> +++++++++++++++++++++++
>>>>>    meta/recipes-bsp/u-boot/u-boot_2013.07.bb         | 23
>>>>> +++++++++++++++++++
>>>>>    2 files changed, 50 insertions(+)
>>>>>    create mode 100644
>>>>> meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>>>>>    create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>>>>
>>>> ...
>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>>>> b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>>>> new file mode 100644
>>>>> index 0000000..f3f4b62
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>>>> @@ -0,0 +1,23 @@
>>>>> +require u-boot.inc
>>>>> +
>>>>> +# To build u-boot for your machine, provide the following lines in
>>>>> your machine
>>>>> +# config, replacing the assignments as appropriate for your machine.
>>>>> +# UBOOT_MACHINE = "omap3_beagle_config"
>>>>> +# UBOOT_ENTRYPOINT = "0x80008000"
>>>>> +# UBOOT_LOADADDRESS = "0x80008000"
>>>>> +
>>>>> +LICENSE = "GPLv2+"
>>>>> +LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>>>>> +
>>>>> file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
>>>>>
>>>>> +
>>>>> +# This revision corresponds to the tag "v2013.07"
>>>>> +# We use the revision in order to avoid having to fetch it from
>>>>> the repo during parse
>>>>> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>>>>> +
>>>>> +PV = "v2013.07+git${SRCPV}"
>>>>> +
>>>>> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>>>
>>>> Just curious...
>>>> I dont' see a good reason to specify the git protocol twice:
>>>>      git://.... and ; protocol=git
>>>
>>> It's not twice, git:// is to select bitbake fetcher (git.py) and one
>>> fetcher can support multiple protocols (e.g. over git, http or ssh)
>>>
>>> but you're right that in most cases "protocol=git" isn't needed, because
>>> it's default protocol for git fetcher when host is specified in that
>>> SRC_URI.
>>>
>>> bitbake/lib/bb/fetch2/git.py:
>>>          if 'protocol' in ud.parm:
>>>              ud.proto = ud.parm['protocol']
>>>          elif not ud.host:
>>>              ud.proto = 'file'
>>>          else:
>>>              ud.proto = "git"
>>>
>>> And I would support removing it in one go as it clearly confuses people
>>> :).
>>
>> The reason is that the default for the git fetcher was once rsync. Why?
>> The fetcher was written when git was still a new and unexplored
>> landscape. We decided in the end to break that insane default and fix
>> it.
>>
>> We should kill off the now unnecessary parameters though.
>
> Ok. Jackie will have time to make a first pass tomorrow.
> Jackie, please include the replacement script in your email.

I think it should be the for the fetchers of svn, cvs, hg and so on:

$ grep protocol bitbake/lib/bb/fetch2/svn.py
         proto = ud.parm.get('protocol', 'svn')

$ grep protocol bitbake/lib/bb/fetch2/hg.py
         proto = ud.parm.get('protocol', 'http')


I checked that we only use git and svn:
$ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed 
-n 's/.*"\(\w*:\/\/\).*\(;protocol=\w*\)/\1 \2/p' {} \; | sort | uniq
git:// ;protocol=git \
git:// ;protocol=git"
git:// 
;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
git:// ;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
git:// ;protocol=git" % (gstpkg_basename, branch))
git:// 
;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
git:// ;protocol=http \
svn:// ;protocol=http \
svn:// ;protocol=http;module=trunk \
svn:// ;protocol=svn"

So I think it's safe to simply remove ";protocol=git" and ";protocol=svn":

$ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed 
-i 's/;protocol=git//; s/;protocol=svn//' {} \;


What left with protocol parameter after removal is:
$ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed 
-n 's/.*"\(\w*:\/\/\).*\(;protocol=\w*\)/\1 \2/p' {} \; | sort | uniq
git:// ;protocol=http \
svn:// ;protocol=http \
svn:// ;protocol=http;module=trunk \

I think it should be what we want, I will send the patch after my 
"bitbake world" complete.

Thanks,
Jackie

>
> // Randy
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

