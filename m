Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9A8C607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 01:57:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t691vWom002005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Jul 2015 18:57:32 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Jul 2015 18:57:32 -0700
Message-ID: <559DD50C.4040109@windriver.com>
Date: Thu, 9 Jul 2015 09:57:32 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1436346123.git.kai.kang@windriver.com>
	<4e6ff252db44e357cbdda2cdfcbd553defaf7958.1436346123.git.kai.kang@windriver.com>
	<20150708103656.GB2398@jama>
In-Reply-To: <20150708103656.GB2398@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] subversion: improve the regex of sed command of SVN_SERF_INCLUDES macro
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
X-List-Received-Date: Thu, 09 Jul 2015 01:57:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年07月08日 18:36, Martin Jansa wrote:
> On Wed, Jul 08, 2015 at 05:03:40PM +0800, Kai Kang wrote:
>> [Yocto #7474]
>>
>> The regex of sed command is too simple, which mangles any "-D" in
>> strings, for example, a project name is "My-Demo", it will be removed
>> from the path by the sed regex, which causes a build failure. Improving
>> it to only delete the -D behind of a space or the -D at start of a
>> string.
> Seems to duplicate:
> commit 04554b128c358e3c10f6581fd4506764a65240b8
> Author: Jose Lamego <jose.a.lamego@linux.intel.com>
> Date:   Fri Jul 3 07:34:50 2015 +0000
>
>      subversion_1.8.13.bb: Regex modified to allow '-D' in paths

Thanks for pointing out it.

The patch is merged by subversion upstream with replacing '[[:space:]]' 
with ' '.

http://svn.apache.org/viewvc/subversion/trunk/build/ac-macros/serf.m4?r1=1594156&r2=1689824

Regards,
Kai

>      
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../Improve_the_regex_of_sed_command_of.patch      | 31 ++++++++++++++++++++++
>>   .../subversion/subversion_1.8.13.bb                |  1 +
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch
>>
>> diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch b/meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch
>> new file mode 100644
>> index 0000000..626923b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch
>> @@ -0,0 +1,31 @@
>> +Improve the regex of sed command of SVN_SERF_INCLUDES macro
>> +
>> +The regex of sed command is too simple, which mangles any "-D"
>> +in strings, for example, a project name is "My-Demo", it will
>> +be removed from the path by the sed regex, which causes a build
>> +failure. Improving it to only delete the -D behind of a space or
>> +the -D at start of a string.
>> +
>> +Reference:
>> +
>> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=7874
>> +
>> +Upstream-Status: Submitted [http://mail-archives.apache.org/mod_mbox/subversion-dev/201507.mbox/%3C559CDA70.8030403%40windriver.com%3E]
>> +
>> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +diff --git a/build/ac-macros/serf.m4.old b/build/ac-macros/serf.m4
>> +index 885c5a1..39969c6 100644
>> +--- a/build/ac-macros/serf.m4.old
>> ++++ b/build/ac-macros/serf.m4
>> +@@ -143,7 +143,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
>> +         if $PKG_CONFIG $serf_major --atleast-version=$serf_check_version; then
>> +           AC_MSG_RESULT([yes])
>> +           serf_found=yes
>> +-          SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_major --cflags | $SED -e 's/-D[^ ]*//g'`]
>> ++          SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_major --cflags | $SED -e 's/[[:space:]]-D[^ ]*//g' -e 's/^-D[^ ]*//g'`]
>> +           SVN_SERF_LIBS=`$PKG_CONFIG $serf_major --libs`
>> +           break
>> +         else
>> diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
>> index a98be67..73ace61 100644
>> --- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
>> +++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
>> @@ -12,6 +12,7 @@ inherit gettext pythonnative
>>   SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>>              file://libtool2.patch \
>>              file://disable_macos.patch \
>> +           file://Improve_the_regex_of_sed_command_of.patch \
>>   "
>>   SRC_URI[md5sum] = "4413417b529d7bdf82f74e50df02e88b"
>>   SRC_URI[sha256sum] = "1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e5d500e843d607579"
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Regards,
Neil | Kai Kang


