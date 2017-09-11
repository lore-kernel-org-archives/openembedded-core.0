Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 700B978235
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:48:16 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d70so5338358qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=NTWpD3y+fzCZiRq/4l4/82JzAfcPfSuH/pMfJ9t1Bw0=;
	b=BrlU7QzEHTLeixFXNbnAMBdgZvSw50e0IC3rnC6afE1Wze5qtuGplQ+Jkx+gGz21vn
	OQtfyEdclzjlmWyvvb8E27ZqTncoNoLEgfFEgaJ5w/unGUHr25N+/qfzI1Ff32xXzTfV
	wf0i7Ey4ettD9LShiAlsnJCZCkKcwewNY1siNn+iJuBFHlUmM7M8+nc+3T3TuWxfN3cQ
	OfKXs+uLG1Pqox0vJ5Uo/c1puuXn+xTNk966aSTMx0iMQOenhc+lfEeP2gU4mdNEW31L
	YnNJt8yW+jlK4bjfB/pgBZtNgKz3x7zgbiRme3gyMgVMdTViCe7mYMRBgEYfK616TbO+
	pkIQ==
X-Gm-Message-State: AHPjjUjmDJzkW8MHaAKmuVB2GjOapaQGv+T95L9Cd3FwzbMqbHgA3yfe
	l8dSnPjzYfAyLaUP
X-Google-Smtp-Source: AOwi7QDbls9Gehd1j0cvJgclI64qRBqGn9z/JY1Y+XcWMu1164fTMzR2MuhLv4iGhKFEvITze8y1XQ==
X-Received: by 10.55.139.5 with SMTP id n5mr14447849qkd.90.1505134098039;
	Mon, 11 Sep 2017 05:48:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	c11sm5750705qth.13.2017.09.11.05.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:48:17 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:48:12 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:54 -0300
Message-Id: <20170911124558.2863-23-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 22/26] go-cross: take GOARM environment setting
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
X-List-Received-Date: Mon, 11 Sep 2017 12:48:17 -0000

From: Matt Madison <matt@madison.systems>

Instead of hard-coding GOARM to ${TARGET_GOARM} in
the wrapper script, take it from an existing
environment setting if present.  This allows the
same cross-compiler to be used for different ARM
targets.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- new patch

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

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


