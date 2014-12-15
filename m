Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1F072479
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 15:15:05 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so9238333wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 07:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=L2ZB38B4nhQk8SzYJuWP7sOjSn030ef3CHRScku0DtM=;
	b=KXTQhYWT26rqHERVoT5rDJA5fOzgwywlRJduIsidcaWTtUzpop6TCqcTErFfvUtiIq
	K2HgU8zpoy0nmiFli4W/qnfq5YB34s6EauQq2iHdprDttcj2sOUqNwwAyeFkt3K0jJRx
	HAgJdD2UP2qpfqCkL7TC0CvTlTV3N1BOe5cBakUSK3LSV6m2L3RKNHdp7qlbokZoxBD6
	KDKzofRdX5se3oGd2aqSgnekrV+HbJ1cjEtP1Z6VDtqWX+5Ni9vVyGQze80k12JwwwL7
	mVQSxEbbjVyZhwJw2IXmoiiVFTw3lOcXLkDVxIn/tMftfMV3TIwLrNU14ejTrtQXko/V
	xOew==
X-Gm-Message-State: ALoCoQktEiGX/DaBQNfJu6JlGkVdmyG15I7n4NbeVnZ24Hvsoee7yg/hcC2zxyCxhvtiMuevTd+V
X-Received: by 10.180.83.228 with SMTP id t4mr32978562wiy.28.1418656505419;
	Mon, 15 Dec 2014 07:15:05 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id o2sm10384918wiy.11.2014.12.15.07.15.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Dec 2014 07:15:04 -0800 (PST)
Message-ID: <548EFAF7.9010002@dresearch-fe.de>
Date: Mon, 15 Dec 2014 16:15:03 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Gaurang Shastri <gshastri@juniper.net>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <548EF838.7000705@zone42.org>
In-Reply-To: <548EF838.7000705@zone42.org>
X-Forwarded-Message-Id: <548EF838.7000705@zone42.org>
Subject: Re: "qemu-arm udevadm hwdb --update" eats swap space after build host update to openSUSE 13.2
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
X-List-Received-Date: Mon, 15 Dec 2014 15:15:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 15.12.2014 12:00, Gaurang Shastri wrote:
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Steffen Sledz
>> After updating our build host from openSUSE 13.1 to 13.2 we're no longer able to build our images with OE (with 13.1 on the same host everything worked well). :(
>>
>> The first thing we observed was that the do_rootfs stage made a very big load (more than 500) on the machine but the cpu's aren't working for 100%. I could track down the problem to the call
>>
>> qemu-arm -r 2.6.32 -L /pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs -E LD_LIBRARY_PATH=/pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs/usr/lib:/pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs/lib /pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs/bin/udevadm hwdb --update --root /pm/sledz/hipos-dfe.dizzy/build-closed/tmp-glibc/work/hikirk-angstrom-linux-gnueabi/hydraip-prodimage/1.0-r0+r16+r17.5/rootfs
>>
>> which eats swap space without end till the system crashes (more than 100GB swap space ist available).
>>
>> I've no idea how to inspect this problem further. Any ideas?
>
> I have already raised some similar issue where because of un-appropriate use of "QEMU_OPTIONS" led the post process of udev-hwdb failed.
> 
> Anyhow, Richard has created a patch and you can go through the same here at:
> http://lists.openembedded.org/pipermail/openembedded-core/2014-December/099544.html
> 
> Let's see if that solves your issue.

Unfortunately not.

I've used the latest dizzy-Branch and applied this patch, but the behaviour did not change. :(

commit 219e793907406eabf632e784e3a11ab9acb77cfb
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu Dec 4 19:49:19 2014 +0000

    qemu/libc-package: Fix qemu option handling

    The 'overrides' here are PACKAGE_ARCH based and hence not overrides
    as such and the _append wasn't working in many cases. This adjusts the
    code to use PACKAGE_ARCH as the accessor and ensures the variables
    work as expected. This fixes various segfaults and ensures postinsts
    run at build time rather than on the target system.

    The bug was introduced in http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=7efad8a1b56df6ee07c12ad360c0493d7b1d6d23.

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058




