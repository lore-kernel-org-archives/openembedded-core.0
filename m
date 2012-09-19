Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TEDUq-0006hv-Dt
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 08:10:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2981; q=dns/txt; s=iport;
	t=1348034293; x=1349243893;
	h=message-id:date:from:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=iG0mWbqBBbnxBlVh91UcCiQ3tRXsksU1/6whohtiu8c=;
	b=N0ZspBP8VccZmKg/HhJSVMR3rZyz3z2x6SWtij+9tafM4CinIVsISo3M
	6xzKDGWS3qsx5lN17hjsWowdR2sEVYdBLNZT78MoM2tDVukIfNTHRoQ72
	fAC2Yo+qMCEPM4+8Odm6++MyWknc56or4u1EYlDfivZ5i9P/Vj3vSEk8v U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EAD5dWVCQ/khR/2dsb2JhbABFvFWBCIIgAQEBBBIBOAEsARALDgoJFg8JAwIBAgFFBg0BBwEBFweHXppAkVYBjkKLHIZBA5VjhWCIWIFpgmg
X-IronPort-AV: E=Sophos;i="4.80,446,1344211200"; d="scan'208";a="76803124"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-2.cisco.com with ESMTP; 19 Sep 2012 05:57:06 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q8J5v6Yi002748;
	Wed, 19 Sep 2012 05:57:06 GMT
Message-ID: <50595E49.5030202@cisco.com>
Date: Wed, 19 Sep 2012 07:55:21 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1347972747-7040-1-git-send-email-mertsas@cisco.com>
	<50588B69.90209@linux.intel.com>
In-Reply-To: <50588B69.90209@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bash: Make it possible to run bash 3.2.48 instead of 4.2.
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
X-List-Received-Date: Wed, 19 Sep 2012 06:10:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/18/12 16:55, Saul Wold wrote:
> On 09/18/2012 05:52 AM, Martin Ertsaas wrote:
>> bash-3.2.48 did not provide the linking from sh to bash, making it
>> unusable.
>> This patch fixes this. The reason for using 3.2.48 is that it is
>> GPLv2 licensed,
>> which 4.2 is not.
>> ---
>>   meta/recipes-extended/bash/bash_3.2.48.bb |   20 +++++++++++++++-----
>>   1 files changed, 15 insertions(+), 5 deletions(-)
>>
>
> Why can't this recipe use the base.inc file also?  This seems to be
> duplicating the code in the .inc file.
>
> Sau!
We could of course do that, and then overwrite the license as the inc
file is the one that says it's GPLv3. I however find that a bit
confusing, as we will have two files to make bash-3.2.48, where one is
saying it's GPLv3 and one saying it's GPLv2. The build system will
understand it, but I don't think it's a nice solution.

Another solution would be to move the LICENSE part out of the inc file,
and into the bash_4.2.bb file, which would completely eliminate both of
our concerns about this. Any objections to doing that?

- Martin
>
>> diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb
>> b/meta/recipes-extended/bash/bash_3.2.48.bb
>> index 509d7a0..bab38a1 100644
>> --- a/meta/recipes-extended/bash/bash_3.2.48.bb
>> +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
>> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
>>   LIC_FILES_CHKSUM =
>> "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
>>   DEPENDS = "ncurses"
>>
>> -PR = "r10"
>> +PR = "r11"
>>
>>   SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
>>             
>> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001
>> \
>> @@ -25,16 +25,18 @@ SRC_URI[patch003.sha256sum] =
>> "354886097cd95b4def77028f32ee01e2e088d58a98184fede
>>   SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
>>   SRC_URI[sha256sum] =
>> "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
>>
>> -inherit autotools gettext
>> +inherit autotools gettext update-alternatives
>>
>>   PARALLEL_MAKE = ""
>>
>> -bindir = "/bin"
>> -sbindir = "/sbin"
>> -
>>   EXTRA_OECONF = "--with-ncurses"
>>   export CC_FOR_BUILD = "${BUILD_CC}"
>>
>> +ALTERNATIVE_${PN} = "sh"
>> +ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
>> +ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash"
>> +ALTERNATIVE_PRIORITY = "100"
>> +
>>   export AUTOHEADER = "true"
>>
>>   do_configure_prepend () {
>> @@ -43,6 +45,14 @@ do_configure_prepend () {
>>       fi
>>   }
>>
>> +do_install_append () {
>> +    # Move /usr/bin/bash to /bin/bash, if need
>> +    if [ "${base_bindir}" != "${bindir}" ]; then
>> +        mkdir -p ${D}${base_bindir}
>> +        mv ${D}${bindir}/bash ${D}${base_bindir}
>> +    fi
>> +}
>> +
>>   pkg_postinst_${PN} () {
>>       touch $D${sysconfdir}/shells
>>       grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >>
>> $D${sysconfdir}/shells
>>



