Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3C07E61A80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:21:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLQCSC023849; Wed, 29 May 2013 22:26:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RaMV-qGaScFl; Wed, 29 May 2013 22:26:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLQ8qU023845
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 29 May 2013 22:26:09 +0100
Message-ID: <1369862502.14887.234.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 29 May 2013 22:21:42 +0100
In-Reply-To: <1369840203-21898-18-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-18-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 17/21] grep: fix for CVE-2012-5667
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
X-List-Received-Date: Wed, 29 May 2013 21:21:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 10:09 -0500, Mark Hatle wrote:
> From: Ming Liu <ming.liu@windriver.com>
> 
> Multiple integer overflows in GNU Grep before 2.11 might allow
> context-dependent attackers to execute arbitrary code via vectors
> involving a long input line that triggers a heap-based buffer overflow.
> 
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-5667
> 
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  .../grep/grep-2.5.1a/grep-CVE-2012-5667.patch      | 28 ++++++++++++++++++++++
>  meta/recipes-extended/grep/grep_2.5.1a.bb          |  3 ++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
> 
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
> new file mode 100644
> index 0000000..e163736
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
> @@ -0,0 +1,28 @@
> +The patch to fix CVE-2012-5667
> +Reference: https://bugzilla.redhat.com/attachment.cgi?id=686605&action=diff
> +
> +Multiple integer overflows in GNU Grep before 2.11 might allow
> +context-dependent attackers to execute arbitrary code via vectors
> +involving a long input line that triggers a heap-based buffer overflow.
> +
> +http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-5667
> +
> +Signed-off-by Ming Liu <ming.liu@windriver.com>
> +---
> + grep.c |    7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)

This needs an Upstream-Status field (I know its clear when you read it
but the scripts can't do that).

Cheers,

Richard

> +--- a/src/grep.c	2013-05-15 13:39:33.359191769 +0800
> ++++ a/src/grep.c	2013-05-15 13:50:22.609191882 +0800
> +@@ -306,6 +306,11 @@ fillbuf (size_t save, struct stats const
> +   int cc = 1;
> +   char *readbuf;
> +   size_t readsize;
> ++  const size_t max_save = INT_MAX / 2;
> ++
> ++  /* Limit the amount of saved data to INT_MAX to fix CVE-2012-5667 */
> ++  if (save > max_save)
> ++     error (2, 0, _("line too long"));
> + 
> +   /* Offset from start of buffer to start of old stuff
> +      that we want to save.  */
> diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
> index d6386ed..247c837 100644
> --- a/meta/recipes-extended/grep/grep_2.5.1a.bb
> +++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
> @@ -13,7 +13,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
>             file://gettext.patch \
>             file://fix64-int-to-pointer.patch \
>             file://Makevars \
> -           "
> +           file://grep-CVE-2012-5667.patch \
> +          "
>  
>  SRC_URI[md5sum] = "52202fe462770fa6be1bb667bd6cf30c"
>  SRC_URI[sha256sum] = "38c8a2bb9223d1fb1b10bdd607cf44830afc92fd451ac4cd07619bf92bdd3132"



