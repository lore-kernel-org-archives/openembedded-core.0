Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 27202731A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 22:07:58 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id q21so99348328iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=M9sgQ7WoiyLeIkdwInQXdUGxGiSo0873+lZhcVxM9uA=;
	b=AogVAyI2sCSiaLIVN6UbHFWbI7MU2zXrMOdJixMtQ4fCcFOuHU8i6/Wk5NilADVZJZ
	rS3u1RS3aYRryxZSiDcpkNk6iHzQt6kX8t4Qi3li7Yimfxivb2+YG/+tr/pcsp6zT9Kt
	MhTKtJNq4hXcYQaiclbh/q+EO4RHaEOjsvozSP3y5NLD7Sdavi5oP+JZWn/WDa0HcrVV
	hJ63DquDMY7BOJXuIWknsaJm/dBbASRMVOMPb+xhBuzIxvBB7GjTvfzje6jFj3EEzK1b
	iqFHZP/yX5oWFCt4GhAYND1HI8O4lEZDxZlyVCk9vkOcHy3pyahjlFmSI+1aDFzcU6tp
	xfRw==
X-Received: by 10.107.31.17 with SMTP id f17mr13142848iof.68.1451599679197;
	Thu, 31 Dec 2015 14:07:59 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	h187sm26725285ioh.4.2015.12.31.14.07.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Dec 2015 14:07:58 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1448720991-29707-1-git-send-email-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5685A731.1070109@gmail.com>
Date: Thu, 31 Dec 2015 17:07:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1448720991-29707-1-git-send-email-twoerner@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-oe][PATCH] mkefidisk.sh: add boot log on console
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
X-List-Received-Date: Thu, 31 Dec 2015 22:07:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping?

On 11/28/15 09:29, Trevor Woerner wrote:
> Hooking up a serial console is a "developer mode", the chances are pretty good
> developers are interested in watching the kernel boot log on the console so
> they can spot any problems or diagnose any failed boots (e.g. can't find root
> fs).
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  scripts/contrib/mkefidisk.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> index cd4de05..23c18cb 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -402,7 +402,7 @@ if [ -e "$GRUB_CFG" ]; then
>  	sed -i "s/ LABEL=[^ ]*/ /" $GRUB_CFG
>  
>  	sed -i "s@ root=[^ ]*@ @" $GRUB_CFG
> -	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @" $GRUB_CFG
> +	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $GRUB_CFG
>  fi
>  
>  # Look for a gummiboot installation
> @@ -419,7 +419,7 @@ if [ -d "$GUMMI_ENTRIES" ]; then
>  
>  	sed -i "/initrd /d" $GUMMI_CFG
>  	sed -i "s@ root=[^ ]*@ @" $GUMMI_CFG
> -	sed -i "s@options *LABEL=boot @options LABEL=Boot root=$TARGET_ROOTFS ro rootwait quiet @" $GUMMI_CFG
> +	sed -i "s@options *LABEL=boot @options LABEL=Boot root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $GUMMI_CFG
>  fi
>  
>  # Ensure we have at least one EFI bootloader configured


