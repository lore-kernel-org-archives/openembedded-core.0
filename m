Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5F92D6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 01:24:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 Nov 2014 17:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="421049890"
Received: from unknown (HELO [10.255.13.72]) ([10.255.13.72])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2014 17:14:52 -0800
Message-ID: <5473DA53.3090500@linux.intel.com>
Date: Mon, 24 Nov 2014 17:24:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1416843472-16839-1-git-send-email-sgw@linux.intel.com>
	<5473C3BF.10108@gmail.com>
In-Reply-To: <5473C3BF.10108@gmail.com>
Subject: Re: [PATCH v2] resolvconf: add fixes for busybox and make it work
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
X-List-Received-Date: Tue, 25 Nov 2014 01:24:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/2014 03:48 PM, akuster808 wrote:
> is this needed for dizzy?
>
Sure once it's proved, btw do you have the babeltrace patch I sent.

Sau!

> - armin
>
> On 11/24/2014 07:37 AM, Saul Wold wrote:
>> resolvconf was missing a script and needed readlink which was in
>> /usr/bin.  Also the /etc/resolv.conf was not being correctly linked
>> to /etc/resolvconf/run/resolv.conf, which is fixed by the volaties
>> change which is now a file as opposed to created in do_install.
>>
>> Ensure that the correct scripts for ifup/ifdown get installed and that
>> resolvconf is correctly enabled at startup
>>
>> [YOCTO #5361]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   .../resolvconf/resolvconf/99_resolvconf              |  4 ++++
>>   .../resolvconf/resolvconf/fix-path-for-busybox.patch | 20
>> ++++++++++++++++++++
>>   .../resolvconf/resolvconf_1.76.bb                    | 17
>> ++++++++++++++---
>>   3 files changed, 38 insertions(+), 3 deletions(-)
>>   create mode 100644
>> meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
>>   create mode 100644
>> meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
>>
>>
>> diff --git
>> a/meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
>> b/meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
>> new file mode 100644
>> index 0000000..3790d77
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
>> @@ -0,0 +1,4 @@
>> +d root root 0755 /var/run/resolvconf/interface none
>> +f root root 0644 /etc/resolvconf/run/resolv.conf none
>> +f root root 0644 /etc/resolvconf/run/enable-updates none
>> +l root root 0644 /etc/resolv.conf /etc/resolvconf/run/resolv.conf
>> diff --git
>> a/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
>> b/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
>>
>> new file mode 100644
>> index 0000000..1aead07
>> --- /dev/null
>> +++
>> b/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
>>
>> @@ -0,0 +1,20 @@
>> +
>> +busybox installs readlink into /usr/bin, so ensure /usr/bin
>> +is in the path.
>> +
>> +Upstream-Status: Submitted
>> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> +
>> +Index: resolvconf-1.76/etc/resolvconf/update.d/libc
>> +===================================================================
>> +--- resolvconf-1.76.orig/etc/resolvconf/update.d/libc
>> ++++ resolvconf-1.76/etc/resolvconf/update.d/libc
>> +@@ -16,7 +16,7 @@
>> + #
>> +
>> + set -e
>> +-PATH=/sbin:/bin
>> ++PATH=/sbin:/bin:/usr/bin
>> +
>> + [ -x /lib/resolvconf/list-records ] || exit 1
>> +
>> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
>> b/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
>> index eb29a2a..20a2c19 100644
>> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
>> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
>> @@ -11,7 +11,11 @@ AUTHOR = "Thomas Hood"
>>   HOMEPAGE = "http://packages.debian.org/resolvconf"
>>   RDEPENDS_${PN} = "bash"
>>
>> -SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.xz"
>> +SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.xz \
>> +           file://fix-path-for-busybox.patch \
>> +           file://99_resolvconf \
>> +          "
>> +
>>
>>   SRC_URI[md5sum] = "d78ce30ea068999cd3e0523300b27255"
>>   SRC_URI[sha256sum] =
>> "c9f40f7405b37399ddbf29ca4205b4911ee35cb9ffd9be7671faa2385b1fa573"
>> @@ -24,13 +28,13 @@ do_compile () {
>>
>>   do_install () {
>>       install -d ${D}${sysconfdir}/default/volatiles
>> -    echo "d root root 0755 ${localstatedir}/run/${BPN}/interface none" \
>> -         > ${D}${sysconfdir}/default/volatiles/99_resolvconf
>> +    install -m 0644 ${WORKDIR}/99_resolvconf
>> ${D}${sysconfdir}/default/volatiles
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
>> 'false', d)}; then
>>           install -d ${D}${sysconfdir}/tmpfiles.d
>>           echo "d /run/${BPN}/interface - - - -" \
>>                > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
>>       fi
>> +    install -d ${D}${base_libdir}/${BPN}
>>       install -d ${D}${sysconfdir}/${BPN}
>>       ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>>       install -d ${D}${sysconfdir} ${D}${base_sbindir}
>> @@ -38,6 +42,11 @@ do_install () {
>>       cp -pPR etc/* ${D}${sysconfdir}/
>>       chown -R root:root ${D}${sysconfdir}/
>>       install -m 0755 bin/resolvconf ${D}${base_sbindir}/
>> +    install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
>> +    install -d ${D}/${sysconfdir}/network/if-up.d
>> +    install -m 0755 debian/resolvconf.000resolvconf.if-up
>> ${D}/${sysconfdir}/network/if-up.d/000resolvconf
>> +    install -d ${D}/${sysconfdir}/network/if-down.d
>> +    install -m 0755 debian/resolvconf.resolvconf.if-down
>> ${D}/${sysconfdir}/network/if-down.d/resolvconf
>>       install -m 0644 README ${D}${docdir}/${P}/
>>       install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
>>   }
>> @@ -51,3 +60,5 @@ pkg_postinst_${PN} () {
>>           fi
>>       fi
>>   }
>> +
>> +FILES_${PN} += "${base_libdir}/${BPN}"
>>
>
>

