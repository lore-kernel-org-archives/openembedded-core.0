Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3Vy4-00017Y-G7
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 19:40:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 10:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,798,1336374000"; d="scan'208";a="211195576"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2012 10:28:37 -0700
Message-ID: <503273C4.6010308@linux.intel.com>
Date: Mon, 20 Aug 2012 10:28:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1345461584-24086-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1345461584-24086-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Preserve generated headers only if they exist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 17:40:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2012 04:19 AM, Martin Jansa wrote:
> * I have 2.6.37 kernel without this directory and do_install now fails
>    after 813256bf7bb6e26d542d5f769e2802564116ebe5
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/kernel.bbclass |    6 ++++--
>   1 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b24ab1a..f34e632 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -191,8 +191,10 @@ kernel_do_install() {
>   	if [ -f include/generated/bounds.h ]; then
>   		cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
>   	fi
> -	mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> -	cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
> +	if [ -d arch/${ARCH}/include/generated ]; then
> +		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> +		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
> +	fi
>
>   	# Remove the following binaries which cause strip or arch QA errors
>   	# during do_package for cross-compiled platforms
>

Merged into OE-Core

Thanks
	Sau!



