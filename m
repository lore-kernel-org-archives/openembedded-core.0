Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7025DE64037
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.10486.1732226087466811722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AJByqzrT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7245a9d0e92so1554964b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226087; x=1732830887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xikLmiroHNHs9rHyNY1Pd2Lk1hzLmdNLLVa4lx2knPA=;
        b=AJByqzrTRHvTNazHatGB8JCr/hoRA3VTQGnSMDKtRK4F9vqRO8L5yOfVxQ4BTixS6H
         dxUeqV3wRSM++uS24sXoSPspwePRJN5GKFCu2z8VmQAzZDLKRtaIwbrx7DMP0TP16sjo
         3QXr09MG5Advx6+k7a5EZXxzsvPqyifnQAsHaM+52CTZGEMetxWmmlis68X/Cf3rl048
         QfcKA6beklfGe+I0xbj+l0GvdeKpFZcR0rV57XqPkqC+K3wUDDRISWnmVOEo/2/fSwER
         +uo7VHMVL2mEZnSVoZRQrdNXOsLoVo9S6kbFccNArrhrwmfgyjjjZ8pFTg5wA11BouMC
         9zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226087; x=1732830887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xikLmiroHNHs9rHyNY1Pd2Lk1hzLmdNLLVa4lx2knPA=;
        b=tEhnVSlI2prHfXQOrHTDg4FGp2ONYrG5Xa2R/KebYpjYxlifqI0kPslPYGaJKeGdb2
         5IZU9Wf9ltwRAlLIGZ8TjXeBxnRV/UZD4+nFvq22DlSEy4Ub2U0bG7du+ACK4q1tLyGg
         O9fbxwbxX+8jO+WxB+xkqfbxR+HGOGMaO0aYmtXZsjiazIIyZ/kFgasNUE3xVcLmmK2k
         J1r3pZ2xIhEZLVkJe6pn4YRTKo4cmfXeIpFvd+ZzxlPl3fbdBvoTIUPcglIdR8BzbmuX
         b75Z/h0JQ3i81aOfOfBeGupGAJEs+805vE8OjT1y9xKwNpo1ztzd886z0XHWuHg9673i
         L2Ew==
X-Gm-Message-State: AOJu0YxnngjcYxLqCJgaHwtCSVn8Qdgpe7zn1a2k4i9R4qLVXtJaJ6nr
	jQxnbwtcGfR8PXx/2d2dZdASQB1CMljWrwrvGZivVzCjZ5jhWJurel55MQKZIeCJbxwzYYfYW2o
	H
X-Gm-Gg: ASbGncvecDo55cfGeAfZdPz/j9ApJzZUt/lD7GJeuLujZquavn39o5lT0iVZN0ShTJF
	z/fviKOVX7p9KmEjjKb5SwJuKjqp8ez658keTmU25oNEdD4tGGUMfVGkazjKMGmn83gGcAurxpG
	Ad9EfwqbxeKOFnTTHr3q2fjHWDpcCoH+5o4HaReKCQAHW9oKFeqz2uVeLKeMRaSr7F7cXbbaV0D
	DBrsB1Imctj8GBFrTOGKN/aHvAuYU0Cg15n93c=
X-Google-Smtp-Source: AGHT+IHA1dwn0IiNM8PNud3kaH40FcFTmdTcxhGLIVZZOEv3yPutQ9Sa9+HGPI6DXf3gw3NeHdRBpw==
X-Received: by 2002:a05:6a00:9297:b0:71e:82b4:6e6e with SMTP id d2e1a72fcca58-724df3c27d8mr715471b3a.4.1732226085214;
        Thu, 21 Nov 2024 13:54:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/27] toolchain-shar-extract.sh: exit when post-relocate-setup.sh fails
Date: Thu, 21 Nov 2024 13:54:06 -0800
Message-Id: <69049104db497e5b01a78e93d83d7e6cd4b2e9e9.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207571

From: Chen Qi <Qi.Chen@windriver.com>

When LD_LIBRARY_PATH is set, post-relocate-setup.sh will fail and
exit properly. But such failure is ignored and the SDK installation
will continue and tell user that things succeed. This is misleading.
So exit immediately if post-relocate-setup.sh fails.

Fixes [Yocto #15586]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8e2dcc1f71aa33cc6e56dfdebebbe7ef010c944)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-extract.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 89d30005fd..3b4647fca7 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -286,6 +286,10 @@ post_relocate="$target_sdk_dir/post-relocate-setup.sh"
 if [ -e "$post_relocate" ]; then
 	$SUDO_EXEC sed -e "s:@SDKPATH@:$target_sdk_dir:g" -i $post_relocate
 	$SUDO_EXEC /bin/sh $post_relocate "$target_sdk_dir" "@SDKPATH@"
+	if [ $? -ne 0 ]; then
+		echo "Executing $post_relocate failed"
+		exit 1
+	fi
 	$SUDO_EXEC rm -f $post_relocate
 fi
 
-- 
2.34.1


