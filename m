Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65861CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 17:29:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.14721.1759426156397148865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 10:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZ1g9Z+e;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e25a4bfd5so258012366b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759426155; x=1760030955; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QO2HZ+7jyAmfq0fBzdgLMOyi2EeEWq/2h75xR1wItKI=;
        b=IZ1g9Z+emYDblSORkbtJ4DPx1KB0i+CUgkzUZffDcANLWlx4YSXyIH81rsEVrtHoY0
         4a+HtZBFzjTH+yNI/EogRrl8FIeGUm5zoRsHwyDqq2Tg7GH1G4XQ/qvOehnydOtkIDvL
         mW1rOU4lJztn+4BaDWow+LBEcpJoT1M+0P1AXO6MxHUA9l7D/Rhb34qwhP39kj2KzpqE
         JbWNyMUaCaW2hAzOodFXePz0vRDevtJOC8jBRA8VcuMA/iyXLshHGExgzfN1IGmX3ksP
         Ok2LVngUauqgusIAmXRD2blmrlkrbLNCgNdsPasGs7wQ0qeYbdNDBVaWOUuRF2Rv1fJC
         92fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759426155; x=1760030955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QO2HZ+7jyAmfq0fBzdgLMOyi2EeEWq/2h75xR1wItKI=;
        b=Ll6ZWoLThO3rOXfI+hEGiNJt4TUlFhkdFdDKPPeT6R4sh2f9MUsbywfuTfv2NWgsVe
         cA66Bdn44Nm5gbuC4Cu8r1efb7Al4za86Cra7z9k0HGGReUIvDvC+8egGn5XJGTU7PTs
         wUtRXznRLwrmChOjGQp9Yev26tHmexgVA4zDwRyyGtd5U1kuamnqW0x2bG330i0BRuUW
         xlKlPGR+5GZdBq2XUkIO2KLMpUEpwwYiJ1Vc/qOVHwh2IdbHi/ebkoqOXwHTgyjwRmht
         5nVxdjIIc5EFu2Pl9vRPVIgCjxNJpnZaqxPSbyy81KcUOLeyjqO+hCcvaRo7afGeqo0C
         f3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7JVkn9GExvXOs2d6rilVtsDF9s0c4lCZVP3DjjDsjcZ1FmnX9OBWvIvP9+dCQ7+k6ZAc83BFpGVQt1+5zfU972A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHogHXc9lW9FAu4hClclxu1edd7ySuTI1zZXChSR62tLu8eVqg
	d5Ch1ig1g+Mu/fvxvdw1JyxxBEkaWtcUTuU6IuVg7txPpQ2TajovsgTj
X-Gm-Gg: ASbGncuD+Z4cJYJPxgvBPkM/RdUOIFUqnkAVC7R1rWiKWruAZaDGg/7oBxYfUeWBJcc
	tq2r2TuNQ6GV5pAqw43BeXYKfKr39MpD5IuxDd2oInllD4Skrup3Ahf/sUK3NhRFQns7rUr+P1C
	MtISvcU57hoywBm76hDQm4VGHG85lXgVQJUTBMc87KU2jy81nK+ly11T4jPF6wyjGHIh5uxSPiF
	i0T0uYigOuZ2hJpxqgG8H2icQvt89kxs5ILULGm9YgCLQrv2PFFLPUYRA8ckvUGJvAAY+5uMHM+
	9DtRzTF02GS9t+mZiFmtgbm4jyP+jjYRVl5TzkBCo9aQZZInL0uNLMuLmQx0Re80JhZ+WxjjCk0
	2O1crF3hXogJ3NnZIpsYTQVUnNFX1TrTWy1Gdu8oP/A/qqxmYBtCxtV/AwgO/sWtwuw==
X-Google-Smtp-Source: AGHT+IHrHGxA15Ywu1HEKRt9jnIhota22uQctFQZbGGlimRfv17TRDESlLGq+OFceWxFUMHpOBIJZQ==
X-Received: by 2002:a17:906:794b:b0:b40:b54d:e687 with SMTP id a640c23a62f3a-b49c3f7da07mr27080666b.47.1759426154365;
        Thu, 02 Oct 2025 10:29:14 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a169555sm233406066b.88.2025.10.02.10.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 10:29:13 -0700 (PDT)
Message-ID: <5cc51968-6aeb-4b61-9724-17bf112c771f@gmail.com>
Date: Thu, 2 Oct 2025 19:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RESEND PATCH 2/2] runqemu: resize rootfs image to
 power of 2 for SD or pflash
To: jon.mason@arm.com, openembedded-core@lists.openembedded.org
References: <20251001175702.62563-1-jon.mason@arm.com>
 <20251001175702.62563-2-jon.mason@arm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251001175702.62563-2-jon.mason@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 17:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224377

On 10/1/25 19:57, Jon Mason via lists.openembedded.org wrote:
> QEMU requires that SD and pflash images are sized to be a power of 2
> (e.g., 32M, 64M, etc).  So, if the image being used is not a power of 2
> and it's being used for SD or pflash, increase it to the next power of 2
> size via the truncate command.
>
> This might not be an actual spec requirement, and is being investigated
> in https://gitlab.com/qemu-project/qemu/-/issues/1754
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  scripts/runqemu | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index a8144aa68c3d..cd2ded69916a 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -421,7 +421,27 @@ class BaseConfig(object):
>          else:
>              raise RunQemuError("Unknown path arg %s" % p)
>  
> -    def uncompress_rootfs(self):
> +    def rootfs_fixups(self):
> +
> +        """Resize rootfs image if needed"""

Nit: the docstring now only describes the newly added behavior, but not
the original. The original docstring is also present, but it is now in
the middle of the method.

> +        qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
> +
> +        # Check if sdcard size is a power of 2, as that is currently a requirement for qemu
> +        # See https://gitlab.com/qemu-project/qemu/-/issues/1754
> +        rootfs_size = os.path.getsize(self.rootfs)
> +        rootfs_size_pwr2 = 1 << (rootfs_size - 1).bit_length()
> +        if ("if=sd" in qb_rootfs_opt or "if=pflash" in qb_rootfs_opt) and rootfs_size != rootfs_size_pwr2:
> +            logger.info("Using sd-card or pflash and is not power of 2. File size %d, power of 2 size %d" %(rootfs_size, rootfs_size_pwr2))
> +            logger.info("Attempting to use truncate to correct this.")
> +
> +            # Ensure the 'truncate' tool is installed before attempting to make a power of 2.
> +            if not shutil.which('truncate'):
> +                raise RunQemuError(f"'truncate' is required to make {self.rootfs} a power of 2 in size but was not found in PATH")
> +            try:
> +                subprocess.check_call(['truncate', '-s', str(rootfs_size_pwr2), self.rootfs])
> +            except subprocess.CalledProcessError as e:
> +                raise RunQemuError(f"Failed to make {self.rootfs} power of 2 in size: {e}")
> +
>          """Decompress ZST rootfs image if needed"""
>          if not self.rootfs or not self.fstype.endswith('.zst'):
>              return
> @@ -1808,7 +1828,7 @@ def main():
>          config.check_args()
>          config.read_qemuboot()
>          config.check_and_set()
> -        config.uncompress_rootfs()
> +        config.rootfs_fixups()
>          # Check whether the combos is valid or not
>          config.validate_combos()
>          config.print_config()
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224315): https://lists.openembedded.org/g/openembedded-core/message/224315
> Mute This Topic: https://lists.openembedded.org/mt/115538558/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


