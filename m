Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1023271C2F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 19:12:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB8JC6aQ018979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2016 11:12:06 -0800
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 8 Dec 2016 11:12:06 -0800
To: <openembedded-core@lists.openembedded.org>
References: <20161208190327.221469-1-mark.hatle@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0274cef3-8b9a-6888-0ecc-13cea1b02561@windriver.com>
Date: Thu, 8 Dec 2016 13:12:05 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161208190327.221469-1-mark.hatle@windriver.com>
Subject: Re: [morty] [PATCH] glibc: Enable backtrace from abort on ARM
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
X-List-Received-Date: Thu, 08 Dec 2016 19:12:06 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Forgot to mention, also applicable to Morty.

--Mark

On 12/8/16 1:03 PM, Mark Hatle wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
> 
> ARM stack frames for abort and raise were limited to the the actual
> abort and raise call, such as:
> 
> Obtained 4 stack frames.
> ./test-app(print_trace+0x1c) [0x10a08]
> ./test-app() [0x10b3c]
> /lib/libc.so.6(__default_sa_restorer+0) [0x4adae1e0]
> /lib/libc.so.6(gsignal+0xa0) [0x4adacf74]
> 
> This is not terribly useful when trying to figure out what function
> may have called called the abort, especially when using pthreads.
> 
> After the change the trace would now look like:
> 
> Obtained 8 stack frames.
> ./test-app(print_trace+0x1c) [0x10a08]
> ./test-app() [0x10b3c]
> /lib/libc.so.6(__default_sa_restorer+0) [0x4befe1e0]
> /lib/libc.so.6(gsignal+0xa0) [0x4befcf74]
> /lib/libc.so.6(abort+0x134) [0x4befe358]
> ./test-app(dummy_function+0x50) [0x10adc]
> ./test-app(main+0xd4) [0x10c24]
> /lib/libc.so.6(__libc_start_main+0x114) [0x4bee7a58]
> 
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index e85c7044a0..358e69be67 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -78,3 +78,9 @@ do_configure_prepend() {
>  }
>  
>  GLIBC_ADDONS ?= "nptl,libidn"
> +
> +# Enable backtrace from abort()
> +do_configure_append_arm () {
> +	echo "CFLAGS-abort.c = -funwind-tables" >> ${B}/configparms
> +	echo "CFLAGS-raise.c = -funwind-tables" >> ${B}/configparms
> +}
> 


