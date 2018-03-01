Return-Path: <matt@madison.systems>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB6478916
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:09 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id q27so2965574pgn.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pdBLBmzuZkE7M8nTg3LTdg5aeKHasLfYCvgbnn02NVc=;
	b=DhR4Nm9QUtNGjuYNBsEY6l6GDr91D7FzbME5VXU+UjGtsyhc7s0EHzkCmchRwjRr6i
	hZiPMOMD8XP1U9lrghCyDRJiPP7BcWuRbT69ApbSWXFLhutw91nwk3AUon4XkRp82yxE
	0qM3Xm//R70Cz+exkgzNjG06LLfrvKc9id6EJO9aUO+FDsk25vNPOuNiINN5gQkvDndF
	k2pIzNadW0DqMR/uQqZnNKUHIFy0SXg82K0ksHBq8NsQqz5+RedsqUkMNWAC+HdGPEUA
	AfYTvNaSpL25ix89xBj2aEPIYoM29jZ5Zel59wyPrCqdPRnPk03eqv6TaWrwqb2CWjJ1
	tALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pdBLBmzuZkE7M8nTg3LTdg5aeKHasLfYCvgbnn02NVc=;
	b=Vol6A+KOJ0vXxUEjSyIgn2SzGZ7aWB4/RpJodvExLdw6e8OPuHfZLtNVrJpK59DrFf
	h04UT8NYLzSEpd7WnyVzz47uUPIuCH4ehJTqkf3cvCh8F4ck8eTOm3NY573Xqpb6Ttc3
	AIzAvB1uEHNjWAUr4JNrJh7MHmpn/HzyyhT3irIWLEB52kFmIoHtNxuMib1N/JwZLojt
	xQfmf5I9x+mWT5KhdaLiew2vAKCkC9ngJ5bQN+ZDiuYeQohm+ddjV7OhctpU7b21dFTa
	6bFFXXWzXH8DYpcgj+4WDn+Ba5Bi5V56+3RmH2XqBDKeIAbtNjxb4w6Fk3poxAb8xiPR
	jlng==
X-Gm-Message-State: APf1xPAS29t8dKjnkJ37VgSqopFP78xy8hL8Hfo8EPYU9ZkZWJx0u05H
	+MJ0QX2a31EvlCk9q7iIgq/iSApt
X-Google-Smtp-Source: AG47ELsJe1tiPfhJKfjFroE/YIyKf27UQvpFkq5DEDo4V15HF+LZ86ZGKwYtX9f+qnWgWbMB38lfGg==
X-Received: by 10.98.61.73 with SMTP id k70mr3660490pfa.10.1519946230264;
	Thu, 01 Mar 2018 15:17:10 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:09 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:46 -0800
Message-Id: <20180301231654.24018-6-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 05/13] go.bbclass: don't stage test data with sources
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:09 -0000

Any directory in a Go package's source tree called
'testdata' contains test data, and isn't necessary
for building.

Some packages include ELF files and other binaries
as test data, and staging them in the sysroot and
-dev package leads to unnecessary QA warnings.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a20d2dc0a7..cd3d9d5bfb 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -108,7 +108,7 @@ do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' . | \
+	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
 	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-- 
2.14.1


