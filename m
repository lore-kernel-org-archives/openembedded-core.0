Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF9DC4706C
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.42664.1703124572396345883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T5c5UaHk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28ad7a26f4aso275336a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124571; x=1703729371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BIo0Q0tZ+kpNzOJKd3Xc7nojkiUBHVj0OqKM7cLcoE=;
        b=T5c5UaHkfs/4Nl37sDGLBTK16lxXydiZiW/OoKcu3aDGwTrpugFAh1A5Rnxdy5DYrT
         Ewhy2PDNGnJHv1RbUpsHrjwBKUZL3Xv7nxWtYodIcQXaldp4W2j9mvQjnyD+2j/FQp0N
         +RxQE5WJRmHuQbr+VQ9ZjA+NiFv0j8Z2U82Ezih/VJmfAnPZ6lhzUTGyAtnFKLDZ3ztA
         Jj0UtfMnhZPmFRm3nFdtP3BlDy4frCu9pZR+jmNbkbTkNf6mpJVvyCMk93C+24AGTM6p
         VdIe8zlE6wpfs8vr+8opkuGjAbCDbJ5YcgjhPclPH3MlweOARS62l16CHGDaLb4wSteR
         ktgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124571; x=1703729371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BIo0Q0tZ+kpNzOJKd3Xc7nojkiUBHVj0OqKM7cLcoE=;
        b=MtMn5lQUN0SDOmTrjKbjdGgTi5s4bRR2dyK4mnz67sj0GQ7BwCfzpkpIukUSWt36ew
         hz4LaZEUMGzmRxxbafrXpis3Fo9/TVh1CQmPcYiU/yC5CIqeDNU8ruYGwnPSFny5d9H+
         mAwbdNDSZXy5w2nbwUfOjeEgwWjmtWfUjxxRK4XCww565gtBLcQFYriPf90b9jWIZzOo
         kQGO2brXU/hcmngByb8jFbutldTRL+7T6kSeBkYZ4Yt3mTib8DsAn71q8cYp86BdyZ2p
         GiIbX5mgyyGz+ZmMCoegQTa/XCtOjVze1UaV0q7Bzaugdxr1W8Votk8jm4BVg01Q/O88
         cUbg==
X-Gm-Message-State: AOJu0YzRgAf2JKeyflR3KIAyz8XBgLDTCzR3IKTbZt30Uw8HZj8jamOk
	g/VCsjzVIPhEoo8gsmmm81OluFghhuM+EvWy+9AFVw==
X-Google-Smtp-Source: AGHT+IEgq0/ODsbvUxuoO9V0OfrYKOXne0U3V7GEwxttaN+IwiaEkaSKMjDClVadmUzJnh+9jLEHMQ==
X-Received: by 2002:a17:90a:744f:b0:28b:d124:34 with SMTP id o15-20020a17090a744f00b0028bd1240034mr1880916pjk.45.1703124571129;
        Wed, 20 Dec 2023 18:09:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/11] perl: update 5.34.1 -> 5.34.3
Date: Wed, 20 Dec 2023 16:09:08 -1000
Message-Id: <d1bc5fb1d090cf93b9014a050b418499c0209080.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192820

From: Soumya Sambu <soumya.sambu@windriver.com>

This includes security fix for CVE-2023-47038

Changes:
https://metacpan.org/release/PEVANS/perl-5.34.3/changes

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Makefile-check-the-file-if-patched-or-not.patch      | 4 ++--
 .../perl-cross/{perlcross_1.3.7.bb => perlcross_1.5.2.bb}     | 2 +-
 meta/recipes-devtools/perl/{perl_5.34.1.bb => perl_5.34.3.bb} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.3.7.bb => perlcross_1.5.2.bb} (92%)
 rename meta/recipes-devtools/perl/{perl_5.34.1.bb => perl_5.34.3.bb} (99%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
index 8c8f3b717c..0ef9b27439 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -21,8 +21,8 @@ index f4a26f5..7bc748e 100644
  # Original versions are not saved anymore; patch generally takes care of this,
  # and if that fails, reaching for the source tarball is the safest option.
  $(CROSSPATCHED): %.applied: %.patch
--	patch -p1 -i $< && touch $@
-+	test ! -f $@ && (patch -p1 -i $< && touch $@) || echo "$@ exist"
+-	$(cpatch) -p1 -i $< && touch $@
++	test ! -f $@ && ($(cpatch) -p1 -i $< && touch $@) || echo "$@ exist"
  
  # ---[ common ]-----------------------------------------------------------------
  
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
index 99a9ca1027..ac4dff33bb 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
            "
 UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335"
+SRC_URI[perl-cross.sha256sum] = "584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.34.1.bb
rename to meta/recipes-devtools/perl/perl_5.34.3.bb
index db306d0be3..e8b518adc9 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "357951a491b0ba1ce3611263922feec78ccd581dddc24a446b033e25acf242a1"
+SRC_URI[perl.sha256sum] = "5b12f62863332b2a5f54102af9cdf8c010877e4bf3294911edbd594b2a1e8ede"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.34.1


