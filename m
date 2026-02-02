Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E186FE7FDD9
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 20:55:39 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1118.1770065738409047954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 12:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Difuw+oM;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c71214052eso62769485a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770065737; x=1770670537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCI5GhPrLRKGq3fSfAkkxA1vZbL51JYKCbfjFVxmMCM=;
        b=Difuw+oMwbKqPjgcS6f5+pZ4NEfsbQbCKDZ9XGysbg2KxQNiyAQYdSCW61QlYXt1y+
         cUZ7vU6oTHaB7dWGs/HdD2fOdA21nIVMTfWsh/jWk9EVMaS2PBn8sFeSmnWmTAveH+p1
         YmsHso2HhZYJfcI2xWitHeKllc86BACjB1yTl6VZLLy2iCQCq559sn8pKIbusY2Zdx9/
         B5S1xcAlQMaaF7qJunPIw+eW940q0tgyjIa5SuNbAxXVTcy2jdg/dPQWrlx14Z9Ysdoo
         KryvLV9rh/1oJMAZMJ2QbzTiZaJOmZaQWQoXovvaVOf5T6GbHXKzLFWTHnsuyhUWpM8L
         FMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065737; x=1770670537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pCI5GhPrLRKGq3fSfAkkxA1vZbL51JYKCbfjFVxmMCM=;
        b=oPCy1SsAO47ndKGGtYTAi/JwaksrJgM7PE0Koke8jNr2wz3IqvKokg3S4uHKl25B0V
         sY7tBcGwoSeByMZ+f96EBlESaPWXjn+w/vPsQvJUkMWr9bZvsVGNhuJogu+yCEFfYL0p
         2dse3DZvw70ntdSXf1pNU4iJbRZBqzujhpzdPt4W8wgD3b0cwI5rrklX+Q3cEizggTJG
         kTlQ+dJDN+0fVPL/9LN9JNnv62PhqoW4FjepPxqpUVceNLl9wYC9CVdrzZdl1fhkv0yJ
         SSi7rL6cKpfT6dAVBGbUqcveR9QWJTUf1d1wMw+tH9j1/zg5LgyDWoAo0NL0sQMZ9cZV
         c7uQ==
X-Gm-Message-State: AOJu0YzuKpeYqLqIboq+BKiTi0GtSKJ4N3sUnF0ye2F7M9ajUAg4Uij2
	hZqJB4cQKeAGMSJed1/lYMT/R6Q0F4UNLhuvtZlcPkYIXrSSwOZ0Q3bZuI3S1fb/XZQ=
X-Gm-Gg: AZuq6aKvSWKC2khs5yBHeq18pIxJM0Vqn7lRYlvSbowrtKiVpYsuhfwRQUUMbvGlDvn
	ls1p/UKHnjbL6MQe4pDi/pgUpi/HeOww+5tBzOGQ4zgq1IuT3yWh+u/GN7rXOSi31envpxO1PaW
	81oRPsJ4Q7ClTreyRdpoC4ZHZjq2s7sMx0y1t1PF3dFo6AXm/gK9lHxGLbij05lAJw0KwsfoxPk
	28T4WYYHeLxRk3M30yQUiV+GlMn9Rro1iWurySOQajX53eCHRklcSoNu1hAYoX0pA1yfkDrgLnq
	I3xtTLnc0QxFzGccpcTxL716droFIPcrDhxBo8UfvV6/D0krBHow2LAm4K7jQeALBOg7kX61Ut5
	V6vGLFWM2arEGeuC507c/fLNXa99J16TzA4bEW+w01W+u6tWX08EKGjZ947NDe2WqVu7WFIf5TM
	eOalAEBX0nNLPTCMWEfsF7KZT9J/BeL9n7YHZCLkVr9LjLQkC/jOdreh8=
X-Received: by 2002:a05:620a:1908:b0:8c7:17af:7ae with SMTP id af79cd13be357-8c9eb2f98acmr1222469885a.7.1770065737363;
        Mon, 02 Feb 2026 12:55:37 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d28c71sm1356221285a.33.2026.02.02.12.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:55:37 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v7 2/4] cvelistv5: add a new recipe
Date: Mon,  2 Feb 2026 15:52:28 -0500
Message-ID: <20260202205231.2134908-3-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202205231.2134908-1-valentin.boudevin@gmail.com>
References: <188B4BEFFC6C387A.3271208@lists.openembedded.org>
 <20260202205231.2134908-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 20:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230401

This recipe is in charge of cloning and setting the cvelistv5
repository: https://github.com/CVEProject/cvelistV5

If the build is online, it is recommanded to use SRCREV set to AUTOREV
to use the latest available commit on the remote repository and stay
up-to-date with the latest CVE information available.

AUTOREV would make the build non-deterministic which would break
offline, turned off by default.

Signed-off-by: ValentinBoudevin <valentin.boudevin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../cvelistv5-native/cvelistv5-native_git.bb  | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e830648945..550ef0e0e7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -139,6 +139,7 @@ RECIPE_MAINTAINER:pn-cryptodev-tests = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-curl = "Robert Joslyn <robert.joslyn@redrectangle.org>"
 RECIPE_MAINTAINER:pn-cve-update-nvd2-native = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-cvelistv5-native = "Valentin Boudevin <valentin.boudevin@savoirfairelinux.com>"
 RECIPE_MAINTAINER:pn-db = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb b/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb
new file mode 100644
index 0000000000..7ee1f04d0a
--- /dev/null
+++ b/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "CVE List V5"
+DESCRIPTION = "Official CVE List. It is a catalog of all CVE Records identified by, or reported to, the CVE Program. \
+The cvelistV5 repository hosts downloadable files of CVE Records in the CVE Record Format."
+HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
+LICENSE = "cve-tou"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/cve-tou;md5=4f7e96b3094e80e66b53359a8342c7f8"
+
+inherit allarch native
+
+SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https"
+
+# SRCREV is pinned to a fixed commit to ensure reproducible builds
+# To get the latest commit available and stay up-to-date, set AUTOREV as SRCREV with SRCREV:pn-cvelistv5-native = "${AUTOREV}"
+SRCREV ?= "644ce1758db1773336ebebb6a0da90e132da0eb7"
+
+do_install(){
+	install -d ${D}${datadir}/cvelistv5-native
+	cp -r ${UNPACKDIR}/cvelistv5-git/* ${D}${datadir}/cvelistv5-native/
+}

