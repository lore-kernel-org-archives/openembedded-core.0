Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.57674.1629305436106905920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NE6YaIau;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r7so4619178wrs.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QVPJ+aLHv926aeatY5eJn95qKME9exhcq4I4lci1+JQ=;
        b=NE6YaIauPVEMX4fIum9MJiUAF0rnL/MrzAltW/XgCor6hGy7SxhFzicZj+HXVRV+6L
         Ux2EuIChGpg3qLR00KYEoCVrI5TvBYsJXttIn5401xOZ+6kdtNUqoe01FBTWLwWLV9qv
         NJ+l3NfcKxne9aLfoL6cTPH9FRE2eTlF5nuLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QVPJ+aLHv926aeatY5eJn95qKME9exhcq4I4lci1+JQ=;
        b=jUpORzZiVMyI7D6EGvBhjrcqHPquaG/8UctI0Qg1IXKYrmYAb5+8M+rHI9a/VBCBfP
         7lxH3ha660dY5rTykOREFEr619brY44HxVk+9sTZ1U6oz369PcH8ILXu3n+hI169hLen
         Qeo5qx4VoRId3EVSn8uxU9CBytw+XyKRQQM7qsPoFGFzPiZ7vx4SzA00gTr1gBkeKI6g
         xez/HpQmg3y4twXt7FrBoptBHobl1HP4K0e6JkzRA3hVVI1yjv+jmfNwnuUT+jJwf6bY
         teAM3CthB5ePRG+H9/bFEH6iIZ65gXvZmleoC9yElNgtSNX55Wd+32Tdb3oo2M1fz3jf
         ojdQ==
X-Gm-Message-State: AOAM532qGJqfgLy5ZwDQqLYsChT+bsxcpjGuWN53HLRxdJJHoWvubZDB
	Xz52SA+Z3EUA9ss1RjP7OBEqj5qb43fGCQ==
X-Google-Smtp-Source: ABdhPJyIY3Y44AChdyY9tYJTXove3HJW1Lv88YGN5Z865FgZARb1YIxVBfXA6NjOKpkciQKnPxL2LQ==
X-Received: by 2002:adf:fa82:: with SMTP id h2mr11389229wrr.129.1629305434317;
        Wed, 18 Aug 2021 09:50:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2])
        by smtp.gmail.com with ESMTPSA id z126sm343363wmc.11.2021.08.18.09.50.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:50:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] glibc-package.inc: Fix builds of pseudo with glibc 2.34
Date: Wed, 18 Aug 2021 17:50:29 +0100
Message-Id: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the same dynamic link tweak for libdl as without this, we have issues
building/using pseudo in mixed glibc/libdl environments.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 56fbf8b08ce..a320c40dc8f 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -122,6 +122,7 @@ do_install() {
 	fi
         lnr ${D}${base_libdir}/libpthread.so.0 ${D}${libdir}/libpthread.so
         lnr ${D}${base_libdir}/librt.so.1 ${D}${libdir}/librt.so
+        lnr ${D}${base_libdir}/libdl.so.2 ${D}${libdir}/libdl.so
 }
 
 def get_libc_fpu_setting(bb, d):
-- 
2.30.2

