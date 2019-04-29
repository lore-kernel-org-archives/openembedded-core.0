Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1667DA88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:41:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3T6ew6r008933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 28 Apr 2019 23:41:08 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 28 Apr 2019 23:40:47 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <5CB80B5D.40800@windriver.com>
	<1556095261-171895-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CC69E2C.9060601@windriver.com>
Date: Mon, 29 Apr 2019 14:48:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1556095261-171895-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.170]
Subject: Re: [PATCH v4 1/2] nettle: fix the Segmentation fault
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
X-List-Received-Date: Mon, 29 Apr 2019 06:41:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

Thanks,

On 2019年04月24日 16:41, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> The commit[8ac8fa8ee1 nettle: update to 3.4.1]
> add CFLAGS_append = " -std=c99" to silence the
> below error for native build:
> | ../nettle-3.4.1/rsa-sign-tr.c: In function 'sec_equal':
> | ../nettle-3.4.1/rsa-sign-tr.c:243:3: error: 'for' loop initial declarations are only allowed in C99 mode
>     for (size_t i = 0; i < limbs; i++)
>     ^
> | ../nettle-3.4.1/rsa-sign-tr.c:243:3: note: use option -std=c99 or -std=gnu99 to compile your code
> | Makefile:263: recipe for target 'rsa-sign-tr.o' failed
>
> But the above change will trigger below Segmentation
> fault:
>   # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
>   [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
>   [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
>   Segmentation fault
>
> So update the logic to CFLAGS_append = " -std=gnu99"
> to fix the issue.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta/recipes-support/nettle/nettle_3.4.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
> index dd49c30..8375fcf 100644
> --- a/meta/recipes-support/nettle/nettle_3.4.1.bb
> +++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
> @@ -30,7 +30,7 @@ inherit autotools ptest multilib_header
>   EXTRA_AUTORECONF += "--exclude=aclocal"
>
>   EXTRA_OECONF = "--disable-openssl"
> -CFLAGS_append = " -std=c99"
> +CFLAGS_append = " -std=gnu99"
>
>   do_compile_ptest() {
>           oe_runmake buildtest
>

