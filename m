Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506ABC433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:41:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.4856.1652776895036951008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 01:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=FLZzh0Qw;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.66] (dslb-084-063-248-085.084.063.pools.vodafone-ip.de
 [84.63.248.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5C5E783AE7;
	Tue, 17 May 2022 10:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1652776892;
	bh=dYCxwuhpj03GZ6eZAuMHM2OMsS0RPk8/tDonZDuauu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FLZzh0QwJ0ck4j5SBMLAegraoSevuRGikRlsVc1uP5cjuvzrz6bQwQzt57ea2jsyF
	 hajgNG/ThhZ7HUwdJllpIn48WOiE/a5IrreozGI0B0aSIlAkDtl7s4Xah93ZnAxXlF
	 /X5wQIPW0nNM0uDMbjRuaUXVP/w3xLPzXJKeocKOCAmzQSmpGQFUIftBLyN0JdIFEd
	 Xn2Km7lJyc0IODHGGp/fLI+TlocdBXgG5u1GT+cPROMYV5+Jf9TCW0R5yOYAk0X0rj
	 HnRJnpUPsaWl3wHt/scC5nVJ5kfsIO58rOHmN7kg06xmW/9xhBCbOTyI+guUQwvyey
	 TEl1eltauuSsg==
Message-ID: <5ea86099-4f18-3afe-4011-4ce90c03c8f1@denx.de>
Date: Tue, 17 May 2022 10:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH v3] classes: rootfs-postcommands: add skip
 option to overlayfs_qa_check
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <16EB8ABC7ADEEC57.8534@lists.openembedded.org>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <16EB8ABC7ADEEC57.8534@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 08:41:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165721

Hi,

On 2022-05-03 10:22, Claudius Heine wrote:
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

Would it be possible to merge this patch into the kirkstone stable branch?

Skipping a qa check should be possible in most cases IMO, and isn't 
really a new feature.

regards,
Claudius

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
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165196): https://lists.openembedded.org/g/openembedded-core/message/165196
> Mute This Topic: https://lists.openembedded.org/mt/90854996/3616714
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ch@denx.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de

