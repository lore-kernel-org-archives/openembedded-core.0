Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9636FE55
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 01:45:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7K1jWZe000423
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 18:45:32 -0700 (PDT)
Received: from server.local (128.224.21.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 18:45:32 -0700
Message-ID: <53F3FD81.7080500@windriver.com>
Date: Tue, 19 Aug 2014 21:44:33 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Yang Shi <yang.shi@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1408483301-7800-1-git-send-email-yang.shi@windriver.com>
In-Reply-To: <1408483301-7800-1-git-send-email-yang.shi@windriver.com>
Subject: Re: [V3 PATCH] kernel: Prevent from installing so files into source dir
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
X-List-Received-Date: Wed, 20 Aug 2014 01:45:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-19, 5:21 PM, Yang Shi wrote:
> vdso build could generate so files, avoid installing such so files into kernel
> source dir, otherwise the below package QA error might be hit:
>
> ERROR: QA Issue: File '/usr/src/kernel/arch/x86/vdso/vdso64.so' from
> linux-yocto was already stripped, this will prevent future
> debugging! [already-stripped]

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Yang Shi <yang.shi@windriver.com>
> ---
>   meta/classes/kernel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 819c302..435b6f0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -253,7 +253,7 @@ kernel_do_install() {
>   	# dir. This ensures the original Makefiles are used and not the
>   	# redirecting Makefiles in the build directory.
>   	#
> -	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
> +	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -name "*.so" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
>   	cp .config $kerneldir
>   	if [ "${S}" != "${B}" ]; then
>   		pwd="$PWD"
>


