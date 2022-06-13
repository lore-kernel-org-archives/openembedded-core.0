Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E49FCCA47F
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.6327.1655130129724635385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Xg4omNFP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id r1so5210496plo.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nPLGEZXmX7bxL4VD5j6VqUIPFcbIey2Cg5wDYIhQ3WI=;
        b=Xg4omNFPtfmvdATQCQCeMf2zyOcVz/me27TMamMC7qPWM3KMWDN2+sXMIgq2HB0eyw
         OACE2nRfH5th8H+wXb4QWdxMHUSU/1LeGXWQ439vVGw0gHrRIw60Ss20ZoK5t3xF4BJe
         iDthmqg/tZak3KaGtYfsVOZE8fzQNG334Y5n1IShnY6H84lwqQtDngmEuZfOgst0qAXE
         7gquTT/xJ5s7j2eA/uubZRSvBl7QgSAya53UGrK6ZKj5Z3jjmQpR6hzGsr38hg6T7Liz
         R3YAWMKsOajOLT9XUY5/Mplt5os4Azw822T0pYPylfmX46/lZs78aTzW9twcyT1hAr2/
         hR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nPLGEZXmX7bxL4VD5j6VqUIPFcbIey2Cg5wDYIhQ3WI=;
        b=dfHxnXQ2DcvHPy722g5DD/O80+WdaJBBspfIQUbxBJUCU6zErFlKLavV+9LqKfVEti
         p1a9EI+je53boRnRPVeLyQ3g/lNFaMkmlr8HnUQJLqTHLsFVroK7CcK//0/QMjwLLha1
         km/kpIAr7ZEihlOF2shgHpn6lb1IfpXfWGGTo7IdSfWLdo6Xo6U+FP7qa6HSrSZoamkW
         nxblK1b+d0BBwGI5P4rRJoh7lOk+u9ccW6xbVJuct0o9sxeQ4GjMonMj9cHRYbZaXkmv
         rd3FXlYfNjH0LElWyTmQuWPLp3sHDMFQblmXWKG8in93ut274LOGorIXk8tx8DsgUstS
         b+xA==
X-Gm-Message-State: AJIora9uVb7l1b3nNqO9BfjdoFZPsX8LZ4BcsnB2B4yeUeIqdTLVLkJP
	TORQJZ1Fy166g1ElrxjTCQ7s5oLi0acG2qC5
X-Google-Smtp-Source: 
 AGRyM1uq/ulKmjfh84v5Jp93kIBpm+XhgR8oZ4QzKotKa5Rcya5UeyjCAZZqUwNcNlvQHmT7AsNZ9g==
X-Received: by 2002:a17:90b:3806:b0:1e2:adc5:d192 with SMTP id
 mq6-20020a17090b380600b001e2adc5d192mr7245pjb.223.1655130128631;
        Mon, 13 Jun 2022 07:22:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/20] perl: Add dependency on make-native to
 avoid race issues
Date: Mon, 13 Jun 2022 04:21:34 -1000
Message-Id: 
 <6b1bc1366bf88ec3b77fe9db44813c4dfd545a7d.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166847

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Make 4.1 has race issues with double colon usage in makefiles which are common
in MakeMaker generated code in perl. Add a dependency on make-native to avoid
this as it is relaitvely low overhead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 692b7c518637c77804caf7b3cfc60a83afa2e4f4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl_5.34.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
index 4b9d2e2c50..42bcb8b1bc 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -33,6 +33,8 @@ S = "${WORKDIR}/perl-${PV}"
 inherit upstream-version-is-even update-alternatives
 
 DEPENDS += "perlcross-native zlib virtual/crypt"
+# make 4.1 has race issues with the double-colon usage of MakeMaker, see #14096
+DEPENDS += "make-native"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
-- 
2.25.1


