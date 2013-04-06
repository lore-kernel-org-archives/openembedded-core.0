Received: from mail-qe0-f41.google.com ([209.85.128.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UOQgF-0004RQ-He
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 12:49:11 +0200
Received: by mail-qe0-f41.google.com with SMTP id b10so1174055qen.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 03:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=tS7sQDB7o4BtLmOs6Ez02XYx+m4DyFloYg6UN8i+el8=;
	b=JLcLvmdIzJ01KB7mZ01XY+yRSOy/Ro0i/nTjB4h8f22HKriXqsCV6HVk3UhiPFmWas
	TF56RUvM4tqygifhAnAklR9J55/6kuafH+7KfoQWwZd8Kz64D8mpTMlMtmJymHcc0NMY
	Vr5N9yZnp3+czbPYTs21Tts70TrSiHipdNFfu+cYl9QB2dmhBckki3yB1tOjceIKuUtj
	94gebr9mlDBlDTqcSntYuJUEocobP9EpIESwuHy+oyNnC6hEvWUYGQHoIIFhP96I/yRF
	xYaB+ap39jquZmMjfOXeXaxCaJcXWZcsqm34m6VwdWTt4DgmYkfiho2Yld+tTnU7eOfQ
	aaOw==
MIME-Version: 1.0
X-Received: by 10.49.60.1 with SMTP id d1mr13080098qer.33.1365244311677; Sat,
	06 Apr 2013 03:31:51 -0700 (PDT)
Received: by 10.49.36.41 with HTTP; Sat, 6 Apr 2013 03:31:51 -0700 (PDT)
In-Reply-To: <230587AC-FD28-420F-8DED-B6AADBD5DE28@dominion.thruhere.net>
References: <1365201484-3514-1-git-send-email-kirgene@gmail.com>
	<230587AC-FD28-420F-8DED-B6AADBD5DE28@dominion.thruhere.net>
Date: Sat, 6 Apr 2013 13:31:51 +0300
Message-ID: <CADV-EXE609FFWX2MjciFwOcpEbT8h1xYc0vy20OqzVj6+qdKDw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sat, 06 Apr 2013 10:49:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/4/6 Koen Kooi <koen@dominion.thruhere.net>:
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
>>            file://touchscreen.rules \
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
>>                  --disable-tcpwrap \
>>                  --enable-split-usr \
>>                  --disable-microhttpd \
>> -                 --without-python \
>
> --with-python ?
>
I use
>> +PACKAGECONFIG[python] = "--with-python,--without-python,python"

>>                  --with-sysvrcnd-path=${sysconfdir} \
>>                  ac_cv_path_KILL=${base_bindir}/kill \
>>                "
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

Best regards,
Yevhen


