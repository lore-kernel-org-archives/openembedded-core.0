Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3539F780CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 15:41:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4UFfvMX005125
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 30 May 2017 08:41:59 -0700
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 30 May 2017 08:41:58 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20170530080836.25342-1-Martin.Jansa@gmail.com>
	<CAJ86T=XbqdaxFrWzd1RN-5Y0E8B+Ndj9fHAy8XU0v+q1OYMp6Q@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <3feaadad-607b-0ae4-61b4-158f86816786@windriver.com>
Date: Tue, 30 May 2017 10:41:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XbqdaxFrWzd1RN-5Y0E8B+Ndj9fHAy8XU0v+q1OYMp6Q@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Tue, 30 May 2017 15:41:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/30/17 9:45 AM, Andre McCurdy wrote:
> On Tue, May 30, 2017 at 1:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> * Using "cp -a" leaks UID of user running the builds, causing
>>   many QA warnings.
>> * See this thread for details:
>>   http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112904.html
> 
> Using "cp -av --no-preserve=ownership" is a slightly cleaner solution.

I personally prefer Martin's version since '-a' is not supported everywhere.
(Unless you using gnu cp, which 99% of the Linux world uses.. but non-Linux
systems rarely do.)

--Mark

>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/recipes-core/coreutils/coreutils_8.27.bb       | 2 +-
>>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb | 4 ++--
>>  meta/recipes-extended/mdadm/mdadm_4.0.bb            | 2 +-
>>  3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb b/meta/recipes-core/coreutils/coreutils_8.27.bb
>> index 667e0af560..ea8740a2d1 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.27.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.27.bb
>> @@ -99,7 +99,7 @@ do_install_append() {
>>         install -t ${D}/${mandir}/man1 ${S}/man/*.1
>>         # prebuilt man pages don't do a separate man page for [ vs test.
>>         # see comment above r.e. sed and update-alternatives
>> -       cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
>> +       cp -R --no-dereference --preserve=mode,links -v ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
>>  }
>>
>>  inherit update-alternatives
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
>> index 5216c7027c..7c8809a41e 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
>> @@ -106,7 +106,7 @@ do_compile_ptest() {
>>  }
>>
>>  do_install_ptest() {
>> -       cp -a ${B}/tests ${D}${PTEST_PATH}/test
>> -       cp -a ${S}/tests/* ${D}${PTEST_PATH}/test
>> +       cp -R --no-dereference --preserve=mode,links -v ${B}/tests ${D}${PTEST_PATH}/test
>> +       cp -R --no-dereference --preserve=mode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test
>>         sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i ${D}${PTEST_PATH}/test/*/expect*
>>  }
>> diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
>> index 98a10a8b15..506b0bc315 100644
>> --- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
>> +++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
>> @@ -55,7 +55,7 @@ do_compile_ptest() {
>>  }
>>
>>  do_install_ptest() {
>> -       cp -a ${S}/tests ${D}${PTEST_PATH}/tests
>> +       cp -R --no-dereference --preserve=mode,links -v ${S}/tests ${D}${PTEST_PATH}/tests
>>         cp ${S}/test ${D}${PTEST_PATH}
>>         sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/!g' -i ${D}${PTEST_PATH}/test
>>         ln -s ${base_sbindir}/mdadm ${D}${PTEST_PATH}/mdadm
>> --
>> 2.13.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


