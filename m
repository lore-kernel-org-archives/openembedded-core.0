Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 120BF71ADD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 14:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id CB96731C07ED;
	Sat, 19 Nov 2016 15:06:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id LqXrj52-Es8N; Sat, 19 Nov 2016 15:06:15 +0100 (CET)
Received: from [172.22.22.61] (55d458e8.access.ecotel.net [85.212.88.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B52E931C0ACA;
	Sat, 19 Nov 2016 15:06:14 +0100 (CET)
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	Linus Wallgren <linus.wallgren@scypho.com>,
	openembedded-core@lists.openembedded.org
References: <20161116163315.18662-1-linus.wallgren@scypho.com>
	<582E2C46.9090605@linux.intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <68b087d8-d920-eb83-8b53-7e561fd419cb@opendreambox.org>
Date: Sat, 19 Nov 2016 15:06:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <582E2C46.9090605@linux.intel.com>
Subject: Re: [PATCH] apt-package: Include maintenance scripts
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
X-List-Received-Date: Sat, 19 Nov 2016 14:06:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 17.11.2016 23:16, Aníbal Limón wrote:
> Your patch looks good, only missing one thing you need to conditional
> those lines to only work when systemd is enabled in DISTRO_FEATURES, see
> example:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-support/consolekit/consolekit_0.4.6.bb#n26

No, because systemd.bbclass, which consolekit doesn't inherit, deletes
all files in systemd_unitdir if systemd is not in distro features.

> On 11/16/2016 10:33 AM, Linus Wallgren wrote:
>> Apt can run multiple tasks daily, such as for example clean, update,
>> autoclean, unattended-upgrades etc.
>>
>> [YOCTO #10669]
>>
>> Signed-off-by: Linus Wallgren <linus.wallgren@scypho.com>
>> ---
>>  meta/recipes-devtools/apt/apt-package.inc | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
>> index a553aa2..38cd558 100644
>> --- a/meta/recipes-devtools/apt/apt-package.inc
>> +++ b/meta/recipes-devtools/apt/apt-package.inc
>> @@ -32,13 +32,19 @@ FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
>>  	       ${bindir}/apt-config ${bindir}/apt-cache \
>>  	       ${libdir}/apt ${libdir}/libapt*.so.* \
>>  	       ${localstatedir} ${sysconfdir} \
>> -	       ${libdir}/dpkg"
>> +	       ${libdir}/dpkg \
>> +	       ${systemd_unitdir}/system \
>> +           "
>>  FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
>>  FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages', True))} \
>>  		   ${docdir}/apt"
>>  FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}"
>>  FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
>>  
>> +inherit systemd
>> +
>> +SYSTEMD_SERVICE_${PN} = "apt-daily.timer"
>> +
>>  do_install () {
>>  	set -x
>>  	install -d ${D}${bindir}
>> @@ -75,4 +81,11 @@ do_install () {
>>  
>>  	install -d ${D}${includedir}/apt-pkg/
>>  	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
>> +
>> +    install -d ${D}${systemd_unitdir}/system/
>> +    install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
>> +    install -m 0644 ${S}/debian/apt-daily.service ${D}${systemd_unitdir}/system/
>> +    install -m 0644 ${S}/debian/apt-daily.timer ${D}${systemd_unitdir}/system/
>> +    install -d ${D}${sysconfdir}/cron.daily/
>> +    install -m 0755 ${S}/debian/apt.apt-compat.cron.daily ${D}${sysconfdir}/cron.daily/
>>  }
>>

Please consider using tabs for consistency with the rest of the recipe.

Regards,
Andreas


