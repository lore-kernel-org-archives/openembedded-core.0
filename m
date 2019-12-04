Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 251987F7AF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 19:33:04 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id x7so321079pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JrHyn5EBg0qpwg2B/CSiXcgbvzP7YNInMx+cZ2HLJ6M=;
	b=EX1KkpnEZdyOk9kT+fkYf7YND504dgYcsIfoW7HDrT6IpwkCENRH9D2UvVhTVdBOai
	l3qlCoUsRh51R4aKkNYkp8VonCMd+XzyZxGZYS4nrowpswSfUkEvfINc7V30UMh+b9Vj
	VpVqZj2Zk17YIFilc/U86aDVzojoWVBx+UF/abh8nfnYu0ToCVcRfG0vNVHPtNf5BXK3
	QpwF4YD+kvGEehdtv5xsIV0ROpt9nKo6U4q1AN7MtPW5TQoKeKLSBnbesSW2yvJPdzA3
	ZArs6KJAtpcTOvt86Temm4XgQepCHQrTL09kiFq4v4FPnaBrQOd12kRMVied6PMlAIGh
	hzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JrHyn5EBg0qpwg2B/CSiXcgbvzP7YNInMx+cZ2HLJ6M=;
	b=H6KwLN1+4K7dFzEY3MrW5NrczDh8EO/u4b+VAYK4hpRV4jdUNAWJdnWGql5Xfv9o36
	/I4haQfuPOHQWqthGs4bZtogFf5DhNJksrJUqoVhMzrw1YGoSpqc1GSS9K6anMs/29zS
	dn3eowqTdGhK0uw/6DXcezJQ4blOBllPxiVuzI4BIUPvp6nLjdtuNKTUPW9oP+j4zkYU
	+sepn3/USf4NC9ef7pSUW3eoAf3vbPvar3WIr3zs7Uq/+0AF6mMtWm2DHl2h/OMIue8r
	HulixkUcIohe78RH8a0b8lsjBNGqNWFaOmfpNiBp7XYpzzBazeKlvlZ+iXpJkHyFmlHX
	pkwg==
X-Gm-Message-State: APjAAAWY+uLOfWUfqCrL0MtBFJoCtSF4t7eGYL8qjO6i8sofbBIk960D
	ZH0Vt4nAZD8OfD3fX4t8A/yr8wyZ5q8=
X-Google-Smtp-Source: APXvYqzraBgJgqMDdZGccUVW6xGq6bCiF8gPutYRuBNF1caK67iIEzvClK1Or/PHk6NeXiLxvNBxdA==
X-Received: by 2002:a63:545f:: with SMTP id e31mr5246678pgm.236.1575487985049; 
	Wed, 04 Dec 2019 11:33:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id e7sm8522292pfi.29.2019.12.04.11.33.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 11:33:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 11:32:54 -0800
Message-Id: <20191204193254.2418208-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Wed, 04 Dec 2019 19:33:05 -0000
Content-Transfer-Encoding: 8bit

Use PCRE, this enables using posix extended Regexps on cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1fa82363b1..8f867aa9b4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
-DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
+DEPENDS = "libcap-ng ncurses virtual/crypt zlib libpcre2"
 
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
-- 
2.24.0


