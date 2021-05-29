Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.22118.1622304396288917508
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NqImOZLQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id v23so3925760wrd.10
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Hp82v9l24A08TCYAX1TRob0KClhmReq1ZXRVuHLXCE=;
        b=NqImOZLQOkzvfmHgpt8768NRRL1Kx7eNf0Pt96G9ow69xNmof+7M5ALU73CJ8fxwok
         owcxvZXzctk8zAHimRXVQgqdSbvZvnaKxAbC/czx1UqFuGtsagW8EeyZ5SHCRN0inXhK
         uk/eU6GjXTl7KGPSPsYQGw/fVzt2tbbq37l+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Hp82v9l24A08TCYAX1TRob0KClhmReq1ZXRVuHLXCE=;
        b=SS7qCcOwLqpJ8esphRQ6EO4fCYSZZG535xawzAD43CA8sOd/AKtx9k+V7tVlN/tmU/
         db8CSmtksFkCoKZky8/clsCdDbh9Ifh1TWIvAzrQ9WWo7tU72LBWPAXW5RbdMrJFyslI
         ltSYKRFBPqOIwtoJLmdcGNtPU8NTBWtMdTg2gQnzvqbWGHWtmcDq05nZMBJ2CeZrit/q
         748AyqmxKC6a/JeU1RjmF6SMjHB5Pu3/Lyq9E9kk1qi87blGJPzddJKt9mH0LTzsZj2p
         ZjI7xsGpqQpj3oa/6vkTMZmnGGZij3cbspMsNg7G95DiIRWHog0x9+oEiFYMnvNu2+wv
         iNhA==
X-Gm-Message-State: AOAM5315KyHR6wuIlssWvoFCKCsNL3X0pFkBAXCcIRYDVi+Aox3XG0iA
	QEf/wSiR+VYl1qJBKWCQNrvUelWhH5ezyA==
X-Google-Smtp-Source: ABdhPJwP3TJiddEUrG8HwSx7h13Fbf++OBy6tBjGnippEWDtJ7RVSHns7/dHdKP4NI7mk75CdMn/NQ==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr14330472wrn.255.1622304394765;
        Sat, 29 May 2021 09:06:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Ghinea <stefan.ghinea@windriver.com>
Subject: [hardknott] [PATCH 05/10] boost: fix do_fetch failure
Date: Sat, 29 May 2021 17:06:27 +0100
Message-Id: <20210529160632.2796977-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

Bintray service has been discontinued causing boost do_fetch to fail:
WARNING: boost-1.76.0-r0 do_fetch: Failed to fetch URL
https://dl.bintray.com/boostorg/release/1.75.0/source/boost_1_75_0.tar.bz2,
attempting MIRRORS if available

RP: Backport to 1.75.0
Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/boost/boost-1.75.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.75.0.inc b/meta/recipes-support/boost/boost-1.75.0.inc
index e5a8488c588..bc70c73739b 100644
--- a/meta/recipes-support/boost/boost-1.75.0.inc
+++ b/meta/recipes-support/boost/boost-1.75.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-- 
2.30.2

