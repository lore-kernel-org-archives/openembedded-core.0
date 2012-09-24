Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TG0f6-0000MI-5L
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 06:52:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2012 21:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,473,1344236400"; d="scan'208";a="196800069"
Received: from unknown (HELO [10.255.14.15]) ([10.255.14.15])
	by orsmga001.jf.intel.com with ESMTP; 23 Sep 2012 21:40:02 -0700
Message-ID: <505FE422.3090809@linux.intel.com>
Date: Sun, 23 Sep 2012 21:40:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1348435031.4444.241.camel@x121e.pbcl.net>
	<CAMKF1sp3_DKmhCw3jrxuKFNf_a6iP_+6EyytXDg1d-zc+Ei22A@mail.gmail.com>
In-Reply-To: <CAMKF1sp3_DKmhCw3jrxuKFNf_a6iP_+6EyytXDg1d-zc+Ei22A@mail.gmail.com>
Cc: Phil Blundell <philb@gnu.org>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Mon, 24 Sep 2012 04:52:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2012 07:11 PM, Khem Raj wrote:
> On Sun, Sep 23, 2012 at 2:17 PM, Phil Blundell <philb@gnu.org> wrote:
>> This removes the dependency of eglibc.bb itself on perl and bash
>> which, in turn, eliminates the need to build those two recipes if the
>> scripts which need them are not going to be installed.
>>
>
> I think this is a good patch.
>
This causes issues with world build and will likely also cause toolchain 
build failures since eglibc-utils is included in a couple of 
packagegroups (self-hosted and core-lsb), it's also listed in the 
tclibc-eglibc.inc LIBC_DEPENDENCIES.

I am not sure this is a candidate for 1.3 at this point either since we 
are starting the RC2 this week, so it might get held up from master, I 
know this is the RFC, so when the real patch comes.

Sau!

>> Signed-off-by: Phil Blundell <pb@pbcl.net>
>
> ...
>
>
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/eglibc-scripts.inc
>> @@ -0,0 +1,17 @@
>> +include eglibc-collateral.inc
>> +
>> +SUMMARY = "utility scripts provided by eglibc"
>> +DESCRIPTION = "utility scripts provided by eglibc"
>> +RDEPENDS_${PN} = "bash"
>> +RDEPENDS_ldd = "bash"
>
> we do not ask for bash see
> sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in in eglibc.inc
>
>
>> +
>> +SRC = "${STAGING_INCDIR}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
>> +
>> +bashscripts = "mtrace sotruss xtrace"
>> +
>> +do_install() {
>> +       install -d -m 0755 ${D}${bindir}
>> +       for i in ${bashscripts}; do
>> +               install -m 0755 ${SRC}/$i ${D}${bindir}/
>> +       done
>> +}
>> diff --git a/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb b/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
>> new file mode 100644
>> index 0000000..3113362
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
>> @@ -0,0 +1 @@
>> +require eglibc-scripts.inc
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
>> index 72d134a..3a7ae50 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
>> @@ -3,7 +3,7 @@ require eglibc.inc
>>   SRCREV = "20393"
>>
>>   DEPENDS += "gperf-native kconfig-frontends-native"
>> -PR = "r10"
>> +PR = "r11"
>>   PR_append = "+svnr${SRCPV}"
>>
>>   EGLIBC_BRANCH="eglibc-2_16"
>> --
>> 1.7.9
>>
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


