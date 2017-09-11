Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6C6606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:30:32 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u48so3182767qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lHazPpfcq3y4lpuMjLzfYtvvvr2SZPsljrWOFlFN4lI=;
	b=bwjzQikr5UCPF2oBuaILwoxims1hnZxTxSvVnHXdYIFdHwBC6LyRSOe71Sw9ZJl3jh
	TzSKq65XlaFuweuzg9DtxWXHyLgta2Fm0npwkeL//iGIiZ7uhm/RQ9R2J7ILERRqtnGn
	GyEW1qrYKw3zhWKRLOY1jYZJrwG1EkfdSY9mjiCAZanR1uWxLxa/+em4Ip5H1np7uaIN
	c0VTNG4q0Ny3iNLd+rf3m2hxnxRGwwYlvZV3/G9Nj6EWkkd448r+7kAMgMgMJYrWrAKO
	2cQYZa0RH38QNPH3MueOw4CjtMhCoAVEhF23I6VIZ77fsf247DE/Dvazi6/2sHZo6jEK
	uwIQ==
X-Gm-Message-State: AHPjjUgKcxIasGoGF6hzKRDah0jxKK+NjhG7v+74U6cOqfMaILQT7MQH
	9Hye30pjxpIcYJRL
X-Google-Smtp-Source: AOwi7QDsiYfdPSU8CKyfsFmhpasFnp0RfcosRDtWkdwyGFNFhrx9xUkzYq1g415363N8XYYgSejBrA==
X-Received: by 10.200.35.65 with SMTP id b1mr16543618qtb.329.1505154633184;
	Mon, 11 Sep 2017 11:30:33 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	m93sm6405575qte.72.2017.09.11.11.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:30:32 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:30:25 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:52 -0300
Message-Id: <20170911182853.11076-12-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 11/12] go.bbclass: enable nativesdk builds for Go packages
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
X-List-Received-Date: Mon, 11 Sep 2017 18:30:32 -0000

From: Matt Madison <matt@madison.systems>

Adding the necessary overrides for nativesdk builds.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
Changes in v6:
- new patch

 meta/classes/go.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 8fb41e5c09..8d363e86a2 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -20,12 +20,14 @@ def get_go_parallel_make(d):
 GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
 
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
+GOROOT_class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
 
 DEPENDS_GOLANG_class-target = "virtual/${TARGET_PREFIX}go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG_class-native = "go-native"
+DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${TARGET_PREFIX}go-runtime"
 
 DEPENDS_append = " ${DEPENDS_GOLANG}"
 
-- 
2.14.1


