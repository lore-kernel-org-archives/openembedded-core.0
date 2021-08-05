Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.10454.1628177475245544390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AmBb7R77;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id h13so7122959wrp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ynJ3lkttw0Wr/bUwa2LJOj+bze9UdG0ARWO7sEzKUaI=;
        b=AmBb7R77vCH5pkMHQtkONlgzPg65uYBBUuAQUSGHEmeFZIq5EHlYYY9+G17XaoFU7j
         fLOCkK66eRZMVA2XyfnzJdzO8fd71yuGXCh2r+ZTYvsHxxUObG/Mz4dN2ZKh+eo9/wEe
         /vqoU6Rvi0e7qgRolArpz4HnohXMrnFSc6ih8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ynJ3lkttw0Wr/bUwa2LJOj+bze9UdG0ARWO7sEzKUaI=;
        b=e6Vv3p6jrlkSOy2McDFH8ZIjXrF/GhZYYDJ9888OTXuVNx/G8Tfc27w3d2KMEEwrgP
         1S+MCb6XOJGDzn518j2q8jXMNmuoRTCylTMcZefQvuLvj8ZdTxoSGSJmExfNL1y/sCLX
         IapoJL1LMLyEBp2WAM91IXob08zFmCVSjHuHQudcF7fbqC3nQ57dvbTNhYmaTYsD2YXA
         pOt8uFImtSRRA4v2delgDshfhqko2SCpWsawE8jfk4DNQhtCNqMCdU37jpYzFebAKBh+
         MYKyNjXDZbcJjtQqEbZ2RB7NS+TUgSFaDXRUYcf8vZY/9RdOTCQRLksq0ONLD+fulp9y
         E/kg==
X-Gm-Message-State: AOAM531vFU6CJw69bmZVVdoU4I5x/ezSzKeyRr5v7VXe7vLI0kXSHK3k
	Ic0zcjkzPYvo8poqv9db41+ZyA==
X-Google-Smtp-Source: ABdhPJzdbM3s2SkXEhI0bAa8KfR6n/gnM763xKYJNjD814K+dYPwUNenCoppyA/pFBqNc2aypZiS2g==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr6069404wrw.72.1628177473525;
        Thu, 05 Aug 2021 08:31:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4? ([2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4])
        by smtp.gmail.com with ESMTPSA id c10sm10274256wml.44.2021.08.05.08.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:31:13 -0700 (PDT)
Message-ID: <f5204c03e3394a38e6663e56b0072d9d65bcc34d.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC][PATCH][dunfell] wic: direct: Use stock fstab in partitions
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Daniel Gomez <daniel@qtec.com>, openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com, Paul Barker <paul@pbarker.dev>
Date: Thu, 05 Aug 2021 16:31:09 +0100
In-Reply-To: <20210805150307.56631-1-daniel@qtec.com>
References: <20210805150307.56631-1-daniel@qtec.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-05 at 17:03 +0200, Daniel Gomez wrote:
> Be able to get the stock fstab in partitions.
> 
> Functionality reverted at commit id:
> ce682a73b7447652f898ce1d1d0416a456df5416
> 
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
> 
> Hi,
> 
> I'm trying to get back the stock fstab file in a rootfs partition
> image (wic plugin) and I'd like to know what you think about it.
> 
> Functionality was included before commit-id
> ce682a73b7447652f898ce1d1d0416a456df5416 and removed afterwards. Would
> it be possible to add it again? What would be needed to re-add it?
> 

The commit you mention above shouldn't have changed the output, it just used a 
different method to replace the fstab file. The question becomes why isn't the
modified file being used in the way you're generating an image. I don't know 
wic well enough to know the answer to that though.

Cheers,

Richard


> Thanks in advance,
> Daniel
> 
> Here the relevant information:
> 
> wks definition:
> part /boot/bootloader --source qbootimg-pcbios --active --align 1024 --use-uuid --fsoptions defaults,ro
> part /export --source rootfs --rootfs-dir=hockeycam-image  --fstype=ext4 --label export --align 1024 --use-uuid --fsoptions defaults,ro --extra-space 400M
> part /media/rw --fstype=ext4 --label rwfs --align 1024 --use-uuid --size 200
> part / --source rootfs --fstype=ext4 --label rootfs --align 1024 --use-uuid --fsoptions defaults,ro --extra-space 400M
> 
> bootloader --timeout=1 --append="ro rootfstype=ext4 qtec_mem.size=64" --source qbootimg-pcbios
> 
> /export/etc/fstab before:
> # stock fstab - you probably want to override this with a machine specific one
> 
> /dev/root            /                    auto       ro              1  0
> proc                 /proc                proc       defaults              0  0
> devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
> tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
> tmpfs                /var/volatile        tmpfs      defaults              0  0
> 
> # uncomment this if your device has a SD/MMC/Transflash slot
> #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
> 
> /dev/sdb /mnt auto defaults 0 0
> UUID=D339-7B77  /boot/bootloader        vfat    defaults,ro     0       0
> UUID=31f46be1-d9fb-4081-bd53-2c2727e7854b       /export ext4    defaults,ro     0       0
> UUID=d8e8f5d4-897e-48cd-9188-33598363f706       /media/rw       ext4    defaults        0       0
> 
> /export/etc/fstab after:
> # stock fstab - you probably want to override this with a machine specific one
> 
> /dev/root            /                    auto       ro              1  0
> proc                 /proc                proc       defaults              0  0
> devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
> tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
> tmpfs                /var/volatile        tmpfs      defaults              0  0
> 
> # uncomment this if your device has a SD/MMC/Transflash slot
> #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
> 
> 10.100.10.100:/mnt/rw /media/rw   nfs        defaults   0 0
> 
> 
>  scripts/lib/wic/plugins/imager/direct.py | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 7e1c1c03ab..1bb9d38524 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -111,7 +111,15 @@ class DirectPlugin(ImagerPlugin):
> 
>          with open(fstab_path) as fstab:
>              fstab_lines = fstab.readlines()
> +            self.original_fstab = fstab_lines.copy()
> 
> +        if self._update_fstab(fstab_lines, self.parts):
> +            with open(fstab_path, "w") as fstab:
> +                fstab.writelines(fstab_lines)
> +        else:
> +            self.original_fstab = None
> +
> +    def _update_fstab(self, fstab_lines, parts):
>          updated = False
>          for part in self.parts:
>              if not part.realnum or not part.mountpoint \
> @@ -142,10 +150,7 @@ class DirectPlugin(ImagerPlugin):
>              fstab_lines.append(line)
>              updated = True
> 
> -        if updated:
> -            self.updated_fstab_path = os.path.join(self.workdir, "fstab")
> -            with open(self.updated_fstab_path, "w") as f:
> -                f.writelines(fstab_lines)
> +        return updated
> 
>      def _full_path(self, path, name, extention):
>          """ Construct full file path to a file we generate. """
> @@ -274,6 +279,13 @@ class DirectPlugin(ImagerPlugin):
>              if os.path.isfile(path):
>                  shutil.move(path, os.path.join(self.outdir, fname))
> 
> +
> +        # Restore original fstab
> +        if self.original_fstab:
> +            fstab_path = self.rootfs_dir.get("ROOTFS_DIR") + "/etc/fstab"
> +            with open(fstab_path, "w") as fstab:
> +                fstab.writelines(self.original_fstab)
> +
>          # remove work directory
>          shutil.rmtree(self.workdir, ignore_errors=True)
> 
> --
> 2.30.2
> 
> 
> 


