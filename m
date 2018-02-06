Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D997560602
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 04:46:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w164kQNw007775
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 5 Feb 2018 20:46:26 -0800
Received: from localhost.localdomain (128.224.163.240) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 5 Feb 2018 20:46:22 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
	<46e9caf8d072f584d43c411386159b795e84eb47.1517798422.git.liezhi.yang@windriver.com>
	<8e77657de70448429413f20d9d26b33f@XBOX02.axis.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <3413eb0c-e964-4ec1-2ef9-23bb878d51b0@windriver.com>
Date: Tue, 6 Feb 2018 12:46:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <8e77657de70448429413f20d9d26b33f@XBOX02.axis.com>
Subject: Re: [PATCH 3/4] git: 2.15.0 -> 2.16.1
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
X-List-Received-Date: Tue, 06 Feb 2018 04:46:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 02/05/2018 07:29 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Robert Yang
>> Sent: den 5 februari 2018 03:41
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 3/4] git: 2.15.0 -> 2.16.1
>>
>> Add RDEPENDS_${PN} += "perl" to fix:
>> ERROR: git-2.16.1-r0 do_package_qa: QA Issue: /usr/share/git-
>> core/templates/hooks/fsmonitor-watchman.sample contained in package git
>> requires /usr/bin/perl, but no providers found in RDEPENDS_git? [file-rdeps]
>> ERROR: git-2.16.1-r0 do_package_qa: QA run found fatal errors. Please
>> consider fixing them.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/git/git.inc       |  2 ++
>>   meta/recipes-devtools/git/git_2.15.0.bb | 11 -----------
>>   meta/recipes-devtools/git/git_2.16.1.bb | 11 +++++++++++
>>   3 files changed, 13 insertions(+), 11 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/git/git_2.15.0.bb
>>   create mode 100644 meta/recipes-devtools/git/git_2.16.1.bb
>>
>> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
>> index 9b4c128..4943b94 100644
>> --- a/meta/recipes-devtools/git/git.inc
>> +++ b/meta/recipes-devtools/git/git.inc
>> @@ -125,6 +125,8 @@ FILES_${PN}-perltools += " \
>>       ${libdir}/perl \
>>       ${datadir}/perl \
>>   "
>> +RDEPENDS_${PN} += "perl"
> 
> No, don't do that. Instead add the fsmonitor-watchman.sample file
> to ${PERLTOOLS}, just like the other hook sample files
> (prepare-commit-msg.sample and pre-rebase.sample) that are written
> in Perl. That way we'll keep the perl dependency out of the main
> git package.

Thanks, updated in the repo.

// Robert


> 
>>   RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
>>
>>   # git-tk package with gitk and git-gui
>> diff --git a/meta/recipes-devtools/git/git_2.15.0.bb b/meta/recipes-
>> devtools/git/git_2.15.0.bb
>> deleted file mode 100644
>> index fd6c931..0000000
>> --- a/meta/recipes-devtools/git/git_2.15.0.bb
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -require git.inc
>> -
>> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
>> -
>> ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
>> -                 "
>> -EXTRA_OEMAKE += "NO_GETTEXT=1"
>> -
>> -SRC_URI[tarball.md5sum] = "1ed7298833336c1accb0a7be5a7a2b1b"
>> -SRC_URI[tarball.sha256sum] =
>> "25762cc50103a6a0665c46ea33ceb0578eee01c19b6a08fd393e8608ccbdb3da"
>> -SRC_URI[manpages.md5sum] = "19a0116bcb0779e0bc997c4180018daf"
>> -SRC_URI[manpages.sha256sum] =
>> "3b1b9ebf02d4aa6e741becd1ed9319597488743f939fdab3b894ec52d25408ef"
>> diff --git a/meta/recipes-devtools/git/git_2.16.1.bb b/meta/recipes-
>> devtools/git/git_2.16.1.bb
>> new file mode 100644
>> index 0000000..9dc4eba
>> --- /dev/null
>> +++ b/meta/recipes-devtools/git/git_2.16.1.bb
>> @@ -0,0 +1,11 @@
>> +require git.inc
>> +
>> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
>> +
>> ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
>> +                 "
>> +EXTRA_OEMAKE += "NO_GETTEXT=1"
>> +
>> +SRC_URI[tarball.md5sum] = "37467da8e79e72f28598d667f219f75e"
>> +SRC_URI[tarball.sha256sum] =
>> "56cfa48af2b289bba172ca0a47c29f0083f5846cf4759978b70988e4f07fc9fd"
>> +SRC_URI[manpages.md5sum] = "5587407f3c28446af12fde3f3131ba34"
>> +SRC_URI[manpages.sha256sum] =
>> "d499e825f429d76862be415f579c20cc26b046573a3a39237acaf9682cb71be7"
>> --
>> 2.7.4
> 
> //peter
> 
> 

