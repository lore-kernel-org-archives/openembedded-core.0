Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.3914.1603919195492092146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jjt2xNG+;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id 7so943238ejm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YvEsDKqVAVuzEcArsTDBJr5K5L7i30kLb2DMI1z+nkE=;
        b=jjt2xNG+nc6q5TNnOBZDe9/2rbmiJ1PKIHsfeoMIw1rlnU2+JEqEc78+xtiRjb7vM8
         TKE5TzzmWLDjzn6f/KOERSruyYDuL5HS74vxpP1kGcDY5JfrM306K/n0q2EgBWd7zQM4
         cIYE3wU14H+kASuT1Z2Xa2Ep9To0xfxXDNlA+Xik9qbZu2QYeURtmH+uTO5/mP6jYcat
         121xEP69kWyy03t53R5Y8ofqwe8dpby90A1AGE4Iw/A1h0ZjCytdCUlRadEo1442rFiX
         dlrrUbidXu+9dmUonlrGxpAFlGnE9EOGoyvaXSob9Sfllt+U08blrvfqBB5PjnFjmKME
         6KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YvEsDKqVAVuzEcArsTDBJr5K5L7i30kLb2DMI1z+nkE=;
        b=WIuopMPuzmA+Zh26pkQTsvxyQvVD8MZMJQlarKOKKvxoCJV15q3riNVlFzeThLywzI
         0AJust2oKgoSHzIU0+4X3w6TPQ0g+v1e2bd81tL8/EBay18ltI0z9dD6w1yoXApGZuqS
         Ei3+lsW44SgyCSVGtzDavu/XyycYDi4PMBudd0mn6uxvexPgfF6HRv4mrb3ntEHUk25k
         Xozz6QBRWiT5pghcX83ZKnLqHlmr1fADGwi7256AGVnuWG+VB79SDAJcVQEOpUAlgu8b
         oIZwQfJ1Qj57d+3Nm282W/1Okuar4nRRHfh+lm59d8SjrL/ipvtUU1jKKSizxxMKAfWn
         FWfw==
X-Gm-Message-State: AOAM5339/JBvRjTm0gNoYDWydf93gywlFfuubTIfvKIAFMUXX/EQCpAR
	e4s4DZstYva5JMFSGVFllMO8Fv7v9GvX9A==
X-Google-Smtp-Source: ABdhPJzIrgS0fd9EG8nAsF32cANb1W0cJeUtoGgQmDOJ+3AjW+7ytQ/pcq3YLjiL2TUntvNHivP8nQ==
X-Received: by 2002:a17:906:4410:: with SMTP id x16mr941359ejo.307.1603919193739;
        Wed, 28 Oct 2020 14:06:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/33] opkg-utils: correct priority matching in update-alternatives
Date: Wed, 28 Oct 2020 22:05:56 +0100
Message-Id: <20201028210558.21070-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...lternatives-correctly-match-priority.patch | 28 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.3.bb            |  5 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-correctly-match-priority.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-correctly-match-priority.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-correctly-match-priority.patch
new file mode 100644
index 0000000000..556d4ce5f5
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-correctly-match-priority.patch
@@ -0,0 +1,28 @@
+From 26206005dacd61380663bb4fd9b18178bb33665b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sat, 24 Oct 2020 21:59:27 +0200
+Subject: [PATCH] update-alternatives: correctly match priority
+
+It should always be at the end of string, otherwise something
+like "/usr/bin/python3.9-config 123" will erroneously match
+against priority 9.
+
+Upstream-Status: Submitted
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ update-alternatives | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/update-alternatives b/update-alternatives
+index 1389b3f..e0b31bf 100644
+--- a/update-alternatives
++++ b/update-alternatives
+@@ -94,7 +94,7 @@ add_alt() {
+ 	local path="$2"
+ 	local priority="$3"
+ 	remove_alt $name $path
+-	if grep -qw "$priority" $ad/$name; then
++	if grep -qw "$priority"$ $ad/$name; then
+ 		echo "Warn: update-alternatives: $name has multiple providers with the same priority, please check $ad/$name for details"
+ 	fi
+ 	echo "$path $priority" >> $ad/$name
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
index f9df58a295..ce299d6b63 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \ 
-"
+SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
+           file://0001-update-alternatives-correctly-match-priority.patch \
+           "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
 SRC_URI[md5sum] = "7bbadb3c381f3ea935b21d3bb8cc4671"
-- 
2.29.0

