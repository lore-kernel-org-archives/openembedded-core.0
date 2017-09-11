Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0277821F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:46:17 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d70so5335391qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=QDjJUSjAov/q2FLh85BD2G0SxVJYssMsG91yCDGhVQA=;
	b=IKqxkJRg6hJWc+94gDmqGecNHEnNWtlsTQQVv03C6J5llHmflx588KR3p2lIkh8U/d
	OP6NI4DBGeEQWGAjHKHv4Sfd/h8lq4XK/CubFN29u9ezBJy+S5vu5McwUqDdwgJSS53X
	oPaLwRp+LWQgJ3OBBw8YAnU31XDrPwtvWJJr0dhU9WUWGRm+ZVJ44xuUl14gMSE/Tt4d
	eZ805c3bURO9em7ciOvoS87KyzUOU8yXYGM9vzWyecvQLHyFXuMFn28W0eHcaeQuOUrX
	l5G25XUxzZV4UEcIohYRN1Q3fEBmrX5jMuOjI3LBijlV/DwD3hvzmvCQEFzZmkj87Agy
	GLfA==
X-Gm-Message-State: AHPjjUhIHnBwWVBUqcbT6w45e0dNaKT3ub++rkYXvGdQAx9brxQPYFac
	HHOoB/Q5pAeWE4vC
X-Google-Smtp-Source: AOwi7QCfb/ryqw8kMcruyla2/Pw8ysUIQ8ubjlJmv+88WiGGGQbgRXPs+uxSA/YjBJ3j26fyOIMF+g==
X-Received: by 10.55.169.81 with SMTP id s78mr16121836qke.34.1505133978798;
	Mon, 11 Sep 2017 05:46:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	s16sm6066808qks.63.2017.09.11.05.46.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:46:18 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:46:13 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:34 -0300
Message-Id: <20170911124558.2863-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 02/26] go.bbclass: Fix binary installation path detection
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
X-List-Received-Date: Mon, 11 Sep 2017 12:46:18 -0000

Go toolchain changes the installation path when building for the same
architecture as the build host. This was already been considered in
the GO_BUILD_BINDIR variable but was not being used by the go class.

This fixes following error:

,----
| ERROR: go-dep-0.3.0-r0 do_package: QA Issue: go-dep: Files/directories
| were installed but not shipped in any package:
|   /usr/lib/x86_64-oel-linux/go/bin/dep
| Please set FILES such that these items are packaged. Alternatively if
| they are unneeded, avoid installing them or delete them within
| do_install.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index cedda68c55..e073cb91b5 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -3,7 +3,7 @@ inherit goarch
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
-GOBIN_FINAL = "${GOROOT_FINAL}/bin/${GOOS}_${GOARCH}"
+GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
-- 
2.14.1


