Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNTxt-0005Up-VO
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 19:30:38 +0100
Received: from mail-vx0-f180.google.com ([209.85.220.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 10:24:23 -0800
Received: by vcbfo1 with SMTP id fo1so999317vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 10:24:22 -0800 (PST)
Received: by 10.68.73.33 with SMTP id i1mr1079553pbv.81.1320690262004;
	Mon, 07 Nov 2011 10:24:22 -0800 (PST)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id lt8sm38232744pbb.0.2011.11.07.10.24.20
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 10:24:20 -0800 (PST)
Message-ID: <4EB8225D.6000804@intel.com>
Date: Mon, 07 Nov 2011 10:24:29 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
	<840A81C1B782724A8EB52725BD519EFF1A8F4E@MBX20.4emm.local>
	<4EA825F0.1030504@windriver.com> <4EA83ACB.4040001@intel.com>
	<4EB6EE8E.4000401@eukrea.com> <4EB7155A.1050808@intel.com>
	<4EB79894.3050209@eukrea.com>
In-Reply-To: <4EB79894.3050209@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: useradd changes to dbus, base-passwd
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
X-List-Received-Date: Mon, 07 Nov 2011 18:30:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2011 12:36 AM, Eric Bénard wrote:
> Hi Scott,
>
> Le 07/11/2011 00:16, Scott Garman a écrit :
>> This looks good, thank you! Two questions though:
>>
>> When I was testing my own variation of this fix out, I found that testing
>> bb.data.inherits_class('nativesdk', d) did not work as I expected. It
>> returned
>> false for a recipe I was testing with that used BBCLASSEXTEND = "native
>> nativesdk". So instead I was checking if PN ended with -nativesdk. Are
>> you
>> certain the inherits_class test works?
>>
> this seems to work as expected in the present case :
>
> $ grep BBCLASSEXTEND
> sources/openembedded-core/meta/recipes-core/dbus/dbus.inc
> BBCLASSEXTEND = "native nativesdk"
>
> $ bitbake dbus -e |grep ^DEPENDS=
> DEPENDS="pkgconfig-native autoconf-native automake-native libtool-native
> libtool-cross gnu-config-native virtual/gettext gettext-native
> virtual/arm-angstrom-linux-gnueabi-gcc
> virtual/arm-angstrom-linux-gnueabi-compilerlibs virtual/libc expat
> virtual/libintl virtual/libx11 libsm shadow-native shadow-sysroot
> base-passwd update-rc.d-native"
>
> $ bitbake dbus-native -e |grep ^DEPENDS=
> DEPENDS="pkgconfig-native autoconf-native automake-native libtool-native
> gnu-config-native gettext-minimal-native expat-native
> virtual/libintl-native shadow-native shadow-sysroot base-passwd
> update-rc.d-native"
>
> $ bitbake dbus-nativesdk -e |grep ^DEPENDS=
> DEPENDS="pkgconfig-native autoconf-native automake-native libtool-native
> libtool-cross gnu-config-native virtual/gettext-nativesdk gettext-native
> virtual/i686-angstromsdk-linux-gcc-crosssdk
> virtual/i686-angstromsdk-linux-compilerlibs-nativesdk
> virtual/libc-nativesdk expat-nativesdk virtual/libintl-nativesdk
> virtual/libx11-nativesdk update-rc.d-native"
>
> $ bitbake dbus-nativesdk -e |grep ^SSTATEPOSTIN
> $ bitbake dbus-native -e |grep ^SSTATEPOSTIN
> SSTATEPOSTINSTFUNCS="useradd_sysroot_sstate"
> $ bitbake dbus -e |grep ^SSTATEPOSTIN
> SSTATEPOSTINSTFUNCS="useradd_sysroot_sstate"
>
>
>> My second question is why the autotools_do_install is needed for the
>> nativesdk
>> case?
>>
> because without the do_install_virtclass-nativesdk() , that's the
> standard do_install which is used which tries to setup some rigths using
> chown on the files and that fails (and is not very useful for a nativesdk).
> Maybe we could use a similar do_install as the one used for native.

Thanks for the explanation and verifying the inherit_class call.

I'm happy to ack a patch for this, please submit it.

Thanks!

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


