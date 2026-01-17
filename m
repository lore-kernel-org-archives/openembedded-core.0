Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5965C98328
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 12:05:39 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7074.1768651530405595300
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jan 2026 04:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+sMKHSi;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-383138a497bso27235871fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 04:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768651528; x=1769256328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7K9C7gIuGP1pDtditvmiLSFWolvbF/fp1MQIdCRsSus=;
        b=C+sMKHSiuBScvVo0IniEUimCtIECrZ7Wct3XqPRyAPpOmkAGxkmSikQu/hqdAfY6X1
         7oVn9fQiBMgGr/OZ4WKP0cLDzIi4UMcGoXGXm+sGQ8Mj2rgahMLHPxfUV2uHD/VDLEcU
         aqMTUFoACJ4bxMYnYOkT80Ar7bQaWJDP+0u5Da1cUikpAOu1Oiy0RNRjGFYV6j96ZWYu
         jV4O6bS4HSlF/efOZwtd/tFzUvbCHoERm2WJZSX8VNVBXacmiBMK1kzjloru2FB5MCUY
         rlln+qaEF+7YnZy/tJWuh1Qaib39t62zeQpTx5D3kozBbqUXaODgyvRM1wVY49HzjHSz
         6eOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768651528; x=1769256328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K9C7gIuGP1pDtditvmiLSFWolvbF/fp1MQIdCRsSus=;
        b=YSfVeq9ZvLF4eCO5y4xuE86lfnMQvEMj3lymbFDDzMhrir0NgjVkYzqGSWhzX11yjY
         yYGOsqZdQ7/ZKWfTZHmGacpOe4oIIng+kw1QcASgW0RsHUvtreC1dZ/U0EdPbsQnCw2o
         anFixF9Ncqr7mRHbtd+qv3M4QIYfyH8hUQhXjX5r/gvIPDC9NOUD/AS4qHmkcwCfbL4R
         /tkvGQXvYk182WMNISqnXwClxLlQ5JfGhpk5QUhaFxQpAiPwD8Y5XklAPyvaGkEBfONz
         P5RJNU4l34j04SY59C0QwKnnxK8IN4H8MfUMqTIQdQkBLdjm1J+OaPQ4lwVM9oCPJmsp
         QjcQ==
X-Gm-Message-State: AOJu0YzQM8W5DF/aiS+Hbs7hiixZKbF9JhAHKYCch2oFpDQzk/hR7QFS
	V+KkCm4OQOc9XRlqs8CYQ9FFLSaLCFU2TylfFUDljcB91Yx8dAHZ0P2HX2gaG0hV
X-Gm-Gg: AY/fxX5AYL2Ss4gWTyi/5fs4c3ZaeAWsjK9VlFw0AoSp7eE7JCzWzMv5u1OZ2/MTiDp
	tBmgO/l4aPHwoqLzNZ1de9bb9QhDzFA6D2AIEyW4T4NKLeqBLoQtHdBDQF6Q5qsO8OtRhDN786p
	EMb+kj5KoHTnWNT1vRG6ZMfGqEyP1MD80XBgpmMl1TH1ru7sywNb3M9DF0Ztl/DqitomubRzU19
	wYSh2pKYmmAraW38h5Q4lw17vIhTopwE26vQISaek83ROEu4TrR/XzowXMEcS30hmlhwQIHl2a2
	Mh6XS4/nwHHd263CDoSR4GoelNe20TopTh+WUnQmM5chu6vxTnNtZgcnHUi30omn5L/ZZv6K5iJ
	rnEbxtbVDITNAq9HMzVc+G4Ond2v7yDAw93qJmbN8W3GvqRCOine3BmkWL+ayYtekzfjPx0JtaM
	7OF6+U+bJg8tPA/uCXh3xw19Wl1SVxJlqItjndKWFBueYxaMiyYU6oPv7DXQSDdHA60q88/Frnk
	gK/75h56vi3giEO1jaNIsfYT5JxWjmp4R90XjjebplYW9ZBBiBtjJ2tv1lF
X-Received: by 2002:a2e:b88d:0:b0:37b:9b58:dd0e with SMTP id 38308e7fff4ca-383866d02d6mr16674761fa.10.1768651527687;
        Sat, 17 Jan 2026 04:05:27 -0800 (PST)
Received: from peterliu-precision-5680.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8f73csm15096491fa.19.2026.01.17.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:05:27 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] rootfs-postcommands.bbclass: avoid checking hard-coded openssh hostkey
Date: Sat, 17 Jan 2026 13:05:23 +0100
Message-ID: <20260117120523.1378888-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 12:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229572

The openssh host keys are configurable in openssh recipe, dont check
hard-coded path ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key. Instead, try
to figure out the first host key in sshd_config, if there is no host
keys set in sshd_config, then check the first host key presenting in
${IMAGE_ROOTFS}/etc/ssh.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index f0c7ee658d..02cb97aec7 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -214,7 +214,11 @@ read_only_rootfs_hook () {
 	# If stateless-rootfs is enabled this is always done as we don't want to save keys then
 	if ${@ 'true' if not bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc', True, False, d) or bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else 'false'}; then
 		if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
-			if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
+			ssh_host_key_checkpath=$(sed -n 's/^[ \t]*HostKey[ \t]\+\(.*\)/\1/p' ${IMAGE_ROOTFS}/etc/ssh/sshd_config | head -1)
+			if [ ! -e "$ssh_host_key_checkpath" ]; then
+				ssh_host_key_checkpath=$(ls ${IMAGE_ROOTFS}/etc/ssh/ssh_host_*_key | cut -f1 | head -1)
+			fi
+			if [ -e "$ssh_host_key_checkpath" ]; then
 				echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
 				echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
 			else
-- 
2.43.0


