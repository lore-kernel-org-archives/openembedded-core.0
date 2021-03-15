Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.9072.1615816981904801144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 07:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastree3d-com.20150623.gappssmtp.com header.s=20150623 header.b=qzkyDx0J;
 spf=none, err=SPF record not found (domain: fastree3d.com, ip: 209.85.218.51, mailfrom: adrian.fiergolski@fastree3d.com)
Received: by mail-ej1-f51.google.com with SMTP id mm21so66333493ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p9ZcNuRet5ac7HfvpA7MM/1oNDx/aoKIIrAEHfgMrcU=;
        b=qzkyDx0JHiAFfsbmOy6pG8XA+nWoROs4R26F5sgh4kz4PPmcZXvaME6lUDp9BtPT5V
         lbl6vIJ7Z6++fALVFERIPpG+0lg/5xxt2sjkfGZGWbQyiY6oFuRb+Y176Uzk/fSilrhk
         8QSPhYaVJdozrk+9aHwOKzMX693ObPZuIncNFJEKFry2Drbh2oAdOWfNmwkAasnfg+Pl
         pSqbJGv5gKM6RIdCT0E/3ORPCjLiFwdwTnppOHAW6uADhVkG19HKWR2N2Bihpw+ghfOK
         ZxeoWu//OUur/oMVoQj1+leX+jlXVoK5TLbwnfMINSsFN/uwKYzWn3PVmdf0haf7hVmO
         tYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p9ZcNuRet5ac7HfvpA7MM/1oNDx/aoKIIrAEHfgMrcU=;
        b=WgFZqKb3oDrInLOR6YpwyE5fFAz8WnP+JsRuQFgLK9C0WX8+8tuoIyazjzfycHh+yd
         21yCXODuu+r1k9cQs7GnI/ziQfirjUk58nDJIekFLFsgjCwYfTtfov3pPds/pfeRjZlb
         V/X2plbImb2fdp5Cb9gbfh/Ll19TQxUZbjYKjmEh9gG58OSNNoMpBlXAuItFfM9nT+kp
         bPmFjuSrNJjZ9l2DDxvRFfxEz4V+aSt3MIzeNIAu6F/1mdV2qGFUhaNFiQAfAG9cayOH
         PQLPYT/eWCeXnGIhJk/lLNW+FFFkzFJN/0Yxe5Z/9Jq5+db2s9udg2YRA+LdJqdnuZ6q
         EDqg==
X-Gm-Message-State: AOAM530pYPXKPaRzZXb7iwA36bBYrAeREfzyt4m5VGhWHLYRR0DLu0KK
	e3cBxk/qDbUBXsWbMUDLaMvkHfX71vKQ
X-Google-Smtp-Source: ABdhPJwt7bvuUYJyZgkD7jTvB4oTs9PtVnYpnSJW4hpdn2qBiruZoazcOZEim6C/+nOmxPAt5z+12w==
X-Received: by 2002:a17:906:7cc:: with SMTP id m12mr23177628ejc.171.1615816980269;
        Mon, 15 Mar 2021 07:03:00 -0700 (PDT)
Return-Path: <adrian.fiergolski@fastree3d.com>
Received: from adrian-laptop.lan (8.237.197.178.dynamic.wless.lssmb00p-cgnat.res.cust.swisscom.ch. [178.197.237.8])
        by smtp.gmail.com with ESMTPSA id si3sm7394761ejb.90.2021.03.15.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 07:02:59 -0700 (PDT)
From: "Adrian" <adrian.fiergolski@fastree3d.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
Subject: [OE-core][PATCH] weston-init: Set $HOME variable for SysVinit manager. SysVinit sets by default the $HOME directory to "/" for the init scripts. It's picked then by the weston-launcher and make weston-terminal to have wrongly set $HOME environment variable for the root user.
Date: Mon, 15 Mar 2021 15:01:37 +0100
Message-Id: <20210315140136.174672-1-adrian.fiergolski@fastree3d.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
---
 meta/recipes-graphics/wayland/weston-init.bb   | 1 +
 meta/recipes-graphics/wayland/weston-init/init | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 65d7b81dc5..6b78e6722f 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -30,6 +30,7 @@ DEFAULTBACKEND_x86-x32 = "fbdev"
 do_install() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
 		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
         fi
 	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
 	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index d3e87c6cef..a849f29bcb 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -30,6 +30,7 @@ done
 case "$1" in
   start)
         . /etc/profile
+	export HOME=ROOTHOME
 
         weston-start -- $OPTARGS
   ;;
-- 
2.30.2

