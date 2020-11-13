Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.5336.1605279197323896482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=byz66dOy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id c66so7826165pfa.4
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=13j2qiaHLsqWvqZCr4+BhcotO3HQ0u0qkdc6RQDwFXk=;
        b=byz66dOyEpsrU0gfCaiOsMUt+LUd5os8MSPlBjN2jLUo8VQvsOYQXO84KDzoWCW5jS
         BII64OnnQzJ0haE0yjIjUbTSBPT5fFrj3xK8LehB6Ti7gHGtkMxeXrQMYIjhsck6vt4o
         ipG1C2gSBZmt1h/84QxCdlufaSPPgUBKvS73CXEs4NNkoXfPUNGNB8lLxM2X+4flM+0Z
         odyBKwHYEyjpgXbeFbskCp7j1+fy1HBPl3mWynczy0mb/SNKKMhFrnrXMbyFDFjVzMAc
         /po1FIaGGNTAkEewO6MV8LkPmhxT//QRW8zlekqK5TJFTap+kFkcJwll+92l7jBTK9CT
         2zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=13j2qiaHLsqWvqZCr4+BhcotO3HQ0u0qkdc6RQDwFXk=;
        b=YbHF298AhkchIZpBYOFX0cOCmngYqOf4pKiGvZZbwHaUUthOXegxl3dIVDoLPkhmht
         6L/NbXofn2T2v1Xn5iavx448PQG9u+xQrcphbpvI1CnSO/kqZh6u0rirtqupoNHqs3lr
         vz9SNPN1+vJn8ttwjT0y+u3XXuMYS9Ld+sBMV0HINfWZtrdfgpi3J+LWLLKNef/zDUy/
         Xvv4MOuURe8iPzQyYPgqTJyLApzBXIdoCvkDoi2BmTrU1dGqkPmtfuuk6Tci7rxQuefX
         ZJZQttOmfxiWMvfN01eml986vfTLGAld2Rd5VsM2Vm6sODW+o04uqQSkY27qiEVdd3Nd
         urQw==
X-Gm-Message-State: AOAM533bYzZpXSYFof6PpWTqzEDTin3qw1QZYqM6MVtT8hEYX7fJV5pQ
	tVJeSDzLLpp76OiPAMMQTeA9L2m/GWRFp1lA
X-Google-Smtp-Source: ABdhPJy939n2dBrZpOb+k/C2iIWi72OXpoSecnOfzqCSAcaZ0D2sT+AW6w7i6DXec/zDtLRSxFp9gw==
X-Received: by 2002:a05:6a00:6:b029:18b:b5a:494c with SMTP id h6-20020a056a000006b029018b0b5a494cmr2441138pfk.81.1605279196441;
        Fri, 13 Nov 2020 06:53:16 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:15 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/18] openssh: upgrade 8.3p1 -> 8.4p1 to fix CVE-2020-14145 and CVE-2020-15778
Date: Fri, 13 Nov 2020 04:52:20 -1000
Message-Id: <324a890cf711efc732e3a27325f81a27c92173d8.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

CVE-2020-14145

The client side in OpenSSH 5.7 through 8.3 has an Observable
Discrepancy leading to an information leak in the algorithm
negotiation. This allows man-in-the-middle attackers to target
initial connection attempts (where no host key for the server
has been cached by the client).

CVE-2020-15778

scp in OpenSSH through 8.3p1 allows command injection in the scp.c
toremote function, as demonstrated by backtick characters in the
destination argument.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc394ade8a0033bc695d979e592e8e92a882c54d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/{openssh_8.3p1.bb => openssh_8.4p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.3p1.bb => openssh_8.4p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.4p1.bb
index e007328704..720b238e71 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
+SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.17.1

