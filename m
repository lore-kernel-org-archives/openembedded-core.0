Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5303ED65538
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 17:51:24 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.52522.1732643476402030645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 09:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xqm7onG8;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-84197c469cfso78358939f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732643475; x=1733248275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5Bx2KoTk0zhfqhwW0JnO+vwC4imeMx0Q97TqHfm8JE=;
        b=Xqm7onG8+TiSMfxwLqC5WIhJJkjSg4Izxu82tk5WCFU0UVxO5m1Vkm7CFXWyorvWr2
         OYxy6Sc9N5Ginf8dADwkQaVoAF3QgsidnaMYzwvXbfajipMD7nb+5Xg1OnPnB0J7EVh/
         dyBZ2r6kM5z3MExMPOfqypi/BUs92DZp+ZKoTJ6Q/rNoummTctC9pU6LZwx+/9AKFCNs
         3DX7yiVvTIEJdzv1iPcRk1c24vZRJA6wKg+VMqNCMsNPEOIkk5Fhytc3qZkLJ5wRa22H
         lv6uZemUoavn+pX/9ejCuuLDPI7T3f+F4Y5GwvGh5hoj3Ap0mO5HYA0VjuCnkBAjM9Hr
         2yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732643475; x=1733248275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5Bx2KoTk0zhfqhwW0JnO+vwC4imeMx0Q97TqHfm8JE=;
        b=VZ5XQ7mpCfErm8vPh2HCYwpd/jLbkUZMy7NEkkCl8XGId+R0axbtGruu+sGQ2AhPWy
         8i9HsGUUTkBIwSXcv1ggye0TE4Uva6nWYgWp1dRxYq05ObR04qkEY+YnDJWm4FghVRBo
         +LEbJhnAvHSvzKFOUJEXP8MpnD3J4vuhXChEZ6ejs+LN6xO4nbcKx9o0yr+TPF00BXnt
         Owe1uBByaGz2xJen0rraT9J/CaFETAwJMGOOJT/rwF8sC3uYavNi53sq5flsJSnGjEfy
         uQhWoaKs3a4TkGPqF2kycOAyVSjs/f1N1b4a5E5ldnfCoj/z63KMlJU16J9J82Qqle50
         I4ow==
X-Gm-Message-State: AOJu0YyqrFgbmiX7fjHZnSyCrtMkV8VsQ0QXA1IK8aBFLoa+wuZr/lC0
	nN/ms4GsmjoDhRGlEGKg8XW+cJPoBSsQZDdusLnsPc3MseIES/xYB8+Xkg==
X-Gm-Gg: ASbGncsoRbSZI0uEAfp6MK3fx7ez9mK/ZqjoGQJChQpKsyycr6rk81Y3QPk9ETbyOKp
	qADD8VK8ZnsMCfvGKXWpF9ivc8dA9eBzzMJ/AdGXYjERE7WHdMV4f5FYCFL1CXGIWGnw7lt03t2
	2DnZobGXjEwIfznDb0FHUnyJvq/YVw7xtS5X7MMQbTVTT6g4Bq6csgOsL8SBOu+xYaVNiXj2YJ8
	cQSvcoTSRorEB4agu9sfNoqGReRvsxnz+6Re7dOK4ux7hP9z4EiePrqmI1XjAYSim+u1CCyvHN1
	mF7a6g==
X-Google-Smtp-Source: AGHT+IFHCtXD1Ajg0PqJztZcQuilCWmg7CsnAaumgIwpk6wQXi30JEdjDxT1pmxpVnhU8FQFdtm4nw==
X-Received: by 2002:a05:6602:150e:b0:843:ec8d:be00 with SMTP id ca18e2360f4ac-843ed021f2bmr28177339f.13.1732643475439;
        Tue, 26 Nov 2024 09:51:15 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83ecd3ea4cesm240631339f.40.2024.11.26.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 09:51:15 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH v3] python3: package tkinter's shared objects
Date: Tue, 26 Nov 2024 11:51:12 -0600
Message-ID: <20241126175112.2019940-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <CANNYZj_ii_qZ3XrhjTXqaZzJodp_f_0zUioTbgbBpkmKXxc_FA@mail.gmail.com>
References: <CANNYZj_ii_qZ3XrhjTXqaZzJodp_f_0zUioTbgbBpkmKXxc_FA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 17:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207875

From: Dan McGregor <dan.mcgregor@usask.ca>

Seems every time python is updated this gets removed. That's likely
because the tk option can't be enabled in python3-native without
creating a dependency loop.

Instead of manually editing the manifest every time, explicitly
add it in the recipe as suggested by Alexander Kanavin.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/python/python3_3.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.0.bb
index 8db5b813738..a393b5e4a07 100644
--- a/meta/recipes-devtools/python/python3_3.13.0.bb
+++ b/meta/recipes-devtools/python/python3_3.13.0.bb
@@ -360,7 +360,6 @@ python(){
             newpackages.append(pypackage)
 
         # "Build" python's manifest FILES, RDEPENDS and SUMMARY
-        d.setVar('FILES:' + pypackage, '')
         for value in python_manifest[key]['files']:
             d.appendVar('FILES:' + pypackage, ' ' + value)
 
@@ -428,6 +427,7 @@ RPROVIDES:${PN}-modules = "${PN}"
 
 FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
+FILES:${PN}-tkinter += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so"
 
 # provide python-pyvenv from python3-venv
 RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
-- 
2.47.0


