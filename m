Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E535F6EA1C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 06:09:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3469DR8014705
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Apr 2014 23:09:13 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 3 Apr 2014 23:09:12 -0700
Message-ID: <533E4C85.2030509@windriver.com>
Date: Fri, 4 Apr 2014 14:09:09 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1395194072.git.Chong.Lu@windriver.com>
	<3e91ee5bf0390d700dd57ed89b1dba1434e3f17c.1395194072.git.Chong.Lu@windriver.com>
	<533DC530.1030400@linux.intel.com>
In-Reply-To: <533DC530.1030400@linux.intel.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH V3 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Fri, 04 Apr 2014 06:09:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/04/2014 04:31 AM, Saul Wold wrote:
> On 03/18/2014 07:00 PM, Chong Lu wrote:
>> If image contains dbus and ptest is in DISTRO_FEATURES, dbus-ptest 
>> package
>> is installed, regardless of whether ptest-pkgs is in IMAGE_FEATURES. 
>> This
>> issue will increase size for most small images.
>> This patch fixes this problem.
>>
>> [YOCTO #5702]
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => 
>> dbus-test_1.6.18.bb} | 0
>> meta/recipes-core/dbus/dbus.inc | 4 +++-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>   rename meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => 
>> dbus-test_1.6.18.bb} (100%)
>>
>> diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb 
>> b/meta/recipes-core/dbus/dbus-test_1.6.18.bb
>> similarity index 100%
>> rename from meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
>> rename to meta/recipes-core/dbus/dbus-test_1.6.18.bb
>> diff --git a/meta/recipes-core/dbus/dbus.inc 
>> b/meta/recipes-core/dbus/dbus.inc
>> index 677ff78..6059e7c 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -6,9 +6,11 @@ LICENSE = "AFL-2 | GPLv2+"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>> file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
>>   DEPENDS = "expat virtual/libintl"
>> -RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 
>> 'dbus-ptest-ptest', '', d)}"
>>   RDEPENDS_dbus_class-native = ""
>>   RDEPENDS_dbus_class-nativesdk = ""
>> +PACKAGES += "${@base_contains('DISTRO_FEATURES', 'ptest', 
>> 'dbus-ptest', '', d)}"
>> +ALLOW_EMPTY_dbus-ptest = "1"
>> +RDEPENDS_dbus-ptest = "dbus-test-ptest"
>
> Seems like this is still causing some issues
>
>> ERROR: Nothing RPROVIDES 'nativesdk-dbus-test-ptest' (but 
>> virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-intel-gpl/build/meta/recipes-core/dbus/dbus_1.6.18.bb 
>> RDEPENDS on or otherwise requires it)
>> NOTE: Runtime target 'nativesdk-dbus-test-ptest' is unbuildable, 
>> removing...
>> Missing or unbuildable dependency chain was: 
>> ['nativesdk-dbus-test-ptest']
>> ERROR: Required build target 'nativesdk-qt4-tools' has no buildable 
>> providers.
>> Missing or unbuildable dependency chain was: ['nativesdk-qt4-tools', 
>> 'nativesdk-dbus', 'nativesdk-dbus-test-ptest']
>
>
> As seen in this AB Failure: 
> http://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/30/steps/BuildImages/logs/stdio
>
> Sau!
>
>
Hi Saul,

I built core-image-sato-sdk after applied my patch. I didn't see error.
Can you tell me how to reproduce your building errors?

Best Regards
Chong
>
>
>
>>
>>   SRC_URI = 
>> "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>>              file://tmpdir.patch \
>>
>
>


