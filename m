Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A05AC4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:05:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9844.1784556317289687888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JGLGdJon;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956242332dso5931185e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784556315; x=1785161115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpgBrZbCWXI+tRQzJclti75sCSCaIRZgheKUpFnjfKM=;
        b=JGLGdJonObBpvY0JZGe6nynTGVBxOBHIukBR3oLy0mbtYOOpzLuZX7drf5skTEQKrl
         yN65FqZM46DSC6x3oZ+QpJxZXdn1ZbGIwdz/+Gluq9kmkVPLeAout7rJdx9wmBKSJmAI
         ozu0Xa/rHUk/V+vrIw60+AoO8viYVbgcnOhxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556315; x=1785161115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WpgBrZbCWXI+tRQzJclti75sCSCaIRZgheKUpFnjfKM=;
        b=X7nQkZs3jOO1kDpsZ1pAguUox0uU/pWfBcs5afqYqw9KG03ColfQnCytjQGmsOoDw2
         OG+HJi38+5eIjvruR7oyMpl4xqebaz23QiEUIyecqE2+eSlbrh67rnasTcZBF2B01p7Y
         Ax6wETRWqMN88fl7GyNSGyg/1FqZ8e2khqNgFJeaEWFAHQ37LFCD5O4v57CnLQ1XzPNv
         zKtfpy3LzTjgM3FLCkcGr7Cai96GNiz71Jqc7koHWVasEeCV8C0RfvcoO7KZAzv2CT5Q
         EqZ8MQEqylm1YT81QWUYv18Opn4BsgmRD27t5n+F94ROmDQrEcMaUxXidK9agAfj3MBt
         Z9wA==
X-Gm-Message-State: AOJu0YwM1goltd8cz9hsqgEwEOeIHUarphzhUpZ+dLKfBCXlfj4O96rd
	r5Glh/6WrG0Wo0qQidaCLyjN2vAoIfpqItR7fodnzJupPyddh6v+wxUCucU3nsLuCqz4D9lC4Xt
	rOxVqXqzCmQ==
X-Gm-Gg: AfdE7cnVEZhUWczkNUDNorWwWpJPqsjRBFWe+oT64HaBLcYAkNY6JiylfnwjgE7Ua6i
	4G19HxPn/nndhXZtCM4z8IYRtAAwrBn/CUzlvM9PTgrqr79RTq4ung2hElCDPjz36RZFXxBUWTz
	LVpFkjRLivcv/WRdlIExrFwyrrFL05XP8j7cyVjB4DnIZD32Wsp8KNLp2MjyS3pcgu1ZL5+qt4G
	4JyfKpoimFvRXfr6N2cAo52IRoECUluZsEEpnufUr6vNGDsvYDCSBnOKIdS7mc4ZtPwpJpMHMng
	VzL0+e5aewExFegnRag83O7ovsD8xhnr0D7eq/3bV/xN4CdlKmRxapIeeHpLQ2ghoXS7fnFVg5n
	bk7UE0zMY9dg6BsDdCo+WpJhxCMPFgJwxtMPghjc1nj78lhCk5vhUNdnbJBLqZVWbKIfuya3H05
	mrpe6lh8YniYvVPnPpLVS8+dl/F7WoLzslrwOkU2AtEoqKPwrgQTgprGH5SHqNUWxtphgPdNcPz
	LBtag3sJis1
X-Received: by 2002:a05:600c:4f81:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-4955b4a5c0amr63792645e9.19.1784556314012;
        Mon, 20 Jul 2026 07:05:14 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a47e64sm298695735e9.8.2026.07.20.07.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:05:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for scarthgap on Mon Jul 20 11:15:59 2026
Date: Mon, 20 Jul 2026 16:05:03 +0200
Message-ID: <20260720140505.1230265-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 14:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241401

Branch: scarthgap

New this week: 31 CVEs
CVE-2026-13221 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-13221 *
CVE-2026-39822 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39822 *
CVE-2026-40467 (CVSS3: N/A): gawk:gawk-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40467 *
CVE-2026-40468 (CVSS3: N/A): gawk:gawk-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40468 *
CVE-2026-40469 (CVSS3: N/A): gawk:gawk-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40469 *
CVE-2026-40553 (CVSS3: N/A): gawk:gawk-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40553 *
CVE-2026-42505 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42505 *
CVE-2026-52946 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52946 *
CVE-2026-52947 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52947 *
CVE-2026-52948 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52948 *
CVE-2026-52953 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52953 *
CVE-2026-52956 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52956 *
CVE-2026-52961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52961 *
CVE-2026-52988 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52988 *
CVE-2026-52990 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52990 *
CVE-2026-52991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52991 *
CVE-2026-53000 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53000 *
CVE-2026-53005 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53005 *
CVE-2026-53009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53009 *
CVE-2026-53010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53010 *
CVE-2026-53015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53015 *
CVE-2026-53017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53017 *
CVE-2026-53018 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53018 *
CVE-2026-53024 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53024 *
CVE-2026-53025 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53025 *
CVE-2026-53027 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53027 *
CVE-2026-56002 (CVSS3: N/A): libxfont:libxfont2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56002 *
CVE-2026-56288 (CVSS3: N/A): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56288 *
CVE-2026-56289 (CVSS3: N/A): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56289 *
CVE-2026-57432 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57432 *
CVE-2026-59890 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59890 *

