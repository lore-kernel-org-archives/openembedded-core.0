Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RFqTL-0001sF-4q
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 18:55:31 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2011 09:49:37 -0700
Received: by wyg24 with SMTP id 24so713045wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 09:49:36 -0700 (PDT)
Received: by 10.227.11.75 with SMTP id s11mr7369541wbs.62.1318870176144;
	Mon, 17 Oct 2011 09:49:36 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ff1sm6818307wbb.8.2011.10.17.09.49.34
	(version=SSLv3 cipher=OTHER); Mon, 17 Oct 2011 09:49:35 -0700 (PDT)
Message-ID: <4E9C5C9C.8060107@intel.com>
Date: Mon, 17 Oct 2011 09:49:32 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318865134-4380-1-git-send-email-koen@dominion.thruhere.net>
	<9945D4F2-8DB8-420E-BF9C-B20D335221C7@dominion.thruhere.net>
In-Reply-To: <9945D4F2-8DB8-420E-BF9C-B20D335221C7@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] bind 9.8.1: fix build after recent update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2011 16:55:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2011 08:59 AM, Koen Kooi wrote:
>
> Op 17 okt. 2011, om 17:25 heeft Koen Kooi het volgende geschreven:
>
>> | checking linking as -lgssapi -lkrb5 -ldes -lcrypt -lasn1 -lroken -lcom_err... no
>> | checking linking as -lgssapi -lkrb5 -lcrypto -lcrypt -lasn1 -lroken -lcom_err... no
>> | checking linking as -lgss -lkrb5... no
>> | configure: error: could not determine proper GSSAPI linkage
>> | + bbfatal 'oe_runconf failed'
>> | + echo 'ERROR: oe_runconf failed'
>>
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>> meta/recipes-connectivity/bind/bind_9.8.1.bb |    5 +++--
>> 1 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
>> index 330acdb..af473e9 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
>> @@ -6,10 +6,10 @@ LICENSE = "ISC&  BSD"
>> LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
>>
>> DEPENDS = "openssl"
>> -PR = "r0"
>> +PR = "r1"
>>
>> SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>> -	   file://conf.patch \
>> +           file://conf.patch \
>>             file://cross-build-fix.patch \
>> 	   "
>>
>> @@ -19,6 +19,7 @@ SRC_URI[sha256sum] = "02285dc429cb2a6687a1b2446e9ee22c1df27f2577225b05be5092395e
>> # --enable-exportlib is necessary for building dhcp
>> EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads \
>>                   --disable-devpoll --disable-epoll --with-gost=no \
>
> Not related to my patch: if someone can explain we we disable epoll I would appreciate it, since we generally want it enabled and I think we're using recent enough kernels (2.6.26+) where epoll finally got hooked up for arm
>
Koen,

Thanks for pointing this out, a little code spelunking showed that 
Holger added this back in '08, you might be right about epoll at this 
point.  Have you tested that we can pass the configure stage and build a 
working bind?

On your gssapi, just curious under what OS conditions you found this, I 
wonder why it passed on multiple systems that I built it on.

Thanks
    Sau!

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



