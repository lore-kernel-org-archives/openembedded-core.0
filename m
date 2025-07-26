Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51365C87FCA
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 21:30:55 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.49330.1753565454318785293
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jul 2025 14:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g85uZayZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70741e2ac20so98226d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 14:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753565453; x=1754170253; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ngHbT8loBoBPhcg898GzV+GvseTBnm3Cz+ezcTrmDFw=;
        b=g85uZayZMC4VFIvS1AwD7uDntZHLoF3hQNDDUQ63LOkaPZto2vFjoRU26i9jCZqcv+
         1h48TLnd1pjX4qFwk9r7De6Lj6s20iuYU/bpg5QODguEwvqrL0VeEkOOkXuagoQC/6Fe
         Ro9hZ63twCkf1sVA7ukkW6xJv62aa1ycQmfp/CHqYdieIvqhrobufAKdB/Cn4G87pR0m
         4dILnPjjphGwOdc1RTXdGv74WA8OvxjtYAxoco8YY3n5A+mOlqnz4T8FeuGvWLN7O1vW
         Vou/xC/n5FvN9aQ1UtC4fQIavH+YuFqrW06lb8dyCBfQrekjSg9IgVKzQJ8MnP15FWzu
         Gi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753565453; x=1754170253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngHbT8loBoBPhcg898GzV+GvseTBnm3Cz+ezcTrmDFw=;
        b=iSjmO43Qm9tgST/IqpsMcHn8zUKpyV2S5CdvG4A7rckxJydSwNR1e0xxb/Gu7SU1wL
         jkgxD6S9D6CVfk8/Zfr5fU0MNcAR7Zs/GFh1aM/Vw+7Haw2WVTH7svVru/8aQw3sjN+0
         /Jxay5moeQgxrTUCngRX+J0BpfNQxS9dTyVYx3MPYJTqkg0fKERmlvbpRK8j4t0V2Xfl
         2HEesWKU2/9D+kiclmpNxotkCEL1R2Yxm5/J1pFz+2PG3p/LBQD265bN5UkCQceX5nNs
         pV6jrGZG91KnKz76mzLG5ncsyA1cHnh3gy4roFDweuS3GvvHQkvznAiH6Fk9Cc2Zey4H
         gRfQ==
X-Gm-Message-State: AOJu0YzFyZ+sdMJ0PTqAsjpnDM4KJFjUhOqdy+HVaVKpUJV5C3yWAzKA
	ipVfEPWQb/cEso9DdvIdYl/L6diZZrjlXsSTVoP07gBcb1Jdcenz/gdhKKTs86BjwkgwrZgAzsD
	+OVH2yGijWsfbem7qyPyUoKWeTdbezMQ=
X-Gm-Gg: ASbGncuhyvzbOqXNsvPncqRKH+LFJOQaB0hxZnzBy5JdmwKswefhnC+RrXaGJ4Yp7vc
	csevB4+sAQxuoAsvL0h09J2zX2LIJC7E3b/Zcerg0YqCJ7XsQzDehaL/FWO4T1DSAE0Ise2dsqz
	9hPztMP8HqjIhnJGnk1kQRpM7Nf0sPIP/bvtEqKD/JWIarzEeZNEeXBSVLxXpX1IyZKDa4gSfYU
	UYGlGuv
X-Google-Smtp-Source: AGHT+IErB3ZgAhw+wQbBh32KGlfCz86b7xLU5ri9vQigUfJWxUFUYMv0RhGEBfIgH0hXOWT+xEFDcu8FAMJR1aTaZYw=
X-Received: by 2002:ad4:5942:0:b0:706:eac9:e834 with SMTP id
 6a1803df08f44-70720547afbmr99179286d6.17.1753565453119; Sat, 26 Jul 2025
 14:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250725143019.2189728-1-lamine.rehahlia@smile.fr>
In-Reply-To: <20250725143019.2189728-1-lamine.rehahlia@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 26 Jul 2025 23:30:42 +0200
X-Gm-Features: Ac12FXyK63TCVFFJ0P3zPH25X7A44R5CIJzD3AEFo3DX8oCjkvFwIhPxxv0HYNA
Message-ID: <CANNYZj-Ew1MUcw1TpYBRSzUaGTna_7Ft06qg1qM9fbRd2LbdSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] runqemu: Add support for running compressed
 .zst rootfs images
