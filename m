Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1Syojm-0002b3-Nb
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:42:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q77IUp51008105
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 11:30:51 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 7 Aug 2012 11:30:50 -0700
Message-ID: <50215ED9.3070505@windriver.com>
Date: Tue, 7 Aug 2012 14:30:49 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com>
In-Reply-To: <502152B8.6070100@gmail.com>
X-Originating-IP: [128.224.147.210]
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
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
X-List-Received-Date: Tue, 07 Aug 2012 18:42:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-07 01:39 PM, Derek Buitenhuis wrote:
> On 07/08/2012 1:31 PM, Yao Zhao wrote:
>> In order to fix the QA Issue for libpam which installed to /lib but
>> reference /usr/libxx/libz and libcrack, install libz and libcrack
>> to /lib.
> OpenBSD puts libpam.so in /lib, so it seems kosher...
>
>>   do_install() {
>> -	oe_runmake DESTDIR=${D} install
>> +	#libz.a installs to libdir, overwrite the env libdir
>> +	#install pkgconfig to env libdir/pkgconfig
>> +	oe_runmake DESTDIR=${D} pkgconfigdir="${libdir}/pkgconfig" \
>> +		   libdir="${base_libdir}" install
>>   }
> If you're specifying --libdir when configuring, why do you need
> libdir during make, as well?
zlib is not using autotools although it has configure.
when install, oe_runmake will be make -e so Makefile will always use 
env's libdir which is the usr/libxx, we have to overwrite it when install.

yao
> - Derek
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




