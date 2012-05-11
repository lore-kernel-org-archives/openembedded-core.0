Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSsZw-0001XG-Eq
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 18:20:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 May 2012 09:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="151867898"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2012 09:10:31 -0700
Message-ID: <4FAD39F7.7080101@linux.intel.com>
Date: Fri, 11 May 2012 09:10:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1336176824-5954-1-git-send-email-sgw@linux.intel.com>
	<5B2F5D0A-BEEF-47BE-85DD-F9FCC7E290DC@dominion.thruhere.net>
	<4FA772BF.5020406@linux.intel.com>
	<92E739C4-DF13-4933-92C0-A6F18CD81957@dominion.thruhere.net>
In-Reply-To: <92E739C4-DF13-4933-92C0-A6F18CD81957@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Move pcap-config to -dev package
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
X-List-Received-Date: Fri, 11 May 2012 16:20:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2012 12:15 AM, Koen Kooi wrote:
>
> Op 7 mei 2012, om 08:59 heeft Saul Wold het volgende geschreven:
>
>> On 05/04/2012 11:57 PM, Koen Kooi wrote:
>>>
>>> Op 5 mei 2012, om 02:13 heeft Saul Wold het volgende geschreven:
>>>
>>>> pcap-config is a tool used for getting the cflags and ln flags for development
>>>>
>>>> [YOCTO #2367]
>>>>
>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>> ---
>>>> meta/recipes-connectivity/libpcap/libpcap.inc |    7 ++++++-
>>>> 1 files changed, 6 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
>>>> index 427078f..7950b2a 100644
>>>> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
>>>> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
>>>> @@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
>>>> PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
>>>> PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
>>>>
>>>> -INC_PR = "r1"
>>>> +INC_PR = "r2"
>>>>
>>>> SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
>>>>
>>>> @@ -30,3 +30,8 @@ do_configure_prepend () {
>>>>          cat aclocal.m4>   acinclude.m4
>>>>      fi
>>>> }
>>>> +
>>>> +# pcap-config is a dev tool and should not be packaged in the
>>>> +# core package.
>>>> +FILES_${PN} = "${libdir}/lib*${SOLIBS}"
>>>> +FILES_${PN}-dev += "${bindir}"
>>>
>>> Change that go ${bindir}/pcap-config to avoid being too greedy during upgrades. Or just inherit 'binconfig' :)
>>
>> It already inherits binconfig!
>>
>> That does not seem to address which package it gets installed in!
>
> Ah right, the oe-core binconfig.bbclass lacks changes that the OE-classic one has:
>
Digging into this has uncovered a small rat's nest of problems! There 
are a around 25 recipes that use binconfig and most of them deliver just 
libraries and a -config command.  There are a number of cases where more 
content is delivered in the FILES_${PN}.

Using the buildhistory tools I was able to see that there are more than 
just pcap with this issue, and moving to the code below does not seem to 
work correctly, since it places the -configs into 
<some_path>/tmp/sysroots/${MACHINE}/<some_path>/tmp/sysroots/${MACHINE>, 
because ${STAGING_BINDIR_CROS} contains  ${STAGING_DIR_HOST} already!

And it's not clear that the FILES_${PN}-dev addition does the correct 
thing since FILES_${PN} is greedy in $bindir, another set change would 
be required to exclude the *-config files from FILES_${PN} which 
currently most of the recipes do by overriding FILES_${PN} with just the 
*.so* line, except for the ones like cups which has a huge amount of 
FILES_${PN} delivered.

I am digging!

Sau!


> koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ diff -u classes/binconfig.bbclass /OE/org.openembedded.dev/classes/binconfig.bbclass
> --- classes/binconfig.bbclass	2012-01-30 13:43:41.000000000 +0100
> +++ /OE/org.openembedded.dev/classes/binconfig.bbclass	2011-04-28 13:29:17.000000000 +0200
> @@ -1,3 +1,5 @@
> +FILES_${PN}-dev += "${bindir}/*-config"
> +
>   # The namespaces can clash here hence the two step replace
>   def get_binconfig_mangle(d):
>   	s = "-e ''"
> @@ -17,6 +19,8 @@
>   		s += " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
>   		s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
>   		s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
> +		if bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d):
> +		    s += bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d)
>   	return s
>
>   BINCONFIG_GLOB ?= "*-config"
> @@ -45,10 +49,10 @@
>   SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
>
>   binconfig_sysroot_preprocess () {
> -	for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
> +	for config in `find ${D} -name '${BINCONFIG_GLOB}'`; do
>   		configname=`basename $config`
> -		install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> -		cat $config | sed ${@get_binconfig_mangle(d)}>  ${SYSROOT_DESTDIR}${bindir_crossscripts}/$configname
> -		chmod u+x ${SYSROOT_DESTDIR}${bindir_crossscripts}/$configname
> +		install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
> +		cat $config | sed ${@get_binconfig_mangle(d)}>  ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
> +		chmod u+x ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
>   	done
>   }
>
>
>


