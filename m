Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B2ECAC5B5
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 20:32:29 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.39267.1759091541428696057
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 13:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qu+JPm2f;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-42480cb42e9so18229565ab.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759091540; x=1759696340; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmuQuYr6/1xd1T4tD/W//JMkcH0z0hD75Cc8FmAp8NE=;
        b=Qu+JPm2fjkHOYWvDLG0Ewg05LOP9D0/GiGdq/vEAdAwkINBFFSNRl91Vy3mRfzqCxk
         SXo9DQvqjuowkKQIVu+aBgXOJL2PMjJImf9/ZbwuWbeuZRHqHj/15yQPKoa4jncEcgeI
         6i/ZYcHPU0eSCa1iX1iJTKFt9uw3m8GXngTUyWkEqwgGO93A0Gm9/+vWjpVGVfQvOwN0
         9GXfoM4DB073We87YvTOcRzi1U7F+2t7xOVRNehb09uvj7+DxbGnIzmj9XrVJuvhULJw
         gf/+b0+i4DIgOobh0WjCdoMFSyLdBgvAZMKj+odDvH89N5sES8MLgNy76bRF1n5V8vzZ
         AOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759091540; x=1759696340;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UmuQuYr6/1xd1T4tD/W//JMkcH0z0hD75Cc8FmAp8NE=;
        b=gyzRt6YnCxKJyfENvnCJcVhMadpC3OFbuUg3fY7wibQuX5KnKWhbPa2pBpQisF1g2y
         japTaOKuF2ex+F9yepfp/oq+yW272sxxeNX3/GiRHfPrDL4NUqq1XnjAlrj1RSQ1yM+o
         xX27B8aBg9MBAU7/UYZgsXWLU9e17/xEbWsSp7BfcdglL3Ujc0B7wBgx5KRz1rbVLS8l
         tXRtNcHlNv8BHl1FftaSwbe0TTIM2cVpmhhd46LZ6n2spPeFktwCTdXTz7A6trgeZf+x
         I1Wjyh9jINN0C6aq5j2+JJk+UVL2oPFIdHQDgFTZZwTxK8tdJPVzFhNxZ/ThW5BIqA4u
         p8rA==
X-Gm-Message-State: AOJu0Yw35J2WwWoSLYU2/TvMYWw3CnJf/pWG16XshmSomE1u1cyrFQOZ
	o726DarBBwQ5/zQO1HUOYPiSnAaA7TrSQDKKu1UxPy+N53vEMhviLQj5xQ6oFA==
X-Gm-Gg: ASbGncu5zjuJ04Ghna10KGpIyj/rlsr0jMeLqlVibNFZcvpCTCmZRuH/peER6HWahEO
	7wzY+bpIlAYtva8wvJ9QNqE7Y0o21BL0mnU83y7RDDlRQePzW/gd/4fOEy/M5mbnBwpP/xsU9C7
	7aEac3+S2cFyy7dfC3mMl7toB9/PLu7oAbMhwUAY0YuBEsvxNXzJ0yqjE3ISeQHOzh+QMnErpv4
	a3dGqSPGjTe4/1w+WNovKeWDu3YoTiiDVYz1TivyIZ3fRBVsiuvgXE4P81egZX3W4hFu9RIe8RF
	dOtbB8/UCmU5KsA2OJHuLkCIRzpY0vhIqpx8GEmHyk/UnmGsLwoCPFLdDICFTdHyq7JuWNUMZF6
	uyy5+QNkvr6hpOH9S7VEmZbuRvTMXiC409c7lhFdbuaxmjWJJKs2WKQHQVOfbEdLnJjrAVGUDvw
	==
X-Google-Smtp-Source: AGHT+IGEDfbWxKVgHOFavR54mYo90ozsAiJfQSZ5o+ydeqEfhCcw8zfJLsZammT6P3afY0m8YQWZBQ==
X-Received: by 2002:a05:6e02:156e:b0:427:b642:235 with SMTP id e9e14a558f8ab-427b64203b2mr144344285ab.10.1759091540552;
        Sun, 28 Sep 2025 13:32:20 -0700 (PDT)
Received: from [172.26.252.3] (174-16-207-42.hlrn.qwest.net. [174.16.207.42])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5719d8f6081sm1246128173.81.2025.09.28.13.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 13:32:20 -0700 (PDT)
Message-ID: <a5b379d1-88b8-499c-bfe6-d741e508ca84@gmail.com>
Date: Sun, 28 Sep 2025 14:32:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org, zboszor@gmail.com
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [PATCH] rpm-sequoia-crypto-policy: add nativesdk to BBCLASSEXTEND
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 20:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224103

Prerequisite for nativesdk-rpm.
Would be required by nativesdk-rpm-sequoia

ERROR: Nothing RPROVIDES 'nativesdk-rpm-sequoia-crypto-policy'
(but virtual:nativesdk:
[...]/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
RDEPENDS on or otherwise requires it)

Reproduce:
1. Add "sequoia" to rpm's default PACKAGECONFIG [1]
2. Add "nativesdk" to rpm-sequoia's BBCLASSEXTEND
3. Configure local.conf [2]
4. Attempt to build "core-image-minimal"

[1] This is seen when directly modifying the weak default.
This does not occur with "PACKAGECONFIG:append:pn-rpm".

[2]
INHERIT += "sign_rpm"

RPM_GPG_NAME = "[...]"
RPM_GPG_PASSPHRASE = "[...]"
GPG_PATH = "[...]"

Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 19b86ae391..c602bb4b5a 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -34,4 +34,4 @@ do_install () {
 
 FILES:${PN} = "${datadir}/crypto-policies/back-ends/*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"

