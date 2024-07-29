Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FA4C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 15:08:09 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.58613.1722265684365063689
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 08:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=yf4FtpdC;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.210.47, mailfrom: troth@openavr.org)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-709340bd54dso1579200a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1722265683; x=1722870483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d5R4ws0t6yLI61wc12myjnfoDF5vdj+02mafrdlLXx8=;
        b=yf4FtpdCQ/UhL9cTA39F9fLygvOK6ZrBJeTGQYotoDLYzHrm/FCsjrS92d42fLQJVI
         AgjpexfVxqLljjLBG6a8HI5WiyYPsDnMmZydKaIMS9uX2rsSSACeYBIj4aUyo7g4KkQV
         A+7SVSH+MIzmGhWx6wSx13X6Xm6gDigYOB1cpIbqGMyhOq4a5aBfUENE+SLdbjLZ3mUK
         Gl1mHX7mR22TGI2DydvJ4HF1DTR/VFaqHw1tJ1A/zj54JQRz4YqP+WmPDzDfcfMSdZK2
         gdlRrRqFg5nQdUrO7L+rDhguxAdU7eh/UQZvlg3NNI4pbD4YnL12JQFl0CBVVXsvfU3O
         DNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265683; x=1722870483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5R4ws0t6yLI61wc12myjnfoDF5vdj+02mafrdlLXx8=;
        b=TZc08zwZLOL9QL+vG4MWct9sbxN5LtTIXRB/JpKaeH/6KehsCvyZ42BAszmPjhpzKz
         pVGxvHYr9dT+vr3wwma6iYMt+0/jvTN+IFRUcgaCg3KdwnOFls9H50BMze9pzUmUZChH
         M0Np8gCnvRdbOVGU38ddLgNEKNMnNOaIzXM4P9eiR2SBjfIKzjNA3gkoFKCRFvMw/i1l
         y7wbqeNKTxV9iVgMe1KTDQUy6/0x81Th2yuyTNfl1OHC+R+jpRKp9sRU6SqOHTSmTdXM
         7qoVbx29nbfm9PALI/Fm2wvfnhj/cSjw+JFuQrGR9fLJINYyrG+3mkJQeSu/8s9ltQCy
         vs8w==
X-Gm-Message-State: AOJu0YwUwTV4BQlcHoB+xf324nox1Bp7+4BrkuTi6A3J0s+m1He1yjj1
	iLHfbvACxxjVRiibHXWo1M+iOE5K0zkONB626jVneYMIdRyihNAjEju15bQJ8veF59uMhH6sMmd
	Kda4=
X-Google-Smtp-Source: AGHT+IHMiQqIGKhXBhY3eEM3dURIWlgluphDGcLPDH6N+/qaMOJ8ItABNNCANFF3APGnc+LkCMkHSA==
X-Received: by 2002:a05:6830:19d5:b0:706:6b2e:2cc2 with SMTP id 46e09a7af769-70940c615damr3699408a34.11.1722265682828;
        Mon, 29 Jul 2024 08:08:02 -0700 (PDT)
Received: from tas-troth.am.trimblecorp.net ([155.63.136.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d5b346d3f1sm1189758eaf.9.2024.07.29.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:08:02 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Theodore A. Roth via lists.openembedded.org" <troth=openavr.org@lists.openembedded.org>,
	"Theodore A . Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [PATCH v2] ca-certificates: Add comment for provenance of SRCREV
Date: Mon, 29 Jul 2024 09:07:50 -0600
Message-Id: <20240729150750.12365-1-troth@openavr.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 15:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202655

From: "Theodore A. Roth via lists.openembedded.org" <troth=openavr.org@lists.openembedded.org>

Provide references for how the SRCREV was arrived at for the 20240203
release.

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
---

V2: Add git commit message body

 .../ca-certificates/ca-certificates_20240203.bb            | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index b198ea77a9..ac0756471c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
@@ -14,6 +14,13 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
+# Since there is no TAG in the git repository, the SRCREV was determined
+# through comparison of the git repository and the data on the following
+# package informatin pages:
+#
+# * https://packages.debian.org/trixie/ca-certificates
+# * https://packages.ubuntu.com/noble/ca-certificates
+#
 SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
-- 
2.34.1


