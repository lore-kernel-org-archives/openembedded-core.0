Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C6CC433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 05:03:11 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.28425.1652072581743650930
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 22:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BU1CnQDe;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id bu29so21866562lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 22:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KSstAEuXI3l4Xgdw3pVQLxksrYoC+16jw5y7632ZUCk=;
        b=BU1CnQDes1NC+H7vZ3jweCLgrJe2CbPg9pzgv1A8hcSpOk9uBhA5gkUu2MaI1wnaWq
         s7JGGZ1gN4/mIJHbsDzFonyeyijihKT7rkhuj2BFngtvtoqkL6mEK0mf1K8r6DByrCBm
         sZ7dXbJjr444EwB4AKAYDK5fxnZPMnYxJX1bPRjBSd9te/Qc2pr58fm126WNzG19NQ3r
         N8OpxifGOL2OOkgFh25nhlS9tl1zWGomwYJ8l2NdKt+BcPGEUHl0eQw3hnrC+in3z68h
         6WZkte7SNm4CUXlnukQuOY90NP6WBvMbXgYCa8/ZqtbF/pR0pvDanGCW2JQLajyneWsK
         5mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KSstAEuXI3l4Xgdw3pVQLxksrYoC+16jw5y7632ZUCk=;
        b=Ox0T+gvUc4PBNLo208Q060pQMIDBVPmNDkfT2csNEBD9bYcmG/qBTX3gTcF7babMq7
         e20QC3j+YhkWExldWFUzWI5eOcKrFVuVXNBH4VMnhKbXnwtBQQbk1nCY+z5HffjvNxB3
         bhLdtccD4fVbdcs0hFY0/7SmyTNU18hMvlcFmyKiP2qcdwPAEySex/CDJjD8HVxUGnKA
         o4A0KWXE7qD7xvpy1dkeod6OV5sjcF0fKNGAoMiqQHaU7GJ4Z8HxyzriquMLSeT6rPPA
         lslrT3zUWQjn6w3Lxe34EuYIba2TDsOaKFhJ1nGOHohtcvABtUHZejpwWNa5WtHc5+bz
         4ftA==
X-Gm-Message-State: AOAM531ElToDGQWzSKLC7cVEF3nuJdWabktDLjJfc7W/bYhpoqqek219
	v6LehHhzDrL1xGBs7XBji7A=
X-Google-Smtp-Source: 
 ABdhPJxeZnEn24vZEBc3uZ9LQtbZnSmjs91A+yUjHV277RjNzpKtvQlkNzVSyJFUFQ+El2k5alpX6Q==
X-Received: by 2002:a05:6512:4003:b0:472:5d5d:fd0 with SMTP id
 br3-20020a056512400300b004725d5d0fd0mr11111014lfb.452.1652072579613;
        Sun, 08 May 2022 22:02:59 -0700 (PDT)
Received: from [10.133.224.58] ([185.253.97.14])
        by smtp.gmail.com with ESMTPSA id
 bg26-20020a05651c0b9a00b0024f3d1daeb4sm1640629ljb.60.2022.05.08.22.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 May 2022 22:02:59 -0700 (PDT)
Message-ID: <56080543-500f-0595-f254-9c24c6a1eff5@gmail.com>
Date: Mon, 9 May 2022 07:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3] classes: rootfs-postcommands: add skip option to
 overlayfs_qa_check
Content-Language: en-US
To: Claudius Heine <ch@denx.de>, openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20220503082231.1971123-1-ch@denx.de>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20220503082231.1971123-1-ch@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 05:03:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165384