To: lamine.rehahlia@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 21:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220940

This is better than v1 (enabling .zst only in snapshot mode), but it
would help to explain to the user why snapshot must be used.

Also .zst is a somewhat arbitrary choice, other compression options
exist, so why not those?

I'd rather just keep things as they are: if you're downloading a
compressed image, decompress it manually.

Alex

On Fri, 25 Jul 2025 at 16:30, lamine.rehahlia via
lists.openembedded.org
<lamine.rehahlia=smile.fr@lists.openembedded.org> wrote:
>
> From: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
>
> Enhance runqemu to detect and decompress .zst-compressed rootfs images
> (e.g. ext4.zst, wic.zst) automatically. If a decompressed image already
> exists in the original directory, it will be reused to avoid overwriting
> build artifacts. Otherwise, the image is decompressed and removed after
> the QEMU session ends.
>
> This allows runqemu to be used seamlessly with compressed image formats
> generated by the build system or during releases.
>
> Note: support for .zst images is only available when snapshot mode is
> enabled
>
> IMPORTANT:
> This patch assumes that the original directory of the .zst-compressed
> image is writable. If, for some reason, the path passed from CI or
> another system to the script is read-only, the decompression step will
> fail when trying to write the uncompressed image to the same directory.
>
> Signed-off-by: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
> ---
>  scripts/runqemu | 40 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 3d77046972..30954ba332 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -376,7 +376,45 @@ class BaseConfig(object):
>               re.search('fitImage', p) or re.search('uImage', p):
>              self.kernel =  p
>          elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or '.rootfs.' in os.path.basename(p)):
> -            self.rootfs = p
> +
> +            # Decompress ZST image if needed
> +            if p.endswith('.zst'):
> +                # Ensure snapshot mode is active before allowing decompression.
> +                if not self.snapshot:
> +                        raise RunQemuError(".zst images are only supported when snapshot mode is enabled. ")
> +                # Get the real path to the image to avoid issues when a symbolic link is passed.
> +                # This ensures we always operate on the actual file.
> +                image_path = os.path.realpath(p)
> +                # Extract target filename by removing .zst
> +                image_dir = os.path.dirname(image_path)
> +                uncompressed_name = os.path.basename(image_path).replace(".zst", "")
> +                uncompressed_path = os.path.join(image_dir, uncompressed_name)
> +
> +                # If the decompressed image already exists (e.g., in the deploy directory),
> +                # we use it directly to avoid overwriting artifacts generated by the build system.
> +                # This prevents redundant decompression and preserves build outputs.
> +                if os.path.exists(uncompressed_path):
> +                    logger.warning(f"Found existing decompressed image: {uncompressed_path}, Using it directly.")
> +                else:
> +                    logger.info(f"Decompressing {p} to {uncompressed_path}")
> +                    # Ensure the 'zstd' tool is installed before attempting to decompress.
> +                    if not shutil.which('zstd'):
> +                        raise RunQemuError(f"'zstd' is required to decompress {p} but was not found in PATH")
> +                    try:
> +                        with open(uncompressed_path, 'wb') as out_file:
> +                            subprocess.check_call(['zstd', '-d', '-c', image_path], stdout=out_file)
> +                    except subprocess.CalledProcessError as e:
> +                        self.cleanup_files.append(uncompressed_path)
> +                        raise RunQemuError(f"Failed to decompress {p}: {e}")
> +
> +                    # Mark for deletion at the end
> +                    self.cleanup_files.append(uncompressed_path)
> +
> +                # Use the decompressed image as the rootfs
> +                self.rootfs = uncompressed_path
> +
> +            else:
> +                self.rootfs = p
>              # Check filename against self.fstypes can handle <file>.cpio.gz,
>              # otherwise, its type would be "gz", which is incorrect.
>              fst = ""
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220914): https://lists.openembedded.org/g/openembedded-core/message/220914
> Mute This Topic: https://lists.openembedded.org/mt/114338431/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

