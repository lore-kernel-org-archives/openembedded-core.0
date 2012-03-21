Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SAM5K-0007om-GC
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:00:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D3546315A42A;
	Wed, 21 Mar 2012 14:51:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id uwPuNlc1PsfD; Wed, 21 Mar 2012 14:51:14 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecc5b.pool.mediaWays.net [89.14.204.91])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 87A0A315A422;
	Wed, 21 Mar 2012 14:51:14 +0100 (CET)
Message-ID: <4F69DCD1.8050502@opendreambox.org>
Date: Wed, 21 Mar 2012 14:51:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1332283657-5978-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKqD4D05U8ursNq7_Z-oWDx869ANGrh2Gh4E4CraZpqHCQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqD4D05U8ursNq7_Z-oWDx869ANGrh2Gh4E4CraZpqHCQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] parted: update to version 3.1
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
X-List-Received-Date: Wed, 21 Mar 2012 14:00:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Richard,

On 21.03.2012 02:44, Otavio Salvador wrote:
> Acked by: Otavio Salvador <otavio@ossystems.com.br>
> 
> On Tue, Mar 20, 2012 at 19:47, Andreas Oberritter <obi@opendreambox.org> wrote:
>> * Supports disks > 2TB
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>> * v2: Updated DEPENDS to match shlibs.
>>      Updated fix-git-version-gen.patch (applied upstream).

you committed v1 instead of v2. Shall I send an incremental patch?

Regards,
Andreas

