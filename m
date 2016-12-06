Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDFC6011B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 02:11:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB62BarC017358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Dec 2016 18:11:36 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Dec 2016 18:11:35 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1480949616.git.liezhi.yang@windriver.com>
	<981a3fcb8a50c6277be726177a5895c64296d2ac.1480949616.git.liezhi.yang@windriver.com>
	<CAMKF1so3kwUrinR7HWarC+CPd+1d1mby2_-H-5XE3XQb3PzZaw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a9bde40d-5322-c9e3-ac47-3801b520e80b@windriver.com>
Date: Tue, 6 Dec 2016 10:11:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so3kwUrinR7HWarC+CPd+1d1mby2_-H-5XE3XQb3PzZaw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] diffutils: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Tue, 06 Dec 2016 02:11:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2016 02:23 AM, Khem Raj wrote:
> On Mon, Dec 5, 2016 at 6:54 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Fixed when len(TMPDIR) =  410:
>> aclocal: error: cannot open echo [snip]: Argument list too long
>>
>> This is becuase it has a lot of m4 files, use relative path for them
>> can fix the problem.
>>
>> It doesn't happen when MACHINE="qemux86", I think it is because
>> intel-x86-64 is longer than qemux86.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/recipes-extended/diffutils/diffutils_3.4.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-extended/diffutils/diffutils_3.4.bb b/meta/recipes-extended/diffutils/diffutils_3.4.bb
>> index cb7092b..be280ec 100644
>> --- a/meta/recipes-extended/diffutils/diffutils_3.4.bb
>> +++ b/meta/recipes-extended/diffutils/diffutils_3.4.bb
>> @@ -10,6 +10,9 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
>>
>>  EXTRA_OECONF += "--without-libsigsegv-prefix"
>>
>> +# Fix "Argument list too long" error when len(TMPDIR) = 410
>> +acpaths = "-I ./m4"
>
> it looks ok if this work ok with externalsrc

Hi Khem,

What did mean about externalsrc, please ? Did you mean when B != S?
If yes, it works well since it is for aclocal, which always runs in S.
We have already such a fix in several recipes.

meta/recipes-extended/tar/tar.inc:acpaths = "-I ./m4"
meta/recipes-extended/wget/wget.inc:acpaths = "-I ./m4"
meta/recipes-core/coreutils/coreutils_6.9.bb:acpaths = "-I ./m4"
meta/recipes-core/coreutils/coreutils_8.25.bb:acpaths = "-I ./m4"

// Robert

>
>> +
>>  do_configure_prepend () {
>>         # Need to remove gettext macros with weird mix of versions
>>         for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
>> --
>> 2.9.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

