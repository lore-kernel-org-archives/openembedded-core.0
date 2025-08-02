Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1F9C87FC9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 21:01:12 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.5971.1754168467643186867
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 14:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=vuHfIehf;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.219.42, mailfrom: anakin@childerhose.ca)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-7076eaa5febso8494806d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754168466; x=1754773266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFzI1GhtoGzGxWfOCRVGa0hQbVpLeuVYULB/CYC5MNo=;
        b=vuHfIehfdZ/rI6idnnAVOO7A2EmvIfsxR4CD9lrod2idQJzp/PEp6CYsIeS/x+5CaW
         7OIwxhBjX1JPmhK555wc1bNy6PK20L91nY1cvlshtzV9EQSVdU20OToPvH48SHkwIqEY
         DuMaBoVxh0T10wVQoZ9gQ2r1JFsp4bN/8aj1yJmo3t5UbCSJGgGRc5wk8P7Jti1RvPVf
         215b4gK6Kc+t5S8qn5JdPWydCspkcVMqA4j2n+iO3djfj7vlxiAZPrW6aFaoQ9XJsXRV
         l+sg2axglCP5HtbPzJXFnMfJnDuD5O474HNwhPauYv0uUSIpVvBnpA/6pHud7EgRKIZe
         4b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754168466; x=1754773266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFzI1GhtoGzGxWfOCRVGa0hQbVpLeuVYULB/CYC5MNo=;
        b=rhmchG5cv89/fbxlgd+5/kedeCKVD1cQDdeK2sT4LhYvMMoLCEBQ97xtiw9UrTDrEL
         MQsDF82/p0+WQ+0Fu5rcxPwKkEJv2w8Y8L6e4kc4qv11cueFsoAfPdrXs5aLgg2+m4zU
         Gc9+HulqMeM2GhF+hF440R8ADtAgYgZKslllrZoAEs5Wb/INqPZsA/U3A659EaJnexYa
         Z3QNpaCTGsWM7ruFxZPVS/0a061TGmilaNl3UR8u1PTY0zT16pN2UGHoRROHDvT6Ej/K
         ZJSYIER16e+Ob/4scsuWy4LqpCx7pDm5tY0HJ/FG1p1UCaQfWtyTLW2fXc6Dbrrisu88
         iwrw==
X-Gm-Message-State: AOJu0YzY/17kFQmSy1+IBh+vtyRa6vQibJxqDyrFALkJhQqG49dmsIdy
	SZD3WjnMq2mCAQ5PgEqao05V22E4qWardxIIsQ1LB5yBIZ35oAsU48kpa2cshJEFrOhbQoWdvPP
	2s+7/LIaO9g==
X-Gm-Gg: ASbGncu6nInUA7Vz4JfUIoVu1fSL+aXJ+ZqXcn+6MThOoi9/2uNs/26hbVRrhzuqT78
	UNShJSBvatdXv5d1GizUzpveZYE+Nmo4oH7GSZLq9e7rRM0jIgwZzP/lg2vK0m466VJndcdKHBp
	AUk0qWeb6Lq2oUdELcBn2skjGLdK0fHrGHkPNY3lrEn9HI9qYOyThK0weufJ+d12oK8iMFEjOCp
	COakrBN6KvVcM2uDX6Q3ATCruyZFBXsFFgvwyEIsJHTpqOPJtAb2K+by2mqyPkyClOH+ht4YKmc
	boezZzLR+aVFiggamLLTmRC/XeEEnTQHMhjpZkV5VNi6NeEIf3f0V46vFSyAAaWl9Vco9pDnSwS
	tOQa9XuBnZIwKFcfp
X-Google-Smtp-Source: AGHT+IHcEXss3Le1FBlLnp+w0c2W3dQPiq2fdg/xjdLofNPro5Uw42QrogiFTU7yCYOVGmPH79DBfA==
X-Received: by 2002:a05:6214:246f:b0:704:f94e:b5d6 with SMTP id 6a1803df08f44-70936338f46mr66914836d6.46.1754168466094;
        Sat, 02 Aug 2025 14:01:06 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm39134646d6.70.2025.08.02.14.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 14:01:05 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 1/2] cmake.bbclass: inherit compile_commands.bbclass
Date: Sat,  2 Aug 2025 17:01:06 -0400
Message-ID: <20250802210107.19804-2-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802210107.19804-1-anakin@childerhose.ca>
References: <20250802210107.19804-1-anakin@childerhose.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 21:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221386

cmake.bbclass generates a compile_commands.json file by default in ${B}.
To automatically configure the clangd language server, link the
compile_commands.json file to ${S} via compile_commands.bbclass.

Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 1488d744d4..2da4a9a6c5 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit compile_commands
+
 # Path to the CMake file to process.
 OECMAKE_SOURCEPATH ??= "${S}"
 
-- 
2.50.1


