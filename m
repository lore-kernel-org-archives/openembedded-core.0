Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.17501.1585329933298347670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mf3Rcopi;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id z18so12258445wmk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YZ9z8cxwoq7Y6MuqUMal2C5LfmTJqnkBvJlQxiHkw9Y=;
        b=mf3RcopiSvHU5SC5/qGfry5PQY9XVMSxJeqPxsq8+SExn5FYfXZZFWet/b9p7Ou4vU
         FeXgagNi58b6sAlhk2knou2JD1YylrOKIGGbbSzKpKmgpv8h6ScDI6LPxCB1Jj7YmajQ
         EwSqsEG7akIZd5orFJ3YZSEqASJVCJNTySo4zjNG39+ZmH/zCeMOdam3znxqXlqRRrlk
         DNpBYUL3wpckpsxxxMjqpcyfFwUY/nfE6wtC0FtyLsgCLm0yG+Sc9Z9zB2IOg2QQMgVW
         byYpRQFdiFyuei2mo/c1OTkhorTJ0/q/d2ulD2Ta3KuI6fB9KBU+FAP7I/SacGNlG1UB
         OeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YZ9z8cxwoq7Y6MuqUMal2C5LfmTJqnkBvJlQxiHkw9Y=;
        b=V8K7Lr2KX+nkxmiASDm7OjkuyQtAX9Whi3vGa947a48pkb9hB4L9HhXJ7PlvxObQsr
         9wgd6Z8zGh01VSVXGKyeOIFC7K15Z0IkNcM/sRI8wnLJHJqLo+OwPlh91UwmT0myGmqP
         +LEq0ERHzy7RrK6dY2kTTfL3PoL+JKkD96m1Iy3sqWUQtiKihFqhHxYUrmChvMW91Hs1
         9GfMriSH1LpJ7pAzvMr1yU2TBvOxC53zKEHSXhQhQJzZXAcBVPLBAp0ABHMaGoziGySG
         JPgxyj+TVqmwKDM7dXJd3/rAfa2qP3CYyeff1hR2SHFmwCyTlqhlimtKVJr5PNlj92Sa
         YCZQ==
X-Gm-Message-State: ANhLgQ1WWmSyxwMTK62ZIZPigTxdNilLXAEbhAe7njNwfcmzJIIl1//4
	tnhXnauSpa2HPOYqzJffVM9rxrbG
X-Google-Smtp-Source: ADFU+vvf4h6D8PN1nevuBtxfAJ4kDGH4q9NH6fL/KEqQMXz+qYPwuYxNkjSVRnmnChaHrgu7tudwbA==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id e23mr6189074wmh.159.1585329931641;
        Fri, 27 Mar 2020 10:25:31 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:31 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 07/13] systemd: Remove X11 related files when disabled
Date: Fri, 27 Mar 2020 17:25:14 +0000
Message-Id: <20200327172520.62888-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

When X11 isn't in DISTRO_FEATURES, remove X11 related files.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 65deede20042..a0d65237bc7d 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -275,6 +275,10 @@ do_install() {
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
+		rm ${D}${exec_prefix}/lib/tmpfiles.d/x11.conf
+		rm -r ${D}${sysconfdir}/X11
+	fi
 
 	# If polkit is setup fixup permissions and ownership
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
-- 
2.17.1

