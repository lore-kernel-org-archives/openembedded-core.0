Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9334C605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 22:27:53 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e4-v6so7462807wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dKrvv/B6sa3jVWF0jLW6BV1iBOBNkbM+a/seOb3LsME=;
	b=ShgF/x36nyK8o5pu5sLT0RQYGXd/qfnGJuOTjljSGmuEvDt3HUu36M1x2LjDLWfqCo
	nsRAW+QFHMjW+u6MCfqAmMaOl3UGWIUe/vbQXZuNlyiq8TPLaioUjvUrL44MAhPM7kL2
	HkObbXgBNkDf5gbTTsStjLIfeCZU1Lk8kJ6Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dKrvv/B6sa3jVWF0jLW6BV1iBOBNkbM+a/seOb3LsME=;
	b=E1fCqhaWh2ROaqPSHcy49Se99BGMLqk2YCRB5NkWnFsnx6Qv5W9DkpjN/qbZgKpCMk
	4KERrCxNKtlXuVtnCC8td0f0rl6cyj50b7HDqoS9dvtLpRk6hAlRJM0w+fVcq59qPf7W
	3U+gnyLtE8+E71ofe5ENPrcjFqiIWLPnT4Itz10F5Zwz4NrSygdT/HwoAlAi1k7WrwhA
	fSCK84nwD+NlrAHYRlQvOtrOE91cVtYiuCZKnD+VBwAowgMzsRjeqpbSxe4g9agVtG5C
	oPc7t6SC4KQiSBYvlrfopGdAxlJzgKrd5jvuWxImmak/FvdHvdzhF3JdEf27cSswcmzu
	RR0w==
X-Gm-Message-State: ABuFfogUIKUH3s7+QWBRgG8qsKgi1BhYy9hJZiS5Gee4kpVj2ndcPtmT
	WgnZYE+SCcFwLUrWcLatg8j0Egj0ULg=
X-Google-Smtp-Source: ACcGV601nkXM9+3AwlW8ZRnW5KMa3Vv4nEqxNuHbUQm5V2gokKt/TV3P8KlEpivDz5fKBrPHsixvTQ==
X-Received: by 2002:adf:a29d:: with SMTP id
	s29-v6mr25599798wra.100.1539210474060; 
	Wed, 10 Oct 2018 15:27:54 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y76-v6sm9441673wmd.37.2018.10.10.15.27.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 15:27:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 23:27:49 +0100
Message-Id: <20181010222750.378-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181010222750.378-1-richard.purdie@linuxfoundation.org>
References: <20181010222750.378-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] testimage: Ensure TESTIMAGEDEPENDS is appended to for qemuall override
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
X-List-Received-Date: Wed, 10 Oct 2018 22:27:55 -0000

The current qemuall override overwrites other dependencies unintentionally.
Tweak the code to avoid this by appending to the variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e289b9343cd..859b5f485ab 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -82,10 +82,10 @@ TEST_QEMUBOOT_TIMEOUT ?= "1000"
 TEST_TARGET ?= "qemu"
 
 TESTIMAGEDEPENDS = ""
-TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
+TESTIMAGEDEPENDS_append_qemuall = " qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS_append_qemuall = " ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS_append_qemuall =  "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot', '', d)}"
-- 
2.17.1


