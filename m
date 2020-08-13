Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.758.1597340284813960601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 10:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Y3QRdjB2;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.215.195, mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f195.google.com with SMTP id x6so3158024pgx.12
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SDE6j6L7KE/WxxI+dKbQ7UI86WNGkxfsZIPYIdZXfss=;
        b=Y3QRdjB2ZewNOtPzKWd3bXntFps86RYM0YP3CFH1We6t8j6/PVf+xnCmCQaV/sm3Jw
         L7Ip4GSA4Ij5YocOt/MUIg5Aih4GzBmfC4ea1DBntn0Q+AlHkK0oYsyaOVFp/bu2juqw
         gpWeKSKzv503JqZLUB7r0QZH5mkhsevE1zAOML0MvymXH/TMTmK1qu9e7Bo0rH3YaqUM
         LLNcsqKfllkoWvQGnzUUKbbODM5N1chpbmmoXgwuKLOKj07lqZ5AkTjpkjHsixVyWEyR
         evjmBtr2tVhTh0R+1zSgQnpu8zne5E98enn5vt/wezaoLbnimTBvyH7aERzVRRwcH5J1
         vUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SDE6j6L7KE/WxxI+dKbQ7UI86WNGkxfsZIPYIdZXfss=;
        b=p2d5aeQuY8+wIaJNMNbwQOTfo7478VsvNrJ1HCse6hFZoif9tO7PmFFGX9sLRzN+I5
         yaDPyXiBD3joHaLSLY7vaBLuuL+cCzMvpcThBUKYMCYtMIW5anTt8/v5GVtR/yL5Zw1x
         qGC3F71bfoVL0irjJYOMeBFPPfoacQ4Jr9Pogi3wpgPw06rjhIgbCmhz/IsCa70KKHXH
         QMm5ImCzD3DavkZ86JszhNNZDrNFogDD5XPgQq0wIQWe4qYzeMKoonc5sHk2BpRjFlY3
         Qa3KgBnfj/6LQI3JBQoOnwfLdD/Vx1GLpQv5Q0DTviZ6PfqxtF3SVfKWupTVSH9f3EUN
         E/1g==
X-Gm-Message-State: AOAM530bQcAZmEyOBKFprGKhm3kXmh4Ql4XoRw3dj0x2M3ornbercSfb
	OJP/yKYUqxkl/fiFtOsXMFr1/ox5Cig=
X-Google-Smtp-Source: ABdhPJxYU9ggBKwMb7H2+YB/wHpF1VNBoE4bqz8OAo5mZ/m8wljHESvqFxyWjsf/xYBg+NpmP5x4ug==
X-Received: by 2002:a62:206:: with SMTP id 6mr5295241pfc.228.1597340283781;
        Thu, 13 Aug 2020 10:38:03 -0700 (PDT)
Return-Path: <jpuhlman@mvista.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id x12sm6320065pff.48.2020.08.13.10.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 10:38:03 -0700 (PDT)
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id D98462A1883; Thu, 13 Aug 2020 10:38:01 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] gobject-introspection: disable scanner caching in install
Date: Thu, 13 Aug 2020 10:37:53 -0700
Message-Id: <20200813173754.26674-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

do_compile and the wrapper already disable touching the
home cache. Do the same in do_install.

[YOCTO: 13970]

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../gobject-introspection/gobject-introspection_1.64.1.bb    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
index 7eefdd3e27..4d80f00e10 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
@@ -131,6 +131,11 @@ do_compile_prepend() {
         export GIR_EXTRA_LIBS_PATH=$B/.libs
 }
 
+do_install_prepend() {
+        # This prevents g-ir-scanner from writing cache data to $HOME
+        export GI_SCANNER_DISABLE_CACHE=1
+}
+
 # Our wrappers need to be available system-wide, because they will be used
 # to build introspection files for all other gobject-based packages
 do_install_append_class-target() {
-- 
2.20.1

