Received: from mail-qa0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUfvu-0000z4-0R
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 18:19:08 +0200
Received: by mail-qa0-f43.google.com with SMTP id bs12so650609qab.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=HoLj3j0kz6BMh/ph3Oa7BR4wEtX0y2HoLoKj3vfm14A=;
	b=qdrb1nFXBvipJKpDS73CKMFuh5EIyaQX8rd8NLdRUoBKV4/0vUNfolTi1/3erj+WYP
	Ei/6KV2QgssHoivAduwaP7dIGagDrgEMZ8iaw9/5tSViHhcCjTCNxQja1uQASPRJC6yr
	1MTqKEFt7b2RxNcjAYzkzOWvi0wIskle0rtS2mkHqc/4cJ8CU8xJrGq4tsn04sajoFg9
	n70w3X1a2nucOv8+EQSdN/MsEc6ICL2vM8sXh1k0Dlgeiyr3wIuUywvhfUcaLPJb4T+d
	tmzHuv4lNIsWBl2MLQANqUtri8Jd6mgsfhqLiT99gZCfKU31mA/TqNp4d9nbbZTL28QH
	4KGg==
MIME-Version: 1.0
X-Received: by 10.224.44.2 with SMTP id y2mr25773655qae.7.1366732885066; Tue,
	23 Apr 2013 09:01:25 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Tue, 23 Apr 2013 09:01:25 -0700 (PDT)
In-Reply-To: <5176A976.3020706@linux.intel.com>
References: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
	<5176A976.3020706@linux.intel.com>
Date: Tue, 23 Apr 2013 19:01:25 +0300
Message-ID: <CADV-EXFMWLBUmz2GZSwXKGBTd4HuxSU5Tu=m0kdNou-mxz5jHA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 16:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'll send new patch without python in PACKAGECONFIG.
Best regards,
Yevhen


2013/4/23 Saul Wold <sgw@linux.intel.com>:
> On 04/23/2013 02:13 AM, Yevhen Kyriukha wrote:
>>
>> ---
>>   meta/recipes-core/systemd/systemd_199.bb |   20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_199.bb
>> b/meta/recipes-core/systemd/systemd_199.bb
>> index 5240443..bbae6f8 100644
>> --- a/meta/recipes-core/systemd/systemd_199.bb
>> +++ b/meta/recipes-core/systemd/systemd_199.bb
>> @@ -16,7 +16,13 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam',
>> 'libpam', '', d)}"
>>
>>   SECTION = "base/shell"
>>
>> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
>> update-alternatives
>> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
>> update-alternatives pythonnative python-dir
>> +
>> +# need to export these variables for python-config to work
>> +export BUILD_SYS
>> +export HOST_SYS
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>>
>>   SRC_URI =
>> "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>>              file://touchscreen.rules \
>> @@ -46,11 +52,13 @@ LDFLAGS_libc-uclibc_append = " -lrt"
>>
>>   GTKDOC_DOCDIR = "${S}/docs/"
>>
>> -PACKAGECONFIG ??= "xz"
>> +PACKAGECONFIG ??= "xz python"
>
>
> I believe that the default should be python is not enabled.
>
> Sau!
>
>
>>   # Sign the journal for anti-tampering
>>   PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>>   # Compress the journal
>>   PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>> +# Use python-systemd
>> +PACKAGECONFIG[python] = "--with-python,--without-python,python"
>>
>>   CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
>>
>> @@ -65,7 +73,6 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
>>                    --disable-tcpwrap \
>>                    --enable-split-usr \
>>                    --disable-microhttpd \
>> -                 --without-python \
>>                    --with-sysvrcnd-path=${sysconfdir} \
>>                    --with-firmware-path=/lib/firmware \
>>                    ac_cv_path_KILL=${base_bindir}/kill \
>> @@ -119,7 +126,7 @@ python populate_packages_prepend (){
>>   }
>>   PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
>>
>> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze
>> ${PN}-kernel-install"
>> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze
>> ${PN}-kernel-install python-${PN} python-${PN}-dbg python-${PN}-dev"
>>
>>   USERADD_PACKAGES = "${PN}"
>>   GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
>> @@ -129,6 +136,11 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>>   FILES_${PN}-initramfs = "/init"
>>   RDEPENDS_${PN}-initramfs = "${PN}"
>>
>> +FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py*
>> ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
>> +RDEPENDS_python-${PN} = "python-core python-datetime python-logging
>> python-syslog"
>> +FILES_python-${PN}-dev = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
>> +FILES_python-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
>> +
>>   FILES_${PN}-gui = "${bindir}/systemadm"
>>
>>   FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup
>> \
>>
>


