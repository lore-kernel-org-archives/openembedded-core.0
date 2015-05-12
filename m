Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7026013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:58:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2015 07:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,415,1427785200"; d="scan'208";a="709017822"
Received: from jrmenon-mobl4.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.252.200.222])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2015 07:58:47 -0700
Message-ID: <55521527.6020509@linux.intel.com>
Date: Tue, 12 May 2015 07:58:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Jens Rottmann <Jens.Rottmann@ADLINKtech.com>
References: <5540CCFD.1050604@ADLINKtech.com> <5551DA96.2090006@ADLINKtech.com>
In-Reply-To: <5551DA96.2090006@ADLINKtech.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2nd resend] powertop: Fix build for !uclibc - kindly respond
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
X-List-Received-Date: Tue, 12 May 2015 14:58:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


I am working on getting a 1.6.3 release finalized, this will be pulled 
into that release and it should be going to QA this week.

Sau!


On 05/12/2015 03:48 AM, Jens Rottmann wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> Date: Thu, 18 Dec 2014 15:54:14 +0100
> Subject: powertop: Fix build for !uclibc
>
> * EXTRA_LDFLAGS isn't defined for !uclibc and configure fails
>    when it reads it unexpanded, see config.log snippet:
>
>    configure:4177: checking whether the C compiler works
>    configure:4199: i586-oe-linux-gcc  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed ${EXTRA_LDFLAGS} conftest.c  >&5
>    i586-oe-linux-gcc: error: ${EXTRA_LDFLAGS}: No such file or directory
>    configure:4203: $? = 1
>    configure:4241: result: no
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Backported from OpenEmbedded Dizzy branch, commit
> c8f9b5c9a8e5179c2013f25decd6a5483df9c716.
>
> Signed-off-by: Jens Rottmann <Jens.Rottmann@ADLINKtech.com>
> ---
>
> Hi Saul,
>
> as I said, attached patch was taken/ported from OE-Core Dizzy, commit c8f9b5c9a8e5179c2013f25decd6a5483df9c716.
>
> Please apply it to OE-Core _Daisy_ branch, which is affected, too.
>
> Is there anything else I should do, any additional information I need to provide, anything I did wrong? Kindly respond.
>
> Thanks & best regards,
> Jens
>
> diff --git a/meta/recipes-kernel/powertop/powertop_2.5.bb b/met/recipes-kernel/powertop/powertop_2.5.bb
> index f37d7a7..84cca25 100644
> --- a/meta/recipes-kernel/powertop/powertop_2.5.bb
> +++ b/meta/recipes-kernel/powertop/powertop_2.5.bb
> @@ -14,8 +14,9 @@ SRC_URI[sha256sum] = "8b2c08a555d79e1c428863470c41cb023971d74ba4801d80a05e35adee
>   inherit autotools gettext
>
>   # we need to explicitly link with libintl in uClibc systems
> -LDFLAGS += "${EXTRA_LDFLAGS}"
> +EXTRA_LDFLAGS ?= ""
>   EXTRA_LDFLAGS_libc-uclibc = "-lintl"
> +LDFLAGS += "${EXTRA_LDFLAGS}"
>
>   # we do not want libncursesw if we can
>   do_configure_prepend() {
>

