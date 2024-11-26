Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9E7D3B9AC
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 15:45:13 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.48217.1732634256501364363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 07:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcQPMLev;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a778cc0e5cso21503465ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 07:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732634256; x=1733239056; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agbaDwMfXH1hODlEa0YM3V7ROxzQIrus2Ztp5PqvYAc=;
        b=gcQPMLevgK3200BFzpqiURQ2EQpeSxAtrlPbJKJqz1UZ94sQX5F8lEWFe3jGrUR6pd
         M9reFapEtmwJGJT93prrWql/LBXQJdm3GleC6y8hxfkf55ycys797TgLDAqQsBlc7F57
         E6JauYwSuyO6uq2cGgs+jNteDSqK44byNg5Mm9cqU4qQ+6UPGoNcpF22KMlgWSmeJ+Bd
         Eq+ZRI/Prde9MYyXM1J5b5q1ni8+yfOIvmqbJt8BTGXC81RT5sqUiqz+aTYjxD6Vp9/7
         pUllesYAXZSuUtOr31XGqX3MQdILdX8JCqLMVbNR4uoccEKwwhtMbbYsgpHZjtgGQ+F+
         ZW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732634256; x=1733239056;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=agbaDwMfXH1hODlEa0YM3V7ROxzQIrus2Ztp5PqvYAc=;
        b=ox12gbx4SVdGYcz7mju1AdCKYSIARY/xKgL//nw9hwm5FU7nZMK5ZOmhE6/5yVtzze
         Lw/59+GqfPXn9P6bXO8J5JhU584LOqgEXznluM8belX+hwAUka3+HleRqHFMq+0LtdWs
         ajV07S72+fUwvBDtAWvwaQFBnP9ebHIY16iWE8SifxydWCfWxyH0JRwhoq3OA2S7JqyX
         fmJ/7Vm9LJRl9uj6/9McK4M0Grn+uG+86XMBSTFVCL8kDPl83WrTnFfaapdkYwuubf7c
         NoNL06SW0285vM4eDPGk06YlLI36nQvgDQmsJYJ7PM/JobwKh18SFnHJg9g74yK7wTas
         IBEA==
X-Forwarded-Encrypted: i=1; AJvYcCXlQL8gy4VYsTRc6clmQwfBKjCRnAqjlHqLpyVCLrFVXSPE90TG8RdEXi8cJW3Hx8HCKLrJ61wgF+7+feu5XFBFmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOPpgVmkrwlGy7zNqqhuYZxukALjc7y3ROOdxuSR8cMLwlqrER
	PdhW1Psmdywd+2T0QHNYdNt76DDz8AxlYqF0cMpKIVWi0guu9jCjSgd5OQ==
X-Gm-Gg: ASbGncts+FCIKm77Tk/ps9hGoSbaMfY/2Qy7wyt1MhiOTXWG8TD4W7309eX+abxAS7v
	E1wag4LYozrRrbaYGbF9XrHuK0MYVDlPnGskVtiTDYHEtJmbdUG1nyNsSjnHWjuYnKumf9SGove
	qUY44O2w9aDBCKljWFbSGR4QOHcoaJHjTYjQAfkt6wEG2rw2lD3RjdwvOL/c+EYUSUSgvo/yEPO
	i+BtR+NJ9AfXaKC6CpGNBApdxfnAYMyV0hvicRPiKhW3/IqQw2fLkZ1hEMeHEUc0G5Q48lWVE82
	Mf7XpTVxAe6+P5gcnk6XU8R+tWM=
X-Google-Smtp-Source: AGHT+IHM6SwnIBIR6juxvXxHFpLq4Yf3F0QsKi33XMKpSTKH1GES2U33NmtL+upg1BxiXnY4SUc+UA==
X-Received: by 2002:a05:6e02:2141:b0:3a7:2b14:add8 with SMTP id e9e14a558f8ab-3a79af7b064mr149838995ab.18.1732634255566;
        Tue, 26 Nov 2024 07:17:35 -0800 (PST)
Received: from [172.26.252.3] (174-29-210-206.hlrn.qwest.net. [174.29.210.206])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a79ac4b7fasm22833825ab.48.2024.11.26.07.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 07:17:35 -0800 (PST)
Message-ID: <6c59a659-d47e-48d5-81af-a729b8533f62@gmail.com>
Date: Tue, 26 Nov 2024 08:17:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [BACKPORT] uboot-sign: fix U-Boot binary with public key
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 15:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207861

Hi, Steve!

I would like to backport this from master to Styhead and Scarthgap.

Thank you!

Clayton Casciato

--

commit 0d14e99aa18ee38293df63d585fafc270a4538be
Author: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Date:   Fri Nov 22 08:00:00 2024 -0700

    uboot-sign: fix U-Boot binary with public key
    
    Fixes [YOCTO #15649]
    
    The U-Boot binary in the "deploy" directory is missing the public key
    when the removed logic branch is used.
    
    The simple concatenation of the binary and DTB with public key works as
    expected on a BeagleBone Black.
    
    Given:
    MACHINE = beaglebone-yocto
    UBOOT_SIGN_KEYNAME = "dev"
    
    Post-patch (poky/build/tmp/deploy/images/beaglebone-yocto):
    $ hexdump -e "16 \"%_p\" \"\\n\"" u-boot-beaglebone-yocto.dtb \
    | tr -d '\n' | grep -o 'key-dev'
    key-dev
    
    $ hexdump -e "16 \"%_p\" \"\\n\"" u-boot.img \
    | tr -d '\n' | grep -o 'key-dev'
    key-dev
    
    Non-Poky BeagleBone Black testing (Scarthgap):
    U-Boot 2024.01 [...]
    [...]
    Using 'conf-ti_omap_am335x-boneblack.dtb' configuration
    Verifying Hash Integrity ... sha256,rsa4096:dev+ OK
    Trying 'kernel-1' kernel subimage
    [...]
    
    Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index a17be745ce..7ee73b872a 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -122,13 +122,7 @@ concat_dtb() {
 	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boot DTB
 	# with public key (otherwise U-Boot will be packaged by uboot_fitimage_assemble)
 	if [ "${SPL_SIGN_ENABLE}" != "1" ] ; then
-		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
-			[ -e "${UBOOT_DTB_BINARY}" ]; then
-			oe_runmake EXT_DTB="${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
-			if [ -n "${binary}" ]; then
-				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
-			fi
-		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
+		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
 			if [ -n "${binary}" ]; then
 				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} > \
 					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}


