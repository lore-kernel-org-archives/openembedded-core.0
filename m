Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A90AF60C14
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 18:05:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s09I5dad017282
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jan 2014 10:05:39 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 9 Jan 2014 10:05:38 -0800
Message-ID: <52CEE4F2.7050409@windriver.com>
Date: Thu, 9 Jan 2014 12:05:38 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1389257340-16166-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1389257340-16166-1-git-send-email-ming.liu@windriver.com>
Subject: Re: [PATCH] rpm: fix a endian incompatible error in generating tag
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
X-List-Received-Date: Thu, 09 Jan 2014 18:05:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/14, 2:49 AM, Ming Liu wrote:
> A flaw was found in the way rpm generating arbitrary tags, which leads to a
> incorrect query result, this issue is introduced by a incompatible endianess
> when the generating process is executed on different architectures.
>
> This patch resolves it by taking a uniform byte order.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   .../rpm-tag-generate-endian-conversion-fix.patch   |   29 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
>   2 files changed, 30 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
> new file mode 100644
> index 0000000..4379515
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
> @@ -0,0 +1,29 @@
> +fix a endian incompatible error in generating rpm tag
> +
> +A flaw was found in the way rpm generating arbitrary tags, which leads to a
> +incorrect query result, this issue is introduced by a incompatible endianess
> +when the generating process is executed on different architectures.
> +
> +This patch resolves it by taking a uniform byte order.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +---
> + tagname.c |    3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff -urpN a/rpmdb/tagname.c b/rpmdb/tagname.c
> +--- a/rpmdb/tagname.c
> ++++ b/rpmdb/tagname.c
> +@@ -152,7 +152,10 @@ static rpmTag _tagGenerate(const char *s
> +     xx = rpmDigestUpdate(ctx, s, nb);
> +     xx = rpmDigestFinal(ctx, &digest, &digestlen, 0);
> +     if (digest && digestlen > 4) {
> ++	/* The tag is stored in a uniform byte order for cross-endian compatibility.
> ++	   Swap to little-endian if appropriate. */
> + 	memcpy(&tag, digest + (digestlen - 4), 4);
> ++	tag = htole32(tag);
> + 	tag = (rpmTag) (tag & 0x3fffffff);
> + 	tag = (rpmTag) (tag | 0x40000000);

The above code doesn't look right to me.

If this is reading in from the RPM package, it should be an le32toh..

Otherwise if it's generating the digest info.. then the htole32 should be 
-after- the & and | operations, otherwise the wrong part of the value will be 
modified.

--Mark

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


