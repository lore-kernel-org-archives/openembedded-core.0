Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3VVt-0000pm-3q
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 19:11:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2012 09:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="182996219"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2012 09:57:56 -0700
Message-ID: <50326C93.9000104@linux.intel.com>
Date: Mon, 20 Aug 2012 09:57:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] kernel.bbclass: Preserve generated headers
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
X-List-Received-Date: Mon, 20 Aug 2012 17:11:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2012 08:10 AM, Khem Raj wrote:
> asm/unistd.h includes asm/unistd_64.h on x86_64
> and asm/unistd_32.h on i386 but these files are
> generated files in 3.4 and when we do 'make clean' they get
> deleted and it shows up as an error when building
> external modules. May be its a 3.4 kernel bug may be not
> but make clean should have left the tree in
> a shape to build modules but it does not.
>
> Probably we should run make modules_prepare after having
> run make clean.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/kernel.bbclass |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b19ed4c..4ac3d48 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -197,6 +197,8 @@ kernel_do_install() {
>   	if [ -f include/generated/bounds.h ]; then
>   		cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
>   	fi
> +	mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> +	cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
>
>   	# Remove the following binaries which cause strip or arch QA errors
>   	# during do_package for cross-compiled platforms
>

Merged into OE-Core

Thanks
	Sau!



