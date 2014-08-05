Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C44B70620
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 10:07:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s75A7s5b017706
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Aug 2014 03:07:54 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 5 Aug 2014 03:07:53 -0700
Message-ID: <53E0ACF6.1040107@windriver.com>
Date: Tue, 5 Aug 2014 18:07:50 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1407227521.git.Chong.Lu@windriver.com>	
	<da89178aaf28354f57e6b83df496838aebb13ab6.1407227521.git.Chong.Lu@windriver.com>
	<1407232384.6981.75.camel@ted>
In-Reply-To: <1407232384.6981.75.camel@ted>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] dbus: fix ptest issue
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
X-List-Received-Date: Tue, 05 Aug 2014 10:07:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/05/2014 05:53 PM, Richard Purdie wrote:
> On Tue, 2014-08-05 at 16:33 +0800, Chong Lu wrote:
>> We use PTEST_ENABLED to decide whether build ptest package, so inherit
>> ptest.bbclass in dbus.inc in order to using PTEST_ENABLED variable.
>> Remove PACKAGES and ALLOW_EMPTY, since they have been defined in ptest.bbclass.
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/recipes-core/dbus/dbus.inc | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> index d38ba7e..6268103 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -8,10 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>>   DEPENDS = "expat virtual/libintl"
>>   RDEPENDS_dbus_class-native = ""
>>   RDEPENDS_dbus_class-nativesdk = ""
>> -PACKAGES += "${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus-ptest', '', d)}"
>> -ALLOW_EMPTY_dbus-ptest = "1"
>
> I don't think you've understood what this is doing, its conditionally
> building the separate dbus-ptest recipe, if ptest is enabled.
>
> Why is it separate? dbus-ptest needs glib and glib needs dbus. Your
> patch doesn't seem to account for any of that.
>
> "fix ptest issue" is far too vague as a summary of this patch too.
>
> Cheers,
>
> Richard
>
>
>
Hi Richard,

Previously, we use DISTRO_FEATURES to decide whether build ptest, but we 
use PTEST_ENABLED now.
PTEST_ENABLED defined in ptest.bbclass. we did't inherit ptest in dbus 
recipes, this cause we can't build dbus-ptest package.
Based on above reason, I just send this patch to fix this issue. Or do 
you have a better way?

Best Regards
Chong


