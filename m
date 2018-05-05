Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB38174DC1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:41 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q22so18606804pff.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3DGvKFoZh+MQzz1o0j040YS0FlZCeqavuYA9r83umDw=;
	b=QLJdwZ9j081j33rQLcSll/wNu3HFyTDjNWKLPhyzW7l/D33c+21PbrtuuBv/yuxPI6
	Wkvy3aQS2B7qjpVXEJcjSNz42I1foKhmry7vLbjadvf4BZIqCJOcCrY1sT89T+Ea3hL0
	IM7TrqKmrjRArD5qPmeQJ8pkLt5oZgFxhasYb04TWnb1TAIsw9hEKahTxNCBdDSnDWkF
	ChoSen7Uc6jT7eyjsZ3C8rhuo3RWvWsOvoXJY7oWdHc9+5BCpe7RhpP4mxqQ3wvtWZav
	du2eV8G0CThzhJ3Crkav7oAbQ1q3Lqf890/ODTabX0GNIikk95x4pzzaaTPYIt5nUYH9
	2Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3DGvKFoZh+MQzz1o0j040YS0FlZCeqavuYA9r83umDw=;
	b=efwgMzx9AnSaszcBrzu/QgFTY5U3PfSh9m0Gf9n72DQ/SLDRSCPCM/dpSeSgQGJoHN
	eFVHb2FHh+Fg1CLiIyDbZ4+g8It5fR52anKNauoKV6Q7Jy3LTQWW2HKrX73LUTFtX5vC
	F6HhNTYwrhRubgP0FaUOC5pbWbeurhggE85L2DURWfxMTtcXTg2wsOSM2iD5G039jb83
	XxA1+UbQEHB+dAmwKOnl2DTruDBRhnKxUq/QRp29vocMZ5bvZ1FWOLDSPHYWfO4Xxu3Y
	QTEybps/bxlZfAsAEEXs83wa4Y/bY39vfMhFwuhUXVTwCtNRwbgVr26X+Ypr+aontPnd
	aADw==
X-Gm-Message-State: ALQs6tAx/MkeavW3HGuQnRo7ox++HGXnfSXgovCiDBbYtQ54md55lfaK
	q0/uzimmNPoOD0DYtCbKL71Hiw==
X-Google-Smtp-Source: AB8JxZoNQ9hR9jn1qT4lgYl1A7ESFV4ZuCtuPPT7/87UqJ/OaTs0ShSG2icps6lUc/h2pdrKTwzuXQ==
X-Received: by 10.98.98.194 with SMTP id w185mr22744437pfb.78.1525479282450;
	Fri, 04 May 2018 17:14:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:11 -0700
Message-Id: <e2dddea2c8aec39a6d45320c0d84051e72ebf482.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 17/27] Use libtirpc even on glibc
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
X-List-Received-Date: Sat, 05 May 2018 00:14:42 -0000

We dropped in-tree obsoleted rpc from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 37b37ae12f..24791c4170 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -22,12 +22,13 @@ SRC_URI[sha256sum] = "ffdc865137ad5d8e53664bd22bad4de6ca136d1b4636720320cb52af0c
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
-inherit autotools update-rc.d systemd
+inherit autotools update-rc.d systemd pkgconfig
 
-DEPENDS_append_libc-musl = " libtirpc "
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
-LDFLAGS_append_libc-musl = " -ltirpc "
-EXTRA_OECONF_append_libc-musl = " --disable-nfs "
+DEPENDS += "libtirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += "-ltirpc"
+
+EXTRA_OECONF += " --disable-nfs "
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
 
-- 
2.17.0


