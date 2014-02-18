Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81C276EE32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 17:49:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1IHnBA3000619
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:49:12 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 09:49:11 -0800
Message-ID: <53039D17.6040106@windriver.com>
Date: Tue, 18 Feb 2014 11:49:11 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1392626895-14981-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1392626895-14981-1-git-send-email-ming.liu@windriver.com>
Subject: Re: [PATCH V2] rpm: fix a endian incompatible error in generating tag
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
X-List-Received-Date: Tue, 18 Feb 2014 17:49:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/14, 2:48 AM, Ming Liu wrote:
> A flaw was found in the way rpm generating arbitrary tags, which leads to a
> incorrect query result, this issue is introduced by a incompatible endianess
> when the generating process is executed on different architectures.
>
> This patch resolves it by taking the byte order that host uses.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>

This looks reasonable to me as well.

Reviewed-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>   .../rpm-tag-generate-endian-conversion-fix.patch   |   49 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
>   2 files changed, 50 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
> new file mode 100644
> index 0000000..e487b82
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
> @@ -0,0 +1,49 @@
> +fix a endian incompatible error in generating rpm tag
> +
> +A flaw was found in the way rpm generating arbitrary tags, which leads to a
> +incorrect query result, this issue is introduced by a incompatible endianess
> +when the generating process is executed on different architectures.
> +
> +This patch resolves it by taking the byte order that host uses.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +---
> + tagname.c |   16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff -urpN a/rpmdb/tagname.c b/rpmdb/tagname.c
> +--- a/rpmdb/tagname.c
> ++++ b/rpmdb/tagname.c
> +@@ -3,6 +3,19 @@
> +  */
> +
> + #include "system.h"
> ++#include <endian.h>
> ++
> ++/* Don't redefine this macro if it already exists */
> ++#ifndef le32toh
> ++#ifdef __USE_BSD
> ++#include <byteswap.h>
> ++#if __BYTE_ORDER == __LITTLE_ENDIAN
> ++#define le32toh(x) (x)
> ++#else
> ++#define le32toh(x) __bswap_32(x)
> ++#endif
> ++#endif /* __USE_BSD */
> ++#endif /* le32toh */
> +
> + #include <rpmio_internal.h>	/* XXX DIGEST_CTX, xtolower, xstrcasecmp */
> + #include <rpmmacro.h>
> +@@ -152,7 +165,10 @@ static rpmTag _tagGenerate(const char *s
> +     xx = rpmDigestUpdate(ctx, s, nb);
> +     xx = rpmDigestFinal(ctx, &digest, &digestlen, 0);
> +     if (digest && digestlen > 4) {
> ++	/* The tag is stored in a uniform byte order for cross-endian compatibility.
> ++	   Swap to the host uses. */
> + 	memcpy(&tag, digest + (digestlen - 4), 4);
> ++	tag = le32toh(tag);
> + 	tag = (rpmTag) (tag & 0x3fffffff);
> + 	tag = (rpmTag) (tag | 0x40000000);
> +     }
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 9d376a5..7921f40 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -89,6 +89,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>   	   file://debugedit-valid-file-to-fix-segment-fault.patch \
>   	   file://rpm-platform-file-fix.patch \
>   	   file://rpm-lsb-compatibility.patch \
> +	   file://rpm-tag-generate-endian-conversion-fix.patch \
>   	  "
>
>   # Uncomment the following line to enable platform score debugging
>


