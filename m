Received: from outbound-relay8.guardedhost.com (outbound-relay8.guardedhost.com [216.239.133.208])
 by mx.groups.io with SMTP id smtpd.web11.3593.1607029273408945745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 13:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.208, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (mx02.guardedhost.com [IPv6:2607:fe90:1:1::53:1])
	by outbound-relay5.guardedhost.com (Postfix) with ESMTP id 4Cn7Y50cfBz1Wk;
	Thu,  3 Dec 2020 21:01:13 +0000 (GMT)
Received: from Alans-MacBook-Pro.local (c-73-254-147-133.hsd1.wa.comcast.net [73.254.147.133])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPA id 4Cn7Y41MRrz30Kv;
	Thu,  3 Dec 2020 21:01:12 +0000 (GMT)
Subject: Re: [OE-core] [PATCH 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20201202191124.15903-1-alanp@snowmoose.com>
 <CAJ86T=XzCC8z=qvzUdpfFbmvBasx4+iV81Dpk_FFszQKEqD2pA@mail.gmail.com>
From: "Alan Perry" <alanp@snowmoose.com>
Message-ID: <9c502cf3-fac3-dfa0-a722-0c09e41ba9e1@snowmoose.com>
Date: Thu, 3 Dec 2020 13:01:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XzCC8z=qvzUdpfFbmvBasx4+iV81Dpk_FFszQKEqD2pA@mail.gmail.com>
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: AD0F0364-35AA-11EB-9851-C50D65746EFE
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx2.omnis.com
X-Virus-Status: Clean
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/2/20 11:29 PM, Andre McCurdy wrote:
> On Wed, Dec 2, 2020 at 11:11 AM Alan Perry <alanp@snowmoose.com> wrote:
>> Many scripts exist that expect the iproute2 tools to be found in
>> the same directories where they are found in Debian or Ubuntu.
>> For the iproute2 tools included in the iproute2 recipe, move
>> them to those directories or create links there. Also, add
>> bash-completion files as is done by Debian and Ubuntu.
> Rather than creating symlinks etc, could this be done more cleanly by
> having "make install" install to the Debian paths directly?
>
> (Presumably Debian isn't manually moving files after "make install",
> they are just configuring the build differently).

I am not an expert in how Debian does its build, but it appears that all 
of the iproute2 tools are in sbin after they are built and then an 
install file in Debian source and not in the iproute2 upstream directs 
some of what is built to be installed in other directories.

>
>> Signed-off-by: Alan Perry <alanp@snowmoose.com>> ---
>>   .../iproute2/iproute2.inc                     | 21 +++++++++++++++++--
>>   1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
>> index 403d264308..21f52f80bc 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>> @@ -41,6 +41,21 @@ do_install () {
>>       install -d ${D}${datadir}
>>       mv ${D}/share/* ${D}${datadir}/ || true
>>       rm ${D}/share -rf || true
>> +
>> +    install -d ${D}${base_bindir}
>> +    ln -s /sbin/ip ${D}${base_bindir}/ip
>> +    mv ${D}${base_sbindir}/ss ${D}${base_bindir}/ss
>> +
>> +    install -d ${D}${bindir}
>> +    mv ${D}${base_sbindir}/nstat ${D}${bindir}/nstat
>> +    mv ${D}${base_sbindir}/lnstat ${D}${bindir}/lnstat
>> +    mv ${D}${base_sbindir}/ctstat ${D}${bindir}/ctstat
>> +    mv ${D}${base_sbindir}/rtstat ${D}${bindir}/rtstat
>> +    mv ${D}${base_sbindir}/routef ${D}${bindir}/routef
>> +    mv ${D}${base_sbindir}/routel ${D}${bindir}/routel
>> +
>> +    install -d ${D}${sbindir}
>> +    mv ${D}${base_sbindir}/genl ${D}${sbindir}/genl
>>   }
>>
>>   # The .so files in iproute2-tc are modules, not traditional libraries
>> @@ -59,7 +74,8 @@ PACKAGES =+ "\
>>   "
>>
>>   FILES_${PN}-tc = "${base_sbindir}/tc* \
>> -                  ${libdir}/tc/*.so"
>> +                  ${libdir}/tc/*.so \
>> +                  ${datadir}/bash-completion/completions/tc"
>>   FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
>>                         ${base_sbindir}/ctstat \
>>                         ${base_sbindir}/rtstat"
>> @@ -69,7 +85,8 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
>>   FILES_${PN}-nstat = "${base_sbindir}/nstat"
>>   FILES_${PN}-ss = "${base_sbindir}/ss"
>>   FILES_${PN}-tipc = "${base_sbindir}/tipc"
>> -FILES_${PN}-devlink = "${base_sbindir}/devlink"
>> +FILES_${PN}-devlink = "${base_sbindir}/devlink \
>> +                       ${datadir}/bash-completion/completions/devlink"
>>
>>   ALTERNATIVE_${PN} = "ip"
>>   ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
>> --
>> 2.17.1
>>
>>
>> 
>>