On 03.05.2022 10:22, Claudius Heine wrote:
> The overlayfs_qa_check checks if the current root file system has a
> mount configured for each overlayfs, when the overlayfs class is used.
>
> However there are certain instances where this mount point is created at
> runtime and not static in a fstab entry or systemd mount unit.
>
> One such case would be if overlayfs-etc is used, where the device is
> mounted in the preinit script and not via a mount unit or fstab entry.
>
> However there are other possibilities for this as well, like startup
> scripts that support a dynamic partition layout. For instance when
> systemd-repart is used.
>
> This adds the `OVERLAYFS_QA_SKIP` variable, which allows to define QA
> skips via its flags. In principle it supports multiple QA skip flags
> separated by whitespace, but only one (`mount-configured`) is
> implemented here. To skip this QA check simply add `mount-configured` to
> the flag of `OVERLAYFS_QA_SKIP` with the same name. For instance if a
> overlayfs is configured as:
>
> 	OVERLAYFS_MOUNT_POINT[data] = "/data"
>
> Skipping this QA check can be done by setting:
>
> 	OVERLAYFS_QA_SKIP[data] = "mount-configured"
>
> Also add a testcase and fix a typo (fstat -> fstab).
>
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>
> Changes from v2:
> - Fix typo 'fstat' -> 'fstab' in testcase
> - Add testcase for successful build when QA check is skipped.
>
> Changes from v1:
> - `getVarFag` -> `getVarFlag`
>
> ---
>   meta/classes/rootfs-postcommands.bbclass  | 10 ++++++++--
>   meta/lib/oeqa/selftest/cases/overlayfs.py | 20 +++++++++++++++++++-
>   2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index 7b92df69c5..9b6824043c 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -398,6 +398,10 @@ python overlayfs_qa_check() {
>   
>       allUnitExist = True;
>       for mountPoint in overlayMountPoints:
> +        qaSkip = (d.getVarFlag("OVERLAYFS_QA_SKIP", mountPoint) or "").split()
> +        if "mount-configured" in qaSkip:
> +            continue
> +
>           mountPath = d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)
>           if mountPath in fstabDevices:
>               continue
> @@ -407,8 +411,10 @@ python overlayfs_qa_check() {
>                  for dirpath in searchpaths):
>               continue
>   
> -        bb.warn('Mount path %s not found in fstat and unit %s not found '
> -                'in systemd unit directories' % (mountPath, mountUnit))
> +        bb.warn(f'Mount path {mountPath} not found in fstab and unit '
> +                f'{mountUnit} not found in systemd unit directories.')
> +        bb.warn(f'Skip this check by setting OVERLAYFS_QA_SKIP[{mountPoint}] = '
> +                '"mount-configured"')
>           allUnitExist = False;
>   
>       if not allUnitExist:
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
> index 472746a64f..ce1d2f1ec3 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -62,11 +62,29 @@ DISTRO_FEATURES += "systemd overlayfs"
>           self.add_overlay_conf_to_machine()
>   
>           res = bitbake('core-image-minimal', ignore_status=True)
> -        line = getline(res, " Mount path /mnt/overlay not found in fstat and unit mnt-overlay.mount not found in systemd unit directories")
> +        line = getline(res, " Mount path /mnt/overlay not found in fstab and unit mnt-overlay.mount not found in systemd unit directories")
>           self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
>           line = getline(res, "Not all mount paths and units are installed in the image")
>           self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
>   
> +    def test_not_all_units_installed_but_qa_skipped(self):
> +        """
> +        Summary:   Test skipping the QA check
> +        Expected:  Image is created successfully
> +        Author:    Claudius Heine <ch@denx.de>
> +        """
> +
> +        config = """
> +IMAGE_INSTALL:append = " overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
> +"""
> +
> +        self.write_config(config)
> +        self.add_overlay_conf_to_machine()
> +
> +        bitbake('core-image-minimal')
> +
>       def test_mount_unit_not_set(self):
>           """
>           Summary:   Test whether mount unit was set properly
Hi Claudius,
Thanks a lot for the patch

Could you please also extend the header of overlayfs.bbclass to describe 
the use case? I will update the documentation accordingly after that.

Thanks,
Vyacheslav

