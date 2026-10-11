Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7F8CA9ED3
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23432.1791708070738122985
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hzSw2jLL;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c6f764f82so219929f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708069; x=1792312869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cvo+X8tQS8ztgTvEvsm+YjywPJRL6eRj+zIQYskufZE=;
        b=hzSw2jLLpHqPEpcDxdr5sNPEa5OueafLCKCOOnO99Sus17pjBjSaKZKiMLV1GmpO7c
         YaAzJ3Ug0yWWx9Ne1rpXcK1lHqPoe9YzMhIcqwiUP5xfncWyXqrkXPShH05vpqMes2Ni
         sbmSe1TeSl3ZdKe4n2l+1cGAKxb+FXM9LfDoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708069; x=1792312869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cvo+X8tQS8ztgTvEvsm+YjywPJRL6eRj+zIQYskufZE=;
        b=2kl/WIBNc4lmj9+cZ7i4G7YzfX2orbk3pAqSoC19D1HCduktLeT6kcAJ9tvYchVOkJ
         pxgp4YeNHscO9C5ZSv/0t8a/4zTVikQTvtSWLDkAsX//BLc/nhUKRWmKndBJEaPuu3yC
         +UhxMS3SfwLanClKasM0FtN/YwDHsVYcNDvolSHAWrK4qENJ+yNHoj41mohcL57uoTRJ
         OVK+j3w3hhFs7kl82fHtkAB+j6vWo9gszLsE/XnEdIkHfzaMw4GIqza8wqBALFb2M8C7
         RvOVUu9wIxi46iVoJzoF3AUnV+15Fe5LgNrpatnNF/GpTSL7AVto6jEJKhnfbWyAvnZr
         eSoQ==
X-Gm-Message-State: AFq9FYJgn7elY/sAwl+MmcqKOjRq2Z/Kl+xe7uGLfgmIr2vjYV7gTTAF
	hIrjFV9rbRcHTtzmwVVuWxxfzHQT0lIGK2DxYM4ivm/IlNT+vkyuaH+oX4lBcp/BNbkkDtOtjOy
	AyOJUr5I=
X-Gm-Gg: AYBFou3y5gIdcz+aAsTR469xC9PfD1PHhcledzm2h3Ex/68mEEZGVOGXV7ADVGQXjk3
	FwYXHbajoMpskez+zYJxSao3FGJCzkLwjoo/JMKU+hequUsbXJd9nHuS83ocGgRF4KOrQbRfewD
	gmnQ/+L2C0AHWkh9UcvHsuWvv3xsm8sFyhbngscvuRDdgxb7vXFrXoQ0ApdoyeotSgIszZVo0q2
	/uT2q1BfsWngo1TnIX2SWWiWoRuNIRfZtR/RKWa9gbKbWcKXjmf59eqqy7jh21IDelIFf3nSfSv
	P2E1kTx8mPa/IibS9j2ET/VnD1Yhz+n0GIpZO9mTRBg2uWbosWakVuYLIgUx9jGX5tyoscq0GQl
	Dzvzum1xMYJHt9jBVsX26oKGBkx30C3z6EQJYk8Ixb3yoFwff0GI792Lz/x4zfaWGzTVd80I6pA
	9zuj+9Ci6bJ2Xirkjsr7C4zYxAC/jr9HTYufPcyF4DnoyliF4mNt6yYbe2RDbtCV5YkV2M+MepR
	tD0CBGNRIMMVHojmXb2aNfjcNUEommAKk/pbK8jVdcr3ZLhILzGEhr+/ZhWtFBVZvBHtXS0qcij
	algUEy1G
X-Received: by 2002:adf:e183:0:b0:487:490:8391 with SMTP id ffacd0b85a97d-48dbaadd94cmr11178073f8f.16.1791708068910;
        Sun, 11 Oct 2026 01:41:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/60] openssh: set status for CVE-2026-55654
Date: Sun, 11 Oct 2026 10:39:48 +0200
Message-ID: <7940891fd50e0fe5a509d81afd66ebc05e4420d3.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247524

From: Peter Marko <peter.marko@siemens.com>

Per desctiption in [1] (which is different than description in [2]),
this is RedHat patches.
Also [3] suggests this.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/55xxx/CVE-2026-55654.json
[2] https://security-tracker.debian.org/tracker/CVE-2026-55654
[3] https://ubuntu.com/security/CVE-2026-55654

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 389919ea7927962a61a5aaa7b641c5b60af560e0)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 9793e3fa6dc..c53100cd99f 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -46,6 +46,7 @@ CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
+CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 
 PAM_SRC_URI = "file://sshd"

