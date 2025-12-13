Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BEAD5AE4E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2869.1765620016541766889
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LdxrgYnO;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f30233d8aso14589165ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620016; x=1766224816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kc97khpMRAPpmhxUPYQDS9LcGZcaW37PWyvXiwFGH2c=;
        b=LdxrgYnOoDN8jQ/pqmM0i1MVN2ALJE9M3JaoGSxLgwJhV+Sjy7R35j7SMley3mYl22
         wQHWy4Wkc4E9Bc5KiPBR/Ud39RKE/7xA/WsOgNGQ6811IPl2CAZGDETLRcRMPDdHx/tf
         6Z3I1H5c3RBmSV+PwRjbOXZAsxmzSd/iSmI5CMw2XkLXLb5Rp3q0F8S2+8wcRKl4xran
         iXoo4iDnr9aIhqxr3klLH003ejrkWxpmG5myEhM/PQ4SGsPj53/Ngop+wphAGpmZygrr
         hSVoL9AfUXJgaQib2wXkmvCFxFRAO5HVwQHr2JfNgCLRwc3njMD9iDER1H1dO0JugpCS
         ov4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620016; x=1766224816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kc97khpMRAPpmhxUPYQDS9LcGZcaW37PWyvXiwFGH2c=;
        b=sdmnUnfr0H9x+E7SEKe/bBo/n4xJ0F2lTbpTNcbCLnWPWf+TcR5XzG4tlDkve4R7n7
         0XGvmAXnzgmodG6ati0owYMb/Zfol8F9jpKet6dfW9DI9T2hZ3CzYmt5baOAjwLvlVty
         s6Wt+tGXtdTlxZ2CM0Q9fckk22O5Cs6qtGrriOFL/wA8MiZ1mRbLySPXrhA2WLrSq5zb
         bkwsG2uo5eeI4LTPGkMWkPQlh8vOpRJqdbucymJlPzgro4j0dv55PhBLMH6QgcMec/a3
         YXyBRpscztSZ0Y/3A4GRUGGLwePh86u/6+CohF8w0neSwI558Te+pfohal3aflWG1rOs
         EobQ==
X-Gm-Message-State: AOJu0YziXZkrVrFrJooTsiSmzQst08XMyZpQwcjQ2yp6xvYnIrekuO57
	7vZpCedZf2rQPDV9T0VltSj4Jqf+U+pEumm3y7K0UGOFfGC5nOo+qzE8ylfU7STK
X-Gm-Gg: AY/fxX4KNytBnHAbv76o6cylF95gTsEcZdhIdeX2aMvgxulxA+weEd/Vt4FM0ZN5zhc
	cVewOk/OvNws+9bpQV3XkbsXHKA9S9eFnGYLNQM/UVthJpOUULfkaJbSvabSxx6qiIO1fBUZ2Az
	9KbNBvkZCZxqzr84fg9OhQ71Ia0vGfZNWNFQjnF3yJK1q+cBoTaoQceI+H66h0/wLSwxvUJAv4I
	IsrRgElEOKnY1ueWt/vtr8j4ymDarFc7E+M4Zxeyen/knQWc7Ldhd05bsdioP1Oz23KSCJZa6uE
	eph9tVyYPXt+EagN2aTH6eO5A297bTxY1cZAH5c5Cvdi5G4dxuE2aTxutYf6us7fvgdmBuSAfRq
	ls1Ktj/7Q3ZdDrZtwvTq/eDkfk1pm3JxInSQalDlTlGcfAb2Deb5AZjmgotBNbfBvqrYUOcMcOi
	m17+yKnj38PFj+HaXQCXvY+lMw
X-Google-Smtp-Source: AGHT+IHg6nReja9ORJbYmUq8xxoDwJQDrMrrJAB8hWGuK6FW1URqb8PR7dmwbzdEnhuwk8na1k7bBw==
X-Received: by 2002:a17:902:fc86:b0:29f:2438:2df2 with SMTP id d9443c01a7336-29f24384698mr69209955ad.54.1765620015728;
        Sat, 13 Dec 2025 02:00:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 14/67] python3-pygobject: Use SRC_URI from gnomebase
Date: Sat, 13 Dec 2025 15:28:38 +0530
Message-ID: <20251213095931.2571498-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227632

From: Jörg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 7d658e0c4df1399c3c88239ab019a3428b01028f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.52.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
index 42b071ca08..ae81f1e31f 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
@@ -16,12 +16,12 @@ python() {
 
 DEPENDS += "python3 glib-2.0"
 
-SRCNAME = "pygobject"
+GNOME_COMPRESS_TYPE = "gz"
+GNOMEBN = "pygobject"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82"
+SRC_URI[archive.sha256sum] = "00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82"
 
-S = "${UNPACKDIR}/${SRCNAME}-${PV}"
+S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
 

