Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 643C275422
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:11:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5F8BJKT027212
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jun 2018 01:11:19 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 15 Jun 2018 01:11:19 -0700
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
References: <1528968947-430998-1-git-send-email-mingli.yu@windriver.com>
	<bcb49b46-b97e-399b-5a6c-c994b1628ad6@gmail.com>
	<CAJ86T=U0iM3u5Vv-4hOvLFSNs5K8D66++kiRRWqKq7MW=JGyEw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B2373B6.2080006@windriver.com>
Date: Fri, 15 Jun 2018 16:07:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=U0iM3u5Vv-4hOvLFSNs5K8D66++kiRRWqKq7MW=JGyEw@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [PATCH] ltp: set -fomit-frame-pointer explicitly
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
X-List-Received-Date: Fri, 15 Jun 2018 08:11:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年06月15日 03:20, Andre McCurdy wrote:
> On Thu, Jun 14, 2018 at 9:38 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 6/14/18 2:35 AM, mingli.yu@windriver.com wrote:
>>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>>
>>> When build ltp with -fno-omit-frame-pointer,
>>> it will trigger below error:
>>> | cve-2015-3290.c: In function 'child_thread':
>>> | cve-2015-3290.c:416:1: error: bp cannot be used in asm here
>>>
>>> And there is also some comment as below in the source
>>> file ltp/20180515-r0/git/testcases/cve/cve-2015-3290.c
>>> * Build with -O2.  Don't use -fno-omit-frame-pointer.
>>>
>>> So explicitly set -fomit-frame-pointer for compiler
>>> to fix the above build error.
>>>
>>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> ---
>>>   meta/recipes-extended/ltp/ltp_20180515.bb | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
>>> index b07c1b9..5ec25ed 100644
>>> --- a/meta/recipes-extended/ltp/ltp_20180515.bb
>>> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
>>> @@ -19,6 +19,10 @@ LIC_FILES_CHKSUM = "\
>>>   DEPENDS = "attr libaio libcap acl openssl zip-native"
>>>   DEPENDS_append_libc-musl = " fts "
>>>   EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>>> +
>>> +# -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
>>> +# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
>>> +CFLAGS_append = " ${@bb.utils.contains('SELECTED_OPTIMIZATION', '-fno-omit-frame-pointer', '-fomit-frame-pointer', '', d)}"
>
> This doesn't cover all cases - there may be times when the compiler
> chooses to enable frame pointers without being called with
> -fno-omit-frame-pointer.
>
> You could make the append conditional on x86 though (based on the
> error message, it's the x86 frame pointer register which is being used
> by inline assembler).

Thanks Khem and Andre!

Considering it's x86-64 specific(x86 actually not affected), I will 
update the logic unconditionally in V2 as below only for x86-64 to cover 
some cases when the compiler enables frame pointers without being called 
with -fno-omit-frame-pointer.

CFLAGS_append_x86-64 = " -fomit-frame-pointer"

Thanks,

>
>> may be just append it unconditionally, what do we lose ?
>> CFLAGS += "-fomit-frame-pointer"
>>
>>>   CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>>>   CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
>>>   SRCREV = "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"
>>>
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

