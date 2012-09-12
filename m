Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBeUz-0003nD-Gy
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 06:24:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2012 21:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,407,1344236400"; d="scan'208";a="220871272"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2012 21:11:47 -0700
Message-ID: <50500B83.7020603@linux.intel.com>
Date: Tue, 11 Sep 2012 21:11:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1347421458-2044-1-git-send-email-b19537@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A671B9E@039-SN1MPN1-001.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A671B9E@039-SN1MPN1-001.039d.mgd.msft.net>
Cc: St John Robert-RAT173 <RAT173@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: valgrind: fix debug info reading error when do memcheck on ppc targets
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
X-List-Received-Date: Wed, 12 Sep 2012 04:24:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 09:02 PM, McClintock Matthew-B29882 wrote:
> On Tue, Sep 11, 2012 at 10:44 PM,  <b19537@freescale.com> wrote:
>> From: Zhenhua Luo <b19537@freescale.com>
>>
>>      following is the error message:
>>          --2263-- WARNING: Serious error when reading debug info
>>          --2263-- When reading debug info from /lib/ld-2.13.so:
>>          --2263-- Can't make sense of .got section mapping
>>          --2263-- WARNING: Serious error when reading debug info
>>          --2263-- When reading debug info from /home/root/lzh:
>>          --2263-- Can't make sense of .data section mapping
>>          --2263-- WARNING: Serious error when reading debug info
>>          --2263-- When reading debug info from /usr/lib/valgrind/vgpreload_core-ppc32-linux.so:
>>          --2263-- Can't make sense of .data section mapping
>>          --2263-- WARNING: Serious error when reading debug info
>>          --2263-- When reading debug info from /usr/lib/valgrind/vgpreload_memcheck-ppc32-linux.so:
>>          --2263-- Can't make sense of .data section mapping
>>          --2263-- WARNING: Serious error when reading debug info
>>          --2263-- When reading debug info from /lib/libc-2.13.so:
>>          --2263-- Can't make sense of .data section mapping
>>
>> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
>> ---
>>   ...ind-3.7.0-fix-error-of-reading-debug-info.patch |   11 +++++++++++
>>   meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    5 ++++-
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
>
> Patch needs Upstream-Status:
>
and Signed-off-by:

Thanks
	Sau!

> -M
>
>> new file mode 100644
>> index 0000000..c3ebd67
>> --- /dev/null
>> +++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
>> @@ -0,0 +1,11 @@
>> +--- a/coregrind/m_debuginfo/readelf.c  2012-09-11 21:45:36.696462313 -0500
>> ++++ b/coregrind/m_debuginfo/readelf.c  2012-09-11 21:45:49.913463615 -0500
>> +@@ -1539,7 +1539,7 @@
>> +                 && phdr->p_offset < di->fsm.rw_map_foff + di->fsm.rw_map_size
>> +                 && phdr->p_offset + phdr->p_filesz
>> +                    <= di->fsm.rw_map_foff + di->fsm.rw_map_size
>> +-                && (phdr->p_flags & (PF_R | PF_W | PF_X)) == (PF_R | PF_W)) {
>> ++                && (phdr->p_flags & (PF_R | PF_W | PF_X)) >= (PF_R | PF_W)) {
>> +                if (n_rw == N_RX_RW_AREAS) {
>> +                   ML_(symerr)(di, True,
>> +                               "N_RX_RW_AREAS is too low; "
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
>> index abda7a6..651ae60 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
>> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
>>
>>   X11DEPENDS = "virtual/libx11"
>>   DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>> -PR = "r5"
>> +PR = "r6"
>>
>>   SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>>             file://fix_issue_caused_by_ccache.patch \
>> @@ -21,6 +21,9 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>>              file://configure-with-glibc-2.16.patch \
>>             "
>>
>> +SRC_URI_append_powerpc = " file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
>> +SRC_URI_append_powerpc64 = "file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
>
> Is it safe to apply this to everything? I can't image an elf issue
> would be powerpc specific.
>
> -M
>
>> +
>>   SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
>>   SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
>>
>> --
>> 1.7.9.5
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


