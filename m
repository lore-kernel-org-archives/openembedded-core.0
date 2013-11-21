Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41D0560B60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 15:26:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rALFQgfi011577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:26:42 -0800 (PST)
Received: from [128.224.21.188] (128.224.21.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 21 Nov 2013 07:26:41 -0800
Message-ID: <528E262F.9050601@windriver.com>
Date: Thu, 21 Nov 2013 10:26:39 -0500
From: Konrad Scherer <Konrad.Scherer@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
	<1385019198-24458-3-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1385019198-24458-3-git-send-email-mark.hatle@windriver.com>
X-Originating-IP: [128.224.21.188]
Subject: Re: [master][dora][PATCH 2/2] perf: Disable -Werror flag
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
X-List-Received-Date: Thu, 21 Nov 2013 15:26:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-21 02:33 AM, Mark Hatle wrote:
> From: Konrad Scherer <Konrad.Scherer@windriver.com>
>
> If the sed command does not run before make is invoked, the compile
> fails. Defining the environment variable is the proper way to disable
> warnings as errors build option and eliminates the race condition.
>
> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta/recipes-kernel/perf/perf.bb | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 138595d..1b889aa 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -40,6 +40,7 @@ export STAGING_INCDIR
>   export STAGING_LIBDIR
>   export BUILD_SYS
>   export HOST_SYS
> +export WERROR = "0"
>
>   do_populate_lic[depends] += "virtual/kernel:do_populate_sysroot"
>
> @@ -118,10 +119,6 @@ do_install() {
>   	fi
>   }
>
> -do_configure_prepend () {
> -    sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
> -}
> -

This is will not work for kernels < 3.1. I did submit another patch 
which works for all kernel versions.

-- 
Konrad Scherer, MTS, Linux Products Group, Wind River

