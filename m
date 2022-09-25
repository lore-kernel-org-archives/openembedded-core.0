Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DCEC54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:42 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.20267.1664133493767765434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eqUj9Inu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so10491925pja.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=OjVOusPly01hgyF9kVmsggjoOkW/6vPlEXYwbMyUzko=;
        b=eqUj9InutjKPgcDynl0e8uqH2KSVDccHKpgH5RA3mkru9Rh4I/vTv/9Vj9dsVaxDgM
         TTrA2yO3Yjyr9FgrLgqBafEbMDA1nsQRpgBccFUm3Y9MfdICj7N1kmYZ7RDR8oBBo9kH
         dyy7S+aHe9DZ/m/3rMFUZUPI6VNaPcwnR9tYsNVMN+AZcN4NMzfhNbemGWBP+/HCNR+a
         N3+6TIpjS0OJGIxSeYmiPMkp+BrwDNTiB7XKTsX8lJKi+BzYeDGHcrnMQziRfvSL/Jp9
         8aFB/l38sHdvylZYGBPGiudTb95O4StSL+9SFfzw1qPpcjtPuaAkcdxWF4rIPTwgm6mz
         0nmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OjVOusPly01hgyF9kVmsggjoOkW/6vPlEXYwbMyUzko=;
        b=V98FXC9m1HeZBC6k4ed05HRp3Ivqhb3hEhgtfZM2RKcEcBgOWt37i8rDFeMyDauK67
         3O9Z19DV5nvpkDzZAWyXXL+vxkyRs0ETnIxHLcsqSheai9V6n+39HFv0zkyyIifbXbMb
         n1xhQyH0rDTJg/+6rpD1IyF+hEal2kKyvo/RgIZsS+4PLUn12PPQjsIlsO1Fc19FkU3s
         GoJRJ4kWFWqj5eZFGFVwbiyJUu8km2AQNxst6NvbeCSC5TVA5JZHwdHrj27jWKTa659j
         Vxz19Rc7wI1rPWo5tVW4A9D34AcDDXYzcCJJ/t696bmEYbHAx7uXSG3PXK+fv74S9tCc
         MIrg==
X-Gm-Message-State: ACrzQf2Ty6TsfAEDsvMbOcxc+H6fKbjvEfPYnWsUxx0mEO7XZ3omCGs6
	Ghd2keX92qtTgrYGXJeMV1NjTaz0amtJr+98
X-Google-Smtp-Source: 
 AMsMyM6i1EMuz/g3VB59SkfH/MtEKlvKdWNdym7t6HsygaFiz0mJJhAj2+07wous77xCHlrVGsxMDg==
X-Received: by 2002:a17:90b:3910:b0:203:dd3d:5f8a with SMTP id
 ob16-20020a17090b391000b00203dd3d5f8amr23766726pjb.210.1664133511556;
        Sun, 25 Sep 2022 12:18:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/33] kern-tools: allow 'y' or 'm' to avoid
 config audit warnings
Date: Sun, 25 Sep 2022 09:17:28 -1000
Message-Id: 
 <35c2debe35103f92993d9d7bb164b7bd64629c67.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171031

From: Bruce Ashfield <bruce.ashfield@gmail.com>

   commit b627b8bd17501400649d38bf61c8a3d2121a1b8f (HEAD -> master,
   origin/master, origin/HEAD)
   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
   Date:   Sun Sep 18 16:36:43 2022 -0400

       symbol_why: allow options to be flagged as built-in or module

       Some options that are hardware related, can either be built in or
       modules, and meet the criteria of being acceptable for a BSP.

       To allow these options to not throw warnings, we create a new
       configuration fragment to go along with the 'hardware.cfg' and
       'nonhardware.cfg' special fragments.

       This new fragment is called 'y_or_m_enabled.cfg' and is effective
       for the fragments in its directory. The format is the same as
       hardware/nonhardware.cfg, is simply a list of CONFIG_ options.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9cd0623f89d8ff5ea95d6ab713dd4bf45742a8b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e065c3e74f..dea7b65a7c 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "9320c2a1aaa085e94abd15ede0d93ffdab578e9d"
+SRCREV = "ba600ef61a85966596126a6e8d936971905e8749"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.25.1