>>  .../parted/parted-3.1/fix-doc-mandir.patch         |   20 +++++++++
>>  .../parted/parted-3.1/fix-git-version-gen.patch    |   43 ++++++++++++++++++++
>>  .../{parted-3.0 => parted-3.1}/no_check.patch      |    0
>>  .../{parted-3.0 => parted-3.1}/syscalls.patch      |    0
>>  .../parted/{parted_3.0.bb => parted_3.1.bb}        |   12 +++--
>>  5 files changed, 70 insertions(+), 5 deletions(-)
>>  create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
>>  create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
>>  rename meta/recipes-extended/parted/{parted-3.0 => parted-3.1}/no_check.patch (100%)
>>  rename meta/recipes-extended/parted/{parted-3.0 => parted-3.1}/syscalls.patch (100%)
>>  rename meta/recipes-extended/parted/{parted_3.0.bb => parted_3.1.bb} (52%)
>>
>> diff --git a/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch b/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
>> new file mode 100644
>> index 0000000..0711d4e
>> --- /dev/null
>> +++ b/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
>> @@ -0,0 +1,20 @@
>> +Upstream-Status: Submitted [bug-parted@gnu.org]
>> +
>> +| for po in `ls -1 ./*.pt_BR.po 2>/dev/null`; do \
>> +|              make $(basename ${po%.pt_BR.po}); \
>> +|      done
>> +| Makefile:904: *** Recursive variable `mandir' references itself (eventually).  Stop.
>> +
>> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> +
>> +--- parted-3.1/doc/po4a.mk.orig        2012-03-15 14:09:11.555831872 +0100
>> ++++ parted-3.1/doc/po4a.mk     2012-03-15 14:10:44.243830985 +0100
>> +@@ -23,7 +23,7 @@
>> + # threshold is 80%), it won't be distributed, and the build won't fail.
>> + #
>> +
>> +-mandir = $(mandir)/$(lang)
>> ++mandir := $(mandir)/$(lang)
>> +
>> + # Inform automake that we want to install some man pages in section 1, 5
>> + # and 8.
>> diff --git a/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch b/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
>> new file mode 100644
>> index 0000000..a9f26e9
>> --- /dev/null
>> +++ b/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
>> @@ -0,0 +1,43 @@
>> +Upstream-Status: Accepted [Expected to be included in parted versions > 3.1]
>> +Upstream-URL: http://git.savannah.gnu.org/cgit/gnulib.git/patch/?id=cbc11ff0020eb9c04caea6b3e7dc4e4281dff1f9
>> +
>> +From cbc11ff0020eb9c04caea6b3e7dc4e4281dff1f9 Mon Sep 17 00:00:00 2001
>> +From: Andreas Oberritter <obi@opendreambox.org>
>> +Date: Sun, 18 Mar 2012 17:39:14 +0000
>> +Subject: git-version-gen: don't let "prefix" envvar cause trouble
>> +
>> +* build-aux/git-version-gen (prefix): Initialize properly,
>> +so as not to use a value specified via the environment.
>> +Details here: http://thread.gmane.org/gmane.comp.gnu.parted.bugs/10810
>> +---
>> +diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
>> +index d5542a2..0fa9063 100755
>> +--- a/build-aux/git-version-gen
>> ++++ b/build-aux/git-version-gen
>> +@@ -1,6 +1,6 @@
>> + #!/bin/sh
>> + # Print a version string.
>> +-scriptversion=2012-01-06.07; # UTC
>> ++scriptversion=2012-03-18.17; # UTC
>> +
>> + # Copyright (C) 2007-2012 Free Software Foundation, Inc.
>> + #
>> +@@ -92,6 +92,8 @@ Options:
>> +
>> + Running without arguments will suffice in most cases."
>> +
>> ++prefix=v
>> ++
>> + while test $# -gt 0; do
>> +   case $1 in
>> +     --help) echo "$usage"; exit 0;;
>> +@@ -120,7 +122,6 @@ if test -z "$tarball_version_file"; then
>> + fi
>> +
>> + tag_sed_script="${tag_sed_script:-s/x/x/}"
>> +-prefix="${prefix:-v}"
>> +
>> + nl='
>> + '
>> +--
>> +cgit v0.9.0.2
>> diff --git a/meta/recipes-extended/parted/parted-3.0/no_check.patch b/meta/recipes-extended/parted/parted-3.1/no_check.patch
>> similarity index 100%
>> rename from meta/recipes-extended/parted/parted-3.0/no_check.patch
>> rename to meta/recipes-extended/parted/parted-3.1/no_check.patch
>> diff --git a/meta/recipes-extended/parted/parted-3.0/syscalls.patch b/meta/recipes-extended/parted/parted-3.1/syscalls.patch
>> similarity index 100%
>> rename from meta/recipes-extended/parted/parted-3.0/syscalls.patch
>> rename to meta/recipes-extended/parted/parted-3.1/syscalls.patch
>> diff --git a/meta/recipes-extended/parted/parted_3.0.bb b/meta/recipes-extended/parted/parted_3.1.bb
>> similarity index 52%
>> rename from meta/recipes-extended/parted/parted_3.0.bb
>> rename to meta/recipes-extended/parted/parted_3.1.bb
>> index 2fba6d1..21d3a66 100644
>> --- a/meta/recipes-extended/parted/parted_3.0.bb
>> +++ b/meta/recipes-extended/parted/parted_3.1.bb
>> @@ -3,15 +3,17 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
>>  LICENSE = "GPLv3+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
>>  SECTION = "console/tools"
>> -DEPENDS = "readline e2fsprogs"
>> +DEPENDS = "ncurses readline util-linux"
>>  PR = "r0"
>>
>> -SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
>> +SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
>>            file://no_check.patch \
>> -           file://syscalls.patch "
>> +           file://syscalls.patch \
>> +           file://fix-git-version-gen.patch \
>> +           file://fix-doc-mandir.patch"
>>
>> -SRC_URI[md5sum] = "a94e84a9b9944715c4453f82ccc639bf"
>> -SRC_URI[sha256sum] = "8886eece015202f6bd5ce8414f4b68838452cef509f2e3389ad56128219837b7"
>> +SRC_URI[md5sum] = "5d89d64d94bcfefa9ce8f59f4b81bdcb"
>> +SRC_URI[sha256sum] = "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15"
>>
>>  EXTRA_OECONF = "--disable-device-mapper"
>>
>> --
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> 



