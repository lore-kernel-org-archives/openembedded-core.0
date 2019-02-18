Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22BD97C78D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 09:34:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1I9YFWk020547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Feb 2019 01:34:26 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 18 Feb 2019 01:34:04 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1550195817.git.kai.kang@windriver.com>
	<4367f854b1ff23bc2972294715d3837725ee7c43.1550195817.git.kai.kang@windriver.com>
	<b82ae00685d2a9a7c6dc2710391e6e0b78a85527.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <8555dac8-afc3-392b-ba71-8c67d1cb92bd@windriver.com>
Date: Mon, 18 Feb 2019 17:32:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <b82ae00685d2a9a7c6dc2710391e6e0b78a85527.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libidn2: fix buildpaths qa warning
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
X-List-Received-Date: Mon, 18 Feb 2019 09:34:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/2/15 下午5:57, Richard Purdie wrote:
> On Thu, 2019-02-14 at 21:06 -0500, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Fix buildpaths qa warning of libidn2:
>>
>>> WARNING: libidn2-2.0.5-r0 do_package_qa: QA Issue: File
>>> /work/core2-64-poky-linux/libidn2/2.0.5-r0/packages-split/libidn2-
>>> dev/usr/lib/pkgconfig/libidn2.pc
>>> in package contained reference to tmpdir [buildpaths]
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-extended/libidn/libidn2_2.0.5.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
>> b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
>> index 0daf7a6877..da77c4402d 100644
>> --- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
>> +++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
>> @@ -26,4 +26,8 @@ EXTRA_OECONF += "--disable-rpath \
>>   LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
>>   LICENSE_${PN}-bin = "GPLv3+"
>>   
>> +do_install_append () {
>> +    sed -i 's#${RECIPE_SYSROOT}##'
>> ${D}${libdir}/pkgconfig/libidn2.pc
>> +}
>> +
>>   BBCLASSEXTEND = "native nativesdk"
> I have a strong dislike for editing .pc files after the fact. Part of
> the concern is sed expressions like this bitrot badly, its hard to tell
> if they still work as intended.
>
> Is there not a way we can generate a correct .pc file in the first
> place even if that means a patch?

The buildpaths qa issue is caused by a patch to fix compile-host-path qa 
issue. But I could NOT reproduce compile-host-path issue when revert the 
patch.
I'll turn Khem for some help to check whether could revert that patch.

commit e87b501659eecc22f48b3e3ca8cde6b4de9f663a
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun Aug 19 10:23:41 2018 -0700

     libidn2: Fix libunistring detection

     libunistring is one such library which many autotooled packages
     mistake to use from build system if its installed on it. This
     is specifically toxic when build host arch is same as target arch
     since we only see the problem during runtime but thankfully OE
     has build time QA which warns about it.

     QA Issue: libidn2: The compile log indicates that host include 
and/or library paths were used.

     Using --with-libunistring-prefix nudges the autoconf system for the
     component to first look into target sysroot before going on to search
     on the build host

     (From OE-Core rev: 9a4ea4ff856e2379888ea5cdcc0e761956e1f53b)

     Signed-off-by: Khem Raj <raj.khem@gmail.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb 
b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
index 0d7bddbc7f..0daf7a6877 100644
--- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -19,6 +19,10 @@ DEPENDS = "virtual/libiconv libunistring"

  inherit pkgconfig autotools gettext texinfo gtk-doc lib_package

+EXTRA_OECONF += "--disable-rpath \
+ --with-libunistring-prefix=${STAGING_EXECPREFIXDIR} \
+                 "
+
  LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
  LICENSE_${PN}-bin = "GPLv3+"

Thanks.
Kai

>
> Cheers,
>
> Richard
>
>
>

-- 
Kai Kang


