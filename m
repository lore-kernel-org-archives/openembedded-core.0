Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web09.8315.1608020905585596295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=OoRW6yyA;
 spf=pass (domain: nathanrossi.com, ip: 209.85.216.68, mailfrom: nathan@nathanrossi.com)
Received: by mail-pj1-f68.google.com with SMTP id v1so778774pjr.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=6jURbGi16FdXgV1zm1ZHp6p2PwgtlSbGr78OPiimv4Y=;
        b=OoRW6yyAbRS297DWy+mdGRng08yM4+wg3PRIpKxldxCGyVh3mOyBmp9UCo0/rzcQdR
         vh1T91qZ+DM0JqfeZCxD8hAn5FRTBFQvHL7oFxgEtOIFz3iQa1Q7526wfBaace1cyipb
         9peo3B8pOb7ZkPAXmMjXQMsn0Rc1IwdADoYpeUytUwLMYd7EpCmiXSmo7cTcGlMllfIU
         ixpGt0j9QRhJq9gYjtQXg2Pewu+iw/dAkNWM0XVqh1zehjQB4lb9/FPVII/SIEjkO+cq
         Yr3i/yA0IHLzC3VsSdXjeOqIRrEvLjicID7rCAB7+/6KpIENViqJILzs57NwC8oT1YRV
         X8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=6jURbGi16FdXgV1zm1ZHp6p2PwgtlSbGr78OPiimv4Y=;
        b=AUgNzwxI2oQ+EQ1+1OdrooQoshVIspZMfE7lOaeN6lBCcTvo+DGkjgkFjkKpAwaTOh
         dV/fL/QfvctAglshGFaftr+ZonSfPkHij9S8IGNYQbwtwwfO6EML2el1DZ/CS5DhbCte
         5BU+ya0vsh9cb9dPgpf+GqmF5+HoexM2FMYRKCd4RXUtoyaXUamCocsKROXJ7ZrgfYSv
         UD3KWtxaoC68nRklH03O/dlu2O9Rq6lAICoawz3rctE8N9yafaXRAeHRgtDCiqxnWFdH
         lfrqvATMjIreQko5YCrxqCQXENy6uJH9sIS/YxBgfztzok2i11nLzWQ8ym9xJutZZhyn
         UFbQ==
X-Gm-Message-State: AOAM532iIYa+H5eOZbgeSUeN08NV3bVgSFDrIi+SfYqUEIK1oot3Pxad
	MFkyqfW0e1jOw6aI794Kls3q3w==
X-Google-Smtp-Source: ABdhPJxavmutXD6ten5cNfQ05WsDsxZ1IbKKI8y5wDoDEllO0thpNakgwpHsbKNnwxX6eGubIPyGnA==
X-Received: by 2002:a17:902:d705:b029:db:fbbf:6145 with SMTP id w5-20020a170902d705b02900dbfbbf6145mr9174491ply.7.1608020905094;
        Tue, 15 Dec 2020 00:28:25 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id v26sm6237577pfm.203.2020.12.15.00.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:28:24 -0800 (PST)
Date: Tue, 15 Dec 2020 08:28:15 +0000
Message-Id: <20201215082815.1360538-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] qemu.inc: Add seccomp PACKAGECONFIG option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add the seccomp PACKAGECONFIG option to allow building seccomp features
in QEMU. The libseccomp library is available in additional layers (e.g.
meta-security).

Additionally this serves as a way to disable seccomp by default to avoid
the configure of QEMU automatically finding it (via pkg-config) on the
build host when building qemu-system-native and auto enabling the
feature.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 274c855d35..b5827dc2ad 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -188,6 +188,7 @@ PACKAGECONFIG[rbd] = "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] = "--enable-vhost-net,--disable-vhost-net,,"
 PACKAGECONFIG[ust] = "--enable-trace-backend=ust,--enable-trace-backend=nop,lttng-ust,"
 PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,,"
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 
 INSANE_SKIP_${PN} = "arch"
 
---
2.29.2
