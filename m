Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72E3A6011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 05:55:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7A5tfLs004716
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 9 Aug 2016 22:55:41 -0700
Received: from [128.224.162.220] (128.224.162.220) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Aug 2016 22:55:40 -0700
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<qi.chen@gmail.com>
References: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
	<1470808191-29496-1-git-send-email-hongxu.jia@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <02413506-b758-ee7b-a882-d90adee05482@windriver.com>
Date: Wed, 10 Aug 2016 13:55:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470808191-29496-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH] glibc: apply complocaledir while localedir changed
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
X-List-Received-Date: Wed, 10 Aug 2016 05:55:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2016 01:49 PM, Hongxu Jia wrote:
> Since localedir changed, we should apply complocaledir=/usr/lib/locale
>
> Build image with IMAGE_LINGUAS="en-us en-gb"
>
> Boot target and display all locales:
> ...
> root@localhost:~# locale -a
> C
> POSIX
> en_GB
> en_US
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc_2.24.bb | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
> index 88bcbef2..219370c 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -128,9 +128,7 @@ do_compile () {
>   
>   }
>   
> -# Use the host locale archive when built for nativesdk so that we don't need to
> -# ship a complete (100MB) locale set.
> -do_compile_prepend_class-nativesdk() {
> +do_compile_prepend() {
>       echo "complocaledir=/usr/lib/locale" >> ${S}/configparms

Please drop this, It should be "complocaledir=${localedir}" better.

//Hongxu

>   }
>   



