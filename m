Return-Path: <sbabic@denx.de>
X-Greylist: delayed 573 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Apr 2016 09:19:03 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D57367327F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 09:19:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3qhDDT5xVTz3hjNF;
	Fri,  8 Apr 2016 11:09:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3qhDDT2YpGzvh2C;
	Fri,  8 Apr 2016 11:09:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id PvnWk-a56zgV; Fri,  8 Apr 2016 11:09:28 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221]) by mail.mnet-online.de (Postfix) with ESMTP;
	Fri,  8 Apr 2016 11:09:28 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 27E49454060F;
	Fri,  8 Apr 2016 11:09:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gzQdsCHfcuxt; Fri,  8 Apr 2016 11:09:24 +0200 (CEST)
Received: from [192.168.178.20] (papero.fritz.box [192.168.178.20])
	by babic.homelinux.org (Postfix) with ESMTP id 37CFC454021A;
	Fri,  8 Apr 2016 11:09:23 +0200 (CEST)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1460099653.git.liezhi.yang@windriver.com>
	<088e89118818dccb4f19c73795d7ae2a724e6473.1460099653.git.liezhi.yang@windriver.com>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <57077543.1010708@denx.de>
Date: Fri, 8 Apr 2016 11:09:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <088e89118818dccb4f19c73795d7ae2a724e6473.1460099653.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 2/4] image_types.bbclass: fix ubi ubifs and multiubi
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
X-List-Received-Date: Fri, 08 Apr 2016 09:19:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Robert,

On 08/04/2016 09:15, Robert Yang wrote:
> Fixed when do_image_ubi:
> | DEBUG: Executing shell function do_image_ubifs
> | Error: min. I/O unit was not specified (use -h for help)
> | WARNING: exit code 255 from a shell command.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/image_types.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 3f97ddd..caa4dbb 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -120,6 +120,9 @@ IMAGE_CMD_elf () {
>  }
>  IMAGE_TYPEDEP_elf = "cpio.gz"
>  
> +MKUBIFS_ARGS ?= "-m 1KiB -e 128KiB -c $ROOTFS_SIZE"
> +UBINIZE_ARGS ?= "-m 1KiB -p 128KiB"
> +

These are machine specific and are generally set in the machine
configuration file. Default values you set here could be wrong in most
cases, depending on the NAND chip.

Is it not better to get the error ? Then I know that I forget to set the
two variables and I can easy fix it. If no error is raised, we get a
ubifs that never run on the machine and as rootfs is not mounted - and
finding the reason is much more difficult.

Best regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

