Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.2516.1612942848403151923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 23:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X6nZBXTZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id g3so747603plp.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 23:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7DJtCyebVlqeFd+GosbFqbjUf/a7YdB+oEiu27sooyo=;
        b=X6nZBXTZCHf0KH7tbHNjIGfDCg+HtgbzbCMUsbXqGzDd/vtrfXRYmkaU71c7ib6NJK
         YNU+IHeAwU5GdPHm9t7vv1drGt6AqMeO2GO5d9MW+HpeYxuXShM2NjZUHTZewu7zJz+o
         sHIUL3xJVUifWunP66elwZCHIUFYFliIpotnB6cQLRpTlWS24WjuIun+NcxO7QNmzoRk
         /zcn/u5wCuGg6BU8guIkBHRwVQq5euKLzd4uFP5KpVetBTTcRoXE3m19CeOLsuwC8Q4D
         H3XBNeu0ixSSN1l1eS1rUtmaz4IrqttMZoNoZhPO07oLZ4SIReKd+dzf0RI7ET3dEnXK
         oJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7DJtCyebVlqeFd+GosbFqbjUf/a7YdB+oEiu27sooyo=;
        b=rIuYyuaedXP7nbUVwvT8aMTfY3sU6GM2ZOxcQIhmW+Naw5qLFe4hbbt/uV3Hjl58Gm
         cvdvEQ8QJUvf8S7DhNmrEI6aFsqYJNwY8yzDz5qw2smvmKaC/9kUvUddbHsJ7xNXR1aa
         ZdkBCS6dlJI7bgafqeYUHUB1ubFKTsprBkn3cOs3vE7Bj7ZoIhBOEgpOZinW/FD11eiZ
         dzHOu3bcGq8nY2bnLFg9tuW/9V88/G38HXUkZjk0Ly/pelHF4QkwayCyqdm4Q7hDA2iS
         ET8kf0lYrR3/ox/pwmuuLKorupKX9qveBs+9D6BpXfu6uRG/1o5iMSq7mAKA9xcAmKUS
         aAKw==
X-Gm-Message-State: AOAM533gsgOV01Cb/t0jS3cxdK7a36XVVGmotinIlzXnV7gDwtJD4TRO
	bq1UeErYMOSRcwzTsWKxk9RAjW4T7XOVXg==
X-Google-Smtp-Source: ABdhPJzK45GVPVIisT5Bs+6qAQdNWrHCox3hqoJlzx1LdQ8qel3fsrn9pK7eD9fyZ8Wp126Y1Ma4OA==
X-Received: by 2002:a17:90a:420c:: with SMTP id o12mr1932186pjg.193.1612942847582;
        Tue, 09 Feb 2021 23:40:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ca6])
        by smtp.gmail.com with ESMTPSA id k10sm1248954pfk.0.2021.02.09.23.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 23:40:47 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>
Subject: [PATCH v2] security_flags.inc: Add same O<level> as in SELECTED_OPTIMIZATION
Date: Tue,  9 Feb 2021 23:40:44 -0800
Message-Id: <20210210074044.1565808-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding -O can be troublesome in some packages where it may override the
O<n> specified by CFLAGS, this can be due to configure processing of
CFLAGS and munging them into new values in Makefiles, which is
contructed from CC and CFLAGS passed by bitbake environment. Problem
arises if the sequence is altered, which seems to be the case in some
packages e.g. ncurses, where the value from CC variable is added last
and thus overrides -O<n> coming from CFLAGS,

Therefore grok the value from SELECTED_OPTIMIZATION and append the
appropriate -O<level> flag to lcl_maybe_fortify so the level does not
change inaderdantly.

Since we do not use -O0 anymore there is no point of checking for
DEBUG_BUILD since it uses -Og now which works fine with
-D_FORTIFY_SOURCE=2, so check for optlevel O0 instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 05253b2df9..f996ca9be2 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -10,7 +10,9 @@ GCCPIE ?= "--enable-default-pie"
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
-lcl_maybe_fortify ?= "${@oe.utils.conditional('DEBUG_BUILD','1','','-O -D_FORTIFY_SOURCE=2',d)}"
+OPTLEVEL = "${@bb.utils.filter('SELECTED_OPTIMIZATION', '-O0 -O1 -O2 -O3 -Ofast -Og -Os -Oz -O', d)}"
+
+lcl_maybe_fortify ?= "${@oe.utils.conditional('OPTLEVEL','-O0','','${OPTLEVEL} -D_FORTIFY_SOURCE=2',d)}"
 
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
-- 
2.30.0

