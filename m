Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BB2CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 11:15:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17090.1781781305202147579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 04:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fmi8nkGJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84538597e1fso433902b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781304; x=1782386104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB0Z2+SaSzQkeIG71noYLtyNECbmp3DJ2PmK3TUgYj0=;
        b=Fmi8nkGJ1ykFwxAfN0+hW0djbzGQ1GDy/xbGEZh8YT8R/8lRjC04e0egMdWUFLbDAH
         edpVcU2okMXPCvjKGqiirlswk5gg+eOcWCSYkyWx1MlSjqXHM1k6TyZHHlRsWnYk3WS5
         s+LICkm+6c7yeqlPUF97Bw8GfiqHToDppIa2Ehjxpu/5RwUzSM7RnHmmNO14pUubMt2O
         WD+4AODHSRF/Ccbo5TRUnMXWjCpUQYhBFxlCysn2UGyP3uMqGPCsEf3emeTe4KL2sxbO
         ns/NCpQxWEh5kHiZ1mzLFcgbJ8oLSfNpMuBbjRQEj58ratbqf9/XMN4wFcYEgj/EzvMv
         3OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781304; x=1782386104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AB0Z2+SaSzQkeIG71noYLtyNECbmp3DJ2PmK3TUgYj0=;
        b=MM9VZZu3031omG6eyfkErD+9AtKKMtH8YP7xVkN2H9FKJocIui23aDJhXEEx1sO2TG
         2+j28zET+lqag3MNveLHgvzbRwMcsR2y/IXA242nsmiByA+PKIwbHcinEPIxdLiDFTbx
         Z6nacEtPFuK9llKSjuUDYi/LxGElyQA1VmE7gJkgmbUn0sOmWMoBwdxuhO9HS6G3ZoOW
         xpH7KSrcMgd+KzWV/PVFyxRhkUPJDSQ+Er8eK73b6TLNY6Y/cQI9FiRR7/xEGomJSc5w
         W6kKwiCcWpSyezFqvcu+lRHX6U6XAUie/N/KNFVELhBpEhqu7lfyZ79jO7WSw9S45fJs
         rq7w==
X-Gm-Message-State: AOJu0YyIqRQRbPbL67qnruQI8W2+TpLTDgA0dO7jrG2xzZxco8/SXBY9
	af5SPt2kslC8iKaBlMyUM7Sh8+xrI3jFwiD4vC11sqnCxVIFky8blwtnMVTaEq8va5g=
X-Gm-Gg: AfdE7clb2kZwRjyK9oslqm4Iga7jiangx1hHgCoYI6R/VR28ew+v7GB1OkJUHruZYeG
	YN1EGwWakUXcrWkH0/pfXXTepasQ8BwmvJkvpxbQK92U08ZcTUgs0tSILnExqeFqJkvxK/UswUH
	M3obGgHf39+hG47gMBCnVPErx67UR9GLwm6yUDE63NbQ17CinCQ2mrBqxt+KNDYKFt/CwPQet70
	m8czPWit4pwV6PFRCFxtQgmiK+gibRfrpbCU+17ZDMXly28a98flAf672jTVD8aQKdyS0dohyIm
	7JvOw9L+RoAI9Xyj7DsMulgz+L1+27v9SO6gRTf0ZI1uaiRuOFwR6o4pZAbMcULoYGNYkiiKfqA
	z9RiJGLx8teFb9SP/KpunhcJ2aIUHMv+KgXBpZg1tXvz1yWR0QBsNSTCJVJBg8qAEug4GEi10We
	YCAoyEDjO1rEoBFZR9ibhGYOLYc94pgztS3bq9AVQL8FBhnQIV9M0ZPjM=
X-Received: by 2002:a05:6a00:4287:b0:845:4928:8655 with SMTP id d2e1a72fcca58-84549288c40mr816954b3a.39.1781781304473;
        Thu, 18 Jun 2026 04:15:04 -0700 (PDT)
Received: from naduvan.timesys.com ([223.184.90.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9bfe1sm19767475b3a.12.2026.06.18.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:15:04 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Nate Kent <nathan@otiv.ai>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: Re: [PATCH] Update sed usage by 'pam-wheel' for sudoers
Date: Thu, 18 Jun 2026 16:44:58 +0530
Message-Id: <20260618111458.3490459-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618102839.363123-1-nathan@otiv.ai>
References: <20260618102839.363123-1-nathan@otiv.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 11:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239076

The code change here is identical to one I independently posted:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260618110111.3484982-1-sivakumar.bs@gmail.com/

I built sudo with DISTRO_FEATURES += "pam" and PACKAGECONFIG:pn-sudo +=
"pam-wheel" and confirmed /etc/sudoers ends up with

    %wheel ALL=(ALL:ALL) ALL

uncommented, while the separate "# %wheel ALL=(ALL:ALL) NOPASSWD: ALL"
line is correctly left commented.

Tested-by: Siva Balasubramanian <sivakumar.bs@gmail.com>

One note: patchtest flagged the shortlog (it should be prefixed
"sudo: ..."), and the bug reference is best written as "[YOCTO #16321]"
so it auto-links. A v2 would be needed for those. Happy for either
patch to land.

