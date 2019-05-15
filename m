Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DEE07DE38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 12:54:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4FCs2GW009457
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 05:54:02 -0700 (PDT)
Received: from [128.224.124.169] (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 05:54:02 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190417104853.18047-1-ovidiu.panait@windriver.com>
	<CAJTo0La5A7XQWKc4eMcckdX6s6k+cO7LjijkQp3AU6m0f5Qsxw@mail.gmail.com>
From: Ovidiu Panait <ovidiu.panait@windriver.com>
Message-ID: <b1799d90-d191-c6c3-af36-1b6275140e83@windriver.com>
Date: Wed, 15 May 2019 15:52:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La5A7XQWKc4eMcckdX6s6k+cO7LjijkQp3AU6m0f5Qsxw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub-mkconfig: Use -c instead of --printf for stat
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
X-List-Received-Date: Wed, 15 May 2019 12:54:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 14.05.2019 00:51, Burton, Ross wrote:

> This isn't OE-specific, can you try and send that upstream so we don't
> carry the patch forever?
>
> Also needs rebasing to current master.

Hi,


I have sent the patch upstream:

http://lists.gnu.org/archive/html/grub-devel/2019-05/msg00079.html


And I rebased to the current master.


Thanks,

Ovidiu

> Ross
>
> On Wed, 17 Apr 2019 at 03:52, Ovidiu Panait <ovidiu.panait@windriver.com> wrote:
>> "--printf" only works with the stat variant provided by coreutils.
>>
>> With busybox, when running grub-mkconfig, stat will fail with the
>> following error:
>> stat: unrecognized option '--printf=%T'
>>
>> Usage: stat [OPTIONS] FILE...
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>   ...fig-Use-c-instead-of-printf-for-stat.patch | 36 +++++++++++++++++++
>>   meta/recipes-bsp/grub/grub2.inc               |  1 +
>>   2 files changed, 37 insertions(+)
>>   create mode 100644 meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
>>
>> diff --git a/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch b/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
>> new file mode 100644
>> index 0000000000..0700911b78
>> --- /dev/null
>> +++ b/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
>> @@ -0,0 +1,36 @@
>> +From b5011ea2bc57d80b3e5a42bc308fa2000e85eab1 Mon Sep 17 00:00:00 2001
>> +From: Ovidiu Panait <ovidiu.panait@windriver.com>
>> +Date: Wed, 17 Apr 2019 12:10:28 +0300
>> +Subject: [PATCH] grub-mkconfig: Use -c instead of --printf for stat
>> +
>> +"--printf" only works with the stat variant provided by coreutils.
>> +
>> +With busybox, when running grub-mkconfig, stat will fail with the
>> +following error:
>> +stat: unrecognized option '--printf=%T'
>> +
>> +Usage: stat [OPTIONS] FILE...
>> +
>> +Upstream-Status: Inappropriate [OE specific]
>> +
>> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> +---
>> + util/grub-mkconfig.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
>> +index f8496d2..628706d 100644
>> +--- a/util/grub-mkconfig.in
>> ++++ b/util/grub-mkconfig.in
>> +@@ -144,7 +144,7 @@ GRUB_DEVICE_BOOT_UUID="`${grub_probe} --device ${GRUB_DEVICE_BOOT} --target=fs_u
>> + GRUB_FS="`${grub_probe} --device ${GRUB_DEVICE} --target=fs 2> /dev/null || echo unknown`"
>> +
>> + if [ x"$GRUB_FS" = xunknown ]; then
>> +-    GRUB_FS="$(stat -f --printf=%T / || echo unknown)"
>> ++    GRUB_FS="$(stat -f -c %T / || echo unknown)"
>> + fi
>> +
>> + if test -f ${sysconfdir}/default/grub ; then
>> +--
>> +2.20.1
>> +
>> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
>> index c6994723f9..a6909c31ca 100644
>> --- a/meta/recipes-bsp/grub/grub2.inc
>> +++ b/meta/recipes-bsp/grub/grub2.inc
>> @@ -23,6 +23,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>>              file://0001-grub-setup-Debug-message-cleanup.patch \
>>              file://disable-address-of-packed-member.patch \
>>              file://fix.build.with.squashfs.patch \
>> +           file://0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch \
>>   "
>>   SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
>>   SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