Removed this week: 76 CVEs
CVE-2023-52920 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52920 *
CVE-2024-43826 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43826 *
CVE-2024-56647 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56647 *
CVE-2025-21682 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21682 *
CVE-2025-21739 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21739 *
CVE-2025-22125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22125 *
CVE-2025-38164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38164 *
CVE-2025-38426 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38426 *
CVE-2025-38531 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38531 *
CVE-2025-38584 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38584 *
CVE-2025-38704 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38704 *
CVE-2025-38710 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38710 *
CVE-2025-39748 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39748 *
CVE-2025-39764 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39764 *
CVE-2025-71152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71152 *
CVE-2025-71161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71161 *
CVE-2025-71203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71203 *
CVE-2025-71221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71221 *
CVE-2026-23066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23066 *
CVE-2026-23118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23118 *
CVE-2026-23138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23138 *
CVE-2026-23154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23154 *
CVE-2026-23157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23157 *
CVE-2026-23171 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23171 *
CVE-2026-23227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23227 *
CVE-2026-23272 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23272 *
CVE-2026-23330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23330 *
CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23374 *
CVE-2026-23389 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23389 *
CVE-2026-23394 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23394 *
CVE-2026-23399 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23399 *
CVE-2026-23442 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23442 *
CVE-2026-23444 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23444 *
CVE-2026-28417 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28417 *
CVE-2026-28420 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28420 *
CVE-2026-28421 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28421 *
CVE-2026-31440 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31440 *
CVE-2026-31449 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31449 *
CVE-2026-31488 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31488 *
CVE-2026-31489 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31489 *
CVE-2026-31527 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31527 *
CVE-2026-31613 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31613 *
CVE-2026-31707 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31707 *
CVE-2026-31709 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31709 *
CVE-2026-31712 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31712 *
CVE-2026-31715 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31715 *
CVE-2026-31717 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31717 *
CVE-2026-31718 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31718 *
CVE-2026-34714 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34714 *
CVE-2026-34982 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34982 *
CVE-2026-35177 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35177 *
CVE-2026-35414 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35414 *
CVE-2026-41411 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41411 *
CVE-2026-41989 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41989 *
CVE-2026-43052 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43052 *
CVE-2026-43109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43109 *
CVE-2026-43137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43137 *
CVE-2026-43245 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43245 *
CVE-2026-43319 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43319 *
CVE-2026-43500 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43500 *
CVE-2026-44656 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-44656 *
CVE-2026-45130 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45130 *
CVE-2026-45973 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45973 *
CVE-2026-46483 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46483 *
CVE-2026-5222 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5222 *
CVE-2026-5223 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5223 *
CVE-2026-55199 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55199 *
CVE-2026-55200 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55200 *
CVE-2026-56113 (CVSS3: N/A): dhcpcd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56113 *
CVE-2026-56114 (CVSS3: N/A): dhcpcd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56114 *
CVE-2026-56117 (CVSS3: N/A): dhcpcd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56117 *
CVE-2026-5704 (CVSS3: N/A): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5704 *
CVE-2026-5773 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5773 *
CVE-2026-6276 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6276 *
CVE-2026-6846 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6846 *
CVE-2026-8376 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8376 *

