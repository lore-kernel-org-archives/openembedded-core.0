Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BE7E63FF8
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 20:57:39 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24336.1775336252662784179
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 13:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QEiwY3Mz;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cfc40e4158so323770685a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775336252; x=1775941052; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ctWLUSmEeXwP/7G3uRtqYwKm7PtPc7vt7dLjj6F6q4=;
        b=QEiwY3MzQZogH38Qa4JKnADNs15LM8yTB+YkndknP1LfYqYzLkt+S+aYGj1OaTeJbP
         1m+FWwQM4cDkLPMv8wNR6XPiaLsFe1tTbft0zNkEbNzzDf4Bqwh6MaUPUTjAtiqEceiw
         m2bcrboRLO1yaLss7V3E8l9M056woP2iasYDW/W00VpQ5c3I+CTjMkHQ+QVTzkNsbeky
         riHqRWDgNCchxXWf6pwk6PTKzUvumHPs9R8T6tnjBWHwI8s4MCC75WFTi7nmxXvU0OoI
         CbB6EzNdsqEqwbMqWXt1eITqDgKD8ZdRG/iYAU70xw1+2eNVa3yahJ5H44sJ4utdJg4H
         9P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336252; x=1775941052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ctWLUSmEeXwP/7G3uRtqYwKm7PtPc7vt7dLjj6F6q4=;
        b=fjV7ZBRQ795l8byn116jgDUe92H0HrOWasMYOhE8Nh72UpkiacldQgwuXsRTsImq4z
         nLySgv1+5zbK06vqgS460U0g2qmV6vPB7r9opWE+WBK9HHcUV6K1liDp0fsNZidTjCcS
         7h/4+FYMTLeXYDPl6COcn6XN/bpI4Bd/YkDD7Z+RLhVRajVm8Yz1/rjP5viLF6bpal85
         b1i1c8VJBn94tTItpJemw4rCzazMUes8LtjIcQmAKBmSKa0ejsG9eArgeWxu0zjzoePe
         z6FOZomVEJZhkWxIY+4Ci/LKG1jC4P4hHhSd3RQNbxXt1/ms3sft/zRNIQsPBFT7aJfs
         yrbA==
X-Gm-Message-State: AOJu0YwTHpxUzLv1PV2RESmpkGzwNorABPq6d47r41Cx6KP/3De/V6I7
	UoXBTUAV6j5WXWcV/Vp6MTfs0re/vd0WTGk7NIGFkqXtH4mrLw8yTvQV
X-Gm-Gg: AeBDievCF1ddty7XcqalAL62nPZ+xcrLH83VOE9mbLqY9lSr1FEpvaDCRnuuhdxD8jF
	l0aK+jkLmPP6buaOvaAjntPXdN2OyU4ExdWQdO6Mk2ZObQO9dB+Hlqnp1BvEjXn2LraYrZXE5+J
	EUzlQJXnFp77MHoqBthL6PeuBxu4YkrrQsJPLU7fbUWPaEDTc01o/eu9vMUa07syqcF42myZx2u
	v3Yw2zzwDnJQ/oDIvLXpumOM4zHr4eWE/2LWJrt3jUtSzH1p0vTIbPapEdiNfvu711oMQqZ8W1h
	PekXZqlr7Wm890+Ny8wSogptCUTm6IcC46K3KhpUSWJUzIAUVU1WAiktlLhGq7F40+Rm0bErwLC
	3D0dgwEP+5h4Nc4KzxM+colkJrL/ntXmNWYBHUUWJRzfBTRHxbEusRWzoidv1OKJXI6uaJIsscp
	JiHs/2SdGeVuy1kLloI3NncO9cWeynonLjeX9wSeSNMZkDZXlzJ0E4JSx4FCKtS36vTg==
X-Received: by 2002:a05:620a:4802:b0:8ca:a950:238f with SMTP id af79cd13be357-8d41bbdb2a8mr1054248485a.10.1775336251462;
        Sat, 04 Apr 2026 13:57:31 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a864b516sm753606885a.37.2026.04.04.13.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 13:57:30 -0700 (PDT)
Date: Sat, 4 Apr 2026 16:57:29 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: zizuzacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] qemuarm/qemuarm64: add WKS_FILE for wic image
 creation
Message-ID: <adF7OR6UByOf3jlJ@localhost.localdomain>
References: <20260404012859.2463603-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404012859.2463603-1-zizuzacker@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 20:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234621

On Sat 2026-04-04 @ 08:28:59 AM, Zk47T via lists.openembedded.org wrote:
> Some of the oe-selftest test cases require generating a wic file, but
> the qemuarm and qemuarm64 machines didn't have one defined, which
> caused tests to fail when attempting to build WIC images.

Which tests are failing due to lack of wks files? All of the
oe-selftests in wic.py are passing for me.

Some oe-selftests generate wks files on the fly, and others use
pre-existing wks files; both scenarios work fine, and one doesn't depend
on the other. I don't understand how adding a wks file is related to
tests which generate their own wks files.

> This creates a default qemuarm.wks providing a single 5GB ext4 root
> partition and assigns it via the WKS_FILE variable in both the
> qemuarm.conf and qemuarm64.conf machine configurations.
> [YOCTO #14963]
> 
> Signed-off-by: Zk47T <zizuzacker@gmail.com>
> ---
>  meta/conf/machine/qemuarm.conf         | 2 ++
>  meta/conf/machine/qemuarm64.conf       | 2 ++
>  scripts/lib/wic/canned-wks/qemuarm.wks | 3 +++
>  3 files changed, 7 insertions(+)
>  create mode 100644 scripts/lib/wic/canned-wks/qemuarm.wks
> 
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index 943ce7c16a..685483c545 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -29,3 +29,5 @@ QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device v
>  QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
>  
>  KMACHINE:qemuarm = "qemuarma15"
> +
> +WKS_FILE ?= "qemuarm.wks"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index a096d964db..14b9f838e2 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -28,3 +28,5 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
>  # Virtio serial console
>  QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
>  QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
> +
> +WKS_FILE ?= "qemuarm.wks"
> diff --git a/scripts/lib/wic/canned-wks/qemuarm.wks b/scripts/lib/wic/canned-wks/qemuarm.wks
> new file mode 100644
> index 0000000000..01d9fbf10b
> --- /dev/null
> +++ b/scripts/lib/wic/canned-wks/qemuarm.wks
> @@ -0,0 +1,3 @@
> +# short-description: Create qcow2 image for ARM QEMU machines

Whether or not a qcow2 image is created is not something over which the
wks file has control.

> +
> +part / --source rootfs --fstype=ext4 --label root --align 4096 --size 5G
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234619): https://lists.openembedded.org/g/openembedded-core/message/234619
> Mute This Topic: https://lists.openembedded.org/mt/118668207/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


