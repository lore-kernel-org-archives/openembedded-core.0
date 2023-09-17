Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81112CD13D2
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.27145.1694943558344170913
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZmGl9hAN;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso55972741fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943556; x=1695548356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LcZ6gzsU4nuW6mOt6U4QXSnGMbJW1B2D6B194/cD00=;
        b=ZmGl9hANijhtv+cy5faSjFUwusMSh1fxZK2+OMbIHrWlnDkUaICrbVd6a5P1TyL8f9
         /Lf7OyuEQehffPjY/enmxGDZU+Q3VDlOUpxH4OtZMrXJFuHqyrIKAMiOe+U4KDGNj10i
         Wlmv4SzqNfUtNI//ZL8ShkbxygKQQlhuUkJze2ruVwhzY0jbkV81CiduVz5RmzwyNoN3
         xhPNGu33KnoHbyTcOjuT0xMYe4nU1cGUFWm8oMRGO3qmNn9kxiz8Utw4hLaWEmpiIAMe
         gvVE1tbS6paLPeFWaQZqToelcAaR2RSjACdc6mPzqD1AWRVbI9uIqw3GcU0ZYSbO5GBm
         ok3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943556; x=1695548356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LcZ6gzsU4nuW6mOt6U4QXSnGMbJW1B2D6B194/cD00=;
        b=DmS1cOxRNU2GYM85y4q9Gu49pJzgmyyz8UHh5Hnzkrt/WNHY1LOKA+F13+kaJmEG5z
         xtQBknE9APTVp13ZYROgjk7UCEgDkNXWZK/TJsWTgP5tbE4p8oOx+v0BKRdJ5Ej9gFY6
         X9dQNXiIHhylaBzDa5RJk3SY95i7y8z4zCXtUr1OnfyaffJ1H9JidXp55uc0x6t/gkfD
         FJlrn4A9XXC3p04CZy7IcNbiCS+j36uAqsi5I5ZRNMlcqcjGX1WEfVQ1BP+zjt7UROoL
         st3pcUWtlvFr7AVpAe5grUotiqClJlsImTWhmrJosHJBw3P3IN0m6P+EuCX0it4Eftqe
         MP2w==
X-Gm-Message-State: AOJu0YzhxBtukI5jDL6Yt7CvrlPUNNi5ZlBOPNSCfk1VMQWu0yUg4m3d
	76s1DvpWRN+Z0bem32bpQgxmqKwf8dw=
X-Google-Smtp-Source: AGHT+IGOKwd1MdNgthGDbKn8VhU2xvNk881tpT8hGOS3f2oe0prGdeuuTeFeYp2ZkzlusHKCWPiF4g==
X-Received: by 2002:a2e:8055:0:b0:2bd:1d02:5026 with SMTP id p21-20020a2e8055000000b002bd1d025026mr5854849ljg.15.1694943556355;
        Sun, 17 Sep 2023 02:39:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/29] liburi-perl: update 5.17 -> 5.21
Date: Sun, 17 Sep 2023 11:38:51 +0200
Message-Id: <20230917093901.428214-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187792

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Skip-TODO-test-cases-that-fail.patch        | 12 ++++++------
 .../{liburi-perl_5.17.bb => liburi-perl_5.21.bb}     |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.17.bb => liburi-perl_5.21.bb} (89%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index 68ccd061202..ed1f25125f9 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 858daa5047b00e7d5aa795302a9fad5504c8f0b9 Mon Sep 17 00:00:00 2001
+From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Thu, 17 Nov 2022 16:33:20 -0800
 Subject: [PATCH] Skip TODO test cases that fail
@@ -47,19 +47,19 @@ index c6ce79c..5e62ad5 100644
  {
      my $str = "http://foo/\xE9";
 diff --git a/t/iri.t b/t/iri.t
-index 2eb64b2..9c663c9 100644
+index cf983d6..884b36e 100644
 --- a/t/iri.t
 +++ b/t/iri.t
 @@ -6,7 +6,7 @@ use Test::More;
  use Config qw( %Config );
  
  if (defined $Config{useperlio}) {
--    plan tests=>26;
-+    plan tests=>24;
+-    plan tests=>30;
++    plan tests=>28;
  } else {
-     plan skip_all=>'this perl doesn\'t support PerlIO layers';
+     plan skip_all=>"this perl doesn't support PerlIO layers";
  }
-@@ -60,17 +60,17 @@ is $u->as_iri, "http://➡.ws/";
+@@ -67,17 +67,17 @@ is $u->as_iri, "http://➡.ws/";
  # draft-duerst-iri-bis.txt examples (section 3.7.1):
  is(URI->new("http://www.example.org/D%C3%BCrst")->as_iri, "http://www.example.org/D\xFCrst");
  is(URI->new("http://www.example.org/D%FCrst")->as_iri, "http://www.example.org/D%FCrst");
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.17.bb b/meta/recipes-devtools/perl/liburi-perl_5.21.bb
similarity index 89%
rename from meta/recipes-devtools/perl/liburi-perl_5.17.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.21.bb
index 5e15004dd0f..0356469d986 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.17.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.21.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "https://metacpan.org/dist/URI"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d8ca5f628bf2cd180bc4fa044cb8ef41"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9944b87af51186f848ae558344aded9f"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "5f7e42b769cb27499113cfae4b786c37d49e7c7d32dbb469602cd808308568f8"
+SRC_URI[sha256sum] = "96265860cd61bde16e8415dcfbf108056de162caa0ac37f81eb695c9d2e0ab77"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.30.2


