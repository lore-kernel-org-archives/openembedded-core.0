Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 10FC47C934
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 16:59:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q1so22798938wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 08:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/Hst2Wg3kN08Nx2UsbfKqOvlF4AigE3ORW3gd3UHjL0=;
	b=mMn10g7jQsoidHV4npRxcktXW08a3aHgRqhymipJooV9sz4SBtNy+zLi8CzCayn1/7
	m+wzYg5+thx6GOZcOtqmc5iZ+UTfl6AcIlv4LxhowdNrXIVnAkYtJFh3TqpTbjpOP97+
	LtvmiLSXjoKjNI9zhj8FIfpCtExcCKA6phlG5doGt48o5XuuEABiHCB0ZA+aLjNvXGNA
	FVnAFg6I4agM5RpOhyDNFfzslpjY+e5psPJRly8WsJ1+UxoAKayflnKk+DPBLYSfvH/B
	GEr4KD40LMByBDQU3HbgoRB/GuEand+c5sNcET+NeRMrFK9Qb0Qq4009zYjixva62+H9
	lHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/Hst2Wg3kN08Nx2UsbfKqOvlF4AigE3ORW3gd3UHjL0=;
	b=eEJ0y4ycttDLYVd/RgHyfZZ7VsNiDgAoLXRd7sq3QyZxSJ9SAz+YVO4g9xmTP8FGuB
	bcFOU2ARbyrVeUi9WLbWy3GetUFCa72AlIYx0gGrrcR8IJPkQcaR6WytrIIkua08xhhy
	DFKBgE7rnUzjnn7Ubg4fliRo4Ai4itMlnwDs+VrA//JX3hoM+m35+UJLYEWpg715R8M4
	EKNu3edcKl/16H+2e1jeQBFqoWSu5XumTjhajf5aaERYCuOKREp52Wmobzsv9EoMPsM8
	daojTxCKPYAN0LrMukhogcyyLt9uaKs/kNrbP5QcfaKvOL9MtaPEeJl5zVeFHsi5F5oq
	FWog==
X-Gm-Message-State: APjAAAUxK8++uA0rnfhabcfEWsMMH5HUDVZ//nkU7qSOnLOkJp8nKO1P
	5OvvoqE44F+R61CAzFAB4Q3mrvFH
X-Google-Smtp-Source: APXvYqzfBOagFwp0ZCDhXH8X2DDDZm5BKY8gnwqY86CY2L5xg7RaMZIVT8paWSh/ZYjtzP4iOonD/A==
X-Received: by 2002:adf:e48a:: with SMTP id i10mr232149wrm.257.1551373151383; 
	Thu, 28 Feb 2019 08:59:11 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id g9sm4912294wmf.19.2019.02.28.08.59.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 08:59:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 17:58:59 +0100
Message-Id: <20190228165859.58628-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] perl: apply a native-only patch only to -native
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
X-List-Received-Date: Thu, 28 Feb 2019 16:59:11 -0000

Otherwise some of ptests were failing on target:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13194

[YOCTO #13194]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 1cc5480d68f..5aa7cd3ee16 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -13,13 +13,15 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
            file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
-           file://perl-configpm-switch.patch \
            file://errno_ver.diff \
            file://native-perlinc.patch \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://perl-dynloader.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            "
+SRC_URI_append_class-native = " \
+           file://perl-configpm-switch.patch \
+"
 
 SRC_URI[perl.md5sum] = "838198c43d4f39d7af797e2f59c2bee5"
 SRC_URI[perl.sha256sum] = "3ebf85fe65df2ee165b22596540b7d5d42f84d4b72d84834f74e2e0b8956c347"
-- 
2.17.1


