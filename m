Received: from dd19416.kasserver.com ([85.13.139.185])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1UKOpB-00069M-A4
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 09:01:42 +0100
Received: from [192.168.1.100] (blfd-4d083444.pool.mediaWays.net [77.8.52.68])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id B8CAB184059D;
	Tue, 26 Mar 2013 08:44:43 +0100 (CET)
Message-ID: <515151EA.70403@herbrechtsmeier.net>
Date: Tue, 26 Mar 2013 08:44:42 +0100
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
	<1363099754-3396-1-git-send-email-stefan@herbrechtsmeier.net>
	<2F386A63-6910-492E-B8A8-986FE6FA3906@gmail.com>
In-Reply-To: <2F386A63-6910-492E-B8A8-986FE6FA3906@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Add real native support
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
X-List-Received-Date: Tue, 26 Mar 2013 08:01:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 26.03.2013 06:55, schrieb Khem Raj:
> On Mar 12, 2013, at 7:49 AM, Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net> wrote:
>
>> The current boost recipe only creates the bjam build tool during
>> a native run and thereby is not usable for other native recipes
>> that depend on a boost library. Use instead the bjam build tool
>> from the do_boostconfig task and add real native support to the
>> boost recipe. Additionally remove the boost-native from DEPENDS.
>>
>> Keep the installation of the native bjam build tool for backward
>> compatibility.
>>
>> Native compilation of bzip2 isn't working and therefore disabled.
>>
> would it be possible to have an independent bjam-native ?
Yes, I can add a bjam-native. But I will only add bjam-native as cross 
compiling don't work out of the box.

> I was wondering if there were other recipes needing bjam
> could benefit. Now that bjam is removed from staging, this
> could cause other recipes which could have been using
> it unknowingly to fail. Although that in itself is a problem.
This patch installs bjam during native build and thereby keep the old 
behaviour but I will update the patch and move bjam to its own native 
recipe.

>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
>> ---
>> meta/recipes-support/boost/boost.inc       |   37 ++++++----------------------
>> meta/recipes-support/boost/boost_1.53.0.bb |    2 +
>> 2 files changed, 10 insertions(+), 29 deletions(-)
>>
>> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
>> index 1266666..eaba3a2 100644
>> --- a/meta/recipes-support/boost/boost.inc
>> +++ b/meta/recipes-support/boost/boost.inc
>> @@ -6,8 +6,7 @@
>> DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
>> HOMEPAGE = "http://www.boost.org/"
>> SECTION = "libs"
>> -DEPENDS = "boost-native zlib bzip2"
>> -DEPENDS_class-native = ""
>> +DEPENDS = "zlib bzip2"
>> LICENSE = "BSL-1.0 & MIT & Python-2.0"
>>
>> ARM_INSTRUCTION_SET = "arm"
>> @@ -126,6 +125,8 @@ BJAM_OPTS    = '${PARALLEL_MAKE} \
>> 		--disable-icu \
>> 		${BJAM_EXTRA}'
>>
>> +# Native compilation of bzip2 isn't working
>> +BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
>>
>> do_boostconfig() {
>> 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
>> @@ -146,7 +147,7 @@ addtask do_boostconfig after do_patch before do_configure
>>
>> do_compile() {
>> 	set -ex
>> -	bjam ${BJAM_OPTS} --prefix=${prefix} \
>> +	./bjam ${BJAM_OPTS} --prefix=${prefix} \
>> 		--exec-prefix=${exec_prefix} \
>> 		--libdir=${libdir} \
>> 		--includedir=${includedir}
>> @@ -154,7 +155,7 @@ do_compile() {
>>
>> do_install() {
>> 	set -ex
>> -	bjam ${BJAM_OPTS} \
>> +	./bjam ${BJAM_OPTS} \
>> 		--libdir=${D}${libdir} \
>> 		--includedir=${D}${includedir} \
>> 		install
>> @@ -171,29 +172,7 @@ do_install() {
>>
>> BBCLASSEXTEND = "native"
>>
>> -do_configure_class-native() {
>> -	:
>> +do_install_append_class-native() {
>> +       install -d ${D}${bindir}/
>> +       install -c -m 755 bjam ${D}${bindir}/
>> }
>> -
>> -do_boostconfig_class-native() {
>> -	:
>> -}
>> -
>> -do_compile_class-native() {
>> -	set -ex
>> -	cd ${S}/tools/build/v2/engine
>> -	rm -rf bin.*
>> -	./build.sh gcc
>> -}
>> -
>> -# This is too terrible - the build script doesn't give any good
>> -# way I can see to find out where the binaries are placed, so
>> -# rely on only one bin.foo directory being created.
>> -do_install_class-native () {
>> -	set -ex
>> -	cd ${S}/tools/build/v2/engine
>> -	install -d ${D}${bindir}/
>> -	install -c -m 755 bin.*/bjam ${D}${bindir}/
>> -}
>> -
>> -
>> diff --git a/meta/recipes-support/boost/boost_1.53.0.bb b/meta/recipes-support/boost/boost_1.53.0.bb
>> index de721c5..7527b25 100644
>> --- a/meta/recipes-support/boost/boost_1.53.0.bb
>> +++ b/meta/recipes-support/boost/boost_1.53.0.bb
>> @@ -2,6 +2,8 @@ include boost.inc
>>
>> LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
>>
>> +PR = "r1"
>> +
>> SRC_URI += "file://arm-intrinsics.patch \
>>             "
>>
>> -- 
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



