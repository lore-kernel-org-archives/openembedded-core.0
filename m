Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397ABD3F095
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 16:38:52 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1826.1769618329689115436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 08:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cx6xA/LC;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-503312a8333so2880441cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 08:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769618329; x=1770223129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGLUYjrZU1ePwwTJTCBJDRijvXlOhDybR4wwbCXz0vA=;
        b=cx6xA/LCIfmuJOAo1HgXbKXKgK3yGPKvx29LfhDAB9H/AiA9wsz0wieh8TCG59BPZc
         UvkSh9bCuvfSA91VxblibXqAM1izBFUHW8Tj3l/eqM5dEuoE44f7EGrsgqD6gWICTsYb
         sqmJ9pmYLORGN+XurxylH/KwXEq1yUsis11OItd5/UBHxBqsJ+qRgphzp/PK8ajCeY9D
         6DSW/qBX8xKtGgG8ngiKPTZCrhDRWBP51vVb0b6SeJJTbce2mvKarzd1+9vxnKulc54m
         Dd5Am9/mDYUOpDCO1fYLP5cQUc0eIRcopseY3gX9zENz+FwdF9J8jwWo5Zi+XLWlTJo0
         x8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769618329; x=1770223129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGLUYjrZU1ePwwTJTCBJDRijvXlOhDybR4wwbCXz0vA=;
        b=N1U17zD7rdb2AHh2DF8eisg6v8FhSy9KdXb17xQwoAMGT4Oqj0uSthvb5frA/gYJ0S
         xdXvlRgi4DKkp2CsTkqB3UMefF7cGbQn8XFIYlOQYJdzdoRQl4OqtDtKhCS4BkzXTDM4
         ++r67is7N7oQFrRnGKDm0mEnlVlaOAH2ztp4HkRoH9gOQSIB/Vo6kUzf4DgVy9WWqbgU
         D6TqmX7UXHBcPXo57mmIggwjzFfQ0HZex6HEQEEWvFs5ukDfFPSEBtoxq28XjTdpPEos
         azA3aZf95rcuMoDLkumwzykZfGhqAbgXezuyBUQ487yOiFeHQZjhCPbJDU3idAn/5y3t
         pPiw==
X-Gm-Message-State: AOJu0YxjHXlnwETcG+KDT6XoxsppK7nFmY98VUXp2xsC0RJJsBdh0TZx
	xUn50PNmepLT11D7zRpbAX2jQpO29dYz1xTVkiMvfel+vhkwfq/jddYCZuBnp+MC
X-Gm-Gg: AZuq6aIazca22v2UX58vnWXxPEu9Fhve3RRJnGqCLqibJr6JfnXI0XVco9Gft+2td8C
	zWVcLOoL2KoQsw07fPxdh9HXmyzrbS47nPtZzhqtM3s3cYzHYEZUe4sciW9hBHhaCcSPGSfXoil
	ISeVHBzfkuKPzO0SS1nE7BR20Z21HuucNb3ZA0u9Ogv5p2SHMlNacL4W95yXwqU+MytST32K+9C
	Ssfa1KXpUtb2LxDIyqiyjhTl5TEA/Zx9K6HVsT413C7d2+g3+sfFxii5ZixW0sUpi/aw+xD+AeU
	BnTjj5qIBzpJKhKQMt0MPl5CuzqVyQF9qo9bVO8jgZRmH61vbPRRGtdwm19M24lKuECBYWG1eXq
	o1EJrGv+GW9rqF49cBLkiSngRJ/jfa8vG+A1cmR0zlH761CTIpw9vTnYmkEtMPpdfNbeh8G8l7x
	jcj4Ml3F/M/ngePuaq/C+9K8iEKOGa97eGjIbrUV8u4AsCHsrUPSU/qbA=
X-Received: by 2002:a05:622a:180c:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-50341af36eemr9005101cf.6.1769618328379;
        Wed, 28 Jan 2026 08:38:48 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337ba4457sm20118311cf.20.2026.01.28.08.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:38:48 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v5 1/2] vulns: add a new recipe
Date: Wed, 28 Jan 2026 11:38:26 -0500
Message-ID: <20260128163827.386933-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128163827.386933-1-valentin.boudevin@gmail.com>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260128163827.386933-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 16:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230102

This recipe is in charge of cloning and setting the Linux repository:
https://git.kernel.org/pub/scm/linux/security/vulns.git/

The variable VULNS_USE_AUTOREV can be used to use AUTOREV to use the
The latest available commit on the remote repository and stay
up-to-date with the latest information available.

AUTOREV would make the build non-deterministic, turned off by default.

Signed-off-by: ValentinBoudevin <valentin.boudevin@gmail.com>
---
 .../vulns-native/vulns-native_git.bb          | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-kernel/vulns-native/vulns-native_git.bb

diff --git a/meta/recipes-kernel/vulns-native/vulns-native_git.bb b/meta/recipes-kernel/vulns-native/vulns-native_git.bb
new file mode 100644
index 0000000000..089382704f
--- /dev/null
+++ b/meta/recipes-kernel/vulns-native/vulns-native_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Linux Security Vulns Repo"
+DESCRIPTION = "Repo for tracking and maintaining the CVE identifiers reserved and assigned to \
+the Linux kernel project."
+HOMEPAGE = "https://git.kernel.org/pub/scm/linux/security/vulns.git/"
+LICENSE = "cve-tou"
+LIC_FILES_CHKSUM = "file://LICENSES/cve-tou.txt;md5=0d1f8ff7666c210e0b0404fd9d7e6703"
+
+inherit native allarch
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/security/vulns.git;branch=master;protocol=https"
+VULNS_USE_AUTOREV ?= "0"
+VULNS_DEFAULT_SRCREV ?= "2c9b20d7a0699222b58c4824560b716b6096637b"
+
+python __anonymous () {
+    if d.getVar("VULNS_USE_AUTOREV") == "1":
+        d.setVar("SRCREV", d.getVar("AUTOREV"))
+    else:
+        d.setVar("SRCREV", d.getVar("VULNS_DEFAULT_SRCREV"))
+}
+
+do_install(){
+	install -d ${D}${datadir}/vulns-native
+	cp -r ${UNPACKDIR}/vulns-git/* ${D}${datadir}/vulns-native/
+}

