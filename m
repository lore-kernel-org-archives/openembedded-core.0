Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.26518.1592249807368198235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lNBukO9A;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id m7so7212743plt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nSua6t/eCQRvm+mXZoEWKoAUSc+ba1TZCiTMVG1bQW0=;
        b=lNBukO9AM7Udd2DkI24LQm3bxmx1Xc1Zsu492ck/1vmwt8GBpGahM3gP67xHTmKjkK
         JcvYUJUay5173W8LabHugU93ht0r9GbD8vD/xhaqMrJDc4WIYohsvEGb04kTo7q6PGoP
         iO7BKP3SM51VmUZVOhJof0EGf3KITV/3y/S/bJvd8/TSmWFDJyY1e1Aab+pEWxpbGbst
         ynF7GnmncVCPokwswmBOa3rCwmPCUIaqz7MK54pSabpZNgiDmQj7tq9EEc2cOSS87Fnl
         c663l3gUX3di3kyIbSxzIeuiV+fla+8KBIef/YBuEb3/759KC59G6V1pJjGDGDm2TDbS
         FlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nSua6t/eCQRvm+mXZoEWKoAUSc+ba1TZCiTMVG1bQW0=;
        b=JnNk+tfv/PcGt56f2ZZyikUWAFN94Iz6epXUV7GZBUzPLYwSR+qzIFu72LIA+4HQYW
         zQZ6AMGsi1F6gbaKV5uhLXb7mQKWaDUglSL1vycLwYtBfUY1v/Cr7jWAP4YWRlTNKc0g
         SJ9WEbbQwNc4R2fdjZKXXc/SKNKYYFQTz/0Mex5Vvsy6r4m4pfZI1z9ZrxrOTKhuZj1M
         F4eyXJzR7T8rcfZXZRizvu3WOOt+F8T2ahRdDLBfUzgX6pJKS9oSgZGCGMAw7M8Rlijp
         MRkDD23iOI2yJgrGG45oPiFgha9hQATDPMi00wEe5YClxjeh3u3wWxu8Z5aUSqM315ry
         K2Eg==
X-Gm-Message-State: AOAM533fGmOtHxVob7InDeS1KcKz/HZzZ076BmfTJ004TB/xBicYA0XZ
	UPayo60Hrvg5WPXot6IQtakHaiDjoD4=
X-Google-Smtp-Source: ABdhPJwuOfpqFAbgbwawa4KUVQmxZjqvlVq/w4kVboqTPFnLfFQRgHoJiA4qpRiI7+C83x0Qiv/WlA==
X-Received: by 2002:a17:90a:f0d4:: with SMTP id fa20mr820973pjb.160.1592249806369;
        Mon, 15 Jun 2020 12:36:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/21] db: do not install db_verify if 'verify' is not enabled
Date: Mon, 15 Jun 2020 09:35:37 -1000
Message-Id: <db5ff344894eefcb447fea94d9f897b2c892c547.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Chen Qi <Qi.Chen@windriver.com>

On target, when running `db_verify /var/lib/rpm/Packages', we get
the following error.

  db_verify: BDB0571 library build did not include support for database verification

This is because db_verify is installed but 'verify' PACKAGECONFIG is
not enabled. So fix it by not installing do_verify in such case.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5ffdb296f211403f987b5d5a724a94ee91dc80c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 3a0923ae36..318efcb61d 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -109,6 +109,9 @@ do_install_append() {
 	fi
 
 	chown -R root:root ${D}
+	if ${@bb.utils.contains('PACKAGECONFIG', 'verify', 'false', 'true', d)}; then
+		rm -f ${D}${bindir}/db_verify
+	fi
 }
 
 INSANE_SKIP_${PN} = "dev-so"
-- 
2.17.1

