Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFD07867D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:54:38 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r66so571883qke.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=rGRvg5zXgsBkWVRhNX2FzAjyT7TWzLKD9KA5glmqsCg=;
	b=OnATx1RQCpwUTcx81vn4nDS5YR267aSk2e6YIYljz/zeIZ/YKsNulvIGm9+vXBxnCO
	dSQhpw1M2HJa7202edSgD25BoQFPKI5b/sXVUCXIrM8RjtuLuvu6KNG9FVKwIPYGVppQ
	Tjks5H3T4UeJj9okEhtCBdC4Jz0nWkllQzGnbolqAh5sQLD7ULUQ4y1/rPzFFbWThzHy
	DgnkfElquZHCGF0BwEtqtVVgB5PvB+uRJFEVntnoLM+6nENoZlcbebep0b1knaDtNCjg
	MeOygAa2657T1vA8RssCDS4Vn6sQ/JqJrIuoiw6TMbP5E/tJqmFOanlKvcW6c74bbFCQ
	qNag==
X-Gm-Message-State: AHPjjUhlbEAzUjVdRzO09SZT54zohq6eBmxqLBXzPkEfSFvIF7Io50MW
	ORExyFW41EsSHDyg
X-Google-Smtp-Source: AOwi7QAXljcbAW7T4XtL9eo2P6Qf3pEXjggnBcbdnyC53LgpZd53wXkkHRGgDIF/HSV8H0fgWHWVHQ==
X-Received: by 10.55.100.11 with SMTP id y11mr23725742qkb.54.1505325279213;
	Wed, 13 Sep 2017 10:54:39 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	z192sm9631466qka.91.2017.09.13.10.54.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:54:38 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:54:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:03 -0300
Message-Id: <20170913175410.23041-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 2/9] goarch.bbclass: identify archs with Go dynamic linking support
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
X-List-Received-Date: Wed, 13 Sep 2017 17:54:38 -0000

From: Matt Madison <matt@madison.systems>

Go only supports shared libraries for some architectures, so
add a variable for use elsewhere that gets a non-null value
only for those architectures.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- new patch

 meta/classes/goarch.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 0c22f80518..bfba3c9723 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -11,6 +11,16 @@ TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES')
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
+# Go supports dynamic linking on a limited set of architectures.
+# See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
+GO_DYNLINK = ""
+GO_DYNLINK_arm = "1"
+GO_DYNLINK_aarch64 = "1"
+GO_DYNLINK_x86 = "1"
+GO_DYNLINK_x86-64 = "1"
+GO_DYNLINK_powerpc64 = "1"
+GO_DYNLINK_class-native = ""
+
 # define here because everybody inherits this class
 #
 COMPATIBLE_HOST_linux-gnux32 = "null"
-- 
2.14.1


