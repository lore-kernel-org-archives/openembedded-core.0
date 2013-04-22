Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UUKw3-0001MV-96
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 19:53:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2013 10:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,528,1363158000"; d="scan'208";a="323049516"
Received: from unknown (HELO [10.255.13.224]) ([10.255.13.224])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2013 10:36:10 -0700
Message-ID: <5175750A.1080108@linux.intel.com>
Date: Mon, 22 Apr 2013 10:36:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>
References: <1365201484-3514-1-git-send-email-kirgene@gmail.com>
	<230587AC-FD28-420F-8DED-B6AADBD5DE28@dominion.thruhere.net>
In-Reply-To: <230587AC-FD28-420F-8DED-B6AADBD5DE28@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: added python-systemd package generation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 17:54:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2013 03:24 AM, Koen Kooi wrote:
>
> Op 6 apr. 2013, om 00:38 heeft Yevhen Kyriukha <kirgene@gmail.com> het volgende geschreven:
>
>> ---
>> meta/recipes-core/systemd/systemd_199.bb |   20 ++++++++++++++++----
>> 1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
>> index e574548..00daf99 100644
>> --- a/meta/recipes-core/systemd/systemd_199.bb
>> +++ b/meta/recipes-core/systemd/systemd_199.bb
>> @@ -15,7 +15,13 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>
>> SECTION = "base/shell"
>>
>> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
>> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d pythonnative python-dir
>> +
>> +# need to export these variables for python-config to work
>> +export BUILD_SYS
>> +export HOST_SYS
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>>
>> SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>>             file://touchscreen.rules \
>> @@ -44,11 +50,13 @@ LDFLAGS_libc-uclibc_append = " -lrt"
>>
>> GTKDOC_DOCDIR = "${S}/docs/"
>>
>> -PACKAGECONFIG ??= "xz"
>> +PACKAGECONFIG ??= "xz python"
>> # Sign the journal for anti-tampering
>> PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>> # Compress the journal
>> PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>> +# Use python-systemd
>> +PACKAGECONFIG[python] = "--with-python,--without-python,python"
>>
>> CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
>>
>> @@ -65,7 +73,6 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
>>                   --disable-tcpwrap \
>>                   --enable-split-usr \
>>                   --disable-microhttpd \
>> -                 --without-python \
>
> --with-python ?
>
>>                   --with-sysvrcnd-path=${sysconfdir} \
>>                   ac_cv_path_KILL=${base_bindir}/kill \
>>                 "
>> @@ -114,7 +121,7 @@ python populate_packages_prepend (){
>> }
>> PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
>>
>> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
>> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN} python-${PN}-dbg python-${PN}-staticdev"
>>
>> USERADD_PACKAGES = "${PN}"
>> GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
>> @@ -124,6 +131,11 @@ FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
>> FILES_${PN}-initramfs = "/init"
>> RDEPENDS_${PN}-initramfs = "${PN}"
>>
>> +FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
>> +RDEPENDS_python-${PN} = "python-core python-datetime python-logging python-syslog"
>> +FILES_python-${PN}-staticdev = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
>
> Do libtool archives belong in -staticdev?
>
Koen is correct here, the .la files do not belong in -staticdev, but in 
the -dev package, please fix this.

Thanks
	Sau!

>
>> +FILES_python-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
>> +
>> FILES_${PN}-gui = "${bindir}/systemadm"
>>
>> FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


