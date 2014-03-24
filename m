Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 778126F911
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 07:58:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2O7w8mZ028332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 00:58:08 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 24 Mar 2014 00:58:05 -0700
Message-ID: <532FE586.2050708@windriver.com>
Date: Mon, 24 Mar 2014 15:57:58 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1395646642.git.hongxu.jia@windriver.com>
	<9c06686dc4ccc2576bd8a171ed685ab00eecf84c.1395646642.git.hongxu.jia@windriver.com>
In-Reply-To: <9c06686dc4ccc2576bd8a171ed685ab00eecf84c.1395646642.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] libsoup-2.4: upgrade to 2.45.92
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
X-List-Received-Date: Mon, 24 Mar 2014 07:58:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2014 03:40 PM, Hongxu Jia wrote:
> There was a error about mips-gcc optimization while building
> libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled, the 2.45.92
> have fixed this issue.

Update the comments to make a clarity.

libsoup-2.4: upgrade to 2.45.92

There was an error about mips-gcc optimization while compiling
libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled.

The test code of libsoup-2.4 2.45.3 triggered gcc assert which located
in gcc/dwarf2out.c:20810:
...
20806       gcc_assert (prev
20807                   && (CALL_P (prev)
20808                       || (NONJUMP_INSN_P (prev)
20809                           && GET_CODE (PATTERN (prev)) == SEQUENCE
20810                           && CALL_P (XVECEXP (PATTERN (prev), 0, 
0)))));
...

The issue test code is the C function 'do_qvalue_tests' located in
tests/header-parsing.c.

The 2.45.92 have refactored the test code and this issue has been fixed.

[YOCTO #5512]

//Hongxu
> [YOCTO #5512]
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../libsoup/{libsoup-2.4_2.45.3.bb => libsoup-2.4_2.45.92.bb}         | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-support/libsoup/{libsoup-2.4_2.45.3.bb => libsoup-2.4_2.45.92.bb} (85%)
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.45.92.bb
> similarity index 85%
> rename from meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
> rename to meta/recipes-support/libsoup/libsoup-2.4_2.45.92.bb
> index b1199d8..f3a2617 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.45.92.bb
> @@ -17,8 +17,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
>   SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
>   SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
>   
> -SRC_URI[md5sum] = "fe7ec04784c6b97c5f8ea963c8542f59"
> -SRC_URI[sha256sum] = "6ac317b931efd2cff9cdea7122987acb3ecb0c32564a9441ba72e5cce021aa12"
> +SRC_URI[md5sum] = "d72623f2baac7f58d1295c0b6ae7cd35"
> +SRC_URI[sha256sum] = "d34f4b41eec99ecf082783f842a29e712e7a78e83f4cd2a060b9de64377d21d8"
>   
>   S = "${WORKDIR}/libsoup-${PV}"
>   


