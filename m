Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RmdrO-0007RL-6c
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 05:07:54 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Jan 2012 20:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="56764943"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jan 2012 20:00:17 -0800
Message-ID: <4F13A0D1.7000700@linux.intel.com>
Date: Sun, 15 Jan 2012 20:00:17 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326184668-14332-1-git-send-email-james@digitalmatter.com.au>
	<840A81C1B782724A8EB52725BD519EFF040C6A85@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF040C6A85@MBX20.4emm.local>
Subject: Re: [PATCH] ghostscript: build cups filters
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
X-List-Received-Date: Mon, 16 Jan 2012 04:07:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2012 05:12 PM, James Limbouris wrote:
>> -----Original Message-----
>> From: James Limbouris [mailto:james@digitalmatter.com.au]
>> Sent: Tuesday, 10 January 2012 4:38 PM
>> To: Openembedded-core@lists.openembedded.org
>> Cc: James Limbouris
>> Subject: [PATCH] ghostscript: build cups filters
>>
>> Cups filters are no longer built by default. Since ghostscript already depends
>> on cups, build the filters and package them as ghostscript-cups.
>>
>> Ghostscript uses the cups-config script from the oe sysroots to determine some
>> of the target install paths, as well as to determine the linker path. The config
>> script gives out paths pointing to the sysroot, so some of the paths needed to
>> be adjusted in the Makefile.
>>
>> Signed-off-by: James Limbouris<james@digitalmatter.com.au>
>> ---
>>   .../ghostscript/ghostscript_9.04.bb                |   29 ++++++++++++++++---
>>   1 files changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
>> b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
>> index 7178524..80d363f 100644
>> --- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
>> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
>> @@ -15,7 +15,7 @@ SECTION = "console/utils"
>>   LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
>>
>> -PR = "r2"
>> +PR = "r3"
>>
>>   DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
>>   DEPENDS_virtclass-native = ""
>> @@ -34,7 +34,8 @@ SRC_URI_virtclass-native = "${SRC_URI_BASE}"
>>   SRC_URI[md5sum] = "9c2fb4af1eb609d09dba5bb0fa76173a"
>>   SRC_URI[sha256sum] =
>> "f1e333738c41c3bf2b47ceb9806abb8045bcdc7353002c32736150425a7c1ef4"
>>
>> -EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --
>> without-jasper --with-fontpath=${datadir}/fonts"
>> +EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --
>> without-jasper \
>> +                --with-fontpath=${datadir}/fonts --with-install-cups"
>>
>>   # This has been fixed upstream but for now we need to subvert the check for
>> time.h
>>   # http://bugs.ghostscript.com/show_bug.cgi?id=692443
>> @@ -60,6 +61,14 @@ do_configure_append () {
>>   			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i
>> obj/aux/$i
>>   		done
>>   	fi
>> +
>> +	# replace cups paths from sysroots/.../usr/bin/crossscripts/cups-config
>> with target paths
>> +	# CUPSDATA is compiled into a utility, and CUPSSERVERBIN is used as
>> an install path
>> +	CUPSSERVERBIN=${exec_prefix}/lib/cups          # /usr/lib NOT libdir
>> +	CUPSDATA=${datadir}/cups
>> +
>> +	sed -e "s#^CUPSSERVERBIN=.*#CUPSSERVERBIN=${CUPSSERVERBIN}#"
>> -i Makefile
>> +	sed -e "s#^CUPSDATA=.*#CUPSDATA=${CUPSDATA}#" -i Makefile
>>   }
>>
>>   do_install_append () {
>> @@ -67,9 +76,7 @@ do_install_append () {
>>       cp -r Resource ${D}${datadir}/ghostscript/${PV}/
>>       cp -r iccprofiles ${D}${datadir}/ghostscript/${PV}/
>>
>> -    if [ -f ${D}${sysconfdir}/cups ]; then
>> -        chown -R root:lp ${D}${sysconfdir}/cups
>> -    fi
>> +    chown -R root:lp ${D}${sysconfdir}/cups
>>   }
>>
>>   python do_patch_virtclass-native () {
>> @@ -95,3 +102,15 @@ BBCLASSEXTEND = "native"
>>   # Ghostscript install tool 'instcopy' tries to remove already created
>>   # directories during install and parallel make causes problems.
>>   PARALLEL_MAKEINST=""
>> +
>> +PACKAGES =+ "${PN}-cups"
>> +
>> +FILES_${PN}-dbg += "${exec_prefix}/lib/cups/filter/.debug"
>> +
>> +FILES_${PN}-cups += "${exec_prefix}/lib/cups/filter/gstoraster \
>> +                     ${exec_prefix}/lib/cups/filter/pstopxl \
>> +                     ${datadir}/cups \
>> +                     ${sysconfdir}/cups \
>> +                     "
>> +
>> +RDEPENDS_${PN}-cups = ${PN}
>> --
>> 1.7.3.4
>
> Ping?
>
I have it in my pending queue, which other issues so it delayed this 
getting out.

Working on it for tomorrow.

Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


