Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.6383.1604890620023629683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WAXws1zl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id 10so6697500pfp.5
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=W95tK1yVq9vZcARyro7BXlUiK5CeI/30BLDNfpXFnic=;
        b=WAXws1zlWKda85D4dYZM/da9a1s8P0WIIIORgOv5aBm2T6+aj7lSB6R6wd3Cbn1L/p
         6aWVy9heS6hsAHapysbYGUyPmYOoibmqkckuM/5ULLdrhSgoPIwg1tV8Jh/+A6VqyKFo
         40AbeF45JrmPUxTKPbrBIR9BFqT6176bl0PCYHikSsYXS1Viyb3vnXFN+dW5x9o1DprG
         Ck5FJNG8G/aOZUnSnUfHsd/vNN9UJhj6kSGjZ1egoFxRc90LKZXuThj3ubjWnrhjENmc
         +DcqM0e2pBHOcbQ1VrTXxfs6ZlVdrdp36io/Op2PO0WTHg/XdVxh0FZfmhTjNeUoDPQp
         B8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=W95tK1yVq9vZcARyro7BXlUiK5CeI/30BLDNfpXFnic=;
        b=YNw1DFNJCtfznV0rH2O+SnRkflXcCjAAUmlZybRtq+BqNpjhyMuSlyRrjNI221Mlbl
         RSyuapjYK2MSSJLWv8gvgkmDl4eywQnESJpVuX+ZoUDEEwiZ+aJZMinXiYSkZp8Q/EjH
         j/fmrYyNwcjUa9qqI254yE12+pLOE2XTyY+RBJ2nIRwVw+SaYxwJe2t1mJoBcltFJCvi
         dDqyNQkB/bdpe0kzs7BXLQXFHx/Wpdp2mvWvjCvKb8dQovlAFasvlQs8EKsBjz68e6yc
         YValdcPqB30Qu3R5gSjAPIvtca6mufhiSb6ycML5rbK78rOBCgvnnFnhOYxjonoh3aco
         HK/A==
X-Gm-Message-State: AOAM530mB6NTiLRhgbr1N8/RIf8hkASQoPc2iBdC2sdYSEEdO4MRgLrE
	hjxzw000Owlzl/UbW0fDl+ohibmBRVd43nWc
X-Google-Smtp-Source: ABdhPJwrI0jFgWNkLHKlME1RVFmvhSxXiGBLtfUAegkNiujgE8cXgtzdqnEuVxQZ08J1vgHQ15IKoQ==
X-Received: by 2002:a62:8709:0:b029:18b:23db:7712 with SMTP id i9-20020a6287090000b029018b23db7712mr11896774pfe.66.1604890619081;
        Sun, 08 Nov 2020 18:56:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:56:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] update_udev_hwdb: clean hwdb.bin
Date: Sun,  8 Nov 2020 16:56:10 -1000
Message-Id: <10413cf013ae5a92ef12f33dab8e67f0bfb0ae25.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

Steps to reproduce:
echo "IMAGE_INSTALL_append = \" udev-hwdb lib32-udev-hwdb\"" >> conf/local.conf

When install both udev-hwdb and lib32-udev-hwdb as above,
there comes below do_populate_sdk error:
 $ bitbake core-image-sato  -c populate_sdk
 ERROR: Task (/path/core-image-sato.bb:do_populate_sdk) failed with exit code '134'
 NOTE: Tasks Summary: Attempted 5554 tasks of which 0 didn't need to be rerun and 1 failed.

 $ cat /path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/pseudo/pseudo.log
 [snip]
 inode mismatch: '/path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/sdk/image/usr/local/oecore-x86_64/sysroots/core2-64-poky-linux/lib/udev/hwdb.bin' ino 427383040 in db, 427383042 in request.
 [snip]

It is because both udev-hwdb and lib32-udev-hwdb will generate
${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/udev/hwdb.bin during do_populate_sdk
and it triggers pseudo error.

So clean hwdb.bin before generate hwdb.bin to avoid conflict to
fix the above do_populate_sdk error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7472925feb53ce92c1799feba2b7a9104e3f38f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/postinst-intercepts/update_udev_hwdb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index 102e99b947..8076b8ae6f 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -17,5 +17,6 @@ case "${PREFERRED_PROVIDER_udev}" in
 		;;
 esac
 
+rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
 PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
 chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
-- 
2.17.1