Full list:  Found 899 unpatched CVEs
CVE-2011-3374 (CVSS3: N/A): apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3374 *
CVE-2014-8171 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
CVE-2017-1000255 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
CVE-2018-10840 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
CVE-2018-10876 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
CVE-2018-10882 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
CVE-2018-10902 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
CVE-2018-14625 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2019-3016 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
CVE-2019-3819 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
CVE-2019-3887 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
CVE-2020-10742 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10742 *
CVE-2020-16119 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
CVE-2020-1749 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
CVE-2020-25672 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25672 *
CVE-2020-27815 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27815 *
CVE-2020-8834 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
CVE-2021-20194 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20194 *
CVE-2021-20265 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20265 *
CVE-2021-3564 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3564 *
CVE-2021-3669 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3669 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3759 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3759 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2021-4218 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4218 *
CVE-2022-0286 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0286 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-1462 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1462 *
CVE-2022-2308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2308 *
CVE-2022-2327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2327 *
CVE-2022-2663 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2663 *
CVE-2022-3435 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3435 *
CVE-2022-3523 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3523 *
CVE-2022-3534 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3534 *
CVE-2022-3566 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3566 *
CVE-2022-3567 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3567 *
CVE-2022-3619 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3619 *
CVE-2022-3621 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3621 *
CVE-2022-3624 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3624 *
CVE-2022-3629 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3629 *
CVE-2022-3630 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3630 *
CVE-2022-3633 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3633 *
CVE-2022-3636 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3636 *
CVE-2022-36402 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-3646 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3646 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-42895 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42895 *
CVE-2022-4382 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4382 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1073 *
CVE-2023-1074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1074 *
CVE-2023-1075 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1075 *
CVE-2023-1076 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1076 *
CVE-2023-2898 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2898 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-3772 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3772 *
CVE-2023-3773 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3773 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4155 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4155 *
CVE-2023-50431 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-50431 *
CVE-2023-52485 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52485 *
CVE-2023-52586 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52586 *
CVE-2023-52590 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52590 *
CVE-2023-52624 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52624 *
CVE-2023-52625 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52625 *
CVE-2023-6176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6176 *
CVE-2023-6200 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6200 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6270 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6270 *
CVE-2023-6531 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6531 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2023-6606 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6606 *
CVE-2023-6610 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6610 *
CVE-2023-6679 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6679 *
CVE-2023-6915 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6915 *
CVE-2023-6931 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6931 *
CVE-2023-7042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7042 *
CVE-2024-0565 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0565 *
CVE-2024-0607 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0607 *
CVE-2024-1151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-1151 *
CVE-2024-23848 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-23849 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23849 *
CVE-2024-23850 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23850 *
CVE-2024-23851 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23851 *
CVE-2024-24859 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24860 *
CVE-2024-24861 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24861 *
CVE-2024-24864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25739 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25739 *
CVE-2024-25740 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25740 *
CVE-2024-25741 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25741 *
CVE-2024-26672 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26672 *
CVE-2024-26756 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26756 *
CVE-2024-26757 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26757 *
CVE-2024-26758 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26758 *
CVE-2024-26944 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26944 *
CVE-2024-26948 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26948 *
CVE-2024-26962 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26962 *
CVE-2024-27010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27010 *
CVE-2024-27012 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27012 *
CVE-2024-27079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27079 *
CVE-2024-35794 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35794 *
CVE-2024-35808 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35808 *
CVE-2024-35843 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35843 *
CVE-2024-35931 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35931 *
CVE-2024-36024 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36024 *
CVE-2024-38608 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38608 *
CVE-2024-40979 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-40979 *
CVE-2024-40999 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-40999 *
CVE-2024-41008 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41008 *
CVE-2024-41023 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41023 *
CVE-2024-41045 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41045 *
CVE-2024-41082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41082 *
CVE-2024-41085 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41085 *
CVE-2024-41932 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41932 *
CVE-2024-42107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42107 *
CVE-2024-42118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42118 *
CVE-2024-42123 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42123 *
CVE-2024-42139 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42139 *
CVE-2024-42155 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42155 *
CVE-2024-42158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42158 *
CVE-2024-42162 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42162 *
CVE-2024-42317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42317 *
CVE-2024-43819 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43819 *
CVE-2024-43824 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43824 *
CVE-2024-43872 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43872 *
CVE-2024-43901 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43901 *
CVE-2024-44951 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-44951 *
CVE-2024-46681 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46681 *
CVE-2024-46698 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46698 *
CVE-2024-46701 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46701 *
CVE-2024-46727 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46727 *
CVE-2024-46729 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46729 *
CVE-2024-46730 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46730 *
CVE-2024-46754 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46754 *
CVE-2024-46775 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46775 *
CVE-2024-46808 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46808 *
CVE-2024-46834 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46834 *
CVE-2024-46842 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46842 *
CVE-2024-47661 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47661 *
CVE-2024-47662 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47662 *
CVE-2024-47702 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47702 *
CVE-2024-47703 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47703 *
CVE-2024-47794 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47794 *
CVE-2024-49885 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49885 *
CVE-2024-49888 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49888 *
CVE-2024-49893 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49893 *
CVE-2024-49908 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49908 *
CVE-2024-49910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49910 *
CVE-2024-49916 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49916 *
CVE-2024-49918 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49918 *
CVE-2024-49920 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49920 *
CVE-2024-49921 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49921 *
CVE-2024-49922 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49922 *
CVE-2024-49940 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49940 *
CVE-2024-49945 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49945 *
CVE-2024-49970 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49970 *
CVE-2024-50028 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50028 *
CVE-2024-50102 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50102 *
CVE-2024-50217 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50217 *
CVE-2024-50225 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50225 *
CVE-2024-50289 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50289 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-52560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52560 *
CVE-2024-53051 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53051 *
CVE-2024-53056 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53056 *
CVE-2024-53089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53089 *
CVE-2024-53090 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53090 *
CVE-2024-53114 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53114 *
CVE-2024-53147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53147 *
CVE-2024-53187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53187 *
CVE-2024-53219 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53219 *
CVE-2024-56544 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56544 *
CVE-2024-56591 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56591 *
CVE-2024-56702 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56702 *
CVE-2024-56712 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56712 *
CVE-2024-56742 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56742 *
CVE-2024-56775 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56775 *
CVE-2024-57804 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57804 *
CVE-2024-57809 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57809 *
CVE-2024-57857 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57857 *
CVE-2024-57872 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57872 *
CVE-2024-57974 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57974 *
CVE-2024-57975 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57975 *
CVE-2024-57976 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57976 *
CVE-2024-57999 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57999 *
CVE-2024-58006 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58006 *
CVE-2024-58012 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58012 *
CVE-2024-58015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58015 *
CVE-2024-58089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58089 *
CVE-2024-58093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58093 *
CVE-2024-58094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58094 *
CVE-2024-58095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58095 *
CVE-2024-58241 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58241 *
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-12781 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12781 *
CVE-2025-13837 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-13837 *
CVE-2025-15661 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15661 *
CVE-2025-21634 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21634 *
CVE-2025-21635 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21635 *
CVE-2025-21649 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21649 *
CVE-2025-21650 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21650 *
CVE-2025-21651 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21651 *
CVE-2025-21693 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21693 *
CVE-2025-21696 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21696 *
CVE-2025-21714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21714 *
CVE-2025-21722 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21722 *
CVE-2025-21723 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21723 *
CVE-2025-21729 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21729 *
CVE-2025-21732 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21732 *
CVE-2025-21768 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21768 *
CVE-2025-21801 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21801 *
CVE-2025-21825 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21825 *
CVE-2025-21870 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21870 *
CVE-2025-21885 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21885 *
CVE-2025-21888 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21888 *
CVE-2025-21892 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21892 *
CVE-2025-21907 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21907 *
CVE-2025-21927 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21927 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-21961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21961 *
CVE-2025-21972 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21972 *
CVE-2025-21976 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21976 *
CVE-2025-21985 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21985 *
CVE-2025-22039 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22039 *
CVE-2025-22070 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22070 *
CVE-2025-22101 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22101 *
CVE-2025-22104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22104 *
CVE-2025-22108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22108 *
CVE-2025-22109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22109 *
CVE-2025-22113 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22113 *
CVE-2025-22115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22115 *
CVE-2025-22124 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22124 *
CVE-2025-22127 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22127 *
CVE-2025-22873 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22873 *
CVE-2025-23129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23129 *
CVE-2025-23130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23130 *
CVE-2025-23131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23131 *
CVE-2025-23132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23132 *
CVE-2025-23133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23133 *
CVE-2025-23135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23135 *
CVE-2025-37743 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37743 *
CVE-2025-37747 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37747 *
CVE-2025-37750 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37750 *
CVE-2025-37759 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37759 *
CVE-2025-37802 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37802 *
CVE-2025-37806 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37806 *
CVE-2025-37807 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37807 *
CVE-2025-37826 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37826 *
CVE-2025-37833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37833 *
CVE-2025-37834 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37834 *
CVE-2025-37856 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37856 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37861 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37861 *
CVE-2025-37870 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37870 *
CVE-2025-37880 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37880 *
CVE-2025-37907 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37907 *
CVE-2025-37977 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37977 *
CVE-2025-38029 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38029 *
CVE-2025-38038 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38038 *
CVE-2025-38041 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38041 *
CVE-2025-38042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38042 *
CVE-2025-38060 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38060 *
CVE-2025-38064 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38064 *
CVE-2025-38069 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38069 *
CVE-2025-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38096 *
CVE-2025-38132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38132 *
CVE-2025-38140 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38140 *
CVE-2025-38199 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38199 *
CVE-2025-38203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38203 *
CVE-2025-38204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38204 *
CVE-2025-38206 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38206 *
CVE-2025-38207 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38207 *
CVE-2025-38237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38237 *
CVE-2025-38261 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38261 *
CVE-2025-38264 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38264 *
CVE-2025-38272 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38272 *
CVE-2025-38279 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38279 *
CVE-2025-38292 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38292 *
CVE-2025-38303 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38303 *
CVE-2025-38311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38311 *
CVE-2025-38333 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38333 *
CVE-2025-38359 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38359 *
CVE-2025-38414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38414 *
CVE-2025-38438 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38438 *
CVE-2025-38507 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38507 *
CVE-2025-38582 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38582 *
CVE-2025-38585 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38585 *
CVE-2025-38591 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38591 *
CVE-2025-38595 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38595 *
CVE-2025-38597 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38597 *
CVE-2025-38605 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38605 *
CVE-2025-38636 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38636 *
CVE-2025-38656 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38656 *
CVE-2025-38660 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38660 *
CVE-2025-38705 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38705 *
CVE-2025-38717 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38717 *
CVE-2025-38722 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38722 *
CVE-2025-39677 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39677 *
CVE-2025-39705 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39705 *
CVE-2025-39707 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39707 *
CVE-2025-39732 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39732 *
CVE-2025-39746 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39746 *
CVE-2025-39747 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39747 *
CVE-2025-39754 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39754 *
CVE-2025-39762 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39762 *
CVE-2025-39779 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39779 *
CVE-2025-39789 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39789 *
CVE-2025-39810 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39810 *
CVE-2025-39829 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39829 *
CVE-2025-39833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39833 *
CVE-2025-39850 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39850 *
CVE-2025-39851 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39851 *
CVE-2025-39859 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39859 *
CVE-2025-39862 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39862 *
CVE-2025-39901 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39901 *
CVE-2025-39910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39910 *
CVE-2025-39925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39925 *
CVE-2025-39927 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39927 *
CVE-2025-39932 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39932 *
CVE-2025-39933 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39933 *
CVE-2025-39940 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39940 *
CVE-2025-39958 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39958 *
CVE-2025-40325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40325 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-4674 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4674 *
CVE-2025-47906 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47906 *
CVE-2025-47907 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47907 *
CVE-2025-47912 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47912 *
CVE-2025-50182 (CVSS3: N/A): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-50182 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-58185 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58185 *
CVE-2025-58187 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58187 *
CVE-2025-58188 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58188 *
CVE-2025-58189 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58189 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-61723 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61723 *
CVE-2025-61724 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61724 *
CVE-2025-61726 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61726 *
CVE-2025-61727 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61727 *
CVE-2025-61728 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61728 *
CVE-2025-61729 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61729 *
CVE-2025-61730 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61730 *
CVE-2025-61731 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61731 *
CVE-2025-61732 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61732 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-68119 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68119 *
CVE-2025-68121 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68121 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2025-71072 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71072 *
CVE-2025-71073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71073 *
CVE-2025-71074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71074 *
CVE-2025-71109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71109 *
CVE-2025-71202 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71202 *
CVE-2025-71225 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71225 *
CVE-2025-71227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71227 *
CVE-2025-71272 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71272 *
CVE-2025-71273 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71273 *
CVE-2025-71285 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71285 *
CVE-2025-71289 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71289 *
CVE-2025-71313 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71313 *
CVE-2025-71315 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71315 *
CVE-2026-10536 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-10536 *
CVE-2026-11822 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-11822 *
CVE-2026-11824 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-11824 *
CVE-2026-11856 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-11856 *
CVE-2026-11979 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-11979 *
CVE-2026-12064 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12064 *
CVE-2026-12549 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12549 *
CVE-2026-12891 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12891 *
CVE-2026-12892 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12892 *
CVE-2026-13221 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-13221 *
CVE-2026-13595 (CVSS3: N/A): util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-13595 *
CVE-2026-13757 (CVSS3: N/A): p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-13757 *
CVE-2026-1467 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1467 *
CVE-2026-1519 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1519 *
CVE-2026-15308 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-15308 *
CVE-2026-1536 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1536 *
CVE-2026-1539 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1539 *
CVE-2026-1584 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1584 *
CVE-2026-1801 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1801 *
CVE-2026-1940 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1940 *
CVE-2026-2100 (CVSS3: N/A): p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2100 *
CVE-2026-22996 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22996 *
CVE-2026-23000 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23000 *
CVE-2026-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23137 *
CVE-2026-23191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23191 *
CVE-2026-23207 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23207 *
CVE-2026-23208 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23208 *
CVE-2026-23213 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23213 *
CVE-2026-23214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23214 *
CVE-2026-23226 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23226 *
CVE-2026-23239 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23239 *
CVE-2026-23240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23240 *
CVE-2026-23247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23247 *
CVE-2026-23265 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23265 *
CVE-2026-23276 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23276 *
CVE-2026-23278 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23278 *
CVE-2026-23327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23327 *
CVE-2026-23346 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23346 *
CVE-2026-23348 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23348 *
CVE-2026-23361 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23361 *
CVE-2026-23371 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23371 *
CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23377 *
CVE-2026-23383 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23383 *
CVE-2026-23393 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23393 *
CVE-2026-23472 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23472 *
CVE-2026-2369 (CVSS3: N/A): libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2369 *
CVE-2026-2436 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2436 *
CVE-2026-2443 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2443 *
CVE-2026-25679 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25679 *
CVE-2026-2708 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2708 *
CVE-2026-27139 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27139 *
CVE-2026-27140 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27140 *
CVE-2026-27142 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27142 *
CVE-2026-27143 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27143 *
CVE-2026-27144 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27144 *
CVE-2026-27447 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27447 *
CVE-2026-28422 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28422 *
CVE-2026-2920 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2920 *
CVE-2026-2921 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2921 *
CVE-2026-2922 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2922 *
CVE-2026-2923 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2923 *
CVE-2026-29518 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-29518 *
CVE-2026-3039 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3039 *
CVE-2026-3081 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3081 *
CVE-2026-3082 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3082 *
CVE-2026-3083 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3083 *
CVE-2026-3084 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3084 *
CVE-2026-3085 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3085 *
CVE-2026-3086 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3086 *
CVE-2026-3099 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3099 *
CVE-2026-30997 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30997 *
CVE-2026-30998 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30998 *
CVE-2026-30999 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30999 *
CVE-2026-31410 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31410 *
CVE-2026-31419 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31419 *
CVE-2026-31420 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31420 *
CVE-2026-31432 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31432 *
CVE-2026-31462 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31462 *
CVE-2026-31486 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31486 *
CVE-2026-31487 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31487 *
CVE-2026-31493 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31493 *
CVE-2026-31502 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31502 *
CVE-2026-31505 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31505 *
CVE-2026-31506 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31506 *
CVE-2026-31516 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31516 *
CVE-2026-31530 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31530 *
CVE-2026-31531 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31531 *
CVE-2026-31536 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31536 *
CVE-2026-31537 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31537 *
CVE-2026-31557 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31557 *
CVE-2026-31560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31560 *
CVE-2026-31568 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31568 *
CVE-2026-31579 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31579 *
CVE-2026-31592 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31592 *
CVE-2026-31606 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31606 *
CVE-2026-31630 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31630 *
CVE-2026-31645 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31645 *
CVE-2026-31663 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31663 *
CVE-2026-31677 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31677 *
CVE-2026-31692 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31692 *
CVE-2026-31706 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31706 *
CVE-2026-31722 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31722 *
CVE-2026-31723 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31723 *
CVE-2026-31724 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31724 *
CVE-2026-31725 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31725 *
CVE-2026-31729 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31729 *
CVE-2026-31767 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31767 *
CVE-2026-31771 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31771 *
CVE-2026-31777 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31777 *
CVE-2026-3184 (CVSS3: N/A): util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3184 *
CVE-2026-32280 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32280 *
CVE-2026-32281 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32281 *
CVE-2026-32282 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32282 *
CVE-2026-32283 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32283 *
CVE-2026-32288 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32288 *
CVE-2026-32289 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32289 *
CVE-2026-33811 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33811 *
CVE-2026-33814 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33814 *
CVE-2026-33845 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33845 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
CVE-2026-34757 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34757 *
CVE-2026-3497 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3497 *
CVE-2026-34978 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34978 *
CVE-2026-34979 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34979 *
CVE-2026-34980 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34980 *
CVE-2026-34990 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34990 *
CVE-2026-35093 (CVSS3: N/A): libinput https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35093 *
CVE-2026-35094 (CVSS3: N/A): libinput https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35094 *
CVE-2026-3592 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3592 *
CVE-2026-3632 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-37555 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-37555 *
CVE-2026-3832 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3832 *
CVE-2026-3833 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3833 *
CVE-2026-39314 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39314 *
CVE-2026-39316 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39316 *
CVE-2026-39817 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39817 *
CVE-2026-39819 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39819 *
CVE-2026-39820 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39820 *
CVE-2026-39822 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39822 *
CVE-2026-39823 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39823 *
CVE-2026-39825 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39825 *
CVE-2026-39826 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39826 *
CVE-2026-4046 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4046 *
CVE-2026-40467 (CVSS3: N/A): gawk:gawk-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40467 *
CVE-2026-40468 (CVSS3: N/A): gawk:gawk-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40468 *
CVE-2026-40469 (CVSS3: N/A): gawk:gawk-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40469 *
CVE-2026-40553 (CVSS3: N/A): gawk:gawk-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40553 *
CVE-2026-40962 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40962 *
CVE-2026-41079 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41079 *
CVE-2026-41080 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41080 *
CVE-2026-41991 (CVSS3: N/A): gzip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41991 *
CVE-2026-41992 (CVSS3: N/A): gzip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41992 *
CVE-2026-42009 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42009 *
CVE-2026-42010 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42010 *
CVE-2026-42307 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42307 *
CVE-2026-42499 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42499 *
CVE-2026-42501 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42501 *
CVE-2026-42505 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42505 *
CVE-2026-4271 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *
CVE-2026-43009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43009 *
CVE-2026-43010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43010 *
CVE-2026-43019 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43019 *
CVE-2026-43036 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43036 *
CVE-2026-43042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43042 *
CVE-2026-43048 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43048 *
CVE-2026-43049 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43049 *
CVE-2026-43053 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43053 *
CVE-2026-43073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43073 *
CVE-2026-43083 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43083 *
CVE-2026-43088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43088 *
CVE-2026-43101 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43101 *
CVE-2026-43107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43107 *
CVE-2026-43115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43115 *
CVE-2026-43116 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43116 *
CVE-2026-43118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43118 *
CVE-2026-43119 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43119 *
CVE-2026-43125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43125 *
CVE-2026-43126 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43126 *
CVE-2026-43127 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43127 *
CVE-2026-43129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43129 *
CVE-2026-43153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43153 *
CVE-2026-43161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43161 *
CVE-2026-43172 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43172 *
CVE-2026-43185 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43185 *
CVE-2026-43197 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43197 *
CVE-2026-43198 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43198 *
CVE-2026-43199 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43199 *
CVE-2026-43204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43204 *
CVE-2026-43213 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43213 *
CVE-2026-43216 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43216 *
CVE-2026-43219 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43219 *
CVE-2026-43234 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43234 *
CVE-2026-43244 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43244 *
CVE-2026-43248 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43248 *
CVE-2026-43249 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43249 *
CVE-2026-43250 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43250 *
CVE-2026-43258 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43258 *
CVE-2026-43294 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43294 *
CVE-2026-43298 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43298 *
CVE-2026-43299 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43299 *
CVE-2026-43303 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43303 *
CVE-2026-43308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43308 *
CVE-2026-43309 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43309 *
CVE-2026-43310 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43310 *
CVE-2026-43311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43311 *
CVE-2026-43317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43317 *
CVE-2026-43318 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43318 *
CVE-2026-43331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43331 *
CVE-2026-43338 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43338 *
CVE-2026-43344 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43344 *
CVE-2026-43352 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43352 *
CVE-2026-43353 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43353 *
CVE-2026-43414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43414 *
CVE-2026-43416 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43416 *
CVE-2026-43421 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43421 *
CVE-2026-43443 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43443 *
CVE-2026-43456 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43456 *
CVE-2026-43464 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43464 *
CVE-2026-43465 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43465 *
CVE-2026-43617 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43617 *
CVE-2026-43618 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43618 *
CVE-2026-43619 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43619 *
CVE-2026-43620 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43620 *
CVE-2026-4437 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4437 *
CVE-2026-4438 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4438 *
CVE-2026-44431 (CVSS3: N/A): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-44431 *
CVE-2026-45186 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45186 *
CVE-2026-45232 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45232 *
CVE-2026-45850 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45850 *
CVE-2026-45855 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45855 *
CVE-2026-45859 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45859 *
CVE-2026-45861 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45861 *
CVE-2026-45877 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45877 *
CVE-2026-45893 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45893 *
CVE-2026-45894 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45894 *
CVE-2026-45897 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45897 *
CVE-2026-45901 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45901 *
CVE-2026-45917 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45917 *
CVE-2026-45930 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45930 *
CVE-2026-45932 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45932 *
CVE-2026-45934 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45934 *
CVE-2026-45940 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45940 *
CVE-2026-45943 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45943 *
CVE-2026-45944 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45944 *
CVE-2026-45949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45949 *
CVE-2026-45961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45961 *
CVE-2026-45963 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45963 *
CVE-2026-46014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46014 *
CVE-2026-46017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46017 *
CVE-2026-46032 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46032 *
CVE-2026-46044 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46044 *
CVE-2026-46054 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46054 *
CVE-2026-46059 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46059 *
CVE-2026-46066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46066 *
CVE-2026-46071 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46071 *
CVE-2026-46076 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46076 *
CVE-2026-46090 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46090 *
CVE-2026-46092 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46092 *
CVE-2026-46130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46130 *
CVE-2026-46135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46135 *
CVE-2026-46140 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46140 *
CVE-2026-46147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46147 *
CVE-2026-46148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46148 *
CVE-2026-46153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46153 *
CVE-2026-46157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46157 *
CVE-2026-46171 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46171 *
CVE-2026-46175 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46175 *
CVE-2026-46181 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46181 *
CVE-2026-46200 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46200 *
CVE-2026-46241 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46241 *
CVE-2026-46242 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46242 *
CVE-2026-46245 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46245 *
CVE-2026-46252 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46252 *
CVE-2026-46254 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46254 *
CVE-2026-46272 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46272 *
CVE-2026-46282 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46282 *
CVE-2026-46302 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46302 *
CVE-2026-46314 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46314 *
CVE-2026-46320 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46320 *
CVE-2026-46321 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46321 *
CVE-2026-46322 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46322 *
CVE-2026-46324 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46324 *
CVE-2026-46325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46325 *
CVE-2026-46330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46330 *
CVE-2026-46331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46331 *
CVE-2026-4647 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4647 *
CVE-2026-47162 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-47162 *
CVE-2026-47167 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-47167 *
CVE-2026-4873 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4873 *
CVE-2026-4878 (CVSS3: N/A): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4878 *
CVE-2026-50219 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50219 *
CVE-2026-50256 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50256 *
CVE-2026-50257 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50257 *
CVE-2026-50258 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50258 *
CVE-2026-50259 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50259 *
CVE-2026-50260 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50260 *
CVE-2026-50261 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50261 *
CVE-2026-50262 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50262 *
CVE-2026-50263 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50263 *
CVE-2026-50264 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50264 *
CVE-2026-5119 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5119 *
CVE-2026-5121 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5121 *
CVE-2026-52858 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52858 *
CVE-2026-52859 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52859 *
CVE-2026-52860 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52860 *
CVE-2026-52908 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52908 *
CVE-2026-52909 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52909 *
CVE-2026-52910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52910 *
CVE-2026-52913 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52913 *
CVE-2026-52917 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52917 *
CVE-2026-52923 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52923 *
CVE-2026-52924 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52924 *
CVE-2026-52927 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52927 *
CVE-2026-52928 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52928 *
CVE-2026-52929 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52929 *
CVE-2026-52930 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52930 *
CVE-2026-52934 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52934 *
CVE-2026-52935 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52935 *
CVE-2026-52937 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52937 *
CVE-2026-52939 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52939 *
CVE-2026-52942 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52942 *
CVE-2026-52943 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52943 *
CVE-2026-52944 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52944 *
CVE-2026-52946 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52946 *
CVE-2026-52947 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52947 *
CVE-2026-52948 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52948 *
CVE-2026-52953 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52953 *
CVE-2026-52956 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52956 *
CVE-2026-52961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52961 *
CVE-2026-52988 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52988 *
CVE-2026-52990 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52990 *
CVE-2026-52991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52991 *
CVE-2026-53000 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53000 *
CVE-2026-53005 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53005 *
CVE-2026-53009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53009 *
CVE-2026-53010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53010 *
CVE-2026-53015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53015 *
CVE-2026-53017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53017 *
CVE-2026-53018 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53018 *
CVE-2026-53024 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53024 *
CVE-2026-53025 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53025 *
CVE-2026-53027 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53027 *
CVE-2026-53129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53129 *
CVE-2026-53131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53131 *
CVE-2026-53132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53132 *
CVE-2026-53133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53133 *
CVE-2026-53134 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53134 *
CVE-2026-53135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53135 *
CVE-2026-53136 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53136 *
CVE-2026-53137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53137 *
CVE-2026-53138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53138 *
CVE-2026-53139 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53139 *
CVE-2026-53143 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53143 *
CVE-2026-53144 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53144 *
CVE-2026-53146 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53146 *
CVE-2026-53147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53147 *
CVE-2026-53148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53148 *
CVE-2026-53149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53149 *
CVE-2026-53150 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53150 *
CVE-2026-53151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53151 *
CVE-2026-53154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53154 *
CVE-2026-53156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53156 *
CVE-2026-53157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53157 *
CVE-2026-53158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53158 *
CVE-2026-53159 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53159 *
CVE-2026-53160 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53160 *
CVE-2026-53161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53161 *
CVE-2026-53163 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53163 *
CVE-2026-53167 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53167 *
CVE-2026-53168 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53168 *
CVE-2026-53176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53176 *
CVE-2026-53177 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53177 *
CVE-2026-53178 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53178 *
CVE-2026-53179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53179 *
CVE-2026-53181 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53181 *
CVE-2026-53182 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53182 *
CVE-2026-53183 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53183 *
CVE-2026-53184 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53184 *
CVE-2026-53185 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53185 *
CVE-2026-53186 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53186 *
CVE-2026-53189 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53189 *
CVE-2026-53190 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53190 *
CVE-2026-53194 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53194 *
CVE-2026-53195 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53195 *
CVE-2026-53196 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53196 *
CVE-2026-53198 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53198 *
CVE-2026-53199 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53199 *
CVE-2026-53207 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53207 *
CVE-2026-53208 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53208 *
CVE-2026-53209 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53209 *
CVE-2026-53212 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53212 *
CVE-2026-53213 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53213 *
CVE-2026-53214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53214 *
CVE-2026-53215 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53215 *
CVE-2026-53216 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53216 *
CVE-2026-53217 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53217 *
CVE-2026-53218 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53218 *
CVE-2026-53219 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53219 *
CVE-2026-53220 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53220 *
CVE-2026-53221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53221 *
CVE-2026-53223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53223 *
CVE-2026-53224 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53224 *
CVE-2026-53225 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53225 *
CVE-2026-53226 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53226 *
CVE-2026-53227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53227 *
CVE-2026-53228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53228 *
CVE-2026-53229 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53229 *
CVE-2026-53230 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53230 *
CVE-2026-53232 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53232 *
CVE-2026-53236 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53236 *
CVE-2026-53237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53237 *
CVE-2026-53238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53238 *
CVE-2026-53239 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53239 *
CVE-2026-53242 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53242 *
CVE-2026-53245 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53245 *
CVE-2026-53246 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53246 *
CVE-2026-53247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53247 *
CVE-2026-53249 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53249 *
CVE-2026-53252 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53252 *
CVE-2026-53253 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53253 *
CVE-2026-53254 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53254 *
CVE-2026-53255 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53255 *
CVE-2026-53256 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53256 *
CVE-2026-53258 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53258 *
CVE-2026-53262 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53262 *
CVE-2026-53263 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53263 *
CVE-2026-53264 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53264 *
CVE-2026-53265 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53265 *
CVE-2026-53266 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53266 *
CVE-2026-53267 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53267 *
CVE-2026-53268 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53268 *
CVE-2026-53269 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53269 *
CVE-2026-53270 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53270 *
CVE-2026-53271 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53271 *
CVE-2026-53272 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53272 *
CVE-2026-53273 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53273 *
CVE-2026-53274 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53274 *
CVE-2026-53275 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53275 *
CVE-2026-53284 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53284 *
CVE-2026-53285 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53285 *
CVE-2026-53292 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53292 *
CVE-2026-53297 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53297 *
CVE-2026-53313 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53313 *
CVE-2026-53317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53317 *
CVE-2026-53325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53325 *
CVE-2026-5435 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5435 *
CVE-2026-5450 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5450 *
CVE-2026-5545 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5545 *
CVE-2026-55653 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55653 *
CVE-2026-55654 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55654 *
CVE-2026-55655 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55655 *
CVE-2026-55693 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55693 *
CVE-2026-55892 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55892 *
CVE-2026-55895 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55895 *
CVE-2026-55999 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55999 *
CVE-2026-56000 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56000 *
CVE-2026-56001 (CVSS3: N/A): libxfont2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56001 *
CVE-2026-56002 (CVSS3: N/A): libxfont:libxfont2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56002 *
CVE-2026-56003 (CVSS3: N/A): libxfont2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56003 *
CVE-2026-56116 (CVSS3: N/A): dhcpcd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56116 *
CVE-2026-56123 (CVSS3: N/A): socat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56123 *
CVE-2026-56131 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56131 *
CVE-2026-56132 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56132 *
CVE-2026-56288 (CVSS3: N/A): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56288 *
CVE-2026-56289 (CVSS3: N/A): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56289 *
CVE-2026-56403 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56403 *
CVE-2026-56404 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56404 *
CVE-2026-56405 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56405 *
CVE-2026-56406 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56406 *
CVE-2026-56407 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56407 *
CVE-2026-56408 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56408 *
CVE-2026-56409 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56409 *
CVE-2026-56410 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56410 *
CVE-2026-56411 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56411 *
CVE-2026-56412 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56412 *
CVE-2026-5673 (CVSS3: N/A): libtheora https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5673 *
CVE-2026-57432 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57432 *
CVE-2026-5745 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5745 *
CVE-2026-57451 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57451 *
CVE-2026-57452 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57452 *
CVE-2026-57455 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57455 *
CVE-2026-57456 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57456 *
CVE-2026-58010 (CVSS3: N/A): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58010 *
CVE-2026-58011 (CVSS3: N/A): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58011 *
CVE-2026-58012 (CVSS3: N/A): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58012 *
CVE-2026-58013 (CVSS3: N/A): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58013 *
CVE-2026-58014 (CVSS3: N/A): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58014 *
CVE-2026-58015 (CVSS3: N/A): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58015 *
CVE-2026-58016 (CVSS3: N/A): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58016 *
CVE-2026-58050 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58050 *
CVE-2026-58051 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58051 *
CVE-2026-58055 (CVSS3: N/A): nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58055 *
CVE-2026-58469 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58469 *
CVE-2026-58470 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58470 *
CVE-2026-58471 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58471 *
CVE-2026-58472 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58472 *
CVE-2026-5928 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5928 *
CVE-2026-5946 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5946 *
CVE-2026-5950 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5950 *
CVE-2026-59856 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59856 *
CVE-2026-59857 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59857 *
CVE-2026-59858 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59858 *
CVE-2026-59890 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59890 *
CVE-2026-59995 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59995 *
CVE-2026-59996 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59996 *
CVE-2026-59997 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59997 *
CVE-2026-59998 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59998 *
CVE-2026-59999 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59999 *
CVE-2026-60000 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-60000 *
CVE-2026-60001 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-60001 *
CVE-2026-60002 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-60002 *
CVE-2026-6238 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6238 *
CVE-2026-6253 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6253 *
CVE-2026-6429 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6429 *
CVE-2026-6844 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6844 *
CVE-2026-6845 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6845 *
CVE-2026-7168 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-7168 *
CVE-2026-7210 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-7210 *
CVE-2026-8286 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8286 *
CVE-2026-8458 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8458 *
CVE-2026-8924 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8924 *
CVE-2026-8927 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8927 *
CVE-2026-8932 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8932 *
CVE-2026-9149 (CVSS3: N/A): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-9149 *
CVE-2026-9547 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-9547 *

