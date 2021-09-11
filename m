Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.2236.1631354697407336841
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Sep 2021 03:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rwu18mER;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id w29so5580897wra.8
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Sep 2021 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3Kcphvg4eKSMLsQZ9ebIm556f+fAy40+WXBoFBOGK0=;
        b=Rwu18mERm6A+y9dkjoei3JkM3Kw3xiA3jA9ySyqq7GRK/poPqpKOigJ40L3KIZlSz2
         Y4XdUqxFoRBmPWe300Pmeqg/VQ6vcu9jxOIVa8Rfa6PXowC+dU5fqJW9T+OxmHqIr2zc
         gx64rHI3uDAA8GUfDAP9645W5oYYiXizvAu60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3Kcphvg4eKSMLsQZ9ebIm556f+fAy40+WXBoFBOGK0=;
        b=pS8U9avYK9Yxy3WfvnQrY609iBgE4WfMAi6ppCGo1ZmF/JTfoyFIVYKtInXWle8spp
         ERLeEFYF9cY7rZeo07Q8pQ++1GvlddV/2JrMuyIME0XJHSgkKAq6HiTbdhzadnsYfYRt
         xiIXNHx/eqa2LIl3Z6ysZqJz+bBTBvpEvzy817qqlqXFm8EFgfmEsr0MpxrURiq4pIUV
         QlG78JHRFapvcAXd59wnoLc/yl34A0OpPjju+8HMFyo2ueqLGRBvWZMVonzHZrpWBHV8
         eawDbDxxkj8YSxhJ/RdZ8mJCkUaobzetugh98CIgSHMd2CZpqq4TXxsF0xacJjxt3jQd
         kF0w==
X-Gm-Message-State: AOAM5304cbPGE8pOj/UVZz19VmtgmZBydMsdc2u3Ew+6092fbC55AniP
	hdF1vhHAjac7TASwLyqSaupdYpfuLjeTtiCx
X-Google-Smtp-Source: ABdhPJwRf7yhX7JxM0n+IdVvF+cMmo7jFsWnh4ZNBKxM8PaE6L2Tj31GP6qdkSEq4hRcZTEvsJyzGg==
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr2458139wrn.327.1631354695601;
        Sat, 11 Sep 2021 03:04:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a1a5:8b9e:48ea:5b97])
        by smtp.gmail.com with ESMTPSA id p13sm1222274wro.8.2021.09.11.03.04.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 03:04:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf: Ensure XZ_THREADS doesn't change sstate checksums
Date: Sat, 11 Sep 2021 11:04:53 +0100
Message-Id: <20210911100454.1285040-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpm output packages currently depend on the value of XZ_THREADS which
is ok if left to the default value but problematic if system limits
are set such as on the autobuilder.

Force the value to a specific one in the hashes for better sstate reuse
and consistent rpm task checksums.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2140d498f7c..e25d632dc1c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -811,6 +811,7 @@ PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
 # Default parallelism and resource usage for xz
 XZ_MEMLIMIT ?= "50%"
 XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
+XZ_THREADS[vardepvalue] = "1"
 XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
 XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 
-- 
2.32.0

