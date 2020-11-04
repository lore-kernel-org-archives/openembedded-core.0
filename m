Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web08.11692.1604489698588464967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 03:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=TaUnYmO3;
 spf=pass (domain: nathanrossi.com, ip: 209.85.215.193, mailfrom: nathan@nathanrossi.com)
Received: by mail-pg1-f193.google.com with SMTP id w4so6153993pgg.13
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 03:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=bh8QKIUqAmJWo6u5mnG/hufQxOt5gjYICDUQ/SM7y4Y=;
        b=TaUnYmO3SaPMYzgohyKAVw6WOq02PYToFaWlx+jQWiK6v7dWdkdbxO6RYZLVolMhGs
         Vuyt1L4DClOW+Xtsk1XKwZVasZjxibSwU+/FQ5hYrHio/QHr0FtdTeR3mIyABFT3BV/v
         CsM6ScddzNZ4XHr8HMoY/gw3MU0LEF0xgdFI2usxTTzopP291zFE3eDoqJEKnR0s+FAv
         amoJvIWKxp31wm5oirwBgasRh4ONV8UEzLzkIIFVGPWegMV6+V/dBxIKGo0xQsf+kABE
         zFfV1tyh/wcJYLTnS07vkuQC4vU/OqODGoVMC4qL8MbzYUo2mNoBJWf38BkkfFkneUZT
         CDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=bh8QKIUqAmJWo6u5mnG/hufQxOt5gjYICDUQ/SM7y4Y=;
        b=UDdn22cum/hNfqPvWExK9UwDKPP69PZ2UQhNO9nx1rUlz7Kxcggh2ODrTK454ohQG4
         swJzFV2SVaf6+NkkXRb3II572ZHmejWVuDSJVBq/Vtu1jSgY/iNsYP8/j7CwNF+GxcYR
         vJ9DlT9bNbANIw5R+xheGXhlOEP3B1kLtGyeK81Gd1lWtfYvdFu/7gNXYfQspNwutZkk
         mudtGFQvu9GwTXEahk5hwv381C0fNUqWDqxTf3KpXKbdnGnPzkcawAlC6qBaBoEcvzpW
         chOcx1txDnwhmtjKfk8wwOwe6KZYaQuDlKuG4MkD2tw/K+fuUNL8F9W/HkhCQTKEK25N
         z+1Q==
X-Gm-Message-State: AOAM532pl4CDrAB5zIQ39Cj0yBPdMparD0p4Waaf0lasNZyIoS2Mjmy3
	YGPBNDm7Jr4iimxpkXBA4NoGWw==
X-Google-Smtp-Source: ABdhPJyEX/XexGxydi5j33JIbMf517MbP+q+SWPzGHwSNCER3dpy3FJErYIr2PN/BRDSrPslMkcV+w==
X-Received: by 2002:a62:75c6:0:b029:18a:d510:ff60 with SMTP id q189-20020a6275c60000b029018ad510ff60mr16549770pfc.35.1604489698150;
        Wed, 04 Nov 2020 03:34:58 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id v7sm1439907pfu.39.2020.11.04.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 03:34:57 -0800 (PST)
Date: Wed, 04 Nov 2020 11:34:48 +0000
Message-Id: <20201104113448.388597-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] cml1.bbclass: Handle ncurses-native being available via pkg-config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The linux kernel will by default use pkg-config to get ncurses(w) paths,
falling back to absolute path checks otherwise. If the build host does
not have ncurses installed this will fail as pkg-config will not search
the native sysroot for ncurses.

To more all kernel/kconfig sources, inject the equivalent native
pkg-config variables similar to what is done by the pkg-config-native
script. This only affects the menuconfig python task itself and the
oe_terminal call inside it.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Currently in linux-yocto this is solved via the CROSS_CURSES_LIB/INC
with the following patch:

  http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/?id=1714a5ad9cf61f4d0f4b8432f327cca2998aba77

Busybox carries a similar patch within oe-core.

Mainline linux and u-boot do not currently work without ncurses being on
the build host.
---
 meta/classes/cml1.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 9b9866f4c3..d319d66ab2 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -40,6 +40,14 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
+    # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
+    d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig")
+    d.setVar("PKG_CONFIG_PATH", "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NATIVE}/pkgconfig")
+    d.setVar("PKG_CONFIG_LIBDIR", "${PKG_CONFIG_DIR}")
+    d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
+    # ensure that environment variables are overwritten with this tasks 'd' values
+    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
+
     oe_terminal("sh -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
 
---
2.28.0
