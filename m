Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FB0C61DD9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2994.1787945911965012778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UQj56uEO;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so10537135e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945910; x=1788550710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E6Ff+HogpB/Mg2Ro/jble6wwCWpsyrpR50RNFfdVGrE=;
        b=UQj56uEOYapXvirS2uER2ThWSF/oF1osO5050HOxNGREirUjv1TK2/pJ/BVHm/0/hL
         RXnZpBgZ0WRMBw212FpTvWVHlG3iQZlBEWq+I1oRcdcs/7S9GBFbHzvRnnFVqqac0rkC
         OM1mVnAblSd4p27CQiLS05/uRruuowMVC3yo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945910; x=1788550710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E6Ff+HogpB/Mg2Ro/jble6wwCWpsyrpR50RNFfdVGrE=;
        b=IGaJi4R8yu3hn4SwxlfSaJB5M1YUnZeJCNAT7WIAm3eIvHm06A5BFDtHeMIb0sXbRv
         nun+xpnieqT35ebguh/WoSV4y4k25SPlLc8PbymJBovw+sclmco7xY6F8zBS9BXerHpn
         OzOLN6g6w4HcW2toW02AQcFIxF9gmLY/msdQWA39mN3XDxL2Vre7DosKSvv4+bX6Uuhw
         OYQ/1Ec/1dJc+0t/+3zKfKqGLWF/aXaMwQir5ufKyUDFwVfL2cKYiRNjU/vLpLZMpyWo
         RPkq+lA3LkNv373vPCjTJ/qnFP0gYUD6+kfSlNvUI59ugLyMuw/Xh6lt9HaiNnZAfGaB
         QCGA==
X-Gm-Message-State: AFuF++l450ZF/QlMxV3KTqcioz3WDusC+ia9POluqjKRIWyJD9z7Y9i9
	HE0M+Cf5jrH99fMP00FtpY/Avr1mfTX0s5nqJDSRZ/3vA9PBzuu0UxsEg3F0exCLJ5mOoUndWnQ
	5Ar8KS5c=
X-Gm-Gg: AR+sD13vJGiAlti53XoeKjmdAbMUqu7vgF9sXz5T0wU+RIx9IB4jqkI31yA8TNwInj1
	FxylYnayjeC+2FacaBtJWrBoDVxs+a4aNAWevJBrUMB9j0wdNXjnXojDHix+22hG8PXqNOKx/nc
	TdUYGXa2kgLCzQZA3TSZyhEjGhJTTcVNfctbfZJHApy5w7a3vSDNjXAYY9MJrX9mDD+n8xvRfmV
	Ot2P4E/Yo0RCFQMp9udoUp+TICZrHt0CBba47LUOZwz134rhpvfGltsWnxT2HduvbsUqSA4yhCX
	wxuG4sb8z1R7mMShU29uGggmUFIZfn96HiWQCFaB3eygGJKn5x3XZvO11oVt34+GJj1dz2Cwply
	sUF/MH0audd4EanEzZjqOr8ufzyjiUWRT6YhNhze9tEDlUDVX12+rheqRJaF+Rt1FgFKIP2ZjN6
	jb6lJCtxYySvwbGh134kQmj4pRNyRrLr6/u1tovN3iP+JU416YO29EiYsSLZLoNhFcaFJhg/yqM
	kFUERT2QIntzEO7wLQ22idadZNhw+6u/BSGJxnfpN4qWx5gVJ/nnaIUdWBGTV0Srg==
X-Received: by 2002:a05:600c:1992:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-49b91c1fc56mr139042015e9.1.1787945910086;
        Fri, 28 Aug 2026 12:38:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 45/56] libxml2: set status for CVE-2026-6732
Date: Fri, 28 Aug 2026 21:35:55 +0200
Message-ID: <9f1716cde8aa2a59b6f525f44114e404312c18ae.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244606

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE.
[1] points to [2] and [3].
These were backported as [4] and [5] in v2.15.3.

[1] https://security-tracker.debian.org/tracker/CVE-2026-6732
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/226b560837b90dea9b14431eca6e6fda8fb01ab4
[3] https://gitlab.gnome.org/GNOME/libxml2/-/commit/7cea3fd1557437b88f2c7b5e1b71a2d5fb152b55
[4] https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad0f009a8366860272acb8e05c41a401798f2855
[5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/65d0fe61c6f36ee40431aeb041ea703e839ff60d

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 7a75c7c8485cb9225f1714c4c08e1fd05a95f145)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxml/libxml2_2.15.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.3.bb
index 02507d80422..abf9889b3f3 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -25,6 +25,7 @@ SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
+CVE_STATUS[CVE-2026-6732] = "fixed-version: fixed in version 2.15.3"
 
 BINCONFIG = "${bindir}/xml2-config"
 

