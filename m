Return-Path: <andrew.shadura@collabora.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D8DC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 20:25:24 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web08.3050.1642451123819722057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 12:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@collabora.co.uk
 header.s=mail header.b=lJPfdu8y;
 spf=pass (domain: collabora.co.uk, ip: 46.235.227.227,
 mailfrom: andrew.shadura@collabora.co.uk)
Received: from [IPV6:2a01:c846:1980:2500:c895:7533:8856:c063] (unknown
 [IPv6:2a01:c846:1980:2500:c895:7533:8856:c063])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrewsh)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E02761F4308F;
	Mon, 17 Jan 2022 20:25:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.co.uk;
	s=mail; t=1642451121;
	bh=5SHAKbnckff0s75ljppLH7XxnvPo2fL/yeTxJjFURUs=;
	h=Date:To:Cc:From:Subject:From;
	b=lJPfdu8y0F5P65xx7sTLCUfIOBoEtP/kijPe00HO5isOQEB2zjLpKH+6vZ/7uw/5u
	 KiJ9KqyoiOa/JtgYuYC4FdXfv1EveLWycuQJR7F5SpqrRO0YMsl4Y0tL3GHFEa2qao
	 q+m4rEgEEm/dpuLfnAo4XMN8bhXKGydmaK+s1+qZAwH5SdVMtrUnTShrUEMVTSz19E
	 gS3iQf7jbEXxobM+ffuNdvu3MZ0AbyHHg/i72C9V5q/qqvc6Vo/Di63Hpxb25HsICe
	 IowaNgtQtGuvxOYmoEAYwHY4WxVix8eykuTZj0lHGIFQD65BGHDWnZ4BUCji7Zgywz
	 JvPfidQCdyRfQ==
Message-ID: <2172f744-2094-0bdf-335d-b68d70102531@collabora.co.uk>
Date: Mon, 17 Jan 2022 21:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
To: openembedded-core@lists.openembedded.org
Content-Language: en-GB
Cc: Helmut Grohne <helmut@subdivi.de>
From: Andrej Shadura <andrew.shadura@collabora.co.uk>
Subject: pseudo gets confused by tar and aborts
Organization: Collabora
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 20:25:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160661

Hi,

Helmut Grohne reported a bug in pseudo, which, upon further 
investigation, happens when tar (at least v1.34) is extracting a file.

My initial reproducer was this:

$ cd /tmp
$ PSEUDO_PREFIX=/usr PSEUDO_LOCALSTATEDIR=/tmp/state pseudo /bin/bash
# mkdir -p foobar
# tar -C /lib -c -f - . | tar -C /tmp/foobar -xv
./
./cryptsetup/
./cryptsetup/cryptdisks-functions
./cryptsetup/functions
./cryptsetup/scripts/
./cryptsetup/scripts/decrypt_ssl
./cryptsetup/scripts/decrypt_keyctl
./cryptsetup/scripts/decrypt_gnupg
./cryptsetup/scripts/decrypt_gnupg-sc
./cryptsetup/scripts/passdev
./cryptsetup/scripts/decrypt_opensc
./cryptsetup/scripts/decrypt_derived
./cryptsetup/askpass
abort()ing pseudo client by server request. See 
https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
Check logfile: /tmp/state/pseudo.log
Aborted
# cat /tmp/state/pseudo.log
debug_logfile: fd 2
pid 977255 [parent 977254], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 977254.
path mismatch [2 links]: ino 18745211 db 
'/tmp/foobar/cryptsetup/scripts' req '/proc/self/fd/4'.
#

However, the same happened when I pre-tarred /lib and extracted it:

# tar -C /lib -c -f /tmp/test.tar .
# tar -C /tmp/foobar -xv -f /tmp/test.tar
./
./cryptsetup/
./cryptsetup/cryptdisks-functions
./cryptsetup/functions
./cryptsetup/scripts/
./cryptsetup/scripts/decrypt_ssl
./cryptsetup/scripts/decrypt_keyctl
./cryptsetup/scripts/decrypt_gnupg
./cryptsetup/scripts/decrypt_gnupg-sc
./cryptsetup/scripts/passdev
./cryptsetup/scripts/decrypt_opensc
./cryptsetup/scripts/decrypt_derived
./cryptsetup/askpass
./cryptsetup/checks/
./cryptsetup/checks/ext2
./cryptsetup/checks/un_blkid
./cryptsetup/checks/swap
./cryptsetup/checks/blkid
./cryptsetup/checks/xfs
./linux-sound-base/
abort()ing pseudo client by server request. See 
https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
Check logfile: /tmp/state/pseudo.log
Aborted


-- 
Cheers,
   Andrej

