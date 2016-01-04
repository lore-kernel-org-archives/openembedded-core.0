Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E286E606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:09:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0429G06002700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Jan 2016 18:09:16 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 3 Jan 2016 18:09:16 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1451382094.git.kai.kang@windriver.com>
	<c46aeee4002b37e3f84433f78cbb82278e5d066e.1451382094.git.kai.kang@windriver.com>
	<D6F56C56-75BE-40AD-BDDC-AE6F14263057@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5689D451.3090005@windriver.com>
Date: Mon, 4 Jan 2016 10:09:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <D6F56C56-75BE-40AD-BDDC-AE6F14263057@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Revert "glib-2.0: build dependency cleanup"
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
X-List-Received-Date: Mon, 04 Jan 2016 02:09:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年12月31日 16:50, Khem Raj wrote:
>> On Dec 29, 2015, at 1:43 AM, kai.kang@windriver.com wrote:
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> This reverts commit fcd7494b347423185c883b2897c4908929843a71.
>>
>> It uses command glib-genmarshal to build glib-2.0 which is from
>> glibc-2.0-native. If the command doesn't exist on host, build fails
> typo 'glib-2.0-native'

Correct it in pull branch on poky-contrib. Thanks.

--Kai

>
>> with error:
>>
>> | /bin/sh: --prefix=test_marshal: command not found
>> | make[4]: *** [testmarshal.c] Error 127
>>
>> So add the dependency back.
> I ran into the regression as well. So this patch is good.
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> meta/recipes-core/glib-2.0/glib.inc | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
>> index 86f7e0e..8e4dcd7 100644
>> --- a/meta/recipes-core/glib-2.0/glib.inc
>> +++ b/meta/recipes-core/glib-2.0/glib.inc
>> @@ -17,10 +17,10 @@ SECTION = "libs"
>>
>> BBCLASSEXTEND = "native nativesdk"
>>
>> -DEPENDS = "virtual/libiconv libffi zlib"
>> -DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' glib-2.0-native dbus', '', d)}"
>> +DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
>> +DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
>> DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
>> -DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib"
>> +DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib ${BPN}-native"
>>
>> PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
>>
>> --
>> 2.6.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Regards,
Neil | Kai Kang


