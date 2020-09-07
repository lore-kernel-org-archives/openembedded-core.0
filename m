Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6528.1599512006814061011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tv8hCksq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z1so16998057wrt.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+BCs0odn610XUaVjPitPCnsZVuq/9B1fBVsolj4VxHM=;
        b=Tv8hCksqw41HLchi78eprfyzHhNMFFlpfUEZa7ZO5qTFgnFlc5JqiB8F+BgrHGtR9j
         aVSapCok7/iOnTA8posgMpNBf1NwBYpBPQyH3mHV3za5VgRVUhb1tkFWSMkX09zmYjM3
         ZYSqSdZnPCcf69h7mnVFHiqnK98GhsJbjdbt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+BCs0odn610XUaVjPitPCnsZVuq/9B1fBVsolj4VxHM=;
        b=HiVj/600RE7OQr2ShcvCQBGYuFaDGBtJ/K0sTVoVnGplrQxRMfNzgnlYdpxYgQPO9p
         JcxjWXVvOML6EEP7QMLxi+xBcaw19WdXfe5XX5X1kfxET+AL3CWWHa0wUXPxka9DD8Ba
         o+MIZGi70clEBpKeJxZkIwg/HW6BUhpsoOXzQvOIdkMFgQarzhL1TURhioV5X3f54aww
         f8h06gpdmjsKdCIqVb9rvX5BzNiEcamM0kZWmtoTYAUGDbb21Fok0JiUwLkImiHnIxTE
         fVV1vHT0oiypOucC2cZlaGb70tvCrLeP8gjgFsMstep7X52xf17A1PUsHrD2CcAyhF6k
         SqBw==
X-Gm-Message-State: AOAM530K01x85VRpElY1TsbPFQIPEn0+ZMctiGdHr9r2h/b4S8YOwpFS
	e3wj6zTBYT33TsIEyT1Sb4OyIrVUONyrGA==
X-Google-Smtp-Source: ABdhPJz2OdoNYP90x5a33gxs/MsgUAvr24B/g4VVCP2Tq0i30KrXwPW7cvfvbxMjiLT5K7JGTLzkGQ==
X-Received: by 2002:adf:ec92:: with SMTP id z18mr24957803wrn.53.1599512005144;
        Mon, 07 Sep 2020 13:53:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 04/19] binutils: Install non-alternatives links for nativesdk
Date: Mon,  7 Sep 2020 21:53:06 +0100
Message-Id: <20200907205321.1941682-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the SDK we need the plain symlinks and don't use alternative providers.
When these are missing the toolchain can work incorrectly so fix this.

(From OE-Core rev: 0c06cfaa016d06cc56d80dc1c244a938f3d38a3c)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils_2.32.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.32.bb b/meta/recipes-devtools/binutils/binutils_2.32.bb
index c2833b84473..ecdab966581 100644
--- a/meta/recipes-devtools/binutils/binutils_2.32.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.32.bb
@@ -53,5 +53,8 @@ FILES_libbfd = "${libdir}/libbfd-*.so"
 
 SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
 
+USE_ALTERNATIVES_FOR_class-nativesdk = ""
+FILES_${PN}_append_class-nativesdk = " ${bindir}"
+
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1

