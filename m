Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8228D6DDCA
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 03:21:29 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.11353.1731637502867695398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 18:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kSCOuegl;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a6ababaaa9so977005ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 18:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731637502; x=1732242302; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGh935suxzYaAvlYVXvWLWO6i5eY+8D9EZPtTKpILwE=;
        b=kSCOuegllX0GMnsep0N71blUSpjtP2LNaTjJFyTOYiSGxsn59gP8DOhI/FYvyOqccv
         11IBYNXLI0wZ7ScYkpbPb4+47JftG0bV6ZrWupy9rtb27BSm66N1QBeXKtQRvWi7I9/5
         m4w+tAtecU5oe39yYnFFqXlV9cVj1ep3CimgO/xdZOq8H2QVCf5iw/LOCsKllhoIg2DW
         JcU3RxTlvkR5QW68/8Qre/KU+4qn6HVVSfvgFmhGRw2XEixU+XSmkHEZvLlxro+D+OR/
         oY/rTakYcmc1HBN1E7hPW58iXNptgc8mulmrhWIJM72RaEHG/8JKu5JRp4V3GyC2NBeS
         vEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731637502; x=1732242302;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QGh935suxzYaAvlYVXvWLWO6i5eY+8D9EZPtTKpILwE=;
        b=CZcX8CV21wqwtPhVPzwjnNTg2RCywfCa4RRTZCrw+Dx55kwsahpsmk9d7CnVXQe9x5
         jJMauUFw3LGj9QzrC+4mNnj7ApF4TGNqfOb8yilmTGzG59XlQq9WvO58pre9Q8orB9Lt
         zr7yWqPLzSOSKUeaKQ7NI5Y9dSYl7bGG1bRYg+Oj/ofYlc7UMexz3wQ0muUwCKaS7csv
         nP/lGrC7FCE7Vt0+9FysSYUkZ9AAlgxo65o7uCzF1PnIqczbYukBnPTwngv3dgK1Hx4L
         INgGtLYCm4hjgFSSpFCOW3xBFNRTnU5aTc/Arw72HE1bGLLLXD1/NO8XIusmkE7pDrFf
         Zy1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDD+meXiA5w4e4CG9oTf2w5RdVnokGHYg0Guwfm2dcEFnl5dULG8tcI1ArR8RvmQwN0KfHgEOsT/WXIBjN6XVcXQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZRdtj+WX8HAMRwG9/3H38EFY4LY1mJN8ytgMcqi6uXDC1SkZs
	GyrmBROlIppixY3A574jr4V1NiKvx/EIksOMHCC4isZ/m9VZMr6tcBFn6A==
X-Google-Smtp-Source: AGHT+IH3VGYmnEQOw5xM7aR1G6FNuHmJCzFhBbhN3jpSODwTzK7w3JBk3QlTWxnLsHocg2ojK1znog==
X-Received: by 2002:a05:6e02:19ce:b0:3a7:1a65:2fbc with SMTP id e9e14a558f8ab-3a74808cc28mr12493405ab.23.1731637501695;
        Thu, 14 Nov 2024 18:25:01 -0800 (PST)
Received: from [172.26.252.3] (174-29-213-205.hlrn.qwest.net. [174.29.213.205])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a74806fc2dsm1240675ab.2.2024.11.14.18.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 18:25:01 -0800 (PST)
Message-ID: <12abdca1-293e-4615-993d-6f8ccec3506b@gmail.com>
Date: Thu, 14 Nov 2024 19:25:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [BACKPORT] uboot-sign: fix concat_dtb arguments
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 03:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207179

Hi, Steve!

I would like to backport this from master to Styhead and Scarthgap.

Please let me know if there's a better format to request this.

Thank you!

Clayton Casciato

--

commit b3c473785e5ceef677ff2b77c5fc17f5704c622f
Author: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Date:   Thu Nov 7 10:10:47 2024 -0700

    uboot-sign: fix concat_dtb arguments
    
    Fixes [YOCTO #15642]
    
    Ensure empty argument passed from do_uboot_assemble_fitimage is passed to
    concat_dtb
    
    Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 3e5f5dcf66..a17be745ce 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -338,7 +338,7 @@ uboot_assemble_fitimage_helper() {
 	binary="$2"
 
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
-		concat_dtb $type $binary
+		concat_dtb "$type" "$binary"
 	fi
 
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ]; then

