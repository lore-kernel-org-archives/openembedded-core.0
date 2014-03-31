Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA4F6EA2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 14:37:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2VEbeao022499
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 07:37:40 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 31 Mar 2014 07:37:40 -0700
Message-ID: <53397DB0.4060900@windriver.com>
Date: Mon, 31 Mar 2014 22:37:36 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1396254930-11013-1-git-send-email-kai.kang@windriver.com>
	<1396254930-11013-2-git-send-email-kai.kang@windriver.com>
	<20140331102446.GB2425@jama>
In-Reply-To: <20140331102446.GB2425@jama>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo-1.5.1: keep install command directory mode
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
X-List-Received-Date: Mon, 31 Mar 2014 14:37:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年03月31日 18:24, Martin Jansa wrote:
> On Mon, Mar 31, 2014 at 04:35:30PM +0800, Kai Kang wrote:
>> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>>
>> When install command sets the created directory mode, pseudo will change
>> the mode of the directory to 0700 incorrectly. Backport patch to fix it.
>>
>> Drop PR as well.
>>
>> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../files/pseudo-1.5.1-install-directory-mode.patch    | 18 ++++++++++++++++++
>>   meta/recipes-devtools/pseudo/pseudo_1.5.1.bb           |  3 +--
>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
>>
>> diff --git a/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
>> new file mode 100644
>> index 0000000..e8eaf13
>> --- /dev/null
>> +++ b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
>> @@ -0,0 +1,18 @@
>> +Upstream-Status: Backport
>> +
>> +when install command sets the created directory mode, pseudo will change
>> +the mode of the directory to 0700 incorrectly.
>> +
>> +Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +--- a/ports/unix/guts/mkdirat.c
>> ++++ b/ports/unix/guts/mkdirat.c
>> +@@ -25,6 +25,7 @@
>> + 		stat_rc = base_fstatat(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
>> + #endif
>> + 		if (stat_rc != -1) {
>> ++			buf.st_mode = PSEUDO_DB_MODE(buf.st_mode, mode);
>> + 			pseudo_client_op(OP_MKDIR, 0, -1, dirfd, path, &buf);
>> + 		} else {
>> + 			pseudo_debug(1, "mkdir of %s succeeded, but stat failed: %s\n",
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
>> index bc92856..c265017 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
>> @@ -1,11 +1,10 @@
>>   require pseudo.inc
>>   
>> -PR = "r4"
> You cannot drop PR when PV/PE is the same, version goes backward (you
> should notice QA Error about that).

Sorry, forget that. But I didn't meet the QA Error. When should it 
appear, parse recipes or do_package_qa?

I'll send V2.

Thanks,
Kai

>
>> -
>>   SRC_URI = " \
>>       http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
>>       file://0001-pseudo_has_unload-add-function.patch \
>>       file://shutdownping.patch \
>> +    file://pseudo-1.5.1-install-directory-mode.patch \
>>   "
>>   
>>   SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
>> -- 
>> 1.8.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Regards,
Neil | Kai Kang


