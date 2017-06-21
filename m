Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7F978038
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 02:58:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5L2wPMC008300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 20 Jun 2017 19:58:25 -0700
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Jun 2017 19:58:25 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1498012112-27453-1-git-send-email-Randy.MacLeod@windriver.com>
	<CAMKF1sr6jktZh7936pMndka5XBxGs1iPzkeSTtxQ=0Nj8iuV6A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e31fb941-a8b0-6b75-cbc1-7575a6cac150@windriver.com>
Date: Tue, 20 Jun 2017 22:58:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr6jktZh7936pMndka5XBxGs1iPzkeSTtxQ=0Nj8iuV6A@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: work-around ppc gold linker error
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
X-List-Received-Date: Wed, 21 Jun 2017 02:58:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-06-20 10:41 PM, Khem Raj wrote:
> On Tue, Jun 20, 2017 at 10:28 PM, Randy MacLeod
> <Randy.MacLeod@windriver.com> wrote:
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   .../systemd/systemd/systemd-drop-gold-use-bfd.patch           | 11 +++++++++++
>>   meta/recipes-core/systemd/systemd_232.bb                      |  2 ++
>>   2 files changed, 13 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
>> new file mode 100644
>> index 0000000..eac2199
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
>> @@ -0,0 +1,11 @@
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -260,7 +260,7 @@
>> +         -Wl,-z,relro \
>> +         -Wl,-z,now \
>> +         -pie \
>> +-        -Wl,-fuse-ld=gold])
>> ++        -Wl,-fuse-ld=bfd])
>> + AC_SUBST([OUR_LDFLAGS], "$with_ldflags $sanitizer_ldflags")
>> +
>> + AC_CHECK_SIZEOF(pid_t)
> 
> may be a sed expression in do_configure_prepend is better

Maybe?... hmmm.

I could do but this works and is intended to be reverted once
the proper fix is merged so unless you or someone else insists
and explains why it's better to do it in configure_prepend,
I'll leave it as is.
> 
>> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
>> index 1007360..1ce9dc1 100644
>> --- a/meta/recipes-core/systemd/systemd_232.bb
>> +++ b/meta/recipes-core/systemd/systemd_232.bb
>> @@ -41,6 +41,8 @@ SRC_URI_append_libc-uclibc = "\
>>   "
>>   SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>>
>> +SRC_URI_append_qemuppc = " file://systemd-drop-gold-use-bfd.patch"
> 
> is it specific to qemu alone ? 

Probably not. I'll figure out a better pattern for v2.

> if its generic across ppc then this is not
> right override. Infact you should also describe what the problem is in detail
> here.

Right. I'll do that in v2.

Meanwhile, some details are here for those interested:
	https://bugzilla.yoctoproject.org/show_bug.cgi?id=11696

Thanks for the review.

../Randy

> 
>> +
>>   PACKAGECONFIG ??= "xz \
>>                      ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

