Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B408760280
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 14:17:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so18392068wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Po4n7vXwczVNFa7BU6r3VGdsGL3foAQW2qK4z3uD9pE=;
	b=hjQTzLCLEuYjlaL+D3wUFD1VUYJCbRICO2yr97E5RIPrxKNEy4d9Q5O+xcA1kHDm+k
	69xhREPd1fTuhIAgOIqz4Krbu9FNHwGDX5wLIWitmv+hOjjflKZ9vLbsW4HrWXL1A3Lt
	mj65R/yFOZ85C3XOB6P9lexM2zuftjnnZH5Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Po4n7vXwczVNFa7BU6r3VGdsGL3foAQW2qK4z3uD9pE=;
	b=tRtndrv0qUvfOaeNZ1SFVEfeSMBsn7EktxcJC9f/owZWHGPkVdpSiralamw99MkdSS
	FuB8F5DURU5ayaX4r6lRnV2HT5iINysQw0yMrmTDOF9fLH3REQUJMwQ5l1MTPuOjzusw
	cL7SnL3O3kMnYcQppwb6chf2qyDmU4RfZeRPGc2oqh15jl7NAgo/sR7Is/mDYuES4jnM
	pgpynmks0z5jL68W6ZW7gbKJQjkXlIDWRW5QeMlDANq6GoKzDN2Ge2KSNQGDwdEm0IJm
	g/jALoB0iGd52tU+/EKKAC1Ut6WYodlkAbKK75YVzhQSxR9glHCf8P79opNxASvEL9Z/
	Ez/A==
X-Gm-Message-State: APjAAAWGhGQgFvDpJWxLMK2luTu4KN9frGrEAKe/LeQL+CQxBzARyu7w
	SSDc7CUU+b6JetAVBQb/mDJJK2x4bss=
X-Google-Smtp-Source: APXvYqxPSBMVasYR1xhhayTfnzzvVg2GtyXZhdOESmfwz24cm+2DKQlTEDrxp59NSfqS2lb8CTXglw==
X-Received: by 2002:a05:6000:12c7:: with SMTP id
	l7mr14906305wrx.136.1580739422878; 
	Mon, 03 Feb 2020 06:17:02 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l29sm2168822wrb.64.2020.02.03.06.17.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 06:17:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 14:17:00 +0000
Message-Id: <20200203141701.18379-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] sudo: Set vardir deterministically
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
X-List-Received-Date: Mon, 03 Feb 2020 14:17:02 -0000
Content-Transfer-Encoding: 8bit

Without setting this it will vary depending on which directories are present
on the host.

[YOCTO #13775]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/sudo/sudo_1.8.29.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.29.bb b/meta/recipes-extended/sudo/sudo_1.8.29.bb
index 8da2d646318..7089e1a1d2e 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.29.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.29.bb
@@ -17,6 +17,7 @@ EXTRA_OECONF += " \
              ac_cv_type_rsize_t=no \
              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${nonarch_libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
+             --with-vardir=/var/lib/sudo \
              "
 
 do_install_append () {
-- 
2.20.1


