Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFBAC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 08:24:00 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.59376.1672734230045236831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 00:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R4VKXpLS;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id fy8so7920395ejc.13
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 00:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2YC82x2QKTaqxZW9+AhXOI1cSQlSYetjRkT4kHL/J8=;
        b=R4VKXpLSMgdIpRtcYnSWUJ6W/yWYFCXKmcOC98HBH7LZzIPUbUJUg39hoIPD/9loRp
         r71EgK5bPgUld2NemBsFTzrAQX3faXFxLhgNed+Q5s3Z+H+k7WWJsIqaoyny7MIIXskJ
         HrJi6Joh+E90QkcT+78/DhMS4qRtJH7wvufKmf3UzjQxh3gnKY3akwZ2XpLPuqr/DtPV
         3ybFs8+WEeuosZwPG7utCkwf7e9qMlR4cMm+KqWDwDPozBeDXppMTi5frtXGY0PfO1zd
         7DdR1zxrvIqT3xdudlNDtYnjZT4BEf49FW6C47/h9UKpAad2Gr0i493/Q6Mq2Miv3DvQ
         p0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2YC82x2QKTaqxZW9+AhXOI1cSQlSYetjRkT4kHL/J8=;
        b=1SQquY2toj/pFFziSOGAAOJE/6SrkietD4UqY+alkuwH3mtcD4raSacnULt0zBokZc
         4nabSrHNqcnNi+QsvLS6g+yAjOpHKwJE2KxufVmzS2uVglRauQ+rHefe43GiHO7WnEPL
         FXBbiw1KSCYypgTBicC86M0fCck7jRwPlWllTn9oZtfGbDPtU6duFY9YKRIQQCCEEBDZ
         HWDnkPBDUvJS6PKmtnqo5Sl9OOzfUKViiOX6wjvnIDf+xuI5hlDLXK8dX4uOZvJRrCjm
         jpBbVxSQ+6GWk5MI5j/XEbrCdT5CtomOVEwuPlhSFwJueE1S6Ypb/6Ku+6zvINbkuQiq
         MVZw==
X-Gm-Message-State: AFqh2kq5/nyUpNy1DH+zEMP6ED9iit/JmWrUbTaKVXFAemTL/bETRCgs
	7TmBjI/QE9dO6rQ3aTWKX/56TFvrOXo=
X-Google-Smtp-Source: AMrXdXuAC87ws3Lqry8smk4sosZjdZn5fuOGMAf02EtUkBF18JkiK3kwjXLl8TPI2WLLdxyqIEO7KA==
X-Received: by 2002:a17:907:c717:b0:7c1:ad6:638a with SMTP id ty23-20020a170907c71700b007c10ad6638amr40036741ejc.17.1672734227238;
        Tue, 03 Jan 2023 00:23:47 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-136-29.ptr.icomera.net. [185.104.136.29])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906538300b0082535e2da13sm13861040ejo.6.2023.01.03.00.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 00:23:45 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 2/2] default-distrovars: Include "c" in IMAGE_LINGUAS for glibc
Date: Tue,  3 Jan 2023 08:23:34 +0000
Message-Id: <20230103082334.288617-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103082334.288617-1-alex.kiernan@gmail.com>
References: <20230103082334.288617-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 08:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175338

glibc 2.35 introduced C.UTF-8, we should include this by default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Switch to DEFAULT_IMAGE_LINGUAS so that override ordering is obvious

 meta/conf/distro/include/default-distrovars.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index abf48f79f08a..d05390d3cc8c 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -4,7 +4,10 @@ OEINCLUDELOGS ?= "yes"
 KERNEL_CONSOLE ?= "ttyS0"
 KEEPUIMAGE ??= "yes"
 
-IMAGE_LINGUAS ?= "en-us en-gb"
+DEFAULT_IMAGE_LINGUAS = "en-us en-gb"
+DEFAULT_IMAGE_LINGUAS:libc-glibc = "c en-us en-gb"
+IMAGE_LINGUAS ?= "${DEFAULT_IMAGE_LINGUAS}"
+
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
-- 
2.39.0


