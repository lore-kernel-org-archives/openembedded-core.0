Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B30DC74A5B
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:14 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.44012.1679494924098682818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=B+hgHnZl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id x15so8311640pjk.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlUu2xEA9LlTTRP1hUzF0BDZ6tRGM+5NZpqYeMXRjp4=;
        b=B+hgHnZlTFaWnDCqjLndxTw8LDBIkMo3PC00p3XQtAJS7bsOYokK1ZJmPvtXzSU6/s
         9upFmdMF9xyKpqJ5iPugS54nnQQMCmV7utyI/tXY5JGlYfHxaX+exa1SafnCYYrOPWy0
         IAz99vuMj7mEOsNkpFLMhgRCsKr9ZVKdMhupHAjA965mxQ+5Lsbbmxt3HjCG9o03UDN0
         YHT1ka7yXVjTtjVGKIfv6cvTaT2JvA/dnSu3AKvEtCuVsRdQtGsKnCday5wjBGInVz8m
         foz5kDM76TWCJWEQO9B+hd41G4Xn5zy+khZc8De6h7o+DeCzl4cwB7R1fyC0wu8IYq43
         q6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlUu2xEA9LlTTRP1hUzF0BDZ6tRGM+5NZpqYeMXRjp4=;
        b=TJY2WjOcpKWQzIHCtPt8B/K7R+G1/GCzu+7AMru6kS6/7qJxUrOJamGN6KRd/auBoo
         sGxwBdcm5/7D01b2u3UE6pMSGk+gZzPdHxySAu0lhFVy+TUNZ5Zqkgn7poaOg7nkm4Gs
         I2XD6TppVXm4a5zlzTA8V9GxKajeETGNyHehMVd2LWetoED8qCNiGVuaGBIJcLbwUfkB
         Kk3RIcQ0KVwYIdmeQr7mEESeoZeemnzyF4Es1paiDeRev5lOG5AzQBhK85ixJt3SZ3EL
         6WBaLxx8cFiBQC2xCrLumVpal1vbY+8GMG50ePiTLnrEN2WoxUIqmF8XaaG4jf3pUdE1
         jJ1w==
X-Gm-Message-State: AO0yUKURgKZ3/foSChmzO6kSEUNuh+PznybkKEc37k11eoKsvbufhYy/
	8GC6HIwx/DMdK1ml3nwV3DFHY4gooGwVTCeJh+0=
X-Google-Smtp-Source: AK7set/frgJG3yGOFpWNSkEUIUbEB2ca43Dy7+JmQ8MnEAGkEzQ05SipElvc9ACNAKkJPQEv391JmQ==
X-Received: by 2002:a05:6a20:dc9e:b0:db:701:3857 with SMTP id ky30-20020a056a20dc9e00b000db07013857mr3321024pzb.34.1679494923199;
        Wed, 22 Mar 2023 07:22:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/21] image_types: fix multiubi var init
Date: Wed, 22 Mar 2023 04:21:27 -1000
Message-Id: <417b096d5cf51f5b947bccc32e6be97a93aed9d6.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178933

From: Romuald Jeanne <romuald.jeanne@st.com>

Make sure to expand all MKUBIFS_ARGS_<label> and UBINIZE_ARGS_<label> vars
in 'do_image_multiubi' task to use them to init the local 'mkubifs_args'
and 'ubinize_args' vars.

See [YOCTO #15065]

Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09d05215cf61981c7bc828cc0ff64c2fd5edc43c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image_types.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index c6cb8f5336..e4939af459 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -209,7 +209,10 @@ multiubi_mkfs() {
 	fi
 }
 
+MULTIUBI_ARGS = "MKUBIFS_ARGS UBINIZE_ARGS"
+
 IMAGE_CMD:multiubi () {
+	${@' '.join(['%s_%s="%s";' % (arg, name, d.getVar('%s_%s' % (arg, name))) for arg in d.getVar('MULTIUBI_ARGS').split() for name in d.getVar('MULTIUBI_BUILD').split()])}
 	# Split MKUBIFS_ARGS_<name> and UBINIZE_ARGS_<name>
 	for name in ${MULTIUBI_BUILD}; do
 		eval local mkubifs_args=\"\$MKUBIFS_ARGS_${name}\"
-- 
2.34.1


