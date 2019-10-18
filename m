Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 20F487F660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 11:28:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m18so5761185wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 04:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JnC329Eee7/29cXrbN/xPXV76MLrVSqBniLg/QiphIE=;
	b=w3ZKKhDXYQnBP3Wl7LxHOabqI1323Eo3M55U+AiZbKWvdqdM198fN1bneO15j1pNv/
	/ii2PIYYHg4XMs8yQnLm26588stXuT8JjGs8wImdKIHICZkqhReSgWBGfMdolHAiu2fh
	u9grP9qyskWrGCOZd4a02Nntsi25t5RDR4cr7CYRhbB7g2DbW5p94gd1rEGyn45RLtV2
	yLnL+RjPVj8dPTr6UR/3yjeRQzv8d53ffnNBfJ1V1uyjE0JM0LQ2YX+j1w07SUbDZ9k6
	2eqmcJij9TWgI9VFLddVFcygMDIjZrExtEd81f0KkF0X01cowbIwPb9GR3V7vNURDMxr
	jFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JnC329Eee7/29cXrbN/xPXV76MLrVSqBniLg/QiphIE=;
	b=Xo5QLhSB9zcTgPQrVbNeqpNneHUsJe7L5C021nTaHHftcy2DYI4TplB7GdSfZx0VAK
	rxx1uPaqsYkvlPmtfAm6jZXlbhcrmpEYP+rbhVmvMq7+GLlFKxO4+0Ct3Vloq2T10Y0Q
	PYXKSU9vfBrnS1m2lsODUsFJVmOxoFTb1NVAXsvUhriH5V6/XHA8d06IjVfbovrZI7vU
	a7KvuonwSI+72hHAV/E5lZfAU3Uttpg0qZi0f1CN/U/faNce3wwdkTKeDVgIMpZQvqKH
	vDo8/okjCyEl3YzrGdOQdyXyHH3C0VQ+1yKbpbxJh5qOq9ANyOdNr5tsiupT9REfdc/R
	LOeQ==
X-Gm-Message-State: APjAAAV6B0rp8J+4Mo/0Ky4Eq9DDjMSWrB8h4XE3aFWpGiXYM4nEx2r9
	JdOammQi/7mOy4m6XhqQufjjRne0e8Q=
X-Google-Smtp-Source: APXvYqyW2M9knKbezBowU3RbBurxvy3R2xegf8Spw4bInfrYMITVaypeHfiRKm32GoeN2tJLE9OceQ==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr7713699wme.80.1571398103525; 
	Fri, 18 Oct 2019 04:28:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v20sm4467212wml.26.2019.10.18.04.28.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 04:28:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Oct 2019 12:28:19 +0100
Message-Id: <20191018112819.16210-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] file: explicitly disable seccomp
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
X-List-Received-Date: Fri, 18 Oct 2019 11:28:23 -0000
Content-Transfer-Encoding: 8bit

file will automatically enable seccomp if the seccomp headers are available, but
the build will fail on Opensuse Tumbleweed because the include paths are wrong.

Enabling seccomp is a bad idea because it interacts badly with pseudo (causing
build failures), so explicitly and globally disable seccomp.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/file/file_5.37.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index a840dbc012b..c53a120b840 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -21,6 +21,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
 
+EXTRA_OECONF += "--disable-libseccomp"
+
 ALTERNATIVE_${PN} = "file"
 ALTERNATIVE_LINK_NAME[file] = "${bindir}/file"
 
-- 
2.20.1


