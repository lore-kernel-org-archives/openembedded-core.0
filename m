Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090F7C54F30
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:04 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4697.1747808396225790941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAuvu8Ts;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742b0840d98so3658258b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808395; x=1748413195; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEUWJtTV+Dxn97pQ0jjmvimGwWL7FeMTIR6rhIBY4Xw=;
        b=mAuvu8TsoS/rejEfLBHfw2i7XCuYJisAVFOYxXbrc53BbImVtSfCZ2Y/K4R0bY8CtH
         hNco0a/eaEVmIl82FIfO5EBoFdro4xYXxDyev8/y4Y/gZ2zX3/Qrbg86z1LcRoky3OEN
         TMuoPZJakr0CN9zYV9ry/4Qs48qdv1kTqld/wkaFBCaU3yo+gDwpi59sIovYLkm4MAMj
         ARidJAu2L/GowTa5KBbax0qHV/Ev2SE5Aj4xYHHN9RIPuGUhaSesTqmDrS4sLsvt1o8B
         WQnz59RcGB43/JPzU0PHj4i6Xn8bV/9Sv5OgX7bbaTVblbK2k3tBniv0eZwkNw2kU+hr
         khzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808395; x=1748413195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEUWJtTV+Dxn97pQ0jjmvimGwWL7FeMTIR6rhIBY4Xw=;
        b=lesnVVrtynrnBVU4Iep5xd8RvONp0Ph1ILrIGRLHzdOJYqlvh/KqzEsEifqst1fThF
         IPnRZY+v19PXXjp0HyTCW+U03e90xK2ShB53GuYYjXbhrYhhEPuc/88QGW97dBRvBu2g
         6iHC68vb9Ba1+ilhD6VdpsgHscIPjdr5MDbMPHOJGD9xZm2SSzIfetRpWP8eGVcqmEew
         UBJgf9+Ou8+vyQWYazXQSIJYai/Hfl7JklpK75aGuub+VVjMM4hgyXL2OEIcwUqnfrZ3
         bkelek63z53PQEE86gu7V2cU33wgZqymvwT27NR2Wu3t1TjIbb2F6V7pQkdMB0l7H8eS
         X9Iw==
X-Gm-Message-State: AOJu0YxcTsYXwHmyTScOjZdbZ5FHtPafexBbUacYAnL+xF33FIJlXsww
	UFRyIUeHHbWlGm5vgb9pMkqcbDiXvs00pFzOxm3s6ervFm31ZgZ83PgVzN2zqIYC
X-Gm-Gg: ASbGncs2jvWvOuzquXRfLiNiKSt3badeGLZgNrWIAV/CtupBl0Jwp+2XrqIngFwuuOe
	w3vEtYPstm3dPLAReJpIS5QyT/r9M6OiXM10oSkkgKpTdUQkVUhydNUQD19mTkT8KcDyev7/8jT
	cnVYg8fTeb90LNkrkakUlqBqamI226Ssg7ndQMDikGbIzQxcbxpDXu3J0Ev/2TQ1CQsvrWOnfVR
	CWZm/Ql3HSRX6jPuVNfF2YInSI/bZNstUZR9wqHScJbajZly1SpDlKtxWqu1EAZkhHzW72UOuVl
	RjN9BOMEKryCvb9iIeAxmgVWMMRn9JwKpu+eYI9Nr9M=
X-Google-Smtp-Source: AGHT+IHRz8XFjXXWJdJKMh0F707upvOz2HoSpcGGFKNZSJEMb9lgyXlnPdrBDDgxlrRe+HevkeZAfw==
X-Received: by 2002:a05:6a00:1793:b0:739:4a93:a5db with SMTP id d2e1a72fcca58-742acd72b13mr23605314b3a.22.1747808395394;
        Tue, 20 May 2025 23:19:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:41 -0700
Subject: [PATCH v2 05/28] gnu-efi: Use objcopy from GNU binutils with clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-5-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216973

llvm-objcopy reports errors which needs further investigations but
stick to binutils provided objcopy meanwhile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
index 29d9e695a9213d63d10ca62b6e77eab291615331..cee320a510a117be0b1f4c554a9954341a065d71 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
@@ -22,6 +22,10 @@ SRCREV = "5ea320f0f01c8de8f9dd4e4e38a245608f0287dd"
 
 S = "${WORKDIR}/git"
 
+# llvm-objcopy fails
+# arm-poky-linux-gnueabi-llvm-objcopy: error: 't8.so': section '.dynstr' cannot be removed because it is referenced by the section '.dynamic'
+OBJCOPY:toolchain-clang = "${HOST_PREFIX}objcopy"
+
 inherit github-releases
 
 do_configure:linux-gnux32:prepend() {

-- 
2.49.0


