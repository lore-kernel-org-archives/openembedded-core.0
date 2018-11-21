Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DCDDC60234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 10:22:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wALAM0Dn027969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2018 02:22:00 -0800 (PST)
Received: from [128.224.163.212] (128.224.163.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 21 Nov 2018 02:21:59 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1542793159-82086-1-git-send-email-zhe.he@windriver.com>
	<a62020398837a76303dfc2b9d880279731d955e9.camel@linuxfoundation.org>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <443e9905-4658-ba4b-4138-ab1a4cef99ac@windriver.com>
Date: Wed, 21 Nov 2018 18:21:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a62020398837a76303dfc2b9d880279731d955e9.camel@linuxfoundation.org>
X-Originating-IP: [128.224.163.212]
Cc: bruce.ashfield@windriver.com
Subject: Re: [PATCH] scripts: Use fixed temporary file instead of pipe for here-doc
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
X-List-Received-Date: Wed, 21 Nov 2018 10:22:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2018/11/21 18:07, Richard Purdie wrote:
> On Wed, 2018-11-21 at 17:39 +0800, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> A workaround for possible "*** Compiler lacks asm-goto support..
>> Stop."
>> linux-libc-headers is built by gcc on build machine, which could not
>> contain the
>> fix.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  ...-fixed-temporary-file-instead-of-pipe-for.patch | 60
>> ++++++++++++++++++++++
>>  .../linux-libc-headers/linux-libc-headers_4.18.bb  |  4 ++
>>  2 files changed, 64 insertions(+)
>>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-
>> libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-
>> for.patch
> How old is an "old gcc"?

I put the full explanation in the commit log of the patch inside.

The fix below for the bug has not been released from upstream. Since there has
not been gcc-cross when building linux-libc-headers, we have to use build
machine gcc which could not contain the fix for the moment. To work around the
error, we create a fixed temporary file to contain the program being tested.

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=
2a50366ded329bfb39d387253450c9d5302c3503

>
> If this isn't going upstream, I'm not sure we want to take and carry
> this either. Unless this is a gcc people would commonly run into I'm
> tempted not to take this.

This is a gcc issue, but the fix would not quickly goto versions being used
by users. So this patch is used as a workaround to prevent the failure.

To be specific, we encountered this in docker where the /tmp could be
rarely used that very low number inode may be allocated and triggers
the error.

>
> Also, your patch subject is wrong as this does not change our scripts
> directory.

If this is OK, I'll send v2 to change the subject.

Thanks,
Zhe

>
> Cheers,
>
> Richard
>
>
>
>


