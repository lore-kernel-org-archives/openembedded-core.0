Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A172CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 11:37:27 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3837.1762601837445911696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 03:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gB528SU8;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: liu.ming50@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-656b7a2e7dcso794308eaf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 03:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762601836; x=1763206636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fx4q/yHGvLUh1GfmQv0qmYYO/ro3Sx3APmPJ466kUC0=;
        b=gB528SU8ufY2x1yMRoxECM/xF1aO6ZW8P4Pz8RqOvphtwi3EGMR+XYjRQt1t2HHOap
         6oDP5HlHXdRu56RKEiNxVDhaC+UtUrO2x5WoiC5syi4I3Qj5DXoQq8Mseae/GnRFEg8d
         Wg9MkDv+d93/idqZNXVNZw31pzftYBVQgOk0vHhDuEzohz5C1RjPhnHCLQyjCad8wpLE
         TOmJxc27d3rpKWNwPVOcSKoxIn7imyxoMzsuCEhbg+iHpEZ3YEH8FIJhjYzNxrUfk8gy
         csceFO4Os8ALBbRNPu6mlziuvgA+o/qH4FLptk8EXop0kH5l7S8fuQGMOEWrrpdor3G/
         8dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762601836; x=1763206636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx4q/yHGvLUh1GfmQv0qmYYO/ro3Sx3APmPJ466kUC0=;
        b=tYHz2QHTK8w5WiomGCvkV333o4gNMXbTfA5HwPxk1BUD5CkOM0ba/4M51IVQvBSLAG
         +8R5nmGJp7ZypqCpsKoRez4MUiVoRxH82yudemjP1ISiVO43jipNQ9jDFhS+90QzlBxt
         yVDbguGTPQfTX2gs1TefHPhnO4V/oGP+CSLi9Epjt4kaQRWVn8IITnfMtF4v4FZNxuK1
         bzGN5q1GOv5P6hsrgYEq3XnfNMIDC87uD4utFa/ErYWo0Cg2biX57xR4ckDozwkLjTJN
         ZNHpQEq8Bo57A9f3edpKeEQrTL5YyUv0wIvGaayANRRz9KWv77kao6clcgw2iBhOF99y
         yC2g==
X-Gm-Message-State: AOJu0YxfMb/UBxI/at86kGz7Y88j60uUc/XgJHcn18bXtGIrHHDUIBTz
	AynrvkcABEB9to+vv/2QdJnztaawZA6ki/xusIyTM8c7i5dyiaiveH7Y+JQQ6w==
X-Gm-Gg: ASbGnctQzwjiyDgJVQofrLElJ4rSRXhLkW2eHu+9vN6o7c0cXb4iF8DyV9fQVUEpUf7
	LVOARm++tHhRmC5KuTFJ3XTDm8tqiiLAoxIe46Ndh6zVGf1NUn5++gmSqUExuZNkzhZNozx2lkC
	0nOIQQNXLq5jW6R8mB/jzAjdBbL5PHhONOxYGlq3KkytamKM8DUaXRGmmbrcDK2BjHo+lr7ehfm
	/TPLo7dScBjVEVMcfyNTwTUcOAH2CSQc9sBP7Kih+n4aZY3WCHHeQaNRl/taTFEREMKJZy0hxrb
	GZ1e/TdAO8wlEQMs1XttSpgQcKD7U2i3Gr8JZnuOvP1JhV9fwJ2UeDCd40MD6kqwgLXSjDCJXRw
	hG9n525Gyq2bUL6iEOaC0zqmStaZwk4mng0vzyVvUEROzDHKGMftYSAe8uQfiuuCGczEaEv2OxW
	Huca0OuBuIMhC/dQSltvSL7dWLGNRn/TtbEefONrwepuVtI5aBjyOfNHIP+4CYgk3iQpGXx8gu5
	yPoeN60pbkuDU3VV5vY
X-Google-Smtp-Source: AGHT+IGWiMDu4YyWMuI66XjJjL4f27ZwaP9dtpOt5B6edfZcpWqrMg3dCY/YAkr8s/DUDrDx8IP1eA==
X-Received: by 2002:a05:6820:2188:b0:656:735e:9f25 with SMTP id 006d021491bc7-656d8e88d10mr1202448eaf.8.1762601836426;
        Sat, 08 Nov 2025 03:37:16 -0800 (PST)
Received: from peterliu-Precision-5680.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-656d1fef709sm2044776eaf.0.2025.11.08.03.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 03:37:15 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] bash-completion.bbclass: put bash-completion package to PACKAGE_BEFORE_PN
Date: Sat,  8 Nov 2025 12:37:10 +0100
Message-ID: <20251108113710.23299-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 11:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226077

It was observed when FILES:${PN} contains "${sysconfdir}" or
"${datadir}", the bash-completion files wont be installed to
bash-completion package.

Fix it by putting bash-completion package to PACKAGE_BEFORE_PN, this
ensures bash-completion package get the files packaged before PN.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/bash-completion.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/bash-completion.bbclass b/meta/classes-recipe/bash-completion.bbclass
index b656e76c09..5371d3e625 100644
--- a/meta/classes-recipe/bash-completion.bbclass
+++ b/meta/classes-recipe/bash-completion.bbclass
@@ -6,7 +6,7 @@
 
 DEPENDS:append:class-target = " bash-completion"
 
-PACKAGES += "${PN}-bash-completion"
+PACKAGE_BEFORE_PN += "${PN}-bash-completion"
 
 FILES:${PN}-bash-completion = "${datadir}/bash-completion ${sysconfdir}/bash_completion.d"
 
-- 
2.43.0


