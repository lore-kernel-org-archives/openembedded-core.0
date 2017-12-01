Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23D8A71C54
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 05:06:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB156aEo006445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 30 Nov 2017 21:06:36 -0800
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 30 Nov 2017 21:06:30 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1510642397.git.liezhi.yang@windriver.com>
	<09182bb829b79804f26ee1a0eb83115cb6cef51f.1510642397.git.liezhi.yang@windriver.com>
	<CAJTo0LYSpB_HSXqRKE_ytqEoDNfFdYhm4pJ4WJj534voMSX-UA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6dfec3f4-fabb-1171-14a3-dc50633464c0@windriver.com>
Date: Fri, 1 Dec 2017 13:06:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYSpB_HSXqRKE_ytqEoDNfFdYhm4pJ4WJj534voMSX-UA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] targetcontrol.py: make QEMU_USE_KVM = "1" work
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
X-List-Received-Date: Fri, 01 Dec 2017 05:06:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/30/2017 06:57 PM, Burton, Ross wrote:
> There are two neater ways of doing this:
> 
> 1) oe.types.boolean() which handles all the common aliases for true or false.
> 2)bitbake typed variables.  Do QEMU_USE_KVM[type]="boolean" where it gets a 
> default value, and then use oe.data.typed_value('QEMU_USE_KVM', d) to get the value.
> 
> Both ways move the actual value parsing to dedicated code so its less error 
> prone and more consistent.

Thanks, make sense, I will send V2 which uses oe.types.boolean().

// Robert

> 
> Ross
> 
> On 14 November 2017 at 06:57, Robert Yang <liezhi.yang@windriver.com 
> <mailto:liezhi.yang@windriver.com>> wrote:
> 
>     It only could be set to "True", which was not common in oe, e.g.:
>     * Works
>     QEMU_USE_KVM = "True"
> 
>     * Didn't work, this would surprise user.
>     QEMU_USE_KVM = "1"
> 
>     Make it work with both 1 and True now, the "True" is for compatibility.
> 
>     [YOCTO #12343]
> 
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>       meta/classes/testimage.bbclass | 2 +-
>       meta/lib/oeqa/targetcontrol.py | 2 +-
>       2 files changed, 2 insertions(+), 2 deletions(-)
> 
>     diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
>     index 45bb2bd..66b4baf 100644
>     --- a/meta/classes/testimage.bbclass
>     +++ b/meta/classes/testimage.bbclass
>     @@ -215,7 +215,7 @@ def testimage_main(d):
>           # Get use_kvm
>           qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>           if qemu_use_kvm and \
>     -       (qemu_use_kvm == 'True' and 'x86' in machine or \
>     +       (qemu_use_kvm in ('True', '1') and 'x86' in machine or \
>               d.getVar('MACHINE') in qemu_use_kvm.split()):
>               kvm = True
>           else:
>     diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
>     index f63936c..1625569 100644
>     --- a/meta/lib/oeqa/targetcontrol.py
>     +++ b/meta/lib/oeqa/targetcontrol.py
>     @@ -107,7 +107,7 @@ class QemuTarget(BaseTarget):
>               dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>               qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>               if qemu_use_kvm and \
>     -           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
>     +           (qemu_use_kvm in ("True", "1") and "x86" in d.getVar("MACHINE") or \
>                   d.getVar("MACHINE") in qemu_use_kvm.split()):
>                   use_kvm = True
>               else:
>     --
>     2.7.4
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 

