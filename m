Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88707CCF9E3
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 08:49:23 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6879.1762073355180530517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 01:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2UqKMPq;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-78125ed4052so4916973b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762073354; x=1762678154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7p/vNSZbOps4VSyOGVlsZNXq3aFp87t8RUfoyoMa3U=;
        b=h2UqKMPqu1jBm8cwsGB5BmMR+LPkaJUtvQn2oOehdYqakjxK/n2PDxoB0SCu64lDGg
         2aha6dPLje6Xj2TqY7FZox8TRIHm5a+wPGEFF+qPx8CLf52QhUPzD9XS6mb2fHJlHPVc
         sI4EDncyLVLQy/+Mpn1ojwXH/TKghEvBeoLsbWLyI6ut6zVpwz34nLYPatxTwo6M0Boh
         Zkt3zbDwQz+FZUszvmjGmt7EQkWqlSQZ9yoOkA/Jth/MV6XWAR/xRMA75ugvl/iGOZDo
         xNFucJzrPHFALe5mT93SVUVsy1ugH0qnba57sBCHFFyT+F4k15JFvYXD5Nw4SxW+YCe0
         GD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762073354; x=1762678154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7p/vNSZbOps4VSyOGVlsZNXq3aFp87t8RUfoyoMa3U=;
        b=tYSJSPTzzmutyiQRBE5Xs4IF3zZlc9FP2PYM6YR17jz0MNX+3sBUKPZoihKV80zOSu
         KW//ct/uR/oVa13BfOGZOrtlMVfYiqQy95t4fPlFS3vvapNFj/11HQvb61b+0DF0lD09
         iX/k4+MKU1gFXz7aT0scr1eKLPGCYBdIx2h+fRwSU0wOpSTaUvdfyDZW89k/yUwx5BF5
         eBeZtji2oYpyfrEPqpdGbAqJpuxMGeOKzoxV4eqrQQO5MsoP8uM30PKDYB5At81yuI76
         QKS5B9hla6ql2hqA0VV+osk+m9eqB2QaOUbhKeFh5rkDdgYH+ejdfKAClJunDaZHcqB1
         ev6w==
X-Gm-Message-State: AOJu0Ywnz92O2r1y8G+6duNxnqN77uAkvwFAEKIh8wztJ4xOVkzSEqT7
	mXizA7T6Ap4B5n4BSueUdvVa6G28NQ1Ri5Q4L4WO7wm9L5+6qoP+9gPfDb5KAQ==
X-Gm-Gg: ASbGncsNOsavMoWTzo+J3opYhP20gSK4q0bmS3me4fL3ahhtNEoTVAAyWuCGf6W1DY0
	KR4rMu1sK1XECZzZpeiTdT8LKgHeUfl4q9UF28oGxmc5rDchwn5WftHP3YF0eo10lxgPR/AUzSd
	XHKPcvvJpovC8XgYtyZj3XJGeKIimGW7EkcRRt2yMUiE2wQ1g5HTAE8zSQU1MYH3Sb+NCgJXAa9
	tf0B5AvCpYFpfIGK1Ozftd2Tmh/DZlbaf5mlUWzV+Yn74t0gSBOs+uuKVdpdQK4CyUqzi07TCVc
	+xqm3sUAq7ADp1RtUffM6VvCXgxUyLnIaXLCZLqVbET16Qg/NZY3x85LEI5BypIrI57wAL8tsI+
	psNmuxVnNUnvKNiyQMjo6R1SWodeQK83bvWNDUzMG+T22r1S29LL9nPmhvQyN7PnveCwWb4+K92
	tdlK0TE13udPZHlQ==
X-Google-Smtp-Source: AGHT+IEqMBDxLbn4j2uhf7aKESoR2M43YycGh/n+graNs+OckS8Upo78LDiUvCoAXZsOtyyBa2ZrJA==
X-Received: by 2002:a05:6a00:174c:b0:7a2:8201:e35a with SMTP id d2e1a72fcca58-7a7789003fbmr11466243b3a.19.1762073354395;
        Sun, 02 Nov 2025 01:49:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aaf449e8f1sm113891b3a.11.2025.11.02.01.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:49:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/5] gobject-introspection: upgrade 1.84.0 -> 1.86.0
Date: Sun,  2 Nov 2025 21:48:52 +1300
Message-ID: <20251102084855.1555197-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
References: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 08:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225569

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gobject-introspection/-/tags/1.86.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-introspection_1.84.0.bb => gobject-introspection_1.86.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.84.0.bb => gobject-introspection_1.86.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
index f6797cd2e5..2fff132b1d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779"
+SRC_URI[sha256sum] = "920d1a3fcedeadc32acff95c2e203b319039dd4b4a08dd1a2dfd283d19c0b9ae"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 

