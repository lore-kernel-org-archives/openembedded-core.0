Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCA56009A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 06:00:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2013 23:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,882,1367996400"; d="scan'208";a="387416481"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2013 23:00:55 -0700
Message-ID: <520C6E96.80900@linux.intel.com>
Date: Wed, 14 Aug 2013 23:00:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
References: <1376428851-13845-1-git-send-email-jslater@windriver.com>
	<520AA98C.6020104@linux.intel.com>
In-Reply-To: <520AA98C.6020104@linux.intel.com>
Cc: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] coreutils: allow for acl support
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
X-List-Received-Date: Thu, 15 Aug 2013 06:00:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2013 02:47 PM, Saul Wold wrote:
> On 08/13/2013 02:20 PM, Joe Slater wrote:
>> CQID: 430353
>>
>> Define PACKAGECONFIG info for acl assuming it
>> might be a DISTRO_FEATURE.
>>
>
> Thanks for the Patch!
>
> Will you be doing the same for the GPLv2 version?
>
> I guess this means we should be expecting a set of patches to enable
> other recipes that have --disable-acl by default?
>
>
> Thanks
> Sau!
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> ---
>>   meta/recipes-core/coreutils/coreutils_8.21.bb |   14 +++++++++++---
>>   1 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb
>> b/meta/recipes-core/coreutils/coreutils_8.21.bb
>> index 26ada48..e784329 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.21.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
>> @@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>>   LICENSE = "GPLv3+"
>>   LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
>>
>> file://src/ls.c;beginline=5;endline=16;md5=38b79785ca88537b75871782a2a3c6b8"
>>
>> -PR = "r0"
>> +PR = "r1"

I missed noticing this on the first round, please drop the PR Update

Thanks
	Sau!

>>   DEPENDS = "gmp libcap"
>>   DEPENDS_class-native = ""
>>
>> @@ -22,8 +22,16 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>>   SRC_URI[md5sum] = "065ba41828644eca5dd8163446de5d64"
>>   SRC_URI[sha256sum] =
>> "adaa44bdab3fa5eb352e80d8a31fdbf957b78653d0c2cd30d63e161444288e18"
>>
>> -EXTRA_OECONF = "--disable-acl"
>> -EXTRA_OECONF_class-native = "--disable-acl --without-gmp"
>> +EXTRA_OECONF_class-native = "--without-gmp"
>> +
>> +# acl is not a default feature
>> +#
>> +PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES',
>> 'acl', 'acl', '', d)}"
>> +PACKAGECONFIG_class-native ??= ""
>> +
>> +# with, without, depends, rdepends
>> +#
>> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
>>
>>   # [ df mktemp base64 gets a special treatment and is not included in
>> this
>>   bindir_progs = "basename chcon cksum comm csplit cut dir dircolors
>> dirname du \
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

