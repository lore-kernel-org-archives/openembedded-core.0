Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id A020F60C65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:29:02 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id f3so19272983wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Okg7PZd/qLhNZffgtJnMMLb2a5cgMQLw8tlmpNowIh0=;
	b=Y8x5yGCVKydMrtye1j/Pb8OEF8wDaidNosNCiQDBFrHYp5WhQ+cvCcAxWYbR3D5vAZ
	Y5p4BuuULOXwtyjpcuSTPxvQD933SKgXP9KKzY/TQTDkSarIobI+CSGeXB3tpGlvOyf8
	cpHPhtAAtPDwCGKBJAjzBcH2TNtCH5lqJc1INEaRkrXctA9VWZ+kvbcQ1046/fdBQw+T
	K2iFN2i87aOycwDEKOpN2nv6JS61a6ciR6IPUr9Td1b54ln0Lf9p5ETue+PxjaM8il+Y
	AYx6oRLa4KwEBwMrrT0bfetl4cJFtnW/mjCidlfnGu5k+5Rn+GhrPi56DdCdU78iljc5
	Sy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Okg7PZd/qLhNZffgtJnMMLb2a5cgMQLw8tlmpNowIh0=;
	b=YzIGVPc2OyzfaLP6v3XhAP9h0N38XIN7S7Gw3Yd68+5lYHA289vW6R8pnEgYblOqMC
	WL8h6yJDudWo0q+IYGviya4xQaHdBcjtgFQv3HYAIgA9gpDR0+kZmcCEavjrwMwwy7MX
	ROauXipPr5BCVSDdT3WbQNC1Ft6XbFGrMJq5LoQJpLLB7pnf0S0vzfAfxgCr2tQ/Tkh/
	D4MgUuJn0EqDFPJtentnBeLq78nK+2xewzseH6mLnypYCX/aZJgkE3vbK+Of9kMjixAc
	GzK38p706K4kd+YnKxBXzNuDQhQdsvT1S1pC6Wq29JX3ohS/l1KJCg9WMEpaKU8cWI6E
	iH0Q==
X-Gm-Message-State: ANhLgQ1IfJGZ9wZJmX6xJ82MnB77l+4rQTlqckwvYsmH8QOZR/gumDyZ
	hHmpgk6vSFMR6c59rMyQM95c0n+v
X-Google-Smtp-Source: ADFU+vvnNwqwxLYKYCNiOdY/mY/2wwhuXneqs5uA1xBDzRFvSc4mq7KND/1qdtYbXYqU40cNlgCDQA==
X-Received: by 2002:adf:ce12:: with SMTP id p18mr6391423wrn.88.1584458943038; 
	Tue, 17 Mar 2020 08:29:03 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.29.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:29:02 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:23:02 +0000
Message-Id: <20200317152303.4600-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 10/11] systemd: Enable audit based on DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2020 15:29:03 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_245.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_245.bb b/meta/recipes-core/systemd/systemd_245.bb
index a7fae930f770..72021a0991ae 100644
--- a/meta/recipes-core/systemd/systemd_245.bb
+++ b/meta/recipes-core/systemd/systemd_245.bb
@@ -57,7 +57,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'audit efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
-- 
2.17.1


