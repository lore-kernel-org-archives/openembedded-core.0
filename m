Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.347.1588969288455358211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 13:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=thzVrjhr;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id r26so12047092wmh.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2020 13:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LbEE1rHwxjh0d47VnkASiFN0Gbh78r8mMiSvCqvVgw=;
        b=thzVrjhr6f3U4RxNgbTVdnrBm88QW08Um6Knf8hmtf8r3aKcd3HyzWYd0lZBnm6GdQ
         OgAl7HKzUb1KxX9qTxCq+h3WneKA0ZlYDqHPXVE9WuO2Elp31yq1zoF3U3ZHXHEphOPZ
         XL/DzCNcycsqe1g/uAdZFs1pAOxml5i1L5cmTVdS1Q63a8tia5kowlCJlaJ8WyrOZVa4
         cl3IkKAfympePqjgITFMaFXd92T0XSnOCX+klmFhcN9VNAUw0V3wB8PINPiiW+MnRTB4
         tZZmFtT1LVjzk0H+ycQezVfTRtZuEu4L/VrCDEW0b8kTB4N1m/kxFVVZnGIlQ1702+4D
         lI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LbEE1rHwxjh0d47VnkASiFN0Gbh78r8mMiSvCqvVgw=;
        b=CCC3bdfisuTCCYF7UZNyY6bkizPCSBh+4eg6+fV4KzcT0IegIiv2cV9fP+byUP5Q1p
         udiZ7Bs75jffA6jKl+jS/qtHEr8XrflPw4JHNAsGt8tPhtFxiBySxXAixohz7QGgAkiq
         aRSu+MHdZjYB+bZOJgVOCD9e8fIl6z+AAq+toeIYNn8WGqJa+XtRycqJVqbvoAHkogXT
         Dxtnwu3n+6P9Q6GrVItsZSahtKALpBHrRpKKx71xDsfB1ekpQoN7GtR0xu9yWlRvZgBF
         4xNBg4/fXJubazn2gPPlh4T1jYcXwWvEnnA0+rjRXfxioyqLflYcE4syUZGVmaUbJ1ES
         Yv1g==
X-Gm-Message-State: AGi0PuYztOCp2E4jCpydWg9p+COmqFUINiVfVJOWlv19V3BpqN6uJE5n
	XKWrXmOtrpkdMzpbtPgaG1dEU4xJ
X-Google-Smtp-Source: APiQypKiYxaZ2dxF8MnGb2NDdkr7hCFhfr6CUTwdhbn9cGxUzvqlMA3hZdb9th11juH00wOC1LR9KA==
X-Received: by 2002:a05:600c:d8:: with SMTP id u24mr10871526wmm.19.1588969286675;
        Fri, 08 May 2020 13:21:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id v2sm5021799wrn.21.2020.05.08.13.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 13:21:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] runqemu: force software x11 renderer for SDL when GL is not in use
Date: Fri,  8 May 2020 22:21:10 +0200
Message-Id: <20200508202110.22140-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If libsdl is configured with opengl enabled, it will try to use GL
renderers to open a window even if qemu doesn't use virgl. Setting
the environment variable forces a software X11 renderer, which is the
same one used when libsdl has opengl switched off. This avoids
needlessly loading the GL libraries and drivers from the host.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7eb7a9c7b4..21680b49d2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -448,6 +448,9 @@ class BaseConfig(object):
                 logger.setLevel(logging.ERROR)
                 sys.argv.remove(quiet)
 
+        if 'gl' not in sys.argv[1:] and 'gl-es' not in sys.argv[1:]:
+            os.environ['SDL_RENDER_DRIVER'] = 'software'
+
         unknown_arg = ""
         for arg in sys.argv[1:]:
             if arg in self.fstypes + self.vmtypes + self.wictypes:
-- 
2.26.1

