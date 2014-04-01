Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1473A60DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 12:58:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s31CwUTN018545
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 05:58:30 -0700 (PDT)
Received: from [128.224.170.220] (128.224.170.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 1 Apr 2014 05:58:30 -0700
Message-ID: <533AB7F7.2090402@windriver.com>
Date: Tue, 1 Apr 2014 15:58:31 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1396347400-9699-1-git-send-email-florin.sarbu@windriver.com>
	<20140401104720.GK2425@jama>
In-Reply-To: <20140401104720.GK2425@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpcap.inc: Add PACKAGECONFIG support for bluez
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
X-List-Received-Date: Tue, 01 Apr 2014 12:58:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2014 01:47 PM, Martin Jansa wrote:
> On Tue, Apr 01, 2014 at 01:16:40PM +0300, Florin Sarbu wrote:
>> This patch adds support for having bluez5 in PACKAGECONFIG
>> and get libpcap DEPEND on bluez5.
>>
>> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
>> ---
>>   meta/recipes-connectivity/libpcap/libpcap.inc | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
>> index a984e05..1613567 100644
>> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
>> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
>> @@ -10,8 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
>>                       file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
>>   DEPENDS = "flex-native bison-native libnl"
>>   
>> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
>> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
>> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
>> +PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
>> +PACKAGECONFIG[bluez5] = "--enable-bluetooth,--disable-bluetooth,bluez5"
> Does it work correctly?
>
> If you don't enable both you will always get at least one
> --disable-bluetooth and depending on order how packageconfigs were
> processed it will be disabled or not.
>
You are correct, the line:

+PACKAGECONFIG[bluez5] = "--enable-bluetooth,--disable-bluetooth,bluez5"

should be:


+PACKAGECONFIG[bluez5] = "--enable-bluetooth,,bluez5"


to get it to work as expected until bluez5 is replacing entirely bluez4.

Florin

>>   PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
>>   PACKAGECONFIG[libnl1] = "--with-libnl,--without-libnl,libnl1,libnl1"
>>   
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


