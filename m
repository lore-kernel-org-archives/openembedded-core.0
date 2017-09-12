Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2E67842D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:52:10 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id c69so7108750qke.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=OgSMc4THtJCWG4+Qf2MWY9h/4AwxfjYamSry9FlWO2c=;
	b=ZiRuQvbAKG1mZgCTJDpfV178kaNCRHklpe5z4Khq/DQhCOmrHJEC3uPqWJKjD+zsqc
	8LQBtzDXRUal8AYlxSqfEtC2FQWAjx38xW5Tytv5vcLfq+UyD553+tYsynJeMmSXL3Jn
	w7sgfPDQEZD8x92dFcgtGauNSQn/8xkEeUsH1Jex1wlcP97FAzLtjiL4JkztLKV4doCE
	TLMh9jLDNHhHCsSZ+960IlWjW1awMZEihK+UgviZKlhViM2sqatONWw1KUep3KVTJlYd
	4PGTrdDIbuA7orRx7wCXhmTlZfzZ9BsFuULdhu1TinsvD5t8m5vEUW6EV7R3SPbDzmqh
	SCTg==
X-Gm-Message-State: AHPjjUi+3mnXgmUaqddc/irWyFkM1n5V2FVNhZxtpQKh93gs29zmWChX
	9vbn6ZE2xEjO9F2t
X-Google-Smtp-Source: AOwi7QDxRQe9yUqP+jOWfowExHZhJl3M83EifUwEUP/ot/x97SUCklvXGP3O6MeDo28l+CjYriRtkQ==
X-Received: by 10.55.79.85 with SMTP id d82mr18895021qkb.5.1505220731803;
	Tue, 12 Sep 2017 05:52:11 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 22sm7927344qto.50.2017.09.12.05.52.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:52:11 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:52:04 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:27 -0300
Message-Id: <20170912125031.4009-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 09/13] go-cross: take GOARM environment setting
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
X-List-Received-Date: Tue, 12 Sep 2017 12:52:11 -0000

From: Matt Madison <matt@madison.systems>

Instead of hard-coding GOARM to ${TARGET_GOARM} in
the wrapper script, take it from an existing
environment setting if present.  This allows the
same cross-compiler to be used for different ARM
targets.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- new patch

 meta/recipes-devtools/go/go-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index df3e4ea914..d18d9613ff 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -36,7 +36,7 @@ make_wrapper() {
 here=\`dirname \$0\`
 export GOARCH="${TARGET_GOARCH}"
 export GOOS="${TARGET_GOOS}"
-export GOARM="${TARGET_GOARM}"
+export GOARM="\${GOARM:-${TARGET_GOARM}}"
 \$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
 END
     chmod +x ${D}${bindir}/$2
-- 
2.14.1


