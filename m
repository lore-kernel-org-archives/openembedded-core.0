Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2193E708F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 02:05:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6T2589s026472
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 19:05:09 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 28 Jul 2014 19:05:08 -0700
Message-ID: <53D70167.5030606@windriver.com>
Date: Tue, 29 Jul 2014 10:05:27 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1406525420.git.Qi.Chen@windriver.com>	
	<441004b90226e88ca148d267d4474c7d54853819.1406525420.git.Qi.Chen@windriver.com>
	<1406553715.13346.18.camel@ted>
In-Reply-To: <1406553715.13346.18.camel@ted>
X-Originating-IP: [128.224.162.187]
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] systemd: add volatile-binds to RDEPENDS
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
X-List-Received-Date: Tue, 29 Jul 2014 02:05:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2014 09:21 PM, Richard Purdie wrote:
> On Mon, 2014-07-28 at 13:34 +0800, Chen Qi wrote:
>> ---
>>   meta/recipes-core/systemd/systemd_213.bb |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
>> index 5de7cdc..4fb7ffc 100644
>> --- a/meta/recipes-core/systemd/systemd_213.bb
>> +++ b/meta/recipes-core/systemd/systemd_213.bb
>> @@ -243,6 +243,7 @@ FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_uni
>>   FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>>   
>>   RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
>> +RDEPENDS_${PN} += "volatile-binds"
>>   
>>   RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
>>                         util-linux-agetty \
> Do we always need/want to include this? Does this have any implications
> for rw systems? I couldn't immediately see how this triggers on a ro
> system...
>
> Cheers,
>
> Richard
>
>
>

Hi Richard,

Take var-lib-volatile.service as an example.
In the service file, we have:

ConditionPathIsReadWrite=!/var/lib


So if /var/lib is rw, the service is not started. On a ro system, 
/var/lib is read-only, and the service is started.


I just realized that I didn't put comments in these patches.
I'll send out a V2.

Best Regards,
Chen Qi

