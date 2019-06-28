Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id DBC777EAEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 13:25:09 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id s15so8963251wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MX4yjk0XIXKYvoDZzSbRVTAc9uDUSz68I0xebAIJ/Bs=;
	b=NIvQGX58gy+V2nN6EHxXtDQdC+VDxNQnofrR6kPv+6benZsHC9TNaqogTIgmfEzfwB
	cb3W8sIAMN6UeIwPK2QctPrkBAMJpM1ejLelAO2lcoUZ+HWhoTGwnVkGPgdy0OPw1m3C
	dpHgDNwCgaLPKFOiG4HSBh9/U4vk1ZIOipc+rag2wGbUfbbGoQpINo9I6upwakGXzuZs
	Qkwejh4yU4bLwdqPDFIjeXwGYX7c6zrzYjSRmSwuHWimmyimXM8UiSHswfitwiMxYCwL
	7B4wBhIn0HWCmUPkZSgvgK02CZmLeZTQn/0TilE7DbM7rHROwhiv533ce9MCZCIz1W4m
	LQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MX4yjk0XIXKYvoDZzSbRVTAc9uDUSz68I0xebAIJ/Bs=;
	b=jPLFDIAUREzkeLonc27eYQRu8ipja6DSeG02b+xfeW8F8HNES+k0zmQqCN8gFdBmqv
	V06fyyuV8bQO6abvzu4BpGtpR6Zpz4BQOhUSOOlt3Qfci59Qbyqugr5sMqDk107wnxTN
	TLrj7al6yj2WIseq0H95yoIMRKDAxq7JvGXkyr/Go4Cl1JRh9uHFl4JFEjK2jJV14hJF
	LQKNt0RFa1nJ32UY50WLHt0DS8kPrOIJMuDmj3uMtYFNjl2NFRXeQiUMOKSmsjjk5Wap
	KltBtj0CjQSwCLaEhhFIQxxKiV3UVZKMzqRHHe4BQND+nV81jhzhS/E9MlnTtgwQqon2
	CxDg==
X-Gm-Message-State: APjAAAW143HE+bnUnbxq54zgb1NZ6OTS9bkuz1/8RMXs7QdIuInEUTT0
	mRlrdkPJQgB4naQWLfynQ131SJCN
X-Google-Smtp-Source: APXvYqyxvryPNhUcE6VfJ4QKW5wBNV5wEKkx9HBYpoKiogaMc8PDXFVVZoKTyXcA9858p78uDyEmIQ==
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr7667338wmc.89.1561728310600; 
	Fri, 28 Jun 2019 06:25:10 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id z6sm2158338wrw.2.2019.06.28.06.25.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jun 2019 06:25:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2019 15:24:56 +0200
Message-Id: <20190628132457.39465-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628132457.39465-1-alex.kanavin@gmail.com>
References: <20190628132457.39465-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/6] meson.bbclass: do not pass native compiler/linker flags via command line
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
X-List-Received-Date: Fri, 28 Jun 2019 13:25:10 -0000

With 0.51.0 version these command line options override what is in the cross file (e.g.
the cross-flags). I could not determine what is the scenario when the native flags are
needed (this would be building a native binary in the context of cross build).
If we find such a scenario we would need to find a way to pass native flags
through some other channel.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/meson.bbclass | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0edbfc1815a..ca768fdab90 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -24,11 +24,7 @@ MESONOPTS = " --prefix ${prefix} \
               --infodir ${@noprefix('infodir', d)} \
               --sysconfdir ${sysconfdir} \
               --localstatedir ${localstatedir} \
-              --sharedstatedir ${sharedstatedir} \
-              -Dc_args='${BUILD_CPPFLAGS} ${BUILD_CFLAGS}' \
-              -Dc_link_args='${BUILD_LDFLAGS}' \
-              -Dcpp_args='${BUILD_CPPFLAGS} ${BUILD_CXXFLAGS}' \
-              -Dcpp_link_args='${BUILD_LDFLAGS}'"
+              --sharedstatedir ${sharedstatedir} "
 
 MESON_TOOLCHAIN_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
-- 
2.17.1


