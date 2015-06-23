Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABC6973905
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 21:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NLs3s1016184; Tue, 23 Jun 2015 22:54:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6iV57kSMotuw; Tue, 23 Jun 2015 22:54:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NLrl4f016178
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Jun 2015 22:53:58 +0100
Message-ID: <1435096427.11489.102.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 23 Jun 2015 22:53:47 +0100
In-Reply-To: <1435087374-18117-1-git-send-email-sgw@linux.intel.com>
References: <1435087374-18117-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][master&fido] image.bbclass: Disable USE_DEPMOD for the dummy kernel
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
X-List-Received-Date: Tue, 23 Jun 2015 21:54:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-23 at 12:22 -0700, Saul Wold wrote:
> The image bbclass will try to find the kernel-abiversion file which is not part
> of the linux-dummy kernel since there is no actual kernel. In this case using
> depmod also does not make sense since there should not be any kernel module built.
> 
> [YOCTO #7884]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 01f8b3f..be245e9 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -66,7 +66,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
>  EXCLUDE_FROM_WORLD = "1"
>  
>  USE_DEVFS ?= "1"
> -USE_DEPMOD ?= "1"
> +USE_DEPMOD ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-dummy", "0", "1", d)}'
>  

I'm not convinced this is the right way to solve this. How about we
teach the code in rootfs.py not to generate a modules.dep file if there
are no kernel modules to generate dependency information for?

Cheers,

Richard


