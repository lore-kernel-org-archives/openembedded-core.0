Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E237D172BE
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13360.1770113972421728373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=c1tyfdI9;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359a302794so3715129f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113970; x=1770718770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rvrEdw9rY3VIakIu2LZnyijy7NIiePsjtf6cb1WcQo=;
        b=c1tyfdI9c2s9NCwhhDu4RBOsRu2sjHpXI5wMF3VpvSkSjkAdoeEEbrhPWt1AJa6zz1
         B79rhYPtisaJGmSwP7lZe/Om8nmb3BePzwNKsl+OCzBAgC0/Nshy1KzuR5CPBEU6YmS6
         Gq3MLWGfTztEtGHf+QYQx/+P9UtCLT4tFhb6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113970; x=1770718770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1rvrEdw9rY3VIakIu2LZnyijy7NIiePsjtf6cb1WcQo=;
        b=dfEoI1P4sa0/TfYCS2kNg9W8NZPienbamI2AEQp2HZPCylfZhlcytrDg8kw3euE0k8
         0v89gnDlG6APRtqiBWpluRkLt9hC3OmFhHvfjkWqzg8DCxghb1eErmvTtLpwW694hx49
         Cnf+HPdMdq01zKSt1XlvqfyLI0Fx9bV79TFt+Q32npmC91X2wjRGpVXjJSTtpxQjh7MW
         kZoWSVzNqkfRfilVQjrTH2YXF7uo4a0GG7inwn/Dy6cb9SLk55QtlBU0rHpFVqHu/Kgj
         0/1z9RX/Fv5/Guhll1wFXlQjMgVI4CjD5LdAZVzcTF9krbx6yHyI2zwWCdX3er/qvi6q
         d76A==
X-Gm-Message-State: AOJu0YyscYhMOcB/V/7HlANZnJyjr9h3tsU85coPFpc7tOSzpNWt5dMO
	Ed1RM17TO727neZc5iGFDRfSSxdI091AOIBT+nAu0GcuIIEJttbPN9clC+s48L/leJjavua5i+r
	wMSliM24=
X-Gm-Gg: AZuq6aLygKzQyHTdn2Ln+aGpQoisncz/Kl6mT94DZAwEfTrGNMOOOlMVnaro6uX5N5g
	b6reA2DcEQUfr5W0/mSkVFdIxOk7zq+Yyt5xUbFJHs16n87Itc19E+q0Z0LQhYKkR6Gn4NHW76f
	Et4yunOVRqY3x81ROyNhTYuyafNgobScw4dCYIlcZ37FB/K4VdYb2ZeWc7D0RrvDlNjeaN/bhg7
	1Ft/8TMe//ZIO563LW76PzpdITUX/fIY2z4z9BueEEgtPqv5xwV0APE4N2rW531XzfJ+xiRTPrF
	fEVv2GHMkO4seS5dDIXKk6BrezobDqxiTQz667GanNmSqaAnQo3Bcq1e4WDUeUP2yEeCDnz8tLx
	9ARAVBxamNdFhwGvZcxcueqwUENroUdluz+TQRNksTMKPey+0yj3H2R/AikzQZoUVrl12Su1yZP
	eL9iFemWnCRc58NLZXunW+2DCVaQ1/MrfoVsH0USjutSWsVQ7unXepQvrEJB2H9DEsadgaO4QHz
	D42AsGYis6QD8w=
X-Received: by 2002:a05:6000:1868:b0:430:fd60:93fb with SMTP id ffacd0b85a97d-435f3aae16amr20270506f8f.32.1770113970326;
        Tue, 03 Feb 2026 02:19:30 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 12/22] docbook-xml-dtd4: fix the fetching failure
Date: Tue,  3 Feb 2026 11:16:41 +0100
Message-ID: <0bd1e63f90a3ee74f936b61acb820c9d454fca1d.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230440

From: Khai Dang <khaidangbk1998@gmail.com>

Updating SRC_URI, the old archive url is deprecated.

Signed-off-by: Khai Dang <khai.dang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c137d3637b6171fbd3bfd671a56096e7f2b3c318)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../docbook-xml/docbook-xml-dtd4_4.5.bb                | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 1148d536944..ea0861823d3 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://docbook-4.5/docbookx.dtd;beginline=15;endline=30;md5=
                     file://LICENSE-OASIS;md5=b9ee6208caa6e66c68dfad6f31d73f92"
 
 # Install the latest 4.5 DTDs, and the previous releases for backward compatibility.
-SRC_URI = "https://docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-4.1.2 \
-           https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-4.2 \
-           https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-4.3 \
-           https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-4.4 \
-           https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-${PV} \
+SRC_URI = "https://archive.docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-4.1.2 \
+           https://archive.docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-4.2 \
+           https://archive.docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-4.3 \
+           https://archive.docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-4.4 \
+           https://archive.docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-${PV} \
            file://docbook-xml-update-catalog.xml.patch \
            file://LICENSE-OASIS"
 

