Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8ACC4321E
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:40 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.13297.1668953794459881634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CmsrpNE6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id q9so9125923pfg.5
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgtinEgDEe2ikZU5s08uIwiRuvqg0fcYUnEM/MaKess=;
        b=CmsrpNE6muyEl7Fkk+GUNUr7XrnI0/2/RQftAeTxwKpuMx00vgQiqKxPp/B/+T1JHa
         XAjkw99v7GAxlFZDDaCdkBNvc2HHb0JJ3Leke5VrqaHZ4SP8C3wz8TtieCdL9gLW1YY0
         MTUT58menuechrPESA9e76M1m+u9yBqK/TdKhwCVblG1iLLGhIwOxe1whfMxP4okgk7R
         NP9Zs+66nVtqWux6TKyrlkIGPmzPi/xnzL0twhO7GPp/kTJBq02ylk7CeXEYW+ki598a
         aDW07o1BxYPWsVUWrvlZS4Hp4HXj9UrbSHN4TmwmNvBJo/UBeqL2mb0LpcgIH2ehYDgY
         u+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgtinEgDEe2ikZU5s08uIwiRuvqg0fcYUnEM/MaKess=;
        b=uAH0wVMtPK7HOQWh4tVTpRRA3tf7ypcPkSOlGYgzQ2gajKhm8OglgWTbiBi4Sb5BkX
         D1pmQYVXwKzB7o7Q/X/xWuNk+kvfZBQ9XMBCVBEiQoYqUdNa55XYaBh4m0TEDNFJoMLg
         GUTI8EZPzBEceqbwTjYpg+su0W3WTe6YNXB5wqlfYzDkHjOm5iz4NloRcg9mIBKr6B/c
         D5GqZ+bONgij/ucXOztzC+Y8rd/ELqV0o+WBToFRELHbkzyWl5RGsLnEqbD+d1w2LoUA
         buPCrzYYmsx6XeSC3LVTelJxSY2ocsttlUkhrv07zM7IB6WSwexgdrdtsBK0nHpXbXRY
         lMew==
X-Gm-Message-State: ANoB5plQEM2yJZmwlrKA6P0rJbG5Ummnt9B3X9+SB6CN4VbSEGoh0bPA
	NT4KaZ9S7rZu5VrGo/S+RfDthszMDoGJgZZvtuQ=
X-Google-Smtp-Source: AA0mqf4Xlo+DI3jqY8rAYpqktfxovMnRR/vp9oAiyi5afUdhDf6BWA6XJC545Bbse8T5e4aTUQsP5Q==
X-Received: by 2002:a63:191d:0:b0:46f:1cbd:261f with SMTP id z29-20020a63191d000000b0046f1cbd261fmr14131182pgl.329.1668953793458;
        Sun, 20 Nov 2022 06:16:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/35] kernel.bbclass: Include randstruct seed assets in STAGING_KERNEL_BUILDDIR
Date: Sun, 20 Nov 2022 04:15:19 -1000
Message-Id: <d6cb9dce1ffb14f9db497e9bb0cb7265ea4064ec.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173630

From: Diego Sueiro <diego.sueiro@arm.com>

When building with CONFIG_MODVERSIONS=y and CONFIG_RANDSTRUCT=y we need
to copy the build assets generated for the randstrutc seed to
STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
generate those assets which will result in a different
RANDSTRUCT_HASHED_SEED.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b36303158b2e0273ff415bdedefb379f680b30fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d878d4e167..ad2b296c2d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -585,6 +585,22 @@ do_shared_workdir () {
 			cp tools/objtool/objtool ${kerneldir}/tools/objtool/
 		fi
 	fi
+
+	# When building with CONFIG_MODVERSIONS=y and CONFIG_RANDSTRUCT=y we need
+	# to copy the build assets generated for the randstruct seed to
+	# STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
+	# generate those assets which will result in a different
+	# RANDSTRUCT_HASHED_SEED
+	if [ -d scripts/basic ]; then
+		mkdir -p ${kerneldir}/scripts
+		cp -r scripts/basic ${kerneldir}/scripts
+	fi
+
+	if [ -d scripts/gcc-plugins ]; then
+		mkdir -p ${kerneldir}/scripts
+		cp -r scripts/gcc-plugins ${kerneldir}/scripts
+	fi
+
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.25.1


