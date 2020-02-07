Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 659E060EDC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 15:28:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w12so3196071wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 07:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8h3aniErDTxfBkXHwTtvF6qaPaiIA0+w7aCWs0gwHc8=;
	b=TGmZ2b0IylDnng8t2iE5ql8Jmq7QC6oXDepbez3MaV1TRjAS4wGFyAjgzIwJl6Fmdm
	67D2DFkpfsWsJsHeBS6UokEBdBdW9I7cHQ8duQdPckz5/fjaNzNxy8HOtNlBsmfzNJsn
	hdTcwtNVh2P+ByZ434uD/0VAl7MQEbzJLknnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8h3aniErDTxfBkXHwTtvF6qaPaiIA0+w7aCWs0gwHc8=;
	b=s1qwg+bFJMqSAZoSmmcVMMTZ/iFQ6P5TWqwSSYNqNOFqRtSJ5E/GUCW8/Opw5TmJ8j
	pOWw/qNhH1385v1NSTCTYjnRw+bX6129+2ksbY2W7OTbVNdlj39f+KlL2TTSBSZ6lQsh
	OF1uz7GHf0VHQCb+YJBNUP233ngq9VE5JpUSx/fKPOtlhbN1YJ+OKtzyQhwhQjygTkTW
	JViv/GZDCR6vrEA/bqgfgXKbP9ZtAhRWYa7OyZrfqjjVNndyqyjrEYlR9J8FX7ron6hu
	EmTQIEmDdUucwqUQPI8flyWjrP2GSAyZW1VYKAvPFJw6uWziiwgsnbz0tvuZIi4gAPTK
	d6ng==
X-Gm-Message-State: APjAAAUCkQh1/fPmQsLoDrR/B2fKZB4babxg7USx41krg6wcw9bDd1Bx
	AniW80aHYwxPii6yRSaQxxJaH6TgpUw=
X-Google-Smtp-Source: APXvYqymaeqjDAfM4hAtNvfbjgqYduXNttag/Mk+h0BqUmYTyGEST/eAbTDL3+57BiZConFXfyX4Bw==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr5398386wrp.203.1581089285608; 
	Fri, 07 Feb 2020 07:28:05 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h13sm4242630wrw.54.2020.02.07.07.28.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 07:28:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 15:28:03 +0000
Message-Id: <20200207152803.9633-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] ncurses: Fix reproducibility issue
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
X-List-Received-Date: Fri, 07 Feb 2020 15:28:05 -0000
Content-Transfer-Encoding: 8bit

The build was deciding whether to rename manpages based upon the presence of
/etc/debian_version. Be explicit about the configuration instead and
ensure determinism.

[YOCTO #13781]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ncurses/ncurses.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 5f2cc358233..b7bf4c0d81c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -87,6 +87,7 @@ ncurses_configure() {
 	        --disable-rpath-hack \
 		${EXCONFIG_ARGS} \
 	        --with-manpage-format=normal \
+	        --without-manpage-renames \
 	        --disable-stripping \
 	        "$@" || return 1
 	cd ..
-- 
2.20.1


