Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D5F3A71DD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 11:58:30 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c85so35566101wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 03:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uOsmiFHCvXD85Xpo/XDnaK+HHZCOtemlFORpnpcd+fk=;
	b=AMlqB/4B9I/GPeNstx4YYEnXi5w2pvMiPFWF6tzKo0Vkny+WEbWgeI0o6HElN/HBlc
	91sv+jd5qgqs1hp4QRWULZBVd6Vahws3d6zHXbq9aXOVZHhSO1TbJzrVTtlt0kG/sYGh
	u5dXBLml/JwGqYJT1HlX3MX9F/MtZx+EMu0whEwvD0Tz2KIo5OwIBGDuOqv++EBc5SKm
	GLrINGH3J55YRX9XcyzAyB4A87hNSQG6X0TZEhYfk8yfFbGnX8cGauyScAaLfilm3RXg
	9Gl2PugWRVuvztdnTKKuGZT9T2ZhRx5ASec5KiDM5/0y25F3gs/OKjtNHqvn0aFQahf2
	UiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uOsmiFHCvXD85Xpo/XDnaK+HHZCOtemlFORpnpcd+fk=;
	b=UNNl4g1VGKjCWgtvk3iwYraVUoqhW26TRMXBfwkkPfhKovefzQpzaSU5EiCaxXaqJg
	nO/u81sv+q+cgRJaN9jtBYkNzOZmeCOU3xcJzF++5kZz1R/63/JwFR6xH9hyApORmhxx
	agwd0wyk3uXc+WGJZccbzPd/F0Wkf/yAebNlrC7pwqjUOX2PphR1E6WO3EacFXDd3Y3m
	G+5zNl7wApNmVgN/OyN2bJYETtqljDt2hWP7CD+4ekjhQT9fekZMvuBpC+TceytrCFwG
	eLhH1lHJRV9gHfGXp8oyUCA0X4xgu+4sBZEvV1LSu4RXjCjGX1sQM91NHLztdX3q5gqE
	IRtQ==
X-Gm-Message-State: AIkVDXLaYatkSd4C5uRV0BmhKLYVNKl2x02daMO2ZLBQ/uUC0C3J9D6Hes0RzGPiEQheQpok
X-Received: by 10.28.139.134 with SMTP id n128mr2394188wmd.125.1485950310226; 
	Wed, 01 Feb 2017 03:58:30 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x25sm33797898wrx.27.2017.02.01.03.58.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Feb 2017 03:58:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 11:58:26 +0000
Message-Id: <1485950306-1442-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] pkg-config: depend on pkgconfig-native for target builds
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
X-List-Received-Date: Wed, 01 Feb 2017 11:58:31 -0000

When building for the target, pkg-config uses the target glib-2.0 instead of
it's own minimal fork. To find this it needs to use pkg-config so ensure this
dependency exists in case it doesn't exist on the host already.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index ff8254c..66b02f1 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 pkgconfig-native"
 DEPENDS_class-native = ""
 DEPENDS_class-nativesdk = ""
 
-- 
2.8.1


