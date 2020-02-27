Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD46606AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:05:51 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id j17so828299pjz.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sadVFxQBL6aTu6S/fLV6iX7Kae7D9MRzmrnjXE4Tzzk=;
	b=ubOOcdEr5OeKhVJKg7dAagUq40jYQjIiEmOANLOZdji3GXTsCnJw4TUNcryJfoCn/J
	jhZ4MnbkV/ZJeZItZUc40AGeCgNy93R+H6TJFsqItTP1K+QUJ0GPIxP+AhFYXFgD/L0R
	AFbVum9szUCBtq74A+/XEeh7LiSeUsSDfJvPGgMLvpkhoEBv9fo6f6wVRm80CJ0FTy8D
	yq5cPr0n3c1OLG87zBugsNKuAb4PKg6pfVwohrcOpFzlY8sXrfvToiuLUHVpCWLSn1zH
	DfoXTY1gkQeZWy47H43FC+pMh8EZtaxSYgRcaPzYAjGM0aQrooBZt/JpU7yDPzAvjk1I
	A8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sadVFxQBL6aTu6S/fLV6iX7Kae7D9MRzmrnjXE4Tzzk=;
	b=XO8Bjvl+iCybQa+zXvp/bz2dnlfVgKsqkoWmSlHW8nkUYzGQASdE7d/f7eo/HhkldH
	cb5tZlKW+9xp5pZXqaUmjM2SOFgmENpYkzn8Ejp7F9s1+4eOuWeDno/VPfV0GoXcjqMP
	ZAfLnpHLiUBkIo3FXtcVTj46gM6atHlghdw22JyLQNUqb95PsIOkZD5uI5cISyqURMua
	nnTDmFWfnDvw10BKWQQvvEBZQCIkdjAnNiOUA5FpvJ/jD3EANy9qGqlLc2cyoYZ900Tr
	B3ajWn6BgbdmzJbYutj555p89CJuBfaAySQhO5ysZJeyYazX+/I8mLuadYJikdMVhwvN
	GuIA==
X-Gm-Message-State: APjAAAUVwBTXNc4ZQL48BFhPlAxliwFaFoBB/hD+TH3+bs6geYKtdYqG
	YmIWSX6SrPB02bSjlI1P4EYEXhvH/Io=
X-Google-Smtp-Source: APXvYqx2EQjvy5yrevh0C/1s3bUSdHrItLPtEpMDnN5u1J7J3sd3GKBqYF4MLsE0r/I08l1NdBRXFQ==
X-Received: by 2002:a17:90a:17c2:: with SMTP id
	q60mr3384675pja.111.1582790752340; 
	Thu, 27 Feb 2020 00:05:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	188sm1431753pfa.62.2020.02.27.00.05.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 00:05:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 00:05:54 -0800
Message-Id: <20200227080558.3819138-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade go to 1.16, kernel-headers and systemd fixes for musl
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
X-List-Received-Date: Thu, 27 Feb 2020 08:05:52 -0000
Content-Transfer-Encoding: 8bit

go 1.14 was just released, it seems to be an easy one to upgrade
drop couple of musl-only linux-libc-headers patches, glibc should be unaffected
Enable resolved in systemd for musl now that we can compile it
Drop local patch to enable 64bit time_t in favor of backports

Khem Raj (4):
  linux-libc-headers: Drop patches manipulating __UAPI_DEF_ETHHDR
  systemd: Do not force removing resolved from PACKAGECONFIG
  systemd: Drop local time64 patch in favour of upstreamed patches
  go: Update to 1.14 release series

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...ead-of-TIME_T_MAX-for-timerfd_settim.patch | 31 ----------------
 meta/recipes-core/systemd/systemd_244.3.bb    |  6 +--
 .../go/{go-1.13.inc => go-1.14.inc}           |  8 ++--
 ...ow-CC-and-CXX-to-have-multiple-words.patch |  7 +---
 ...ent-based-hash-generation-less-pedan.patch | 33 +++++++----------
 ...-to-be-overridden-in-the-environment.patch | 11 +-----
 ...4-ld-add-soname-to-shareable-objects.patch | 11 ++----
 ...de-CC-when-building-dist-and-go_boot.patch |  9 +----
 ...dist-separate-host-and-target-builds.patch | 37 ++++++++-----------
 ...d-go-make-GOROOT-precious-by-default.patch | 23 ++++--------
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |  9 +----
 ...place-glibc-dynamic-linker-with-musl.patch | 23 +-----------
 ...dian_1.13.bb => go-cross-canadian_1.14.bb} |  0
 .../go/{go-cross_1.13.bb => go-cross_1.14.bb} |  0
 ...o-crosssdk_1.13.bb => go-crosssdk_1.14.bb} |  0
 .../{go-native_1.13.bb => go-native_1.14.bb}  |  0
 ...{go-runtime_1.13.bb => go-runtime_1.14.bb} |  0
 .../go/{go_1.13.bb => go_1.14.bb}             |  0
 ...muslc-ethhdr-protection-to-uapi-file.patch | 31 ----------------
 ...revent-redefinition-of-struct-ethhdr.patch | 30 ---------------
 .../linux-libc-headers_5.4.bb                 |  2 -
 22 files changed, 56 insertions(+), 217 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
 rename meta/recipes-devtools/go/{go-1.13.inc => go-1.14.inc} (81%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (85%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (88%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (83%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0004-ld-add-soname-to-shareable-objects.patch (82%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (88%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0006-cmd-dist-separate-host-and-target-builds.patch (95%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0007-cmd-go-make-GOROOT-precious-by-default.patch (79%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0008-use-GOBUILDMODE-to-set-buildmode.patch (85%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0009-ld-replace-glibc-dynamic-linker-with-musl.patch (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.13.bb => go-cross-canadian_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.13.bb => go-cross_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.13.bb => go-crosssdk_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.13.bb => go-native_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.13.bb => go-runtime_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.13.bb => go_1.14.bb} (100%)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch

-- 
2.25.1


