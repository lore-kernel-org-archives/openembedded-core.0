Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 29E89731AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 10:04:02 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 851D15C024C;
	Mon, 25 Nov 2019 11:04:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574676243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=A/dgT4p36O2bXRIpZMxYgEASsE+wQCuqtqP2ACnIf3c=;
	b=mZiuqVXx8QfMHJ6PL4vQktSFTRgUNg3AJarAB5oeNKriLjzx0GJPzGQdt5hfVYIM+ZP/Ju
	Gp2cXmauCn1b+teFXkfN+MdKsJCCCmBASfOLybVoNB+v0X57PI0FXTWeuFwBiKUOthFDGs
	n8lQUbyid+KVCDo1Oo4ZvPZYjMoKPPU=
MIME-Version: 1.0
Date: Mon, 25 Nov 2019 11:04:03 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20191115160944.28231-1-stefan@agner.ch>
References: <20191115160944.28231-1-stefan@agner.ch>
Message-ID: <17ae28d0ee7a91545c3647cf8f4ce9e0@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] base-files: set ptmxmode to 666
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
X-List-Received-Date: Mon, 25 Nov 2019 10:04:03 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On 2019-11-15 17:09, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> Make sure that the (newer) /dev/pts/ptmx is accessible by users. This
> is useful e.g. when running containers which symlink /dev/ptmx to
> /dev/pts/ptmx on start. The default mode (000) does not allow to
> create ptys inside the container.
> 
> Using 666 when symlinking /dev/ptmx is also recommended by the kernel
> documentation when /dev/ptmx is symlinked:
> https://www.kernel.org/doc/Documentation/filesystems/devpts.txt
> 
> Also buildroot uses ptmxmode=0666. The patch introducing the change
> explains related use cases why this is necessary a bit more in depth:
> https://github.com/buildroot/buildroot/commit/8196b299ba12bd6741bf7f4462cad180dab77fb0#diff-2d4604b9e565eb19fa52ce31f282f06c
> 

Any thought about this? From what I can tell it did not make it into
oe-core yet?

--
Stefan


> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/recipes-core/base-files/base-files/fstab | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files/fstab
> b/meta/recipes-core/base-files/base-files/fstab
> index d79a01602f..70e400f567 100644
> --- a/meta/recipes-core/base-files/base-files/fstab
> +++ b/meta/recipes-core/base-files/base-files/fstab
> @@ -2,7 +2,7 @@
>  
>  /dev/root            /                    auto       defaults              1  1
>  proc                 /proc                proc       defaults              0  0
> -devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
> +devpts               /dev/pts             devpts    
> mode=0620,ptmxmode=0666,gid=5      0  0
>  tmpfs                /run                 tmpfs     
> mode=0755,nodev,nosuid,strictatime 0  0
>  tmpfs                /var/volatile        tmpfs      defaults              0  0

