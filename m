Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A83278247
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:46:56 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id c69so5328406qke.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=J29VnWA9y88YZWafQoVR1TpJIyr6VsGIESh84nwX3XU=;
	b=Y5Zvhu0NTteRBva2yIIFJlcuI7QOPuWGVhWRbwDg7GxI/hoQqVs4jliwXtHlomz+jX
	Ty0qzoFTi9wvvCLa8jOlTFU66723XXTlstVkZRRAHoFuzqerCXdP9G8gbv2YBXPshIeS
	GkTRFZg4JzAxF806U+UX395DCzVfBtOSpcxmLu8WE/xEj6ozjVK5NKwK3caVeFY8xRzw
	S+y3KEo7ASpLlzlNntTQbOfppBTobXMwsQqCFL0tIUeI3LC2DQhzvCLJjU3daBCYhef7
	SV/LF1s5CNlUG7sGxgjXFzaUd9aoAEKEShSglDnnsNIBGp0+XSHHzdjrRD3WsftBbks1
	/V3Q==
X-Gm-Message-State: AHPjjUhvMRZCbGyfHkni9+XlyU+EBVHAzUUo0l8DuWcJWc8mN7g+UDNG
	cT+y3FwbpAfL+qjq
X-Google-Smtp-Source: AOwi7QCvQdHDkrEdxxBwCUGCDGnLPwzLZJBpuT+WOi8JDqBa13etm7EpS+4iOkpBV/G0BG2IKJrW8Q==
X-Received: by 10.233.223.66 with SMTP id t63mr15368101qkf.7.1505134017251;
	Mon, 11 Sep 2017 05:46:57 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	i63sm5888460qtb.65.2017.09.11.05.46.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:46:56 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:46:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:40 -0300
Message-Id: <20170911124558.2863-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 08/26] go.bbclass: exported function cleanup
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
X-List-Received-Date: Mon, 11 Sep 2017 12:46:56 -0000

From: Matt Madison <matt@madison.systems>

Since this is a class, it should follow the
class function export mechanism for its task
functions, and should set directory-related
flags for directories they need.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
- new patch

Changes in v2: None

 meta/classes/go.bbclass | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index f64b07fd82..6df73bf377 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -51,14 +51,14 @@ FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
 
 GO_INSTALL ?= "${GO_IMPORT}/..."
 
-do_go_compile() {
+go_do_compile() {
 	GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
 	if [ -n "${GO_INSTALL}" ]; then
 		GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
 	fi
 }
 
-do_go_install() {
+go_do_install() {
 	rm -rf ${WORKDIR}/staging
 	install -d ${WORKDIR}/staging${GOROOT_FINAL} ${D}${GOROOT_FINAL}
 	tar -C ${S} -cf - . | tar -C ${WORKDIR}/staging${GOROOT_FINAL} -xpvf -
@@ -84,11 +84,7 @@ do_go_install() {
 		rmdir -p "${D}${GOBIN_FINAL}" || true
 	fi
 }
+do_install[dirs] =+ "${WORKDIR}/staging"
+do_install[cleandirs] += "${WORKDIR}/staging"
 
-do_compile() {
-	do_go_compile
-}
-
-do_install() {
-	do_go_install
-}
+EXPORT_FUNCTIONS do_compile do_install
-- 
2.14.1


