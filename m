Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.43848.1597672653871839837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 06:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q/pfqGwZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id di22so12314103edb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xe8JsaUPstGPj8O+x/1sAhqs77FyzHLBrUA2UdVsoA8=;
        b=q/pfqGwZHcL7J80oXviqK04+L+8/iEDG6bGC540FuwNpFbotEvrex3F4ynD7GxUA8c
         3nLTqSRC5DXkRUONnSpYIQjB+kU8F0sM16N7brfeLOT8NhglcfdO/oDn06ELsRnQ3/3m
         OcCjMXjrx2qTbM431Ljp5UQwqjGHBQJjvUOkcBCTcMvolheeow22Pi4THvxm6tiYLGcp
         B00dUcYfPNxllqkgTb6FxKJTkWSJp5k4HB96680jJf8KifgTvuHl2hkc9w33bj3dJjIX
         ya3EyJWg4JbeeLDrXx+YI6zVqhIpF1X6jSEiNdXJtcgSUaqmPyhfOyDIGD0syPacprxf
         I21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xe8JsaUPstGPj8O+x/1sAhqs77FyzHLBrUA2UdVsoA8=;
        b=GVfuWfggYtFtHeuNpU+RqFfhO1i3zyHVBdnDYailGz29L26CCt0qcfHnpv0t+esr4z
         AVugYTxf/ANv6IlS4yrtqOezmaNZ03MS2Zhf812EPoORN3+2+1/4ryjXykldOUiQRsMd
         +CioFl9DM1XG34gutak4IaEfFlynAqst9bc+d86ZTjqFk521fpw1qAImi/xvHv4Lqmeg
         xu/DDi/cUL2ujd6cHPEAWDKfTmGfjPqvjWiU+dajK8W0v4+fuQwa0gFToeK4v2fq/W5n
         yqgKvPdcLtqsJa+X559JXuW407JYNoOcRx3xVEsvlH0u6vxjuTRpyhDl+2PSffWtfhYA
         Ojqw==
X-Gm-Message-State: AOAM533rwhHGr1Y/6FcnWJxcVgs4bbw0hZJilJD+5eOzXBoCDJWhNmIc
	zKO8qrqN/FyU16cdKGmQpgPeTrbrIJrgdw==
X-Google-Smtp-Source: ABdhPJzA4oPoLceVKxEoObCx6h8JJWuXp9cdz5VNXz/6AgRNYS/FGMM0IPzvJYqHF4VlnULPxjboKA==
X-Received: by 2002:aa7:df8a:: with SMTP id b10mr14615904edy.62.1597672652224;
        Mon, 17 Aug 2020 06:57:32 -0700 (PDT)
Return-Path: <vvavrychuk@gmail.com>
Received: from glva-laptop.open-synergy.com ([213.174.19.120])
        by smtp.gmail.com with ESMTPSA id s2sm14599451ejd.17.2020.08.17.06.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 06:57:31 -0700 (PDT)
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: [PATCH] runqemu: Check gtk or sdl option is passed together with gl or gl-es options.
Date: Mon, 17 Aug 2020 16:57:28 +0300
Message-Id: <20200817135728.19929-1-vvavrychuk@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

runqemu help reports that gtk or sdl option is needed with gl or gl-es
option. But if user forgot to add gtk or sdl option, then gl or gl-es
options were silently skipped.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c40acc4a86..7fb5f7db57 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -478,7 +478,8 @@ class BaseConfig(object):
                     self.qemu_opt_script += ' -display gtk,show-cursor=on'
             elif arg == 'gl' or arg == 'gl-es':
                 # These args are handled inside sdl or gtk blocks above
-                pass
+                if ('gtk' not in sys.argv) and ('sdl' not in sys.argv):
+                    raise RunQemuError('Option %s also needs gtk or sdl option.' % (arg))
             elif arg == 'egl-headless':
                 self.set_dri_path()
                 self.qemu_opt_script += ' -vga virtio -display egl-headless,show-cursor=on'
-- 
2.23.0

