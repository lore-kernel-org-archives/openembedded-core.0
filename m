Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sbheo-00083P-NH
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 02:29:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Jun 2012 17:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107822532"
Received: from unknown (HELO [10.255.12.127]) ([10.255.12.127])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Jun 2012 17:19:31 -0700
Message-ID: <4FCD5093.3070606@linux.intel.com>
Date: Mon, 04 Jun 2012 17:19:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1338537158-19917-1-git-send-email-cristian.iorga@intel.com>
	<CAPhnLPAUewTddwVFXa77deAUomq7_T17MAYCsr_t+6rmT0OLxw@mail.gmail.com>
In-Reply-To: <CAPhnLPAUewTddwVFXa77deAUomq7_T17MAYCsr_t+6rmT0OLxw@mail.gmail.com>
Subject: Re: [PATCH] ltp: Add patch to correct failing build
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
X-List-Received-Date: Tue, 05 Jun 2012 00:29:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 06/02/2012 09:59 AM, Flanagan, Elizabeth wrote:
> On Fri, Jun 1, 2012 at 12:52 AM, Cristian Iorga
> <cristian.iorga@intel.com>  wrote:
>> ltp makefile does not interpret correctly the result of git describe
>> command and assumes that it is working with a git repo, while in fact
>> working with a source code archive.
>> Added a patch to corect makefile system.
>>
>> Signed-off-by: Cristian Iorga<cristian.iorga@intel.com>
>> ---
>>   .../ltp/ltp/fix_building_fom_archive.patch         |   23 ++++++++++++++++++++
>>   meta/recipes-extended/ltp/ltp_20120401.bb          |    4 ++--
>>   2 files changed, 25 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>>
>> diff --git a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>> new file mode 100644
>> index 0000000..c0ecc86
>> --- /dev/null
>> +++ b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>> @@ -0,0 +1,23 @@
>> +ltp package build system is broken if building from archive
>> +
>> +ltp makefile does not interpret correctly the result of git describe
>> +command and assumes that it is working with a git repo, while in fact
>> +working with a source code archive.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Cristian Iorga<cristian.iorga@intel.com>
>> +
>> +Index: ltp-20120401/Makefile
>> +===================================================================
>> +--- ltp-20120401.orig/Makefile
>> ++++ ltp-20120401/Makefile
>> +@@ -173,7 +173,8 @@ SRCDIR_INSTALL_TARGETS     := $(SRCDIR_INSTA
>> + #
>> + .PHONY: Version
>> + Version:
>> +-      if git describe&>  /dev/null; then \
>> ++      git describe&>  /dev/null
>> ++      if [ $? -eq 0 ]; then \
>> +               git describe>  "$@"; \
>> +       else \
>> +               cp VERSION "$@"; \
>> diff --git a/meta/recipes-extended/ltp/ltp_20120401.bb b/meta/recipes-extended/ltp/ltp_20120401.bb
>> index 912d6d9..563bd58 100644
>> --- a/meta/recipes-extended/ltp/ltp_20120401.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20120401.bb
>> @@ -21,10 +21,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>
>>   DEPENDS = "attr"
>>
>> -PR = "r3"
>> +PR = "r4"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
>> -          "
>> +           file://fix_building_fom_archive.patch"
>>
>>   SRC_URI[md5sum] = "e1d0acf1a6b6da0cb30dc1b0dcf5f26d"
>>   SRC_URI[sha256sum] = "f0f5845f9666f61332fdf0b7e396fc647f9372db0902a829af2cf9402b807bd1"
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> This patch seems to be causing build failures:
>
> | ERROR: Function failed: do_compile (see
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/temp/log.do_compile.695
> for further information)
> | NOTE: make -j 16
> | make -C "lib" \
> | 	-f "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib/Makefile"
> all
> | git describe&>  /dev/null
> | make: *** [Version] Error 128
> | make: *** Waiting for unfinished jobs....
> | make[1]: Entering directory
> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib'
> | make[1]: Nothing to be done for `all'.
> | make[1]: Leaving directory
> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib'
> | ERROR: oe_runmake failed
>
>
You might want to use "-git describe&>  /dev/null", as this will ignore 
errors, I thought you tested the final patch?

 From the make manual pages:

To ignore errors in a recipe line, write a ‘-’ at the beginning of the 
line's text (after the initial tab). The ‘-’ is discarded before the 
line is passed to the shell for execution.

For example,

      clean:
              -rm -f *.o

This causes make to continue even if rm is unable to remove a file.

>
> -b
>


