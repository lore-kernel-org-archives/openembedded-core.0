Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E771665D58
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 08:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8985VVf016915; Tue, 9 Sep 2014 09:05:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6iIQHBpUqcSl; Tue,  9 Sep 2014 09:05:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8985Pan016907
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 9 Sep 2014 09:05:26 +0100
Message-ID: <1410249927.19272.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>
Date: Tue, 09 Sep 2014 09:05:27 +0100
In-Reply-To: <1410227590-14190-2-git-send-email-akuster808@gmail.com>
References: <1410227590-14190-1-git-send-email-akuster808@gmail.com>
	<1410227590-14190-2-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [[PATCH] qemuppc64: add machine
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
X-List-Received-Date: Tue, 09 Sep 2014 08:05:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-09-08 at 18:53 -0700, Armin Kuster wrote:
> override USER_CLASSES as prelink does not currently
> work on ppc64
> ---
>  meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/conf/machine/qemuppc64.conf
> 
> diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
> new file mode 100644
> index 0000000..86916e5
> --- /dev/null
> +++ b/meta/conf/machine/qemuppc64.conf
> @@ -0,0 +1,16 @@
> +#@TYPE: Machine
> +#@NAME: qemu PPC 64 Emulator setup
> +#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
> +
> +require conf/machine/include/qemu.inc
> +DEFAULTTUNE ?= "ppc64p6"
> +require conf/machine/include/tune-power6.inc
> +
> +#prelink broken
> +USER_CLASSES = "buildstats image-mklibs "

This is horrible. Can we somehow blacklist qemuppc64 in the prelink
class itself?

USER_CLASSES_remove = "prelink"

would be better than overriding the users choice like above...

Cheers,

Richard

> +KERNEL_IMAGETYPE = "vmlinux"
> +
> +IMAGE_FSTYPES = "ext2 ext3"
> +
> +SERIAL_CONSOLE ?= "ttyS0"
> -- 
> 1.9.1
> 



