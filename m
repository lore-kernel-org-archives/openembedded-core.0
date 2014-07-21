Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D9CE970657
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 22:47:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6LMlaq9001767
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:47:36 -0700 (PDT)
Received: from msp-dhcp53.wrs.com (172.25.34.53) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 21 Jul 2014 15:47:36 -0700
Message-ID: <53CD9887.1000204@windriver.com>
Date: Mon, 21 Jul 2014 17:47:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20140716092525.988C0503D2@opal.openembedded.org>
	<20140721223240.GN22875@jama>
In-Reply-To: <20140721223240.GN22875@jama>
Subject: Re: [oe-commits] Peter Seebach : pseudo_1.6.0.bb: uprev to pseudo 1.6
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
X-List-Received-Date: Mon, 21 Jul 2014 22:47:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/14, 5:32 PM, Martin Jansa wrote:
> On Wed, Jul 16, 2014 at 09:25:25AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: b8f5d6b493ec759a97b92cf9b4c07ad8a8114de6
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b8f5d6b493ec759a97b92cf9b4c07ad8a8114de6
>>
>> Author: Peter Seebach <peter.seebach@windriver.com>
>> Date:   Mon Jul 14 14:12:29 2014 -0500
>>
>> pseudo_1.6.0.bb: uprev to pseudo 1.6
>>
>> This uprevs pseudo to 1.6. This merges in all of the existing
>> fixes, and also adds partial support for extended attributes,
>> including storing arbitrary extended attributes in the database,
>> and also interpreting the posix permissions ACLs as chmod
>> requests.
>>
>> The extended attribute support means we need xattr.h, the simplest
>> way to be sure of this is to build attr before pseudo, which doesn't
>> take long.
>>
>> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> I know there is 1.6.1 version in pseudo_git.bb but 1.6.0 is still default version and target version fails to build with:
>
> | arm-oe-linux-gnueabi-gcc  -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -pipe -std=gnu99 -Wall -W -Wextra -fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -O2 -pipe -g -feliminate-unused-debug-types -DPSEUDO_PREFIX='"/usr"' -DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"' -DPSEUDO_LIBDIR='"lib/pseudo/lib"' -DPSEUDO_LOCALSTATEDIR='"var/pseudo"' -DPSEUDO_VERSION='"1.6.0"' -DUSE_MEMORY_DB -DPSEUDO_FORCE_ASYNC -DPSEUDO_PASSWD_FALLBACK='""' -O2 -g -L/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib -I/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include  -o bin/pseudolog pseudolog.o pseudo_client.o pseudo_ipc.o \
> | 		pseudo_db.o pseudo_tables.o pseudo_util.o /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/libsqlite3.a -lpthread -ldl -lpthread
> | pseudo.c:556: error: undefined reference to 'memcpy', version 'GLIBC_2.0'
> ..
>
> full log
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140721_022210.log/3_min/failed/pseudo.log
>
> Can you please check it?

This is the exact error fixed by one of the commits in 1.6.1.  Look at the git 
log and it's clear how it was fixed.  (Changing an #if #else...)

1.6.0 should have been removed if 1.6.1 went in.

--Mark

>>
>> ---
>>
>>   meta/recipes-devtools/pseudo/pseudo.inc      |  6 +-----
>>   meta/recipes-devtools/pseudo/pseudo_1.5.1.bb |  4 ++++
>>   meta/recipes-devtools/pseudo/pseudo_1.6.0.bb | 10 ++++++++++
>>   meta/recipes-devtools/pseudo/pseudo_git.bb   |  4 ++--
>>   4 files changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
>> index 42738ab..11a8514 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo.inc
>> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
>> @@ -7,11 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
>>   SECTION = "base"
>>   LICENSE = "LGPL2.1"
>> -DEPENDS = "sqlite3"
>> -
>> -SRC_URI_append_class-nativesdk = " file://symver.patch"
>> -
>> -SRC_URI_append_class-native = " file://symver.patch"
>> +DEPENDS = "sqlite3 attr"
>>
>>   FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
>>   FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
>> index 47291fd..8d562ec 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
>> @@ -10,6 +10,10 @@ SRC_URI = " \
>>       file://pseudo-fchmodat-permissions.patch \
>>   "
>>
>> +SRC_URI_append_class-nativesdk = " file://symver.patch"
>> +
>> +SRC_URI_append_class-native = " file://symver.patch"
>> +
>>   SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
>>   SRC_URI[sha256sum] = "3b896f592f4d568569bd02323fad2d6b8c398e16ca36ee5a8947d2ff6c1d3d52"
>>
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb
>> new file mode 100644
>> index 0000000..e92c4d7
>> --- /dev/null
>> +++ b/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb
>> @@ -0,0 +1,10 @@
>> +require pseudo.inc
>> +
>> +SRC_URI = " \
>> +    http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
>> +"
>> +
>> +SRC_URI[md5sum] = "78c3f8aa8efe8cf15a2b21261174e3b6"
>> +SRC_URI[sha256sum] = "e24f526443b31c3292ec5ba04950d230b5388e8983c7e192e9e489c007f3dba3"
>> +
>> +PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> index 66fc85f..ef258fa 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> @@ -1,7 +1,7 @@
>>   require pseudo.inc
>>
>> -SRCREV = "b9eb2b5633b5a23efe72c950494728d93c2b5823"
>> -PV = "1.5.1+git${SRCPV}"
>> +SRCREV = "512b84fb539c970464a93107995edf0e775d13fa"
>> +PV = "1.6.0+git${SRCPV}"
>>
>>   DEFAULT_PREFERENCE = "-1"
>>
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>
>


