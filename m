Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TiFRW-0001DR-Fz
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 03:19:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBB250u7012388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Dec 2012 18:05:00 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 10 Dec 2012 18:04:59 -0800
Message-ID: <50C694D1.8070703@windriver.com>
Date: Tue, 11 Dec 2012 10:05:05 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
	<4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
	<50C6126F.3020401@linux.intel.com>
	<50C657CD.2040103@linux.intel.com>
In-Reply-To: <50C657CD.2040103@linux.intel.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] ICU: add pkgconfig support
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
X-List-Received-Date: Tue, 11 Dec 2012 02:19:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


>> Not sure what exactly is happening.
>>
>> Please look into this.
>>
>> Thanks
>>      Sau!
>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   .../icu/files/icu-add-pkgconfig-support.patch      |   43
>>> ++++++++++++++++++++
>>>   meta/recipes-support/icu/icu-3.6.inc               |   11 +++++
>>>   meta/recipes-support/icu/icu_3.6.bb                |    2 +-
>>>   3 files changed, 55 insertions(+), 1 deletion(-)
>>>   create mode 100644
>>> meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>>>
>>> diff --git
>>> a/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>>> b/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>>> new file mode 100644
>>> index 0000000..c7cd9d5
>>> --- /dev/null
>>> +++ b/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>>> @@ -0,0 +1,43 @@
>>> +Upstream-Status: Inappropriate [version]
>>> +ICU-3.6 has no pkgconfig, so I add it here.
>>> +But ICU has had pkgconfig support since 4.6.
>>> +So this patch is inappropriate to upstream.
>>> +
>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> +
>>> +Index: configure.in
>>> +=============================================================
>>> +--- a/configure.in
>>> ++++ b/configure.in
>>> +@@ -1057,4 +1057,7 @@ echo "This may cause ICU to fail to build.
>>> Please make sure that GNU make"
>>> + echo "is in your PATH so that this configure script can detect its
>>> location."
>>> + fi
>>> +
>>> ++AC_CONFIG_FILES([icu.pc])
>>> ++AC_OUTPUT
>>> ++
>>> + $as_unset _CXX_CXXSUFFIX
>>> +
>>> +Index: icu.pc.in
>>> +=============================================================
>>> +--- /dev/null
>>> ++++ b/icu.pc.in
>>> +@@ -0,0 +1,15 @@
>>> ++# Process this file with autoconf to produce a pkg-config metadata
>>> file.
>>> ++
>>> ++prefix=@prefix@
>>> ++exec_prefix=@exec_prefix@
>>> ++libdir=@libdir@
>>> ++includedir=@includedir@
>>> ++unicode_version=@UNICODE_VERSION@
>>> ++
>>> ++Name: ICU
>>> ++Description: International Component for Unicode libraries
>>> ++Requires:
>>> ++Version: @VERSION@
>>> ++Libs: -L${libdir} -licui18n -licuuc -licudata
>>> ++Libs.private: -L{libdir} -lpthread -lm
>>> ++Cflags: -I${includedir} -O2 -pipe -g -feliminate-unused-debug-types
>>> +--
>>> +1.7.11.2
>>> +
>>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>>> b/meta/recipes-support/icu/icu-3.6.inc
>>> index 272f6d1..8caf71c 100644
>>> --- a/meta/recipes-support/icu/icu-3.6.inc
>>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>>> @@ -7,6 +7,7 @@ BASE_SRC_URI =
>>> "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-
>>>              file://fix-parallel-build.patch \
>>>              file://use-g++-for-linking.patch \
>>>              file://larger-cmd-size.patch \
>>> +       file://icu-add-pkgconfig-support.patch \
>>>              "
>>>   SRC_URI = "${BASE_SRC_URI} \
>>>              file://noldlibpath.patch \
>>> @@ -28,6 +29,12 @@ inherit autotools pkgconfig binconfig
>>>   do_configure() {
>>>       libtoolize --force
>>>       gnu-configize --force
>>> +    if [ "${PN}" != "icu-native" ]; then
>>> +        OLD=`pwd`
>>> +        cd ${S}
>>> +        autoconf
>>> +        cd ${OLD}
>>> +    fi
>
> I had some time this morning to investigate this more deeply.  What I 
> found was that the ICU tarball was being delivered with a "configure" 
> and that the do_configure was avoiding the "autoconf" conversion of 
> configure.in -> configure.  I am not sure if this is historical or if 
> this is truly needed.
>
> So by doing the autoconf above you changed the "configure" script, 
> this in turn caused some configuration changes to occur in the 
> platform.h file.  Why these changed (particularly the U_HAVE_NAMESPACE 
> define) then caused the ICU libraries to be built with different 
> namespace.
>
> So a couple of key questions that need to be resolved:
> 1) Will updating to 4.6 solve this issue, if not then we need to dive 
> into 2 + 3 Below:
>
> 2) Why does icu tarball have a generated configure?
>
> 3) Why does the autoconf generated configure fail to configure things 
> correctly?
>
> Sau!
>
>
Thanks a lot!
I'll look into this immediately.


Chen Qi

>>>       oe_runconf
>>>       if [ "${PN}" != "icu-native" ]; then
>>>           # In the non-native case we need to make substitutions to use
>>> @@ -45,6 +52,10 @@ do_compile() {
>>>
>>>   do_install_append() {
>>>           chmod +x ${D}${libdir}/lib*
>>> +    if [ "${PN}" != "icu-native" ]; then
>>> +        install -d ${D}/${libdir}/pkgconfig
>>> +            install -m 0644 ${S}/icu.pc ${D}/${libdir}/pkgconfig
>>> +    fi
>>>   }
>>>
>>>   PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx
>>> libicutu libicuio"
>>> diff --git a/meta/recipes-support/icu/icu_3.6.bb
>>> b/meta/recipes-support/icu/icu_3.6.bb
>>> index f941acf..f50abe2 100644
>>> --- a/meta/recipes-support/icu/icu_3.6.bb
>>> +++ b/meta/recipes-support/icu/icu_3.6.bb
>>> @@ -1,6 +1,6 @@
>>>   require icu-3.6.inc
>>>
>>> -PR = "r9"
>>> +PR = "r10"
>>>
>>>   SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
>>>   SRC_URI[sha256sum] =
>>> "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>



