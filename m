Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.43295.1600697795946956330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=sDAqkrwJ;
 spf=pass (domain: blade-group.com, ip: 209.85.128.68, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f68.google.com with SMTP id l9so12902674wme.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6PaN++sSaXXW+i1liKAOMItj7hyUxx4Ge1zdh0CPeo0=;
        b=sDAqkrwJPHnjlpSn+QPhO/2pNvhnzNwD5HCgvx3EuUpNONBMKs/IxCmIF4KSiwgn7B
         EfnaAAVYRtwqFm/u6mddhvDEe1j8b6BRc+RSQ57rAwIZy8sihbhh2HNE0H078egU1tA0
         f/ueyNIadpDHM9f4E/tcjEc1VGIGvG/VCbOkEvq59iOMS1KovS0m3/5yr3c1ZIJqaD4X
         IDvGZ09jAhVUBEbQTt9XVB47QF2fbWK3S0dUAasjhJbqdtdRcO94R/mvJa8Ym3qw48Zk
         nsSJwAfeUkCunalIkIzIZqalpklLSqV3RsC+Fullonl6LAL1mCzoXShjHZjuYI+Nl89E
         W8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PaN++sSaXXW+i1liKAOMItj7hyUxx4Ge1zdh0CPeo0=;
        b=RQKU6hxVF9yyzlWpxKM6sqlvg6l1ponC7t0E+Sd3DI6fXab6A2JPTNPkKIDmnutO0i
         S2Wu3N/GaC5wpC2isclXNONOmui7J15Vo8Z7IgVPMU8ipiok+7hvDqGQm5OZWyUXRa8i
         sNP142wqwekbwD8GtKmGUdS3oVgw3lfvWJpODcvN+5HwWfvS4I5P07WbNcqZbruqgi9z
         eFldW9vya84tFlpqU3RRuVnezUrP18wsO15a9e+K2W1qikZoRt2uuinHPXmM610DVDh1
         AtAr6x8nCGqTWTuVQwA2qdM/USuh65gGvK7FFdDy02CaYp926FLbwLB63CKkkTVqYhlQ
         NFYA==
X-Gm-Message-State: AOAM533vJ0HBQoXENjyrWNf3JqTez4Qk2QiYHKFJ7HsOkxTQyiH/a755
	1JClqf6ChaHxWmxxDzLrsVBpkrPR5JskOqwu
X-Google-Smtp-Source: ABdhPJxpDHRPR+m9gDPMqMXSNggRLGAkIlHVbS3ZZ20Go9+KdZxfyZetV63v6XXio5yXK8NzRoWDPg==
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr69820wmo.23.1600697794113;
        Mon, 21 Sep 2020 07:16:34 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:33 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 7/8] kernel: consider vmlinux a build artifact, so systemtap can use it
Date: Mon, 21 Sep 2020 16:15:43 +0200
Message-Id: <20200921141544.3145189-8-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921141544.3145189-1-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Cross-building a systemtap module requires access to debug information.
---
 meta/classes/kernel.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 48135b3d41..fd2355bb68 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -495,6 +495,10 @@ do_shared_workdir () {
 		cp signing_key.* $kerneldir/
 	fi
 
+        # Copy vmlinux, needed by recipes depending on kernel debuginfo,
+        # like systemtap modules
+        cp vmlinux $kerneldir/
+
 	# We can also copy over all the generated files and avoid special cases
 	# like version.h, but we've opted to keep this small until file creep starts
 	# to happen
-- 
2.28.0

