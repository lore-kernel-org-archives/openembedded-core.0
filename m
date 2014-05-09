Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E534A60559
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 06:38:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 May 2014 23:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1016,1389772800"; d="scan'208";a="528991864"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2014 23:38:13 -0700
Message-ID: <536C77D5.6040205@linux.intel.com>
Date: Thu, 08 May 2014 23:38:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1399019818-4767-1-git-send-email-koen.kooi@linaro.org>
	<536BB2C0.60903@linux.intel.com>
	<7A042294-2122-4EA0-BE1F-68E0BB65512D@dominion.thruhere.net>
	<916F5AEB-85EC-4CE0-8771-79F7467D6A86@dominion.thruhere.net>
In-Reply-To: <916F5AEB-85EC-4CE0-8771-79F7467D6A86@dominion.thruhere.net>
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] git: fix perl binding installation
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
X-List-Received-Date: Fri, 09 May 2014 06:38:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2014 10:59 PM, Koen Kooi wrote:
>
> Op 8 mei 2014, om 19:30 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
>
>>
>> Op 8 mei 2014, om 18:37 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
>>
>>> On 05/02/2014 01:36 AM, Koen Kooi wrote:
>>>> Git.pm wasn't ending up in the package because do_install removed it
>>>> with a misleading comment about multilib. Workaround the problem so
>>>> that Git.pm ends up in the correct dir *and* doesn't get deleted.
>>>>
>>>
>>> Seems to be a problem as RP was concerned with:
>>>
>>>
>>>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/bin/git difftool
>>>> Can't locate Error.pm in @INC (@INC contains: /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3 /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl//5.14.3 /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/ /srv/ssd/machines/meta-intel-iot-devkit/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3 .) at /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-difftool line 17.
>>>> BEGIN failed--compilation aborted at /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-difftool line 17.
>>>
>>> Doing a find in my sysroot:
>>>
>>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/CPANPLUS/Error.pm
>>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl/5.14.3/Error.pm
>>
>> Drat, I checked for buildpaths and didn't find anything. I'll retest and send a new version hopefully tomorrow.
>
> I need to read errors better :) Do you have http://patches.openembedded.org/patch/70635/ applied? And did 'difftool' work before this? None of the perl tools worked for me due to error.pm missing.
>
Apparently not, this must have gotten lost during the release crazies.

Can you please resend a rebased patch set against master with both of 
these tested using the git-replacement-native target.

Thanks
	Sau!

>
>>
>> regards,
>>
>> Koen
>>
>>>
>>> Sau!
>>>
>>>
>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>> ---
>>>> meta/recipes-devtools/git/git.inc | 7 ++++++-
>>>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
>>>> index 73e11eb..178b768 100644
>>>> --- a/meta/recipes-devtools/git/git.inc
>>>> +++ b/meta/recipes-devtools/git/git.inc
>>>> @@ -28,10 +28,14 @@ do_install () {
>>>> 		template_dir=${datadir}/git-core/templates \
>>>> 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
>>>>
>>>> +	cd ${B}/perl && oe_runmake install DESTDIR="${D}" bindir=${bindir}
>>>> +
>>>> 	# ${libdir} is not applicable here, perl-native files are always
>>>> 	# installed to /usr/lib on both 32/64 bits targets.
>>>> +	# Fix up build paths and point to target locations.
>>>> +	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${exec_prefix}/lib/perl
>>>> +	sed -i -e s:${D}::g ${D}${exec_prefix}/lib/perl/*/auto/Git/.packlist
>>>> 	rm -rf ${D}${exec_prefix}/lib/perl-native
>>>> -	rmdir ${D}${exec_prefix}/lib || true
>>>> }
>>>>
>>>> PERLSEDFIXUP = " \
>>>> @@ -75,6 +79,7 @@ PERLTOOLS = " \
>>>> PACKAGES =+ "${PN}-perltools"
>>>> FILES_${PN}-perltools += " \
>>>>      ${PERLTOOLS} \
>>>> +    ${prefix}/lib/perl \
>>>>      ${datadir}/perl \
>>>> "
>>>> RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path liberror-perl findutils"
>
>
>

