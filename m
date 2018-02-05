Return-Path: <prvs=5674cc8ee=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id F394271BB9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2873; q=dns/txt;
	s=ironport2; t=1517835073; x=1549371073;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=Yqq9GMldl6PiBLE7uotH4YMC1xFyPxGivRpK4/vxEFY=;
	b=2ZjgDiGm6w/MHNTNSmOZa/fIPyoE0rwyf8+eEHw1buhTyGGvesf0mk2r
	k3oMSvvb0AQKqg7n/m9ZyVmgK9S/jfTjDXv5JY3D+rypD/XuoBY6oWNei
	v4eLssQNz5WKTTnSvZ4OC0HVaFS1EwOBufAhoxch46Q6GAacL3ZouM+o4 Q=;
X-IronPort-AV: E=Sophos;i="5.46,464,1511823600"; 
   d="scan'208";a="3010770"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 13:51:10 +0100
Received: from [172.16.11.15] (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1; Mon, 5 Feb 2018 13:51:09
	+0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <20180205122544.27223-1-mnhu@prevas.dk>
	<20180205122544.27223-2-mnhu@prevas.dk>
	<1517834950.3090.80.camel@linuxfoundation.org>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <ce847aa4-fd11-c467-e919-0c3b5720e428@prevas.dk>
Date: Mon, 5 Feb 2018 13:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517834950.3090.80.camel@linuxfoundation.org>
X-Originating-IP: [172.16.8.31]
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH] bind: add packageconfig for python-support
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
X-List-Received-Date: Mon, 05 Feb 2018 12:51:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2018-02-05 13:49, Richard Purdie wrote:
> On Mon, 2018-02-05 at 13:25 +0100, Martin Hundebøll wrote:
>> Break the hard runtime dependency on python3-core by adding a
>> (default-on) packageconfig option for python.
>>
>> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
>> ---
>>   meta/recipes-connectivity/bind/bind_9.10.6.bb | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> b/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> index 8b8835ba80..2ec7ab44f0 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> @@ -38,16 +38,19 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --
>> enable-threads \
>>                    --with-openssl=${STAGING_LIBDIR}/.. \
>>                  "
>>   
>> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
>> +inherit autotools update-rc.d systemd useradd pkgconfig
>>   
>>   export PYTHON_SITEPACKAGES_DIR
>>   
>>   # PACKAGECONFIGs readline and libedit should NOT be set at same time
>> -PACKAGECONFIG ?= "readline"
>> +PACKAGECONFIG ?= "readline python"
>>   PACKAGECONFIG[httpstats] = "--with-libxml2,--without-
>> libxml2,libxml2"
>>   PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>>   PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>>   PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-
>> randomdev=/dev/random,,"
>> +PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-
>> python,python3-core,python3-core"
>> +
>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python',
>> 'python3native', '', d)}
>>   
>>   USERADD_PACKAGES = "${PN}"
>>   USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind
>> --no-create-home \
>> @@ -60,7 +63,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
>>   
>>   PARALLEL_MAKE = ""
>>   
>> -RDEPENDS_${PN} = "python3-core"
>>   RDEPENDS_${PN}-dev = ""
>>   
>>   PACKAGE_BEFORE_PN += "${PN}-utils"
>> @@ -88,7 +90,11 @@ do_install_append() {
>>   	install -d "${D}${sysconfdir}/init.d"
>>   	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>>   	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
>> -	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,'
>> ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
>> +
>> +	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python',
>> 'python', '', d)}" ]; then
>> +		sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
>> +			${D}${sbindir}/dnssec-coverage
>> ${D}${sbindir}/dnssec-checkds
>> +	fi
> 
> Rather than having a broken file, shouldn't it be deleted in the "no
> python" case?

Bind is clever enough to avoid installing it in that case...

// Martin

