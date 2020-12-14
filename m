Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.35169.1607956660726728290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=g7+/z8a6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id t8so12165759pfg.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/7CVTpY/jfzmqrfGIgGq6k2fRayZMnwXxeClN57EquI=;
        b=g7+/z8a6LwTlTpK9M5oDMHqgHGTaue4eNq4E84wZXL7kLWlZ8CVTQ0ueOabXHuxxJc
         Y+ZrZYOERfEqjohI+5fTEkLflvwy/f4w3mOYV/4TPoU3VePXyjZchBTAISP/xrxadY7q
         /5qQ5f+wHU/VX+5WsSi5h9EGX7jiJ0pVJcaRdaI4SIyAXXfeBSvchQAPv9G1+u1uyBfy
         LqY0TZSGfxM+KDs4KtSoWBuJ5PrNQ+gsJTnbTfLJmbOCsrDs1Jv/eiu9NLmE8/3BEXIj
         dCmpcHWPiQTk2sOIxBFTo+NfHNeuASWMaFr9nyRqwChmZOKgfjDy4ZUDXohfOYRFO29B
         yOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/7CVTpY/jfzmqrfGIgGq6k2fRayZMnwXxeClN57EquI=;
        b=jnMVTxIJTqOubaCeto3ACLB/eikjEhg8DOtuO69DIvyK6wzDW0wBzN3zWpyjfUCMVn
         M/GTf/SOVB+rkZNr7VJkh64DylfchuvuA2nnJoDimYDFl5JRR4+iJccBNglRXZfw4MK8
         T1W8IUhadoio4zOBUAZtxxk9AZTqB5Dc4dH1XKd/H6HSgXLfjPHTlJ8vGK2ugfe//gmh
         sFSj0R7Vc8O9IXx5R1WT3Owu7Dv3ctBFTUG3weoq+qtZhgrphgNkLmptyYvMYXHIAQtH
         AVAbnBjtOWSuC8P9b+VmfsZrq2X5FsrGIZpQZX22CjoCtXYz/dALL472oodEaYaV5GGz
         MITw==
X-Gm-Message-State: AOAM5318Aj5bY0B8onekzZ2W13WtlIDytIcr1iv2W93mbcJUxxhhVvSF
	zzAd2pAWRGPX+XjbSJHVcQu1hlFEcOwAXFrN
X-Google-Smtp-Source: ABdhPJwwaDg9X4B8eE+gwkU2lcnvjX9JprUkyHmhOFzr0KwPoDntSHLs5N7tWcsAmtDLg5TW1gMsbw==
X-Received: by 2002:a05:6a00:8c7:b029:19d:afa5:34e5 with SMTP id s7-20020a056a0008c7b029019dafa534e5mr14506344pfu.30.1607956659826;
        Mon, 14 Dec 2020 06:37:39 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:39 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/25] cve-update-db-native: handle all-wildcard versions
Date: Mon, 14 Dec 2020 04:36:40 -1000
Message-Id: <ff17ef98ff7ff0bfac9f647c0833f5b7b6d6fdd6.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

If a CPE version field is just *:*:*:* it should be handled the same as
-:*:*:*, that is 'all versions'.  To ease handling, transform this case
to use -.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 04a9bc4ca5294fe6834513669c7746a824d12b04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 0cd3a1c153..9e8e006a32 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -166,7 +166,12 @@ def parse_node_and_insert(c, node, cveId):
                     op_end = '<'
                     v_end = cpe['versionEndExcluding']
 
-                yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+                if op_start or op_end or v_start or v_end:
+                    yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+                else:
+                    # This is no version information, expressed differently.
+                    # Save processing by representing as -.
+                    yield [cveId, vendor, product, '-', '', '', '']
 
     c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
 
-- 
2.17.1

