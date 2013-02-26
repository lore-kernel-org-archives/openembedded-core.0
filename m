Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1UA94x-0007Iq-A6
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 02:11:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q0tEE9000540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Feb 2013 16:55:14 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 25 Feb 2013 16:55:12 -0800
Message-ID: <512C07ED.4070602@windriver.com>
Date: Tue, 26 Feb 2013 08:55:09 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1361768629-6911-1-git-send-email-ming.liu@windriver.com>
	<512BF9FD.7030702@linux.intel.com>
In-Reply-To: <512BF9FD.7030702@linux.intel.com>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] parted: fix several integer overflows
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
X-List-Received-Date: Tue, 26 Feb 2013 01:11:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 07:55 AM, Saul Wold wrote:
> On 02/24/2013 09:03 PM, Ming Liu wrote:
>> Integer overflows was found in libparted/labels/dvh.c, while attemptting
>> assign unsigned int values to int types in some places. These overflows
>> only can be observed on BE platforms like MIPS, when the 
>> "WORDS_BIGENDIAN"
>> macro is defined in parted.
>>
>> Defined by unsigned int instead.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   .../parted/parted-3.1/fix-dvh-overflows.patch      | 34 
>> ++++++++++++++++++++++
>>   meta/recipes-extended/parted/parted_3.1.bb         |  5 ++--
>>   2 files changed, 37 insertions(+), 2 deletions(-)
>>   create mode 100644 
>> meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
>>
>> diff --git 
>> a/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch 
>> b/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
>> new file mode 100644
>> index 0000000..0768642
>> --- /dev/null
>> +++ b/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
>> @@ -0,0 +1,34 @@
>> +Upstream-Status: Pending
>> +
> Please add Signed-off-by: to the patch also.

OK, got it. I will send V1.

the best,
thank you

>
> Thanks
>     Sau!
>
>> +---
>> + dvh.h |   10 +++++-----
>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>> +
>> +Index: parted-3.1/libparted/labels/dvh.h
>> +===================================================================
>> +--- parted-3.1.orig/libparted/labels/dvh.h    2013-02-25 
>> 10:46:13.204477586 +0800
>> ++++ parted-3.1/libparted/labels/dvh.h    2013-02-25 
>> 10:47:20.954477065 +0800
>> +@@ -112,8 +112,8 @@ struct device_parameters {
>> +
>> + struct volume_directory {
>> +     char    vd_name[VDNAMESIZE];    /* name */
>> +-    int    vd_lbn;            /* logical block number */
>> +-    int    vd_nbytes;        /* file length in bytes */
>> ++    unsigned int    vd_lbn;        /* logical block number */
>> ++    unsigned int    vd_nbytes;    /* file length in bytes */
>> + };
>> +
>> + /*
>> +@@ -125,9 +125,9 @@ struct volume_directory {
>> +  * NOTE: pt_firstlbn SHOULD BE CYLINDER ALIGNED
>> +  */
>> + struct partition_table {        /* one per logical partition */
>> +-    int    pt_nblks;        /* # of logical blks in partition */
>> +-    int    pt_firstlbn;        /* first lbn of partition */
>> +-    int    pt_type;        /* use of partition */
>> ++    unsigned int    pt_nblks;    /* # of logical blks in partition */
>> ++    unsigned int    pt_firstlbn;    /* first lbn of partition */
>> ++    int        pt_type;    /* use of partition */
>> + };
>> +
>> + #define    PTYPE_VOLHDR    0        /* partition is volume header */
>> diff --git a/meta/recipes-extended/parted/parted_3.1.bb 
>> b/meta/recipes-extended/parted/parted_3.1.bb
>> index 21d3a66..079b295 100644
>> --- a/meta/recipes-extended/parted/parted_3.1.bb
>> +++ b/meta/recipes-extended/parted/parted_3.1.bb
>> @@ -4,13 +4,14 @@ LICENSE = "GPLv3+"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
>>   SECTION = "console/tools"
>>   DEPENDS = "ncurses readline util-linux"
>> -PR = "r0"
>> +PR = "r1"
>>
>>   SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
>>              file://no_check.patch \
>>              file://syscalls.patch \
>>              file://fix-git-version-gen.patch \
>> -           file://fix-doc-mandir.patch"
>> +           file://fix-doc-mandir.patch \
>> +           file://fix-dvh-overflows.patch"
>>
>>   SRC_URI[md5sum] = "5d89d64d94bcfefa9ce8f59f4b81bdcb"
>>   SRC_URI[sha256sum] = 
>> "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15"
>>
>
>



