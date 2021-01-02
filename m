Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.16393.1609619126500353962
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jan 2021 12:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oX3S0bGq;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id z21so16231204pgj.4
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Jan 2021 12:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X7dUESqjlaBc4tKQsnib9oQmyG5KHEI6vgatLmoiTCo=;
        b=oX3S0bGq2OUCuZQDZFbKIIFWlUmABhDOY566+guKmoNs71Xxxseo9EPfw+kjtVP0WB
         f1A+OG5baOV3r2xhcTMT3zZtQu+Be6SgGbuC00XZ4K5c/4o9sC7O9H11kIy3dgawHKkp
         ILSV9ABRQkGT/2VI9hVpojy9gd6yq6D2BI1wbsdGDy2P9yXespqvVrC+6cDBor2cXnsc
         n0AcX9UYOacu/3LEYpOzjJrkAQYr9QpMVvNL8xCA/DeXEfaLHrpefmvyswHuCap9VXPP
         K7bf/PNFHaXXtJLV5jnB21eaLnn8bBtD7n1qhhAaRhHxSNiidS6vKyutMZTKzWhylTc/
         kmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X7dUESqjlaBc4tKQsnib9oQmyG5KHEI6vgatLmoiTCo=;
        b=Go9pWbiWpw5fNcgM821hUGEyJ2eepW8v1EABzTmASXupuOT3U8zyhtbKszJ3j6LPLf
         e3rOHDpIe3OQbIGFSmaOfDsxfOSWPRY7bjMSAaq+3PLqSBcL6+h+eIirEMJ3AemrtAji
         t40KlTvUslRtdUtE/LwqmMT+KZQB8OlLk8b3HxIo3L2nfCnaw9tZ9aofTgseVhpJnDEH
         mQSRJ5C/J48ygqTzFXkNW/4zvGPwyxUfoO3Rvi1vxgI7lRsx3+9byHxuRKbNhWpgDEqo
         scbwDBtGNLXX3tCGyQ0v7LyfsyPmZbdH4m1Y8+6AOcJHQi+lyrFzquJk3L/UG+BEPPhX
         9C+A==
X-Gm-Message-State: AOAM533m+NDHxyfAShhjqienbjTbLX7RzhIggiEamG7Fc7VpIeCVk01m
	Kmdy89eVcgR+kUl5+4PU5rQT6RbUwfS5WQ==
X-Google-Smtp-Source: ABdhPJxVMOweLFksK8T8nOj/j7D/gxAkN+oyjgeepLD9NJDF32TyBdIvW5480U/rvBJHQ+V4SvDzgQ==
X-Received: by 2002:a62:5547:0:b029:1a4:cb2a:2833 with SMTP id j68-20020a6255470000b02901a4cb2a2833mr59136186pfb.35.1609619125872;
        Sat, 02 Jan 2021 12:25:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::cd68])
        by smtp.gmail.com with ESMTPSA id k3sm31750773pgm.94.2021.01.02.12.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:25:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] openssh: Disable lastlog on musl
Date: Sat,  2 Jan 2021 12:25:20 -0800
Message-Id: <20210102202521.3791499-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102202521.3791499-1-raj.khem@gmail.com>
References: <20210102202521.3791499-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_8.4p1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
index 676a8a6533..688fc8a024 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -67,8 +67,8 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --disable-strip \
                 "
 
-# musl doesn't implement wtmp/utmp
-EXTRA_OECONF_append_libc-musl = " --disable-wtmp"
+# musl doesn't implement wtmp/utmp and logwtmp
+EXTRA_OECONF_append_libc-musl = " --disable-wtmp --disable-lastlog"
 
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
-- 
2.30.0

