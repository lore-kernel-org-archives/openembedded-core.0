Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QTjgR-0002K1-9S
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 01:58:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p56NsrTK006996
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 16:54:53 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 6 Jun 2011 16:54:52 -0700
Message-ID: <4DED68CC.60307@windriver.com>
Date: Mon, 6 Jun 2011 18:54:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1307402014.git.mark.hatle@windriver.com>	<4afec421e49b3aa5404170b39ae8a95c8362f5a7.1307402014.git.mark.hatle@windriver.com>
	<BANLkTimfBmiA4ioLJN3tfNxvQpAor-AW5Q@mail.gmail.com>
In-Reply-To: <BANLkTimfBmiA4ioLJN3tfNxvQpAor-AW5Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] pseudo: Update pseudo to 1.1.1 version
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
X-List-Received-Date: Mon, 06 Jun 2011 23:58:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 6/6/11 6:30 PM, Khem Raj wrote:
> On Mon, Jun 6, 2011 at 4:15 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Update both the core and pseudo_git packages to the latest 1.1.1 verison.
>>
>> This fixes an issues where the call system() was not wrapped.  This could
>> lead to issues where certain spawned commands broke out of a pseudo-chroot
>> and created files in the wrong place.
>>
>> Also the update the 1.0 -> 1.1.1 adds additional capabilities such as
>> beginning support for MacOS X.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/recipes-devtools/pseudo/pseudo.inc            |   10 +++++-----
>>  .../pseudo/{pseudo_1.0.bb => pseudo_1.1.1.bb}      |    4 ++--
>>  meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +++---
>>  3 files changed, 10 insertions(+), 10 deletions(-)
>>  rename meta/recipes-devtools/pseudo/{pseudo_1.0.bb => pseudo_1.1.1.bb} (51%)
>>
>> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
>> index a458dcc..df09b0d 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo.inc
>> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
>> @@ -18,7 +18,7 @@ NO32LIBS ??= "0"
>>
>>  # Compile for the local machine arch...
>>  do_compile () {
>> -       ${S}/configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS}
>> +       ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} # --bits=${SITEINFO_BITS}
> 
> Just curious why is it a 32bit binary

It's not.

The default is to build a "native" library and server (in do_compile).  On many
systems this will be 64-bit, or some 32-bit.

Then...

> 
>>        oe_runmake 'LIB=lib/pseudo/lib$(MARK64)'
>>  }
>>
>> @@ -28,8 +28,8 @@ do_compile () {
>>  do_compile_prepend_virtclass-native () {
>>        if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
>>                # We need the 32-bit libpseudo on a 64-bit machine...
>> -               ./configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
>> -               oe_runmake 'CFLAGS=-m32' 'LIB=lib/pseudo/lib' libpseudo
>> +               ./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} # --bits=32
>> +               oe_runmake 'CFLAGS=-m32' libpseudo 'LIB=lib/pseudo/lib$(MARK64)'
>>                # prevent it from removing the lib, but remove everything else
>>                make 'LIB=foo' distclean
>>        fi

On systems where we have both 32-bit and 64-bit libs, we assume the default is
64-bit -- and then we build the compatible 32-bit library.. (well since it's a
prepend, we built it before the other.. but that just makes the build easier...)

If the host has both 32-bit and 64-bit libraries, we have to assume that any
executable on the system may be 32-bit or 64-bit.  So we need two intercept
libraries, one for each.. The same back-end pseudo service is setup to work with
either front-end library.

(One place where this is an issue, if you use certain Code Sourcery pre-compiled
toolchains, they only ship in 32-bit form.  So we need to wrap both 32-bit and
64-bit libraries, otherwise linking and a few other things done by the toolchain
components will be done outside of pseudo, resulting in potentially bad file
owners, permissions, etc..

>> @@ -38,8 +38,8 @@ do_compile_prepend_virtclass-native () {
>>  do_compile_prepend_virtclass-nativesdk () {
>>        if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
>>                # We need the 32-bit libpseudo on a 64-bit machine...
>> -               ./configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
>> -               oe_runmake 'CFLAGS=-m32' 'LIB=lib/pseudo/lib' libpseudo
>> +               ./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} # --bits=32
>> +               oe_runmake 'CFLAGS=-m32' libpseudo 'LIB=lib/pseudo/lib$(MARK64)'
>>                # prevent it from removing the lib, but remove everything else
>>                make 'LIB=foo' distclean
>>        fi
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
>> similarity index 51%
>> rename from meta/recipes-devtools/pseudo/pseudo_1.0.bb
>> rename to meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
>> index e750e8a..8bf6d07 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_1.0.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
>> @@ -5,5 +5,5 @@ PR = "r0"
>>  SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
>>            file://static_sqlite.patch"
>>
>> -SRC_URI[md5sum] = "a329bd00ba78711bcacd48fc1982af6a"
>> -SRC_URI[sha256sum] = "cb41c97094044144ef4027ab9dbba009f3cb1c23e6bec9640f29d530524ad60f"
>> +SRC_URI[md5sum] = "dd59766c17e199fe6144fce8a2c67802"
>> +SRC_URI[sha256sum] = "c697f643577d661c3ce826504b9dcd11fa98e78a5d10e3c83931da8942f6bfad"
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> index 2b9fe70..cf3b191 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> @@ -1,8 +1,8 @@
>>  require pseudo.inc
>>
>> -SRCREV = "5434325fc887817ebb2bad36313d8277992cef1d"
>> -PV = "1.0+git${SRCPV}"
>> -PR = "r18"
>> +SRCREV = "1d3e67cb168c3459e67a0b29f071ca30ed17dadc"
>> +PV = "1.1.1+git${SRCPV}"
>> +PR = "r19"
>>
>>  DEFAULT_PREFERENCE = "-1"
>>
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



