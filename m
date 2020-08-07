Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.5061.1596831952018027140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 13:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dRUFk8l/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id l2so2761505wrc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 13:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cNU314vgcPiIw8gYIANz7rddfb8gP4PQVnBkPlQU6dI=;
        b=dRUFk8l/6bbTiWL6eRAjvgiYnHyT5pG294fxFuUFKS7h6Ys+A3dIBEmqEvotyZ+xBu
         EA1ZXF0ykpQpVSImhMHzan2SuuZtj+WLuZxOyXRJPan4PAK6ufoWYh5r8ICvkgpSquuY
         Y16hIt/cDhnnZsPcf/sAO4fDdbJ2IlvcFXv2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cNU314vgcPiIw8gYIANz7rddfb8gP4PQVnBkPlQU6dI=;
        b=fta3zOGAHoSde4Pxw3m+TPNsvBHdTThQmBduKXJwAKN82k24pzUpuP542f+exKo/kH
         iGOsPZgAq2esX7+LtlKDjaIiBQTm8aak0UswZrUxv5uvLahjmw04TlmHkMQFrPniFPTo
         0plIPBO2cq806/IpRCoaUnIl1vvlLxn3YR76O2R/Q4tiLAnYddk6R2WxUv4vvJOuifr1
         czU7tsYVS7KkudDfMAWVyq6ea8Wr8uboAMdejoupkZ0ZKbCE52WVZs5+TtZ61ojlI4il
         qGNMqrzNWpn+ga7IsC6irmGLh22l4JLAIYDM4BwoGEjgIRWYSUYYpPOdUg0N/MbXH1lZ
         KDsw==
X-Gm-Message-State: AOAM533NK+uefWsj+hMgLhe38LkBalY6y/P12d8vEMGB27r1PEpav/FE
	zZbSkPqr5S0W35kkddknD5Qth6A3JAF1fQ==
X-Google-Smtp-Source: ABdhPJxWGOG5XdsafRTA+ZZOr57Y67AmLRmRLj5wf3FqhcQvyLvsGpCEIEmieTnZuSsh38hIN4Wn3w==
X-Received: by 2002:adf:aa9e:: with SMTP id h30mr12985622wrc.377.1596831950318;
        Fri, 07 Aug 2020 13:25:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id q4sm11827770wme.31.2020.08.07.13.25.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 13:25:49 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] populate_sdk_ext: Ensure buildtools doesn't corrupt OECORE_NATIVE_SYSROOT
Date: Fri,  7 Aug 2020 21:25:46 +0100
Message-Id: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

buildtools is built as a nativesdk which needs to use OECORE_NATIVE_SYSROOT
for its own purposes and can reset it. Save and restore the value
within the eSDK so the two don't clash.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fd0da16e7ea..44d99cfb972 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -653,7 +653,10 @@ sdk_ext_postinst() {
 
 		# Make sure when the user sets up the environment, they also get
 		# the buildtools-tarball tools in their path.
+		echo "# Save and reset OECORE_NATIVE_SYSROOT as buildtools may change it" >> $env_setup_script
+		echo "SAVED=\"\$OECORE_NATIVE_SYSROOT\"" >> $env_setup_script
 		echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
+		echo "OECORE_NATIVE_SYSROOT=\"\$SAVED\"" >> $env_setup_script
 	fi
 
 	# Allow bitbake environment setup to be ran as part of this sdk.
-- 
2.25.1