Summary of CVE counts by recipe:
  linux-yocto: 656
  go-binary-native: 36
  vim: 17
  expat:expat-native: 16
  curl:curl-native: 14
  libsoup:libsoup-2.4: 14
  gstreamer1.0: 13
  openssh: 12
  xserver-xorg: 11
  cups: 8
  go:go-binary-native:go-cross-core2-64:go-runtime: 8
  binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native: 7
  glib-2.0:glib-2.0-native: 7
  glibc: 7
  gnutls:gnutls-native: 6
  rsync:rsync-native: 6
  bind: 5
  python3:python3-native: 5
  ffmpeg: 4
  gawk:gawk-native: 4
  wget: 4
  libsndfile1: 3
  libssh2:libssh2-native: 3
  gzip: 2
  libarchive:libarchive-native: 2
  libinput: 2
  libxfont2: 2
  p11-kit: 2
  patch:patch-native: 2
  perl:perl-native: 2
  python3-urllib3: 2
  sqlite3:sqlite3-native: 2
  util-linux:util-linux-native: 2
  apt: 1
  avahi: 1
  dhcpcd: 1
  libcap:libcap-native: 1
  libpng:libpng-native: 1
  libsolv: 1
  libsoup-2.4: 1
  libtheora: 1
  libxfont:libxfont2: 1
  libxml2:libxml2-native: 1
  nghttp2: 1
  python3-setuptools:python3-setuptools-native: 1
  socat: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

