Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.10931.1625238839178103243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 08:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lOk6W+M3;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id 19so9613016qky.13
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c1wp7ntQX4+ZSz7bqYJxdp2JNPe/kznLp/44y8XMkFU=;
        b=lOk6W+M3Va0elfbLnvYnIebEv08QqyZbwX8ZvNVWXWM9M4L6xrsMbqxK3Duqgrv9sw
         IHjrTf5krW85h59XgbK/bqMLxETI+7D7FdT7PcucLaR0wCHRK7ef7084BlpCti407stH
         G+3vDiNvn+XDhLpJBciipW5v1E8oxKtA6aPSEh/UBJEQ4Q7/S8y1FTGzl6PgprqbnagL
         01ZDiEK9YA5cRXPov8AtoS0VQtiI0a7rG/y3AsWZgzX6YqIOTXrPSucIJZeUzG3ux5C5
         uJc/MpvoRVFtL90KeEWymsPlr95AWPvEPNzI5t3pNN5PNR5YHrBbfYJnWDZ//eIuqJJG
         ssWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c1wp7ntQX4+ZSz7bqYJxdp2JNPe/kznLp/44y8XMkFU=;
        b=N9e/DS8v6O1c7PrFLRLaadDmzqikdaY36gANgu4W5C0/eUu2cPRFPQpE6cvhtZfg0D
         F7jkIbE3ZOYx4aD0hajboAA5uehyagb6xk3n5yn0GLGj2dHawYzBAmlo46Do6+tJz5AU
         bywuqtXHWKn0a8JS6Bn1vvNypGl6zRj24Dea8BBOzlmqne1SSqenSFo9sVYsgGmB4VcS
         I1RwoHG/ZnBNHpBfjQ1JJW+hrt/s9jjvxUAoRJAgU7xvGuRks0TwyyLamt714n/UONMh
         4nAlfFpjaPFWf3FyWlwU5k2eDqKtu4dCRoMRV+U/iOxx+hKI9qvXRRgHfbp312oBX0rg
         6j9A==
X-Gm-Message-State: AOAM533c/Haij5OdSSaEGGvvOFSrjk21LtcstJu88S4w1ZOChRE6O3k4
	MX2WLHFuqseEZXJphyuaJag=
X-Google-Smtp-Source: ABdhPJxzof/UF1ZciTKNfl5uoq9OK6K2x2LxtHgw4XQrzvlhvX88+nTin9CPwiNDQxlyOdrp/nFZtg==
X-Received: by 2002:a37:a90f:: with SMTP id s15mr337651qke.192.1625238838361;
        Fri, 02 Jul 2021 08:13:58 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id o200sm1466800qke.105.2021.07.02.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:13:57 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] kernel-devsrc: powerpc64 add scripts prepare support
Date: Fri,  2 Jul 2021 11:13:47 -0400
Message-Id: <fc9a082c71f452fee05bd6dbbfc870de5de24b43.1625238537.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1625238537.git.bruce.ashfield@gmail.com>
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Similar to 32bit powerpc, we need more vdso bits in devsrc to
support on target scripts prepare for powerpc64.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 92076ac8b0..21b42833ba 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -114,6 +114,7 @@ do_install() {
 	fi
 	if [ "${ARCH}" = "powerpc" ]; then
 	    cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/powerpc/kernel/vdso64/vdso64.lds $kerneldir/build 2>/dev/null || :
 	fi
 
 	cp -a include $kerneldir/build/include
@@ -182,6 +183,7 @@ do_install() {
 	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscallhdr.sh $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/${ARCH}/kernel/vdso32/* $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents arch/${ARCH}/kernel/vdso64/* $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	# include the machine specific headers for ARM variants, if available.
-- 
2.19.1

