Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 679E67BED1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 13:16:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBFDFGBG016364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 15 Dec 2018 05:15:56 -0800
Received: from server.local (128.224.23.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Dec 2018 05:15:41 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Hongzhi.Song"
	<hongzhi.song@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1544608560-107439-1-git-send-email-hongzhi.song@windriver.com>
	<766caeba2dcdfc09616e10e3105e3e0a3f84f194.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <dcf93a11-e9ed-8123-dc13-c3b5d23162dc@windriver.com>
Date: Sat, 15 Dec 2018 08:15:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <766caeba2dcdfc09616e10e3105e3e0a3f84f194.camel@linuxfoundation.org>
Subject: Re: [PATCH] kern-tools: modify grep pattern for tools/kconf_check
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
X-List-Received-Date: Sat, 15 Dec 2018 13:16:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-12-15 7:12 a.m., Richard Purdie wrote:
> On Wed, 2018-12-12 at 04:56 -0500, Hongzhi.Song wrote:
>> The cmd line, <grep '^[  ]*\(menu\)*config '>, can't
>> match all expect config options.
>>
>> This is because that it is not always space after 'config'
>> in kernel-source/*/.../Kconfig.
>> e.g. "config  IP_VS_IPV6" in net/netfilter/ipvs/Kconfig
>> 	    ^^
>> 	These are not spaces.
>>
>> So we should change the cmd to grep '^[  ]*\(menu\)*config\s'.
>>
>> License-Update: <Since the S is changed from WORKDIR to WORKDIR/git
>> for
>> putting the patches to git/, the path of license should be changed
>> too.>
>>
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> ---
>>   ...0001-tool-kconf_check-modify-grep-pattern.patch | 37
>> ++++++++++++++++++++++
>>   .../kern-tools/kern-tools-native_git.bb            | 13 +++++---
>>   2 files changed, 46 insertions(+), 4 deletions(-)
>>   create mode 100644 meta/recipes-kernel/kern-tools/files/0001-tool-
>> kconf_check-modify-grep-pattern.patch
>>
>> diff --git a/meta/recipes-kernel/kern-tools/files/0001-tool-
>> kconf_check-modify-grep-pattern.patch b/meta/recipes-kernel/kern-
>> tools/files/0001-tool-kconf_check-modify-grep-pattern.patch
>> new file mode 100644
>> index 0000000..7f9c5a2
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kern-tools/files/0001-tool-kconf_check-
>> modify-grep-pattern.patch
>> @@ -0,0 +1,37 @@
>> +From 080a0662e235bb359ef06f6ba922f56a6040078f Mon Sep 17 00:00:00
>> 2001
>> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
>> +Date: Tue, 11 Dec 2018 04:54:59 -0500
>> +Subject: [PATCH] tool/kconf_check: modify grep pattern
>> +
>> +The cmd line, <grep '^[  ]*\(menu\)*config '>, can't
>> +match all expect config options.
>> +
>> +This is because that it is not always space after 'config'
>> +in kernel-source/*/.../Kconfig.
>> +e.g. "config  IP_VS_IPV6" in net/netfilter/ipvs/Kconfig
>> +
>> +So we should change the cmd to grep '^[  ]*\(menu\)*config\s'.
>> +
>> +Upstream-Status: Submitted [
>> https://lists.yoctoproject.org/pipermail/yocto/2018-December/043564.html
>> ]
>> +
>> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> +---
>> + tools/kconf_check | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/tools/kconf_check b/tools/kconf_check
>> +index aa86180..20b49cd 100755
>> +--- a/tools/kconf_check
>> ++++ b/tools/kconf_check
>> +@@ -241,7 +241,7 @@ find ${kernel_source} \
>> + # known list of all Kconfig* files.  Again, must filter dups.
>> + rm -f ${LOGDIR}/all.cfg
>> + for i in `cat ${LOGDIR}/all.kcf` ; do
>> +-    cat ${kernel_source}/$i | grep '^[ 	]*\(menu\)*config ' | \
>> ++    cat ${kernel_source}/$i | grep '^[ 	]*\(menu\)*config\s' |
>> \
>> + 	awk '{print "CONFIG_"$2}' >> ${LOGDIR}/all.cfg
>> + done
>> + mv -f ${LOGDIR}/all.cfg ${LOGDIR}/all.cfg~
>> +--
>> +2.8.1
>> +
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index b353c21..682c726 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -1,6 +1,6 @@
>>   SUMMARY = "Tools for managing Yocto Project style branched kernels"
>>   LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM =
>> "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1bda400e28
>> 28845ba0d06c"
>> +LIC_FILES_CHKSUM =
>> "file://tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1bda400e282884
>> 5ba0d06c"
>>   
>>   DEPENDS = "git-native"
>>   
>> @@ -10,8 +10,11 @@ PV = "0.2+git${SRCPV}"
>>   
>>   inherit native
>>   
>> -SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
>> -S = "${WORKDIR}"
>> +SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git \
>> +           file://0001-tool-kconf_check-modify-grep-pattern.patch \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>>   UPSTREAM_CHECK_COMMITS = "1"
>>   
>>   do_compile() {
>> @@ -19,6 +22,8 @@ do_compile() {
>>   }
>>   
>>   do_install() {
>> -	cd ${S}/git
>> +	cd ${S}
>>   	make DESTDIR=${D}${bindir} install
>>   }
>> +
>> +FILESEXTRAPATH = "${THISDIR}/files"
> 
> I don't think you need to add this last line?
> 
> Also, since "we" maintain yocto-kernel-tools, can Bruce not apply this
> or fix it upstream?

Yes. We don't need this part of the patch. I'll apply the
change to the repo and send a SRCREV update for the recipe.

Bruce

> 
> Cheers,
> 
> Richard
> 
> 


