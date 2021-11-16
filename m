Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9169C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 14:49:45 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.25.1637074182737857294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 06:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=g4AMxETx;
 spf=pass (domain: qtec.com, ip: 209.85.167.44, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f44.google.com with SMTP id u3so202656lfl.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 06:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=ajTX6yRP4z1pryfTKxqivPClAoKB8oWo9NEg47xKOvE=;
        b=g4AMxETxqvfWuuNPLUHdD1r22uFHwKJKx2McmAv901E/Hke+nDcLunBarbyNnVOyIC
         7fwm6pwdDYfuQzU/pzEOGh7mwp+JViesVGrBePA3/Xh4eMEQlY+9UVD2w9xH7w+bXzzU
         WBdNc5sV8AdBRF+4EsduKLbkCBSXvrZbO/6/Y21Q1ATPGZT5eL+UYIhCr2Pp58gr8+F/
         9MIB8f1HXM39C6SAfnyELFliOcBx0Hy5MdFvBXmAvVmywEJ6nUgU6dvh6Oto3iSpC4Hd
         2n9c/hNVgEdbk/xNMYkquPw+r2VAKmiPsBx1HLY6r4TzXCjJuAuVBTpPYEteCu4vynPQ
         kfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ajTX6yRP4z1pryfTKxqivPClAoKB8oWo9NEg47xKOvE=;
        b=5K+WpwRUrj0KEL1ANuU324z2K4K/Lwfg8sUtGRKNFiCOsNVFH5NtGoAMclA5Hk7w6h
         2+LtvIVFWTpsIv43HIbMbGeFSGqRty0DtVHc1W6nLOYw7AWSHvpumHVg1WfdZoIsV+xn
         meo5swB0pNgAe+iZcJKMLPWVAVdO7l52WLxhV3Y+lfKsT+GHkj6seKc3Xiuzdd7+oiVw
         8pc19jLL1wT1IOIDfaDrtamDC77VqBT3ihdAACGymeU8KJ043VdRL5cevYPDp5s0hgMi
         /plvSJWOf92moNtKvL87X7oxhoS9hl4waMv57V4O99Hmc42VZrHMkNzboEtgO/77L5+a
         cZrw==
X-Gm-Message-State: AOAM531btd/zb/LKxttFDUU3zsYjh8W2rWR0F+90NeRpa4FdhcYh2UW3
	h4WIW5cRjosSOFcrMQovYPMXd+HetkUXqMlGdo0y2ystodHyeN5Z
X-Google-Smtp-Source: 
 ABdhPJx6bB/eEkZiJaqgJP0GGk12Sprdr0VGWKNxrorAEJhn9COHkx0Y8OXKR3Lc4LvrEK1haWPzeftFBS7ug/SbRjQ=
X-Received: by 2002:a05:6512:398b:: with SMTP id
 j11mr7293760lfu.461.1637074180173;
 Tue, 16 Nov 2021 06:49:40 -0800 (PST)
MIME-Version: 1.0
From: Daniel Gomez <daniel@qtec.com>
Date: Tue, 16 Nov 2021 15:49:29 +0100
Message-ID: 
 <CAH1Ww+SPR6j1_SV-=Ev+XOgHsUismWxGXHPx6_RHwP-W3AJ9Bw@mail.gmail.com>
Subject: [oe] [meta-oe] android-tools: Add flag to enable adbd service (#147)
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	devendra.tewari@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 14:49:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158344

Hi Devendra and Khem,

I'd like to ask about the 'recent' commit you integrated in the
android-tools recipe a few months ago:
http://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb?id=4271cc28279b79140fc6bbde32c9110aec8d1d86

Basically, you are adding a postprocess rootfs command to the $PN-adbd
package to include the '/var/usb-debugging-enabled' file in your
rootfs image or not using the 'ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd
+=' line.
I wonder if this is a new feature or perhaps an error, as I'm trying
to implement it in dunfell and it does not work as expected. Should
this work also in dunfell? Are the rootfs postprocess commands
executed inside the recipe?

Well, what I'm trying to do is to include a configuration file for the
dropbear recipe based on the IMAGE_BASENAME so I can include different
files depending on the image at recipe level. It works fine if I move
everything to the image recipe:

meta-qtec-distro/recipes-core/dropbear $ cat dropbear_%.bbappend
dropbear () {
    touch ${IMAGE_ROOTFS}${sysconfdir}/file1
}

dropbear2 () {
    touch ${IMAGE_ROOTFS}${sysconfdir}/file2
}

PACKAGES =+ "${PN}-conf"

ROOTFS_POSTPROCESS_COMMAND_${PN}-conf +=
"${@bb.utils.contains("IMAGE_BASENAME", "poky-qtec-image-netboot",
"dropbear;", "dropbear2;", d)}"

Any ideas?
Thanks in advance!

Daniel

