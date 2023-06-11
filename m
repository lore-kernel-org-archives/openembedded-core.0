Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF38C7EE45
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:03:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.39002.1686499380938428005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EklMLL2A;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b3be6c0b4cso3187115ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499380; x=1689091380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/nF5UF6oZDBU28Se3zPIqziQyVRwdgKGl/vO8ZI1lc=;
        b=EklMLL2ADfGdX8zUMNjZygflJe76eYg1nvbn3IUrToHoC3LU1LvvhamTbWlVqqsqZL
         m00kAHT4hi2OIy0alAAJHqvKwCWLL4BwBzWOqKlGvTGFmN3BmdrZG9RAbLUKJVjWRFle
         E/2FV9MF0cO8Kxzi5jnQhvYJJclhmhdMbcz6c6S78PaWs4hqBPqarZYs5PW+oPg5nQ4O
         gU9fwt5dkWRurBQ29dvdXxCkndjtMhhW/gl4LA3jaCBmuWtio/eCLwLWw1v/juLguMvi
         DORXq5qPMxCQ9UgWlxQIsukti+LF44OovX5Ux5wda/55NLAzdAlBhIRwrHErNexNFkOu
         a5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499380; x=1689091380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/nF5UF6oZDBU28Se3zPIqziQyVRwdgKGl/vO8ZI1lc=;
        b=hMdQ5rUwUNS6TlfC8LDpwAhzYQD8y6H4SuuPONPIircjqkSIsb9qZoY6375SQXnp/X
         3LMHDJ09awdEKDz3q4xd9ZUUXvav8doWD+GhvzGeiXBJlrLNtyc+a5w9AnQlavLeaDvQ
         ZncyGATRIky8/zgElDMI9l1c/aIh7cZQ57HG+7OcZPIUOAvrDjeYVVFgpmnH6qsK3Nfa
         ARUVh4LrT7WkE74iT4lLiA8oHiYQw7BBkZ8+0alQjFYyPcdm9YUkDr96LOD+W7FVnQrQ
         6fRPk4ZW23HhG1gxkPphErBMDA11yNFMFRR586VV4oXcAhBIaRhfi7rWr0O909uP25Q9
         N08A==
X-Gm-Message-State: AC+VfDxzHWjWOCZ0jsz0TwdRPP+Kj4+RZDqwPgVGHshqxMRRydRVY/A+
	/JadX3UOSlF5pRF2R+bbDyoxLb9GfpYaDsYCUEM=
X-Google-Smtp-Source: ACHHUZ5SCDCx9v9TeLUhGn9cHB2s2O1J6buPCxB6Loe0pb13ZlMJVexRXFDRxfvlk6CACkieWbO5oQ==
X-Received: by 2002:a17:90a:1a51:b0:25b:d5ab:7198 with SMTP id 17-20020a17090a1a5100b0025bd5ab7198mr1619175pjl.27.1686499380000;
        Sun, 11 Jun 2023 09:03:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.02.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:02:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/11] perl: fix CVE-2023-31484
Date: Sun, 11 Jun 2023 06:02:37 -1000
Message-Id: <b093db144b35e7c140ac830dbe67cabfaac69f73.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182626

From: Soumya <soumya.sambu@windriver.com>

CPAN.pm before 2.35 does not verify TLS certificates when downloading
distributions over HTTPS.

Signed-off-by: Soumya <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../perl/files/CVE-2023-31484.patch           | 29 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
new file mode 100644
index 0000000000..1f7cbd0da1
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
@@ -0,0 +1,29 @@
+From a625ec2cc3a0b6116c1f8b831d3480deb621c245 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <git@stig.io>
+Date: Tue, 28 Feb 2023 11:54:06 +0100
+Subject: [PATCH] Add verify_SSL=>1 to HTTP::Tiny to verify https server
+ identity
+
+Upstream-Status: Backport [https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c85289a7f0]
+
+CVE: CVE-2023-31484
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/CPAN/lib/CPAN/HTTP/Client.pm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cpan/CPAN/lib/CPAN/HTTP/Client.pm b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+index 4fc792c..a616fee 100644
+--- a/cpan/CPAN/lib/CPAN/HTTP/Client.pm
++++ b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+@@ -32,6 +32,7 @@ sub mirror {
+
+     my $want_proxy = $self->_want_proxy($uri);
+     my $http = HTTP::Tiny->new(
++        verify_SSL => 1,
+         $want_proxy ? (proxy => $self->{proxy}) : ()
+     );
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
index 42bcb8b1bc..e0ee006e50 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://0001-Fix-build-with-gcc-12.patch \
+           file://CVE-2023-31484.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.34.1


