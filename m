Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id E93C57C2F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 10:59:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k2so1612159wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZQJl5bT9SlcHQ+2+oUneMy4RaPsZVzsJ0B+UlxfFlOw=;
	b=zjLE1japRtDj2s7KIyOfT8XrJ4zncYMMb70ysTgjTBhQnE8Jhgg545Mzu/E7CuMSLd
	uAYSD8s8o0aXuGPURuzzKQQq8f/hfFBPBSPJPEiE3Bj614TxHUBxdPAn82mJYnfshPWC
	K9NXZ9oUSHxoSqMqU9Dd2s+dmYeycAkpBe8fs8COR/Bz+0BXaVifxIYLHyqRUvDf1cX4
	9LOYYGYzLrN3zaWIhkY8VK/wQJ7GXFe4rYDwcWwFvh4eeYAiSl5FLLb/PqK1FMGTofAg
	BgVLqhbEdys57vWUzXf2SKIjnrDSWIqLtt/GOcCkmK+oDVtrb/mF3HA9zmkN8eD2ZD5G
	rgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZQJl5bT9SlcHQ+2+oUneMy4RaPsZVzsJ0B+UlxfFlOw=;
	b=h2Y1XGSAvPfOuC1gEYsFobUxTQLOEBIqe3TFP7TguVIYkQOYLK4P21p597Swjm5ezn
	l2DItwVZY5WjCipmEOLdQd+Jp4nd9MdzpOiRL9VrMeaAthIUeYu/Akhm6xHh+7AXHqJd
	AI89glnBQ6TLuUHHIdkQ13NCjaXSh+bsUyhUXjvZxb5AHifdussz1d6rL9w5p8f5ghL1
	ub5S92G69e6ZkcWvj3oJXFVQmvXW/Vd8q474e1wNiz0eLdLqLJaY8xxlLQV6sH17kL7a
	aNi/6biXVT1RcUqvreyGqHaoRGxiPq6OEuwUSbH+v9w2tdR396iyqFMVW62QCLA21V42
	XV6w==
X-Gm-Message-State: APjAAAXcA18mHX6h0chNl1fIQaTOexTbAmNMS6WpokvR0owSWErZwYPJ
	FBlo4f04XDTRpkwkpTtNAgZXDi/qZ3c=
X-Google-Smtp-Source: APXvYqyb2DjXOudd7nH49H+c5/dDVNQtQPiexMKbUowz+bpZCld/OPu1ePijoP/GnHXowzNAzRgFmA==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr28461600wrn.8.1566385141305;
	Wed, 21 Aug 2019 03:59:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m23sm3680438wml.41.2019.08.21.03.58.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 03:59:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2019 11:58:58 +0100
Message-Id: <20190821105858.5487-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd: add PACKAGECONFIG for gnu-efi
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
X-List-Received-Date: Wed, 21 Aug 2019 10:59:01 -0000
Content-Transfer-Encoding: 8bit

Add a PACKAGECONFIG for gnu-efi, by default the meson.build looks explicitly in
/usr/include and /usr/lib for gnu-efi, and if it is present on the host the
build will fail.

[ YOCTO #13487 ]

Original patch by Chin Huat Ang.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 6992062cef0..b368ca8a2c4 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -126,6 +126,7 @@ PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
 PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup"
 PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
 PACKAGECONFIG[efi] = "-Defi=true,-Defi=false"
+PACKAGECONFIG[gnu-efi] = "-Dgnu-efi=true -Defi-libdir=${STAGING_LIBDIR} -Defi-includedir=${STAGING_INCDIR}/efi,-Dgnu-efi=false,gnu-efi"
 PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 # Sign the journal for anti-tampering
-- 
2.20.1


