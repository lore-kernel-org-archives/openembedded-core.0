Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RUNQK-0007iG-Bd
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 19:56:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Nov 2011 10:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="80220273"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga002.jf.intel.com with ESMTP; 26 Nov 2011 10:49:51 -0800
Message-ID: <4ED134CF.70706@linux.intel.com>
Date: Sat, 26 Nov 2011 10:49:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322095568.git.sgw@linux.intel.com>
	<f8e475e6907d1ad9bfb93ec4c37a0876bc5ed90f.1322095568.git.sgw@linux.intel.com>
	<CAMKF1srOcDxn+y3JaLrN=PCyeHYdhp45ypSy-g4NUc5=uMGwzQ@mail.gmail.com>
In-Reply-To: <CAMKF1srOcDxn+y3JaLrN=PCyeHYdhp45ypSy-g4NUc5=uMGwzQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] intltool: remove XML::Parser check
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
X-List-Received-Date: Sat, 26 Nov 2011 18:56:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/2011 11:37 AM, Khem Raj wrote:
> On Thu, Nov 24, 2011 at 10:29 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>> Add Patch to disable the XML::Parser check in the target
>> intltool.m4, this check will find the host (not native)
>> XML::Parser if it's installed possibly causing Host
>> contamination, but will also fail configuration if XML::Parser
>> is not installed on the host.
>>
>> Since we know that XML::Parser is installed on the image, we don't
>> really need this check, so comment it out.
>
> if it is installed then why does it fail to detect it ?
>
Because the recipes that depend on intltool do not inherit perlnative, 
the recipes in question are gconf and shared-mime-info.  They depend on 
intltool, but do not need to directly inherit perlnative (at least 
according to RP).

Sau!

>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   .../intltool-0.40.6/remove-xml-check.patch         |   29 ++++++++++++++++++++
>>   meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    7 +++--
>>   2 files changed, 33 insertions(+), 3 deletions(-)
>>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>>
>> diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>> new file mode 100644
>> index 0000000..476d091
>> --- /dev/null
>> +++ b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>> @@ -0,0 +1,29 @@
>> +Index: intltool-0.40.6/intltool.m4
>> +===================================================================
>> +--- intltool-0.40.6.orig/intltool.m4   2009-02-14 14:12:28.000000000 -0800
>> ++++ intltool-0.40.6/intltool.m4        2011-11-23 15:39:34.689561872 -0800
>> +@@ -122,14 +122,16 @@
>> +    IT_PERL_VERSION="`$INTLTOOL_PERL -e \"printf '%vd', $^V\"`"
>> +    AC_MSG_RESULT([$IT_PERL_VERSION])
>> + fi
>> +-if test "x$2" != "xno-xml"; then
>> +-   AC_MSG_CHECKING([for XML::Parser])
>> +-   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
>> +-       AC_MSG_RESULT([ok])
>> +-   else
>> +-       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
>> +-   fi
>> +-fi
>> ++
>> ++# Disable this check since we know XML::Parser is installed
>> ++#if test "x$2" != "xno-xml"; then
>> ++#   AC_MSG_CHECKING([for XML::Parser])
>> ++#   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
>> ++#       AC_MSG_RESULT([ok])
>> ++#   else
>> ++#       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
>> ++#   fi
>> ++#fi
>> +
>> + # Substitute ALL_LINGUAS so we can use it in po/Makefile
>> + AC_SUBST(ALL_LINGUAS)
>> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>> index e9871fc..8180fd8 100644
>> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>> +++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>> @@ -1,14 +1,15 @@
>>   require intltool.inc
>>   LICENSE="GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> -PR = "r5"
>> +PR = "r6"
>>
>>   SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
>>                     ${NATIVEPATCHES} \
>>                   "
>>
>> -NATIVEPATCHES = "file://noperlcheck.patch"
>> -NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
>> +NATIVEPATCHES = "file://noperlcheck.patch \
>> +                 file://remove-xml-check.patch"
>> +NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
>>
>>   SRC_URI[md5sum] = "69bc0353323112f42ad4f9cf351bc3e5"
>>   SRC_URI[sha256sum] = "4d1e5f8561f09c958e303d4faa885079a5e173a61d28437d0013ff5efc9e3b64"
>> --
>> 1.7.5.4
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


