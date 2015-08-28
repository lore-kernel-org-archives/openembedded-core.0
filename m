Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3A0976D96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 03:17:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7S3HHJQ022701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 20:17:17 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 27 Aug 2015 20:17:17 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1440731387-19733-1-git-send-email-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <55DFD2BC.7070405@windriver.com>
Date: Thu, 27 Aug 2015 23:17:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1440731387-19733-1-git-send-email-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH] gcc-source: exlude from world
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
X-List-Received-Date: Fri, 28 Aug 2015 03:17:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I've sent the parent email to fix
$ bitbake -c <stage> world.
I've confirmed that my change works for:
$ bitbake -c configure world

I wasn't sure if I should leave gcc-source as
is or change it to be similar to kernel-devsrc
because meta/recipes-devtools/gcc/gcc-source.inc does:

deltask do_configure
deltask do_compile
deltask do_package
...

whereas meta/recipes-kernel/linux/kernel-devsrc.bb does:
# There's nothing to do here, except install the source where we can 
package it
do_fetch[noexec] = "1"
do_unpack[noexec] = "1"
do_patch[noexec] = "1"
...

The kernel-devsrc approach doesn't break world builds
but it's probably slightly less efficient.

Also do people care about consistency in naming:
   gcc-source.inc vs
   kernel-devsrc.bb
? There are only two such 'source' packages so it's not a big deal.

../Randy


On 2015-08-27 11:09 PM, Randy MacLeod wrote:
> Exclude all versions of gcc-source from world builds so that:
>     bitbake -c <stage> world
> will work. gcc-source deletes most bitbake build stages
> since it is a source-only package.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-source_4.8.bb | 2 ++
>   meta/recipes-devtools/gcc/gcc-source_4.9.bb | 2 ++
>   meta/recipes-devtools/gcc/gcc-source_5.2.bb | 2 ++
>   3 files changed, 6 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.8.bb b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
> index 234b82e..b890fa3 100644
> --- a/meta/recipes-devtools/gcc/gcc-source_4.8.bb
> +++ b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
> @@ -1,2 +1,4 @@
>   require recipes-devtools/gcc/gcc-${PV}.inc
>   require recipes-devtools/gcc/gcc-source.inc
> +
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.9.bb b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
> index 234b82e..b890fa3 100644
> --- a/meta/recipes-devtools/gcc/gcc-source_4.9.bb
> +++ b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
> @@ -1,2 +1,4 @@
>   require recipes-devtools/gcc/gcc-${PV}.inc
>   require recipes-devtools/gcc/gcc-source.inc
> +
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/recipes-devtools/gcc/gcc-source_5.2.bb b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
> index 234b82e..b890fa3 100644
> --- a/meta/recipes-devtools/gcc/gcc-source_5.2.bb
> +++ b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
> @@ -1,2 +1,4 @@
>   require recipes-devtools/gcc/gcc-${PV}.inc
>   require recipes-devtools/gcc/gcc-source.inc
> +
> +EXCLUDE_FROM_WORLD = "1"
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

