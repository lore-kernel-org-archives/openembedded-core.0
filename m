Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A36DC433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 19:02:52 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.1424.1666292570559257742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 12:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A3J5N3B6;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1ED8B240005;
	Thu, 20 Oct 2022 19:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666292568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJ2Bc99+br7/UwEUQnDldSMnkqSs88Zm1LmTunIJt2Y=;
	b=A3J5N3B6yFiJ1Hzg4nz82jZuy4Ev9OBIAmLjZvU7ykbecP+cnWi7JN3EX4ynNBDN/OFZrT
	MKzLmjhBbYCoTc54AMvfuXsUoNuD2ijsFT2sPe0pO06BvR99xnPl7y0Md84PmoCOHG1KeG
	Lc4jM3AhCRhCC/2siLXVfBYAeF41A8/x71hE7WxVlieMJ6AqHBBifn6g457WWXO4h8PDPZ
	RZg1zhzO67fV0rFBo15x9lNMnDed9BIeMfAuPHglaNji7qEtKL9VwWbv6+Vz9mUn19rg+6
	JpoiEcge9YsR7bIswDU6zZajjsqbm+ktlgeCIsZYjNxCGn4YBpQ9VSLVl1dYMg==
Message-ID: <16ac69d2-948a-5598-f404-c2093840e2cf@bootlin.com>
Date: Thu, 20 Oct 2022 21:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] run-postinsts: Set dependency for ldconfig to
 avoid boot issues
To: Arturo.Buzarra@digi.com
References: <20221020135531.57483-1-arturo.buzarra@digi.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221020135531.57483-1-arturo.buzarra@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 19:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172005

Hi Arturo

Thanks for the patch!

On 10/20/22 15:55, abuzarra via lists.openembedded.org wrote:
> If a package with a postsints script requires ldconfig, the package class adds
> a ldconfig postinst fragment to initialize it before. Systemd has its own
> ldconfig.service to initialize it and sometimes if both services are running
> at the same time in the first boot, the first one will work, but the second
> one will fail with the following error:
>
>      ldconfig[141]: /sbin/ldconfig: Renaming of /etc/ld.so.cache~ to /etc/ld.so.cache failed: No such file or directory
>
> This commit adds a ordering dependency between them to make sure that only one
> service is running at the same time.
>
> Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
> ---
>   .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


There's a problem with the way your patches are received. I used to have 
it too.

If I apply your patch through "git am", the author of the commit will be:
abuzarra via lists.openembedded.org 
<Arturo.Buzarra=digi.com@lists.openembedded.org>
instead of
Arturo Buzarra <arturo.buzarra@digi.com>

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:

git config --global sendemail.from "arturo.buzarra@digi.com"

This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.

See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update? You could send it to me again through 
private-email first.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


