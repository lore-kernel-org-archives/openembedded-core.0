Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RqLcb-00043A-0x
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 10:27:57 +0100
Received: by werc1 with SMTP id c1so228561wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 01:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Jg78gJI4pRX3RhEjepOorDpaDf3k3/U2uK6gchsvoqE=;
	b=WoqAM2/kjI7+ANwVwQUwZ2ULcBIWZb+2EUhS28SCxT68dL4h+jjxi4so0TE0XVvXVn
	J2M7NprHXi1bLRuIwQKE2QDcaNA7IeGyZ1wa5YZj+vgiArSMQYas1IKd9XdsBquT2tZJ
	GEJpgbCBwjzYbRwfHIMa0IWpDtZIh+nSLspP4=
MIME-Version: 1.0
Received: by 10.216.138.220 with SMTP id a70mr839609wej.24.1327569609642; Thu,
	26 Jan 2012 01:20:09 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Thu, 26 Jan 2012 01:20:09 -0800 (PST)
In-Reply-To: <CAMKF1sp41YHpyt+ihhq=9nzKNPqLEBtQWdr6BjupWBObkLeOeQ@mail.gmail.com>
References: <CAGiJk9dnE5PNX68AO8gXH+VseMS4LFG=1Bq+cQMekSgrVo1aXw@mail.gmail.com>
	<1327427295.19643.118.camel@ted>
	<CAGiJk9f+AwaG0F0P7sZJq=c6WKvioaQF0i9G0U8FMPfv__yc8A@mail.gmail.com>
	<CAGiJk9eaBCxG=cGvw9PaOhLSwYtLKT+7r5y-=ehe5k2BUHd3+Q@mail.gmail.com>
	<CAMKF1sp41YHpyt+ihhq=9nzKNPqLEBtQWdr6BjupWBObkLeOeQ@mail.gmail.com>
Date: Thu, 26 Jan 2012 10:20:09 +0100
Message-ID: <CAGiJk9dEaPNFie2qzjLY3tq1NSyWnZgHwBnCH2Gm0B3MysqQ8w@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: CMake error? CMAKE_AR-NOTFOUND
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
X-List-Received-Date: Thu, 26 Jan 2012 09:27:57 -0000
Content-Type: text/plain; charset=UTF-8

2012/1/25 Khem Raj <raj.khem@gmail.com>:
> On Wed, Jan 25, 2012 at 12:31 AM, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> 2012/1/25 Samuel Stirtzel <s.stirtzel@googlemail.com>:
>>> 2012/1/24 Richard Purdie <richard.purdie@linuxfoundation.org>:
>>>> On Tue, 2012-01-24 at 14:30 +0100, Samuel Stirtzel wrote:
>>>>> Hi,
>>>>> currently I try to build a native software that needs CMake, it is a
>>>>> required tool to cross compile another software.
>>>>> An it seems that CMAKE_AR is set to an invalid value (CMAKE_AR-NOTFOUND).
>>>>> The cmake.bbclass has no entry about this.
>>>>>
>>>>> By searching the web, the only information found was that it can be
>>>>> set to ${GCC_PATH}/dld.
>>>>> As I am usually not working with CMake where can I find the native
>>>>> "ar" or "dld" executable in OpenEmbedded?
>>>>>
>>>>> Using the archiver from my hosts /usr/bin/ar seems to be wrong since
>>>>> in cmake.bbclass "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )"
>>>>> prohibits it.
>>>>
>>>> In the same way the class figures out OECMAKE_C_COMPILER from ${CC}, you
>>>> probably need to figure out ar from ${AR} and pass it to the cmake
>>>> configuration.
>>>>
>>>> Note I know very little about cmake so I'm of less help with that
>>>> piece ;-).
>>>
>>> After looking around in all ends of OE-core it shows up that this
>>> error is caused by binutils.inc.
>>> Finding ar would be no problem itself, but if the binary is not
>>> installed or gets deleted after building binutils-native it is
>>> impossible to locate it.
>>>
>>> In binutils.inc do_install:
>>> rm ${D}${bindir}/ar ${D}${bindir}/strings
>> Sorry I pasted the wrong line, this was for cross compiling.
>> From the do_install_virtclass-native:
>> # We only want libiberty, libbfd and libopcodes
>> rm -rf ${D}${bindir}
>>
>> but the effect is still the same..
>>>
>>> Well I still wonder why my target sysroot has ar if it gets deleted here...
>>>
>
> because its installed using post_install script.
>
>>> Anyone knows why ar is being removed in do_install?
>
> since post_install will install it as a symlink
>
Well that made me wonder too, because yesterday I thought that it
would use ${D}${bindir} instead of ${bindir}.

Ok I double checked this and it looks strange...
Everything further needs some explanation, looking up the used
variables will explain why ar is missing.


Therefore I added some quick debug stuff:
die "D = ${D}, bindir = ${bindir}"
-die 'D = /work/oe-core/tmp-eglibc/work/x86_64-linux/binutils-native-2.22-r2/image,
bindir = /work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin'
die "Target prefix = ${TARGET_PREFIX}"
-die 'Target prefix = '

Inserted in the code this will look like the following (quotation
marks only stand there for visibility):
do_install_virtclass_native:
rm -rf ${D}${bindir}
rm -rf '/work/oe-core/tmp-eglibc/work/x86_64-linux/binutils-native-2.22-r2/image/work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin'

do_pkg_postinst:
update-alternatives --install ${bindir}/ar ar ${TARGET_PREFIX}ar 100
update-alternatives --install
'/work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin'/ar ar ''ar
100



This looks pretty weird.
It looks like ${bindir} should be
"/work/oe-core/tmp-eglibc/work/x86_64-linux/binutils-native-2.22-r2/binutils-2.22/build.x86_64-linux.x86_64-linux/binutils/",
where ar is located.
Any ideas what went wrong?


-- 
Regards
Samuel


