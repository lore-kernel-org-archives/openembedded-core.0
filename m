Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 862B260670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 13:31:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5IDVBTn018679
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 06:31:12 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Thu, 18 Jun 2015 06:31:11 -0700
Message-ID: <5582C81F.7070502@windriver.com>
Date: Thu, 18 Jun 2015 08:31:11 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
Subject: Re: [PATCH 1/3] arch-mips.inc: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Thu, 18 Jun 2015 13:31:13 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 6/18/15 8:13 AM, Dmitry Eremin-Solenikov wrote:
> Currently MIPS64 N32 is broken. There is internal disagreement
> between TARGET_ARCH (which doesn't contain ABIEXTENSION) and
> TRANSLATED_TARGET_ARCH (which contains ABIEXTENSION). ABI is already
> encoded into the TARGET_OS. ARM tunes in the same situation override
> neither the TARGET_ARCH nor the TRANSLATED_TARGET_ARCH. So let's drop
> this override.

This series won't work properly, unless I'm reading something incorrectly.

You won't be able to build/install a tri-lib system after this change, as
something needs to be there to differential between MIPS32 (o32), MIPS64 (n32)
and MIPS64 (n64).

Currently this is done via the ABIEXTENSION value.

What is currently broken w/ MIPS64 N32?  We put in a number of fixes for this
problem and SDK generation in the YP 1.8 time frame.  Perhaps something has
changed since then or maybe the fixes were not as complete as we thought?

--Mark

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/conf/machine/include/mips/arch-mips.inc | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
> index c41fa5e..02626d3 100644
> --- a/meta/conf/machine/include/mips/arch-mips.inc
> +++ b/meta/conf/machine/include/mips/arch-mips.inc
> @@ -100,7 +100,3 @@ TUNE_FEATURES_tune-mips64el-nf = "n64"
>  BASE_LIB_tune-mips64el-nf = "lib64"
>  MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
>  PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
> -
> -# On mips we need to redefine this to include the ABIEXTENSION
> -# we can avoid the python bit as there are no _ or - to translate
> -TRANSLATED_TARGET_ARCH = "${TARGET_ARCH}${ABIEXTENSION}"
> 


