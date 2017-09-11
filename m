Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2C9878422
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:30:08 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l25so3156111qtf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=u/gqmf6C7hymJJoRr67Fed1ZQkUpaMQ7cCVgz6bdMGk=;
	b=javMcr8vZz5i6QyF4jzmQTpzsTOplkdOPf3qQa6WZezasEkUeL5HS8lfzRonpp0zr/
	Ulvxd7oQ2MscaoUJ6d7S4XxCKhO7KdVmdU1ELvhjbeEPZY8s1ICkwPjGQpcxXpb37Xu8
	WCQ87T3UXXd3El7R1hmfhp4MT056jnDV6wRWWko/T+Ccz6Yb5//9pn0T7jHE2RJYEE1x
	uldmVrgHEFIOSk9dttkTG7wku50Fj6C4h/+MoRef9IRyMpzVui8JuCoGlKOk8+rmqPlV
	TgK3eWEd6fCnswd4/rFXhlqCzrkjecPuEio2lWnLA+x50CXlkcWzS1EwVQhsSMiVArp8
	gneA==
X-Gm-Message-State: AHPjjUgtYsBUj0dV7sdp2h2eL8lk5ZH4EwmORNGo2my4w93Mm/RfZDVx
	NpGJ1r9HuzIg66Xc
X-Google-Smtp-Source: AOwi7QDPfBHwsFlAxlYhtzV8jifKId2UBBAK8Sp4CsCc/uLtVWElbeYAwuc+eHHNXlIrqSM1B48hng==
X-Received: by 10.200.34.167 with SMTP id f36mr7383284qta.173.1505154609385;
	Mon, 11 Sep 2017 11:30:09 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u133sm6364536qka.92.2017.09.11.11.30.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:30:08 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:30:02 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:49 -0300
Message-Id: <20170911182853.11076-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 08/12] go-cross: take GOARM environment setting
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
X-List-Received-Date: Mon, 11 Sep 2017 18:30:09 -0000

From: Matt Madison <matt@madison.systems>

Instead of hard-coding GOARM to ${TARGET_GOARM} in
the wrapper script, take it from an existing
environment setting if present.  This allows the
same cross-compiler to be used for different ARM
targets.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


