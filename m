Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7ACC25B7F
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.12949.1715774186507829269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fBHqtEY1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.175, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e43c481b53so80126821fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774184; x=1716378984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRxTa+/sAJnJU4qV2c+jK7YkNtsDSOgOCLKH5t6oNSw=;
        b=fBHqtEY1dLQuYDhXbWF7ALmM/qL4dVwvAGArDUxt92x+/9Jsd5K+MrA/dTkBrqxnb2
         1QPLdDgb2bO5yNccYk1KTOPf88bMdVX3hsMybJ41SQuI6U0MwCibJugCvIHzPF1uCex+
         uRBTGpLgsuQR9/QaQtLQzYuLA7J8KaWCE7Ot0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774184; x=1716378984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRxTa+/sAJnJU4qV2c+jK7YkNtsDSOgOCLKH5t6oNSw=;
        b=WfHKm7OIAAmCOnyAKZsU2gsQJR8/+D1MFcst58MBTRSgIpZrvbTfDHfgzJftMAJurj
         pit0GpbNp7yr9sirTfhdCU+C4vPwoSie35cn21awV6/pkBTsPMbl0L7f/XWev+lE5n0+
         QkAcUeIXzAUpL8y18fSroxnPcD6ukB1CVfpqiuI9OU1MyrCYj/AmZxJELyc+oQ8KrEqY
         K+bPx/k3gKIXvSbxqaOqv5GwndyW9R+hNXLGYjqQAoptq9ii25FFxdNjqYXAU4EL2S/y
         noOPMq+ENfGdWYJH+FKsD2k1OrGc0EcYikrEeRmrd3tXbrTg4rYMGd9baFE+lzbrevdA
         SgFA==
X-Gm-Message-State: AOJu0YzFKDz30ERtCjAtEUN3hdgvOQJ8MswTrf945AW9m/72E3Xq9Uta
	JgOch4gYZ9s835jOFrCDUDMhissDXA2UA56huuYUPYV68DOFeyWRpCnaNDYRDDCagjJCJ9pWx/A
	kIzE=
X-Google-Smtp-Source: AGHT+IGTJQIcLteBFqDL/jYj2yxMLo6+bthXvqmBeu8SOFPr4UXTPrT+vKo9Op9xnxKVB7VBXAFDXQ==
X-Received: by 2002:a2e:e02:0:b0:2d4:54f2:c409 with SMTP id 38308e7fff4ca-2e52028d78emr93840231fa.38.1715774183954;
        Wed, 15 May 2024 04:56:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] at: Tweak UNPACKDIR reference
Date: Wed, 15 May 2024 12:56:13 +0100
Message-Id: <20240515115620.420558-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199279

${UNPACKDIR}/${BP} is ${S} so use the correct variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/at/at_3.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index 0162548d337..112d1c4adcb 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -70,7 +70,7 @@ do_install () {
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/atd.service
 
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -D -m 0644 ${UNPACKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
+		install -D -m 0644 ${S}/pam.conf ${D}${sysconfdir}/pam.d/atd
 	fi
         rm -f ${D}${datadir}/at/batch-job
 }
-- 
2.40.1


