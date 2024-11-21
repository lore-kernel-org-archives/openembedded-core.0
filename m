Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF6AE6402F
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:41 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.10476.1732226074736983157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qaq6GVxI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ee7e87f6e4so1264624a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226074; x=1732830874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmTbQUgFd1YxfIFgU+MPCIeyjMubcm3aDZstOocEug8=;
        b=Qaq6GVxIt1IJwKykA4N3SkFYqPemnz5Wq2FW8e5FmfrPNei5Cmo3jZqjOtziXgZlsC
         t9dF5uoyMPZz7/zKwrNuO7cwZeRmyryyjDJ5Nm6vAdsTtdGxYX6kIgvv7SURLtsANGKK
         t4DiSrzcCM4KrrJ9LXIc7MHVrln4teJZuuedmAuo+p9LSgWXwvmk7m+3rvQEYjNp2dHC
         kqnERFx5HAb2UJ9axnM8f5VjdlW7xMtDGAPKj6WnS6hXn5WmIubhgm8VpvlZx9C6Mzxo
         cCqpF1ew4YRi5hYlkSDs1JamaLuwRkHZ+YSZb4UTnBIkRS524/xafvtdBG1FXaiznWi3
         5+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226074; x=1732830874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmTbQUgFd1YxfIFgU+MPCIeyjMubcm3aDZstOocEug8=;
        b=YoKPsmpBcBIHMQyuIFSpTwsGcuee0+8MVtmOZlb9wUKWLqbHUOAqU2sb5+eaTXkxJd
         k61PvUfP5gUoWdQpWGwD1P15YnCWARJgvI28OoTHyMF0DXfnnfF44wZfSitixz0CgTY6
         zupzJPPTwEvI6WU+jCdY/XQGvbL+EGGk1Gf9ciJ++KYCzDwySAHxSwFv2IIbcspdgY/q
         nCkXVqu89TbZyNYtwGy79lQ5fPPfx7tLqKzXz3austkddrFdsV1UMp7jkphchuYWC+BY
         2ECG6BH9UnaZn/lDQAvPnwCyPR6ZnSwGzhZh3j2X3piEiXfAW12VTJ6YvxZ3eEVOJATh
         6K0A==
X-Gm-Message-State: AOJu0YxpVBWECU1B7XcIZg+WKWbsyPDX3t8T/DvBnVNcCS/EVx2OsvaU
	I5/LkTdUM0VT3Cs/RuKQ+picLDO9WccxCVBoukq831wSWxVJ3GYE5xKMcoD51KuxtVRdBJtPeT9
	i
X-Gm-Gg: ASbGnctHyx7tGh7BhK+7RAOko56gkVue1dcGxUO/k3NdGPgDRZpqf3iG6N5vvgXkWs1
	71/XUWp5BqhpHOgeiG5InpKkzdM9ioUN9RlxCia4VLJQrpQEyjBIu/tmMHU2TIiyodGih262a0r
	9vFSafzbW/ew1K6kIsvLPvE37S1VzwVokizz2wgs/L7HD08dNSyhsBW+Bc9FrB2rd59J6JZepJG
	FwmEFziO+efsY4HiEFOWlbsTMggVnjJwLrZjZM=
X-Google-Smtp-Source: AGHT+IG9JqDTGeUJuzRHw8UYFNBAOTg4CUhoGFfzQ9uHmbGS0OPuQVS59ZxSyFAw5/uZ0PScxn0aqw==
X-Received: by 2002:a05:6a20:2591:b0:1db:ebe4:326c with SMTP id adf61e73a8af0-1e09e3cb551mr599070637.8.1732226073957;
        Thu, 21 Nov 2024 13:54:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/27] uboot-sign: fix concat_dtb arguments
Date: Thu, 21 Nov 2024 13:53:58 -0800
Message-Id: <184fbbe6910491bd26eefc2230069abb11333444.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207563

From: Clayton Casciato <majortomtosourcecontrol@gmail.com>

Fixes [YOCTO #15642]

Ensure empty argument passed from do_uboot_assemble_fitimage is passed to
concat_dtb

Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3c473785e5ceef677ff2b77c5fc17f5704c622f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 3e5f5dcf66..a17be745ce 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -338,7 +338,7 @@ uboot_assemble_fitimage_helper() {
 	binary="$2"
 
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
-		concat_dtb $type $binary
+		concat_dtb "$type" "$binary"
 	fi
 
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ]; then
-- 
2.34.1


