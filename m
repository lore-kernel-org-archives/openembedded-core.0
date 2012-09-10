Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TAxAx-0001tT-G8
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 08:08:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3660; q=dns/txt; s=iport;
	t=1347256584; x=1348466184;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=DxGCqFxuTOPiq95Q0RYj/yBAfM1dn77V2s79Fvj+rgY=;
	b=KDBvsYd51Bbdvc+uHyUyqV/WAB/be7RdhikR0oudGroDYhgAitkKbYHk
	ZGea9LTfzHXR8Q7ae6YmgDlP1rF4tu0timmMu5Ajwak1O9PGKskwQhNud
	kAHRFU2prh0oiXGOYPxQEjfWG4Zj0kT4EneHVep01R/VjzwXwKMXLYUpr 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EAL5/TVCQ/khN/2dsb2JhbABFu1CBB4IgAQEBBAEBAQ8BOAEiChELGAkWBAsJAwIBAgEVAS8TBgIBAR6HbguaZJFTAY1bixOGNgOTMIItgRSES4hXgWeCaA
X-IronPort-AV: E=Sophos;i="4.80,396,1344211200"; d="scan'208";a="143566420"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-1.cisco.com with ESMTP; 10 Sep 2012 05:56:21 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q8A5uL3L003019
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 05:56:21 GMT
Message-ID: <504D7FFF.7000500@cisco.com>
Date: Mon, 10 Sep 2012 07:51:59 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.6esrpre) Gecko/20120730 Thunderbird/10.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1346920164-29192-1-git-send-email-mertsas@cisco.com>
	<5048F57F.10002@linux.intel.com> <5048FCF9.9070707@windriver.com>
In-Reply-To: <5048FCF9.9070707@windriver.com>
Subject: Re: [PATCH] perl: Remove the changes of bin, lib etc. as the defaults will give sane values.
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
X-List-Received-Date: Mon, 10 Sep 2012 06:08:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/06/12 21:43, Mark Hatle wrote:
> On 9/6/12 2:11 PM, Saul Wold wrote:
>> On 09/06/2012 01:29 AM, Martin Ertsaas wrote:
>>> The old config put stuff in
>>> ${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-unknownsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-unknownsdk-linux/usr
>>> instead of in
>>> ${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-nimbussdk-linux/usr
>>> as it should.
>>
>> I am not sure we want to remove that sed code, since allows for
>> different ${libdir} than /usr/lib, such as a flattened /lib, same with
>> the ${exec_prefix}.
>
> Ya, the sed lines are specifically there to enable the end user to
> modify the exec_prefix and libdir to their local distribution
> policies.  If this is no longer necessary, we can remove it.. but
> someone needs to verify they are being used properly.  (Flattened
> filesystem and multilibs are the two places I know it's used today.)
>
> --Mark

Ok. That is ok. However, I think we would need to fix it to give a sane
default value, like
${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-unknownsdk-linux/usr.
Not the part after image is duplicated in the install directory, which
makes do_install fail if you try to use the standard directory.

- Martin
>
>> Sau!
>>
>>
>>> ---
>>>    meta/recipes-devtools/perl/perl_5.14.2.bb |   19 ++++++++-----------
>>>    1 files changed, 8 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb
>>> b/meta/recipes-devtools/perl/perl_5.14.2.bb
>>> index 3c1360f..04e2597 100644
>>> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
>>> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
>>> "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>>    # We need gnugrep (for -I)
>>>    DEPENDS = "virtual/db grep-native"
>>>    DEPENDS += "gdbm zlib"
>>> -PR = "r9"
>>> +PR = "r10"
>>>
>>>    # 5.10.1 has Module::Build built-in
>>>    PROVIDES += "libmodule-build-perl"
>>> @@ -145,16 +145,13 @@ do_configure() {
>>>
>>>        ${@base_contains('DISTRO_FEATURES', 'largefile', '',
>>> 'do_nolargefile', d)}
>>>
>>> -        # Update some paths in the configuration
>>> -        sed -i -e 's,@DESTDIR@,${prefix},g' \
>>> -               -e 's,@ARCH@-thread-multi,,g' \
>>> -               -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>>> -               -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
>>> -               -e "s%\([
>>> \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
>>> -           -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
>>> -           -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
>>> -           -e "s%/perl5%/perl%g" \
>>> -            config.sh-${TARGET_ARCH}-${TARGET_OS}
>>> +    # Update some paths in the configuration
>>> +    sed -i -e 's,@DESTDIR@,${prefix},g' \
>>> +           -e 's,@ARCH@-thread-multi,,g' \
>>> +           -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>>> +           -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
>>> +           -e "s%/perl5%/perl%g" \
>>> +          config.sh-${TARGET_ARCH}-${TARGET_OS}
>>>
>>>        case "${TARGET_ARCH}" in
>>>            x86_64 | powerpc | s390)
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



