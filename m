Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id F3D1971A74
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 12:42:50 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j8-v6so10425587pff.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=Xcn0eiOHp/NjqvSFLBok1i7aB+ZQ7rXQ+szurV5IT7I=;
	b=CQUYJlEcdVrd8qmMn7crobiwEY9AoG2GkVdjFQM5gYVzc9AeMW6kH30smevAH/qtzM
	l819GCNLoFbVuzRr6WSMwSOUaF+3SR7AYq2p2ZVj8od83FLN1VFYyDmnIu1JUwhF9eKU
	4ueIjV3jsAUirHWU9/0yvfS7kTeQmzlvQC07bZ5rqoTCM71Kw0DCrKnrcfC/xkX8vGVK
	59YbTMOf92uLvSoDzlsiKQScm5qSttc9liDAcUT5qBgQsnNGiFcnRRoWTF6hz4qRXCJl
	il3h731iEv8eJDI1mDX6gLgwcBtQFF+gpCN4ujiCqXf6A42avm1kpf3NgA4SWNba1/2L
	jIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=Xcn0eiOHp/NjqvSFLBok1i7aB+ZQ7rXQ+szurV5IT7I=;
	b=ks3oEsDMaHCSgTkYJvnF2wtzeWxC7lZ/KCyoZqdiQN2NEYHy90GWwQu29K4DYDIV0m
	nOC98f9xqxB7yYRbOlbiJRgtWDM7dzU2LnzY5yMfgeGo2RhTbC3nZzrn/RU1+CMI4hPq
	6jP6iDywC8q5zzd8/mT93H/Fg107H6h5o0Bnou4lwP5KjclUXeQJyzV6Dq07f338N4l/
	ytdLggdpsJKqyICHtpc4iW50Omtb/9sA8zGpCQDr/eNmLlEqAmgpVgumU1FH7e6zzR3v
	SaoCBL3Tn7fYXG9NmpcGbCApBoVcsF4es4mBMrOS+2AixA0d0LwlDiGp03jJJwZpuKyd
	+YOQ==
X-Gm-Message-State: APzg51Cp5ONwKUvZ3uKOjkYxhHIuzYAWFJtGn3icy7Aa8KWMPyndYDRj
	Xaf2xzo0eauZ9tu5vwVqWaSgX1qhoFQ=
X-Google-Smtp-Source: ANB0VdYGTD9ICN0KW600+2Ok8Ysz9pnLPJZ6nZ8FQGcL6I/UcV6BQDObpwFU5tYXonUTvwuAl/+DNw==
X-Received: by 2002:aa7:850b:: with SMTP id
	v11-v6mr23604017pfn.165.1536583371838; 
	Mon, 10 Sep 2018 05:42:51 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	f186-v6sm16759804pgc.4.2018.09.10.05.42.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 05:42:50 -0700 (PDT)
Date: Mon, 10 Sep 2018 12:42:38 +0000
Message-Id: <20180910124238.20745-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] libgloss_3.0.0.bb: Fix up mv pattern to include libnosys
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
X-List-Received-Date: Mon, 10 Sep 2018 12:42:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

When installing libgloss libraries handle the ${TARGET_SYS}/lib contents
so that it is placed in ${libdir} instead of ${libdir}/lib. This
resolves a packaging QA issue.

  ERROR: libgloss-3.0.0-r0 do_package: QA Issue: libgloss:
  Files/directories were installed but not shipped in any package:
    /usr/lib/lib
    /usr/lib/lib/libnosys.a
    /usr/lib/lib/nosys.specs
  Please set FILES such that these items are packaged. Alternatively
  if they are unneeded, avoid installing them or delete them within
  do_install.
  libgloss: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/newlib/libgloss_3.0.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/newlib/libgloss_3.0.0.bb b/meta/recipes-core/newlib/libgloss_3.0.0.bb
index 664a922815..727062ca5d 100644
--- a/meta/recipes-core/newlib/libgloss_3.0.0.bb
+++ b/meta/recipes-core/newlib/libgloss_3.0.0.bb
@@ -18,9 +18,10 @@ do_install_prepend() {
 
 do_install_append() {
 	# Move libs to default directories so they can be picked up later
-	mv -v ${D}${prefix}/${TARGET_SYS}/lib ${D}${libdir}
+	mv -v ${D}${prefix}/${TARGET_SYS}/lib/* ${D}${libdir}
 
 	# Remove original directory
+	rmdir ${D}${prefix}/${TARGET_SYS}/lib
 	rmdir ${D}${prefix}/${TARGET_SYS}
 }
 
---
2.18.0

