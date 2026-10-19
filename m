Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5094CCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27998.1792386475374836669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HZJFWbzH;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so20808595e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792386474; x=1792991274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S1m6b9sglfHIn80NUDMDS4wPyL+onlIsgvq8KLr+HMU=;
        b=HZJFWbzH2FJHy01+UsgtoCiCLE850ar2eX5PmGLdcFKAFDDktZL5+XkSbgsVFkQIvC
         BT6ZgJ5SwI1WUwPIJ6WvnPsF5zbZ2ClKbpBYRjgUrkMphO/uxsrb1vyEmUpfDSAxYDF+
         fhp9/dfc72p4KimzARC3qzUApXoC+lsc1RGqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386474; x=1792991274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S1m6b9sglfHIn80NUDMDS4wPyL+onlIsgvq8KLr+HMU=;
        b=n0X28TlvRxt64y0RhXYycgBblmZF3UfA+9S9BuB0Q04ngSsxzAWTZ4aiP+Th5bSu2y
         JNsDYx1BrYjmyV1cBGZSKNnJtI38OB0bGOHeGWruPFYspYg1eJrHO1dovbH75VTsa7y6
         AmyrBc5iTISZbhE45Dx5hlzoMsjDsRlT7Ed3ZsueXgTrEO84L834WfF03rpSR1YAK86y
         7abRbhBo3OPrhymSZYYey5K5f5FbidCB1pGljmLrZdJrW2Py17TIgCgyG+lLLlBw9TdQ
         oKCip8vUYyEpPUr5J4neaSRRs/0vzN2W0m+GVltL6jO4vRXB853sOq/jbaJoHlSM5JMl
         6rkA==
X-Gm-Message-State: AFq9FYLnP+Xf09ikW1aP1KyyD4jKs8UUqKNiIUPCv19X+uey1FavL6dl
	fvkHT/5S8Mr7IhGH8/LmTVtnkTAZUD5BMeWptfwKwsCwH8u5mR9bL9TMhQvltHO+IbEsv0BTZai
	2IGl2hcA=
X-Gm-Gg: AYBFou0zC0V0qX0TTOyPWSq8dQm34kxOQRUZ8hUJzNMSq0AOywnahpBzHYst9ypU4rI
	5st7HRXnEQT2F39I1zU2BCEiGpBNLaqE77E1vO+NyvA9hoPDk0JYM4+KCHLKvcsXeEQSH4/u/b+
	fbNa0kXymsJzNZOfSc59nIUIHge9qYVsxQL7yk5F2L8puKl0xzgfGlJXUCC9OPsZnlI2oN8n5+k
	pSViSmUkj9vv0VODl7xUVBz1Hyrz7fFy26luy59mjclbYd5DfJ0RmnND5CGM2TMMN9yDict8VxD
	t4O9Iu6LUU94JUBeOVPV8hLJh6k+6y9QY5NZnsDe3ko6VElwUqvh4SFBIGQRtrPTmhC/Y2TRhIA
	1MyYgc4OgPD8aXzjo9b3paQYR3eK7niH8De/ydvS/sSX4Cz9tk0o/zROM2aGqpDhVS4zBKS3w2S
	dvdI2p3ZBtpsySMs+WY6vn/0J/o2KFvWydpC4rGnbuMQjcLhsOyjECWWHFcC0ZVhxVitxBVMNdP
	yRLhEJdXAN3lT/TLFDSHBcvV9ELbS45pe8pcDkh1fRiPc/oWk7eAbltsU8tyTPMK9ougS8+ZI6R
	F/0yCfWXNPp79m/9UihfFxovMCBK3hUBByabotXSkAbs
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1d75aa87cmr153569495e9.2.1792386471354;
        Sun, 18 Oct 2026 22:07:51 -0700 (PDT)
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm240158465e9.14.2026.10.18.22.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 22:07:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for wrynose on Mon Oct 19 03:05:10 2026
Date: Mon, 19 Oct 2026 05:07:45 +0000
Message-ID: <20261019050745.24-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019050745.24-1-yoann.congal@smile.fr>
References: <20261019050745.24-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248120

Branch: wrynose

New this week: 481 CVEs
CVE-2024-3220 (CVSSv4: 2.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2024-3220 *
CVE-2026-30754 (CVSSv3: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30754 *
CVE-2026-53613 (CVSSv3: 7.0): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-53613 *
CVE-2026-55453 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55453 *
CVE-2026-55467 (CVSSv3: 2.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55467 *
CVE-2026-55480 (CVSSv3: 5.7): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55480 *
CVE-2026-61702 (CVSSv3: 5.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-61702 *
CVE-2026-63858 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63858 *
CVE-2026-68382 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68382 *
CVE-2026-68383 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68383 *
CVE-2026-72439 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72439 *
CVE-2026-72493 (CVSSv3: 9.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72493 *
CVE-2026-74368 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74368 *
CVE-2026-74529 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74529 *
CVE-2026-74530 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74530 *
CVE-2026-74571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74571 *
CVE-2026-74605 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74605 *
CVE-2026-74733 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74733 *
CVE-2026-80692 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80692 *
CVE-2026-80698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80698 *
CVE-2026-80866 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80866 *
CVE-2026-90087 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90087 *
CVE-2026-90261 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90261 *
CVE-2026-90289 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90289 *
CVE-2026-90300 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90300 *
CVE-2026-90401 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90401 *
CVE-2026-92392 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92392 *
CVE-2026-92485 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92485 *
CVE-2026-92503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92503 *
CVE-2026-93081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93081 *
CVE-2026-93272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93272 *
CVE-2026-97554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97554 *
CVE-2026-97933 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97933 *
CVE-2026-98034 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98034 *
CVE-2026-98057 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98057 *
CVE-2026-98084 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98084 *
CVE-2026-98386 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98386 *
CVE-2026-98387 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98387 *
CVE-2026-98388 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98388 *
CVE-2026-98389 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98389 *
CVE-2026-98390 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98390 *
CVE-2026-98392 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98392 *
CVE-2026-98393 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98393 *
CVE-2026-98394 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98394 *
CVE-2026-98398 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98398 *
CVE-2026-98399 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98399 *
CVE-2026-98400 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98400 *
CVE-2026-98401 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98401 *
CVE-2026-98402 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98402 *
CVE-2026-98403 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98403 *
CVE-2026-98404 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98404 *
CVE-2026-98405 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98405 *
CVE-2026-98406 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98406 *
CVE-2026-98407 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98407 *
CVE-2026-98408 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98408 *
CVE-2026-98409 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98409 *
CVE-2026-98410 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98410 *
CVE-2026-98411 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98411 *
CVE-2026-98412 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98412 *
CVE-2026-98413 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98413 *
CVE-2026-98414 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98414 *
CVE-2026-98415 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98415 *
CVE-2026-98416 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98416 *
CVE-2026-98417 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98417 *
CVE-2026-98419 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98419 *
CVE-2026-98421 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98421 *
CVE-2026-98422 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98422 *
CVE-2026-98423 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98423 *
CVE-2026-98424 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98424 *
CVE-2026-98425 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98425 *
CVE-2026-98426 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98426 *
CVE-2026-98427 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98427 *
CVE-2026-98428 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98428 *
CVE-2026-98429 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98429 *
CVE-2026-98430 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98430 *
CVE-2026-98432 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98432 *
CVE-2026-98433 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98433 *
CVE-2026-98435 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98435 *
CVE-2026-98436 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98436 *
CVE-2026-98437 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98437 *
CVE-2026-98439 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98439 *
CVE-2026-98440 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98440 *
CVE-2026-98441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98441 *
CVE-2026-98442 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98442 *
CVE-2026-98443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98443 *
CVE-2026-98445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98445 *
CVE-2026-98446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98446 *
CVE-2026-98447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98447 *
CVE-2026-98448 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98448 *
CVE-2026-98450 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98450 *
CVE-2026-98451 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98451 *
CVE-2026-98452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98452 *
CVE-2026-98453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98453 *
CVE-2026-98454 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98454 *
CVE-2026-98455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98455 *
CVE-2026-98456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98456 *
CVE-2026-98457 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98457 *
CVE-2026-98458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98458 *
CVE-2026-98459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98459 *
CVE-2026-98460 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98460 *
CVE-2026-98461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98461 *
CVE-2026-98462 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98462 *
CVE-2026-98463 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98463 *
CVE-2026-98464 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98464 *
CVE-2026-98465 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98465 *
CVE-2026-98466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98466 *
CVE-2026-98467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98467 *
CVE-2026-98468 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98468 *
CVE-2026-98469 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98469 *
CVE-2026-98471 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98471 *
CVE-2026-98472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98472 *
CVE-2026-98473 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98473 *
CVE-2026-98474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98474 *
CVE-2026-98475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98475 *
CVE-2026-98476 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98476 *
CVE-2026-98477 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98477 *
CVE-2026-98479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98479 *
CVE-2026-98480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98480 *
CVE-2026-98481 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98481 *
CVE-2026-98482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98482 *
CVE-2026-98483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98483 *
CVE-2026-98484 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98484 *
CVE-2026-98485 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98485 *
CVE-2026-98486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98486 *
CVE-2026-98487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98487 *
CVE-2026-98488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98488 *
CVE-2026-98489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98489 *
CVE-2026-98490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98490 *
CVE-2026-98491 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98491 *
CVE-2026-98492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98492 *
CVE-2026-98493 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98493 *
CVE-2026-98494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98494 *
CVE-2026-98495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98495 *
CVE-2026-98496 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98496 *
CVE-2026-98497 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98497 *
CVE-2026-98498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98498 *
CVE-2026-98499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98499 *
CVE-2026-98501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98501 *
CVE-2026-98502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98502 *
CVE-2026-98503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98503 *
CVE-2026-98504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98504 *
CVE-2026-98505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98505 *
CVE-2026-98506 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98506 *
CVE-2026-98507 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98507 *
CVE-2026-98508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98508 *
CVE-2026-98509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98509 *
CVE-2026-98510 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98510 *
CVE-2026-98511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98511 *
CVE-2026-98512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98512 *
CVE-2026-98513 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98513 *
CVE-2026-98514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98514 *
CVE-2026-98515 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98515 *
CVE-2026-98516 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98516 *
CVE-2026-98517 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98517 *
CVE-2026-98519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98519 *
CVE-2026-98521 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98521 *
CVE-2026-98522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98522 *
CVE-2026-98523 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98523 *
CVE-2026-98524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98524 *
CVE-2026-98525 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98525 *
CVE-2026-98526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98526 *
CVE-2026-98527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98527 *
CVE-2026-98528 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98528 *
CVE-2026-98529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98529 *
CVE-2026-98531 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98531 *
CVE-2026-98532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98532 *
CVE-2026-98533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98533 *
CVE-2026-98534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98534 *
CVE-2026-98535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98535 *
CVE-2026-98536 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98536 *
CVE-2026-98537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98537 *
CVE-2026-98538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98538 *
CVE-2026-98539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98539 *
CVE-2026-98541 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98541 *
CVE-2026-98542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98542 *
CVE-2026-98543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98543 *
CVE-2026-98544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98544 *
CVE-2026-98545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98545 *
CVE-2026-98546 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98546 *
CVE-2026-98547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98547 *
CVE-2026-98548 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98548 *
CVE-2026-98549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98549 *
CVE-2026-98550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98550 *
CVE-2026-98551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98551 *
CVE-2026-98552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98552 *
CVE-2026-98553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98553 *
CVE-2026-98554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98554 *
CVE-2026-98555 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98555 *
CVE-2026-98556 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98556 *
CVE-2026-98558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98558 *
CVE-2026-98559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98559 *
CVE-2026-98561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98561 *
CVE-2026-98562 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98562 *
CVE-2026-98563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98563 *
CVE-2026-98564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98564 *
CVE-2026-98565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98565 *
CVE-2026-98566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98566 *
CVE-2026-98567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98567 *
CVE-2026-98568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98568 *
CVE-2026-98569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98569 *
CVE-2026-98571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98571 *
CVE-2026-98572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98572 *
CVE-2026-98573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98573 *
CVE-2026-98574 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98574 *
CVE-2026-98575 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98575 *
CVE-2026-98576 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98576 *
CVE-2026-98577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98577 *
CVE-2026-98578 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98578 *
CVE-2026-98579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98579 *
CVE-2026-98580 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98580 *
CVE-2026-98581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98581 *
CVE-2026-98582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98582 *
CVE-2026-98583 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98583 *
CVE-2026-98584 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98584 *
CVE-2026-98585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98585 *
CVE-2026-98586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98586 *
CVE-2026-98588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98588 *
CVE-2026-98589 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98589 *
CVE-2026-98590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98590 *
CVE-2026-98591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98591 *
CVE-2026-98592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98592 *
CVE-2026-98593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98593 *
CVE-2026-98594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98594 *
CVE-2026-98595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98595 *
CVE-2026-98596 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98596 *
CVE-2026-98597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98597 *
CVE-2026-98598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98598 *
CVE-2026-98599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98599 *
CVE-2026-98601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98601 *
CVE-2026-98602 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98602 *
CVE-2026-98603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98603 *
CVE-2026-98604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98604 *
CVE-2026-98605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98605 *
CVE-2026-98606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98606 *
CVE-2026-98607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98607 *
CVE-2026-98608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98608 *
CVE-2026-98609 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98609 *
CVE-2026-98610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98610 *
CVE-2026-98611 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98611 *
CVE-2026-98612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98612 *
CVE-2026-98613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98613 *
CVE-2026-98614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98614 *
CVE-2026-98615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98615 *
CVE-2026-98616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98616 *
CVE-2026-98617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98617 *
CVE-2026-98618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98618 *
CVE-2026-98620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98620 *
CVE-2026-98621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98621 *
CVE-2026-98622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98622 *
CVE-2026-98623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98623 *
CVE-2026-98624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98624 *
CVE-2026-98625 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98625 *
CVE-2026-98626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98626 *
CVE-2026-98628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98628 *
CVE-2026-98629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98629 *
CVE-2026-98630 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98630 *
CVE-2026-98631 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98631 *
CVE-2026-98632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98632 *
CVE-2026-98633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98633 *
CVE-2026-98634 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98634 *
CVE-2026-98636 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98636 *
CVE-2026-98637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98637 *
CVE-2026-98638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98638 *
CVE-2026-98639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98639 *
CVE-2026-98640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98640 *
CVE-2026-98641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98641 *
CVE-2026-98642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98642 *
CVE-2026-98643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98643 *
CVE-2026-98644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98644 *
CVE-2026-98646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98646 *
CVE-2026-98647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98647 *
CVE-2026-98648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98648 *
CVE-2026-98652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98652 *
CVE-2026-98655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98655 *
CVE-2026-98656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98656 *
CVE-2026-98657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98657 *
CVE-2026-98658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98658 *
CVE-2026-98659 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98659 *
CVE-2026-98660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98660 *
CVE-2026-98661 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98661 *
CVE-2026-98662 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98662 *
CVE-2026-98663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98663 *
CVE-2026-98664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98664 *
CVE-2026-98665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98665 *
CVE-2026-98666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98666 *
CVE-2026-98668 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98668 *
CVE-2026-98669 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98669 *
CVE-2026-98670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98670 *
CVE-2026-98671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98671 *
CVE-2026-98672 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98672 *
CVE-2026-98673 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98673 *
CVE-2026-98674 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98674 *
CVE-2026-98675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98675 *
CVE-2026-98676 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98676 *
CVE-2026-98677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98677 *
CVE-2026-98678 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98678 *
CVE-2026-98679 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98679 *
CVE-2026-98680 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98680 *
CVE-2026-98681 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98681 *
CVE-2026-98683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98683 *
CVE-2026-98684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98684 *
CVE-2026-98686 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98686 *
CVE-2026-98687 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98687 *
CVE-2026-98689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98689 *
CVE-2026-98690 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98690 *
CVE-2026-98691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98691 *
CVE-2026-98692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98692 *
CVE-2026-98693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98693 *
CVE-2026-98694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98694 *
CVE-2026-98695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98695 *
CVE-2026-98696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98696 *
CVE-2026-98697 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98697 *
CVE-2026-98698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98698 *
CVE-2026-98699 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98699 *
CVE-2026-98700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98700 *
CVE-2026-98701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98701 *
CVE-2026-98702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98702 *
CVE-2026-98703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98703 *
CVE-2026-98704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98704 *
CVE-2026-98705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98705 *
CVE-2026-98706 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98706 *
CVE-2026-98707 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98707 *
CVE-2026-98708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98708 *
CVE-2026-98709 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98709 *
CVE-2026-98710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98710 *
CVE-2026-98711 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98711 *
CVE-2026-98713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98713 *
CVE-2026-98714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98714 *
CVE-2026-98715 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98715 *
CVE-2026-98716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98716 *
CVE-2026-98717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98717 *
CVE-2026-98720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98720 *
CVE-2026-98721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98721 *
CVE-2026-98722 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98722 *
CVE-2026-98723 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98723 *
CVE-2026-98724 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98724 *
CVE-2026-98725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98725 *
CVE-2026-98726 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98726 *
CVE-2026-98727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98727 *
CVE-2026-98728 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98728 *
CVE-2026-98729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98729 *
CVE-2026-98730 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98730 *
CVE-2026-98731 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98731 *
CVE-2026-98732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98732 *
CVE-2026-98733 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98733 *
CVE-2026-98734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98734 *
CVE-2026-98735 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98735 *
CVE-2026-98736 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98736 *
CVE-2026-98737 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98737 *
CVE-2026-98738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98738 *
CVE-2026-98739 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98739 *
CVE-2026-98740 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98740 *
CVE-2026-98741 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98741 *
CVE-2026-98742 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98742 *
CVE-2026-98743 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98743 *
CVE-2026-98744 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98744 *
CVE-2026-98745 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98745 *
CVE-2026-98746 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98746 *
CVE-2026-98747 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98747 *
CVE-2026-98748 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98748 *
CVE-2026-98749 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98749 *
CVE-2026-98750 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98750 *
CVE-2026-98751 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98751 *
CVE-2026-98752 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98752 *
CVE-2026-98753 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98753 *
CVE-2026-98754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98754 *
CVE-2026-98755 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98755 *
CVE-2026-98756 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98756 *
CVE-2026-98757 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98757 *
CVE-2026-98758 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98758 *
CVE-2026-98759 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98759 *
CVE-2026-98760 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98760 *
CVE-2026-98761 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98761 *
CVE-2026-98762 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98762 *
CVE-2026-98763 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98763 *
CVE-2026-98764 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98764 *
CVE-2026-98765 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98765 *
CVE-2026-98766 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98766 *
CVE-2026-98767 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98767 *
CVE-2026-98768 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98768 *
CVE-2026-98769 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98769 *
CVE-2026-98770 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98770 *
CVE-2026-98771 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98771 *
CVE-2026-98772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98772 *
CVE-2026-98773 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98773 *
CVE-2026-98774 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98774 *
CVE-2026-98775 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98775 *
CVE-2026-98777 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98777 *
CVE-2026-98778 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98778 *
CVE-2026-98779 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98779 *
CVE-2026-98780 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98780 *
CVE-2026-98781 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98781 *
CVE-2026-98782 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98782 *
CVE-2026-98783 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98783 *
CVE-2026-98784 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98784 *
CVE-2026-98785 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98785 *
CVE-2026-98786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98786 *
CVE-2026-98788 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98788 *
CVE-2026-98789 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98789 *
CVE-2026-98790 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98790 *
CVE-2026-98791 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98791 *
CVE-2026-98792 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98792 *
CVE-2026-98793 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98793 *
CVE-2026-98794 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98794 *
CVE-2026-98795 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98795 *
CVE-2026-98796 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98796 *
CVE-2026-98797 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98797 *
CVE-2026-98798 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98798 *
CVE-2026-98801 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98801 *
CVE-2026-98802 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98802 *
CVE-2026-98803 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98803 *
CVE-2026-98804 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98804 *
CVE-2026-98805 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98805 *
CVE-2026-98807 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98807 *
CVE-2026-98808 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98808 *
CVE-2026-98809 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98809 *
CVE-2026-98810 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98810 *
CVE-2026-98811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98811 *
CVE-2026-98812 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98812 *
CVE-2026-98814 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98814 *
CVE-2026-98815 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98815 *
CVE-2026-98816 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98816 *
CVE-2026-98818 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98818 *
CVE-2026-98819 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98819 *
CVE-2026-98820 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98820 *
CVE-2026-98821 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98821 *
CVE-2026-98822 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98822 *
CVE-2026-98823 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98823 *
CVE-2026-98824 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98824 *
CVE-2026-98825 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98825 *
CVE-2026-98826 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98826 *
CVE-2026-98827 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98827 *
CVE-2026-98828 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98828 *
CVE-2026-98829 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98829 *
CVE-2026-98830 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98830 *
CVE-2026-98831 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98831 *
CVE-2026-98833 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98833 *
CVE-2026-98835 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98835 *
CVE-2026-98836 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98836 *
CVE-2026-98837 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98837 *
CVE-2026-98838 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98838 *
CVE-2026-98839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98839 *
CVE-2026-98840 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98840 *
CVE-2026-98841 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98841 *
CVE-2026-98842 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98842 *
CVE-2026-98843 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98843 *
CVE-2026-98844 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98844 *
CVE-2026-98845 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98845 *
CVE-2026-98846 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98846 *
CVE-2026-98847 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98847 *
CVE-2026-98848 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98848 *
CVE-2026-98849 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98849 *
CVE-2026-98850 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98850 *
CVE-2026-98851 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98851 *
CVE-2026-98852 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98852 *
CVE-2026-98853 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98853 *
CVE-2026-98854 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98854 *
CVE-2026-98855 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98855 *
CVE-2026-98856 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98856 *
CVE-2026-98857 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98857 *
CVE-2026-98858 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98858 *
CVE-2026-98859 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98859 *
CVE-2026-98860 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98860 *
CVE-2026-98861 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98861 *
CVE-2026-98862 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98862 *
CVE-2026-98863 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98863 *
CVE-2026-99999 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99999 *
CVE-2026-102555 (CVSSv3: 8.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102555 *
CVE-2026-102556 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102556 *
CVE-2026-102557 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102557 *
CVE-2026-102558 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102558 *
CVE-2026-102559 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102559 *
CVE-2026-102560 (CVSSv3: 9.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102560 *
CVE-2026-103658 (CVSSv3: 5.9): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-103658 *
CVE-2026-109828 (CVSSv2: 5.0, CVSSv3: 4.3, CVSSv4: 5.3): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2026-109828 *
CVE-2026-110855 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110855 *
CVE-2026-110856 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110856 *
CVE-2026-110857 (CVSSv3: 7.5, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110857 *
CVE-2026-110858 (CVSSv3: 8.1, CVSSv4: 9.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110858 *
CVE-2026-110859 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110859 *
CVE-2026-111269 (CVSSv3: 6.1, CVSSv4: 6.9): libical:libical-native https://nvd.nist.gov/vuln/detail/CVE-2026-111269 *

Removed this week: 83 CVEs
CVE-2011-0536 (CVSSv2: 6.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2011-0536 *
CVE-2015-3216 (CVSSv2: 4.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2015-3216 *
CVE-2017-5731 (CVSSv2: 4.6, CVSSv3: 7.8): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2017-5731 *
CVE-2019-14584 (CVSSv2: 4.6, CVSSv3: 7.8): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2019-14584 *
CVE-2020-15704 (CVSSv2: 2.1, CVSSv3: 5.5): ppp https://nvd.nist.gov/vuln/detail/CVE-2020-15704 *
CVE-2020-15710 (CVSSv2: 3.6, CVSSv3: 6.1): pulseaudio https://nvd.nist.gov/vuln/detail/CVE-2020-15710 *
CVE-2020-16123 (CVSSv2: 2.1, CVSSv3: 4.7): pulseaudio https://nvd.nist.gov/vuln/detail/CVE-2020-16123 *
CVE-2023-0361 (CVSSv3: 7.4): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2023-0361 *
CVE-2025-0577 (CVSSv3: 4.8): glibc https://nvd.nist.gov/vuln/detail/CVE-2025-0577 *
CVE-2025-12801 (CVSSv3: 6.5): nfs-utils https://nvd.nist.gov/vuln/detail/CVE-2025-12801 *
CVE-2026-4424 (CVSSv3: 7.5): libarchive:libarchive-native https://nvd.nist.gov/vuln/detail/CVE-2026-4424 *
CVE-2026-8674 (CVSSv3: 5.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-8674 *
CVE-2026-18374 (CVSSv3: 4.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-18374 *
CVE-2026-19033 (CVSSv3: 6.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19033 *
CVE-2026-19499 (CVSSv3: 7.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19499 *
CVE-2026-19542 (CVSSv3: 5.6): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19542 *
CVE-2026-19662 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19662 *
CVE-2026-19666 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19666 *
CVE-2026-19667 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19667 *
CVE-2026-19668 (CVSSv3: 5.3): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19668 *
CVE-2026-19941 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19941 *
CVE-2026-35189 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-35189 *
CVE-2026-35191 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-35191 *
CVE-2026-42772 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-42772 *
CVE-2026-48863 (CVSSv3: 7.5): libsolv https://nvd.nist.gov/vuln/detail/CVE-2026-48863 *
CVE-2026-51400 (CVSSv3: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-51400 *
CVE-2026-51401 (CVSSv3: 7.7): vim https://nvd.nist.gov/vuln/detail/CVE-2026-51401 *
CVE-2026-54872 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54872 *
CVE-2026-54873 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54873 *
CVE-2026-54875 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54875 *
CVE-2026-55654 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55654 *
CVE-2026-55655 (CVSSv3: 6.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55655 *
CVE-2026-55999 (CVSSv3: 8.5): xserver-xorg https://nvd.nist.gov/vuln/detail/CVE-2026-55999 *
CVE-2026-56000 (CVSSv3: 7.8, CVSSv4: 9.0): xserver-xorg https://nvd.nist.gov/vuln/detail/CVE-2026-56000 *
CVE-2026-56857 (CVSSv3: 9.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-56857 *
CVE-2026-56866 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-56866 *
CVE-2026-66036 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66036 *
CVE-2026-66041 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66041 *
CVE-2026-66046 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-66046 *
CVE-2026-72897 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-72897 *
CVE-2026-73281 (CVSSv3: 3.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-73281 *
CVE-2026-73282 (CVSSv3: 4.8): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-73282 *
CVE-2026-73283 (CVSSv3: 2.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-73283 *
CVE-2026-75029 (CVSSv3: 5.3): bind https://nvd.nist.gov/vuln/detail/CVE-2026-75029 *
CVE-2026-75804 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75804 *
CVE-2026-75805 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75805 *
CVE-2026-75806 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75806 *
CVE-2026-76163 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-76163 *
CVE-2026-76641 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76641 *
CVE-2026-76642 (CVSSv3: 7.8, CVSSv4: 8.5): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-76642 *
CVE-2026-76956 (CVSSv3: 7.5): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76956 *
CVE-2026-76957 (CVSSv3: 7.8): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76957 *
CVE-2026-77117 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-77117 *
CVE-2026-77119 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-77119 *
CVE-2026-77692 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-77692 *
CVE-2026-77696 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-77696 *
CVE-2026-78301 (CVSSv3: 5.8): bind https://nvd.nist.gov/vuln/detail/CVE-2026-78301 *
CVE-2026-78659 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-78659 *
CVE-2026-78660 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-78660 *
CVE-2026-78663 (CVSSv3: 9.1): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-78663 *
CVE-2026-78667 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-78667 *
CVE-2026-78669 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-78669 *
CVE-2026-80274 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-80274 *
CVE-2026-80489 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-80489 *
CVE-2026-81281 (CVSSv3: 6.5): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-81281 *
CVE-2026-81563 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-81563 *
CVE-2026-81736 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-81736 *
CVE-2026-84782 (CVSSv3: 8.2): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-84782 *
CVE-2026-84784 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-84784 *
CVE-2026-86805 (CVSSv3: 6.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-86805 *
CVE-2026-89092 (CVSSv3: 4.2): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-89092 *
CVE-2026-90781 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-90781 *
CVE-2026-93990 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-93990 *
CVE-2026-94439 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94439 *
CVE-2026-94440 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94440 *
CVE-2026-94444 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94444 *
CVE-2026-94447 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94447 *
CVE-2026-94448 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94448 *
CVE-2026-95818 (CVSSv3: 3.6): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-95818 *
CVE-2026-97030 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97030 *
CVE-2026-97031 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97031 *
CVE-2026-97032 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97032 *
CVE-2026-97399 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-97399 *

Full list: Found 1715 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-0400 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0400 *
CVE-2022-1247 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1247 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-3220 (CVSSv4: 2.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2024-3220 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-50422 (CVSSv3: 2.9): cairo:cairo-native https://nvd.nist.gov/vuln/detail/CVE-2025-50422 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-59529 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-59529 *
CVE-2025-71074 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71074 *
CVE-2025-71306 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71306 *
CVE-2025-71308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71308 *
CVE-2025-71313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71313 *
CVE-2026-2625 (CVSSv3: 5.5): rpm-sequoia https://nvd.nist.gov/vuln/detail/CVE-2026-2625 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3195 (CVSSv3: 7.4): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3195 *
CVE-2026-3196 (CVSSv3: 5.5): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3196 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-3842 (CVSSv3: 7.8): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3842 *
CVE-2026-5201 (CVSSv3: 7.5): gdk-pixbuf:gdk-pixbuf-native https://nvd.nist.gov/vuln/detail/CVE-2026-5201 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-5917 (CVSSv3: 8.8, CVSSv4: 8.6): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-5917 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-8926 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8926 *
CVE-2026-11564 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11564 *
CVE-2026-11856 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11856 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-15310 (CVSSv4: 2.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15310 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-17025 (CVSSv3: 6.4): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-17025 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18739 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18739 *
CVE-2026-18743 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18743 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-18924 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-18924 *
CVE-2026-19445 (CVSSv4: 9.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19445 *
CVE-2026-19547 (CVSSv4: 7.0): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-19547 *
CVE-2026-19553 (CVSSv4: 7.6): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19553 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-19774 (CVSSv3: 7.1): bluez5 https://nvd.nist.gov/vuln/detail/CVE-2026-19774 *
CVE-2026-19931 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-19931 *
CVE-2026-23328 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23328 *
CVE-2026-23374 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23374 *
CVE-2026-23377 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23377 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-29518 (CVSSv3: 7.8, CVSSv4: 7.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-29518 *
CVE-2026-30754 (CVSSv3: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30754 *
CVE-2026-31501 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31501 *
CVE-2026-31771 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31771 *
CVE-2026-31777 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31777 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-39919 (CVSSv3: 9.8, CVSSv4: 9.3): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-39919 *
CVE-2026-41035 (CVSSv3: 7.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-41035 *
CVE-2026-43022 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43022 *
CVE-2026-43042 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43042 *
CVE-2026-43045 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43045 *
CVE-2026-43053 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43053 *
CVE-2026-43095 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43095 *
CVE-2026-43115 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43115 *
CVE-2026-43131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43131 *
CVE-2026-43174 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43174 *
CVE-2026-43191 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43191 *
CVE-2026-43204 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43204 *
CVE-2026-43228 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43228 *
CVE-2026-43299 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43299 *
CVE-2026-43308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43308 *
CVE-2026-43310 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43310 *
CVE-2026-43311 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43311 *
CVE-2026-43326 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43326 *
CVE-2026-43414 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43414 *
CVE-2026-43443 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43443 *
CVE-2026-43617 (CVSSv3: 4.8, CVSSv4: 6.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43617 *
CVE-2026-43618 (CVSSv3: 8.1, CVSSv4: 6.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43618 *
CVE-2026-43619 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43619 *
CVE-2026-43620 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43620 *
CVE-2026-44432 (CVSSv3: 7.5, CVSSv4: 8.9): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-44432 *
CVE-2026-44950 (CVSSv3: 9.0, CVSSv4: 9.5): libxfont https://nvd.nist.gov/vuln/detail/CVE-2026-44950 *
CVE-2026-45232 (CVSSv3: 3.7, CVSSv4: 2.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-45232 *
CVE-2026-45961 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45961 *
CVE-2026-45991 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45991 *
CVE-2026-46008 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46008 *
CVE-2026-46017 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46017 *
CVE-2026-46032 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46032 *
CVE-2026-46153 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46153 *
CVE-2026-46210 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46210 *
CVE-2026-46245 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46245 *
CVE-2026-46298 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46298 *
CVE-2026-46302 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46302 *
CVE-2026-46311 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46311 *
CVE-2026-46330 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46330 *
CVE-2026-48864 (CVSSv3: 7.8): libsolv https://nvd.nist.gov/vuln/detail/CVE-2026-48864 *
CVE-2026-49825 (CVSSv3: 8.2): python3-lxml:python3-lxml-native https://nvd.nist.gov/vuln/detail/CVE-2026-49825 *
CVE-2026-52949 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52949 *
CVE-2026-52956 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52956 *
CVE-2026-52960 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52960 *
CVE-2026-52965 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52965 *
CVE-2026-52988 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52988 *
CVE-2026-53007 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53007 *
CVE-2026-53008 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53008 *
CVE-2026-53009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53009 *
CVE-2026-53017 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53017 *
CVE-2026-53024 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53024 *
CVE-2026-53025 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53025 *
CVE-2026-53091 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53091 *
CVE-2026-53106 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53106 *
CVE-2026-53108 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53108 *
CVE-2026-53124 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53124 *
CVE-2026-53222 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53222 *
CVE-2026-53257 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53257 *
CVE-2026-53285 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53285 *
CVE-2026-53292 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53292 *
CVE-2026-53308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53308 *
CVE-2026-53401 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53401 *
CVE-2026-53583 (CVSSv3: 6.5): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53583 *
CVE-2026-53584 (CVSSv3: 4.3): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53584 *
CVE-2026-53585 (CVSSv3: 5.3): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53585 *
CVE-2026-53586 (CVSSv3: 6.5): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53586 *
CVE-2026-53587 (CVSSv3: 7.5): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53587 *
CVE-2026-53613 (CVSSv3: 7.0): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-53613 *
CVE-2026-53783 (CVSSv3: 8.1, CVSSv4: 8.6): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53783 *
CVE-2026-53784 (CVSSv3: 7.1, CVSSv4: 8.4): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53784 *
CVE-2026-53785 (CVSSv3: 7.1, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53785 *
CVE-2026-53786 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53786 *
CVE-2026-53788 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53788 *
CVE-2026-53789 (CVSSv3: 8.1, CVSSv4: 7.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53789 *
CVE-2026-53790 (CVSSv3: 8.1, CVSSv4: 9.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53790 *
CVE-2026-53791 (CVSSv3: 9.1, CVSSv4: 9.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53791 *
CVE-2026-53792 (CVSSv3: 6.5, CVSSv4: 7.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53792 *
CVE-2026-53793 (CVSSv3: 7.4, CVSSv4: 9.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53793 *
CVE-2026-53794 (CVSSv3: 5.3, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53794 *
CVE-2026-53795 (CVSSv3: 8.1, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53795 *
CVE-2026-53796 (CVSSv3: 6.3, CVSSv4: 5.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53796 *
CVE-2026-53797 (CVSSv3: 4.7, CVSSv4: 5.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53797 *
CVE-2026-53798 (CVSSv3: 5.3, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53798 *
CVE-2026-53799 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53799 *
CVE-2026-53800 (CVSSv3: 4.7, CVSSv4: 5.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53800 *
CVE-2026-53801 (CVSSv3: 5.9, CVSSv4: 8.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53801 *
CVE-2026-53802 (CVSSv3: 7.1, CVSSv4: 8.4): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53802 *
CVE-2026-53803 (CVSSv3: 7.8, CVSSv4: 8.5): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53803 *
CVE-2026-54369 (CVSSv3: 7.1, CVSSv4: 8.4): acl:acl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54369 *
CVE-2026-54370 (CVSSv3: 6.3, CVSSv4: 7.2): acl:acl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54370 *
CVE-2026-54371 (CVSSv3: 7.1, CVSSv4: 8.4): attr:attr-native https://nvd.nist.gov/vuln/detail/CVE-2026-54371 *
CVE-2026-55453 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55453 *
CVE-2026-55467 (CVSSv3: 2.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55467 *
CVE-2026-55480 (CVSSv3: 5.7): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55480 *
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-56392 (CVSSv3: 6.1, CVSSv4: 1.8): coreutils:coreutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-56392 *
CVE-2026-58049 (CVSSv3: 8.6, CVSSv4: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-58049 *
CVE-2026-61702 (CVSSv3: 5.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-61702 *
CVE-2026-63811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63811 *
CVE-2026-63858 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63858 *
CVE-2026-63879 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63879 *
CVE-2026-63941 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63941 *
CVE-2026-63977 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63977 *
CVE-2026-63983 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63983 *
CVE-2026-64013 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64013 *
CVE-2026-64019 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64019 *
CVE-2026-64020 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64020 *
CVE-2026-64040 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64040 *
CVE-2026-64057 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64057 *
CVE-2026-64067 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64067 *
CVE-2026-64079 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64079 *
CVE-2026-64117 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64117 *
CVE-2026-64123 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64123 *
CVE-2026-64146 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64146 *
CVE-2026-64154 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64154 *
CVE-2026-64159 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64159 *
CVE-2026-64160 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64160 *
CVE-2026-64283 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64283 *
CVE-2026-64325 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64325 *
CVE-2026-64341 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64341 *
CVE-2026-64388 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64388 *
CVE-2026-64400 (CVSSv3: 8.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64400 *
CVE-2026-66040 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66040 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-67322 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67322 *
CVE-2026-67323 (CVSSv3: 8.4, CVSSv4: 8.6): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67323 *
CVE-2026-67324 (CVSSv3: 9.8, CVSSv4: 9.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67324 *
CVE-2026-67325 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67325 *
CVE-2026-67326 (CVSSv3: 7.8, CVSSv4: 7.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67326 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-68103 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68103 *
CVE-2026-68105 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68105 *
CVE-2026-68242 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68242 *
CVE-2026-68286 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68286 *
CVE-2026-68287 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68287 *
CVE-2026-68288 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68288 *
CVE-2026-68289 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68289 *
CVE-2026-68291 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68291 *
CVE-2026-68295 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68295 *
CVE-2026-68303 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68303 *
CVE-2026-68305 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68305 *
CVE-2026-68312 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68312 *
CVE-2026-68323 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68323 *
CVE-2026-68337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68337 *
CVE-2026-68375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68375 *
CVE-2026-68382 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68382 *
CVE-2026-68383 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68383 *
CVE-2026-68399 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68399 *
CVE-2026-68404 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68404 *
CVE-2026-68436 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68436 *
CVE-2026-68441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68441 *
CVE-2026-68447 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68447 *
CVE-2026-68470 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68470 *
CVE-2026-69097 (CVSSv3: 7.3, CVSSv4: 7.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-69097 *
CVE-2026-69247 (CVSSv4: 8.2): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-69247 *
CVE-2026-70452 (CVSSv3: 7.4, CVSSv4: 9.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70452 *
CVE-2026-70453 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70453 *
CVE-2026-70454 (CVSSv3: 8.0, CVSSv4: 7.6): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70454 *
CVE-2026-70456 (CVSSv3: 8.2, CVSSv4: 8.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70456 *
CVE-2026-70457 (CVSSv3: 8.2, CVSSv4: 8.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70457 *
CVE-2026-70458 (CVSSv3: 8.2, CVSSv4: 8.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70458 *
CVE-2026-70459 (CVSSv3: 5.3, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70459 *
CVE-2026-70460 (CVSSv3: 8.1, CVSSv4: 9.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70460 *
CVE-2026-70461 (CVSSv3: 8.2, CVSSv4: 8.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70461 *
CVE-2026-70462 (CVSSv3: 6.5, CVSSv4: 7.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70462 *
CVE-2026-70463 (CVSSv3: 8.1, CVSSv4: 8.6): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70463 *
CVE-2026-70464 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70464 *
CVE-2026-70628 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70628 *
CVE-2026-70629 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70629 *
CVE-2026-70630 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70630 *
CVE-2026-70631 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70631 *
CVE-2026-70632 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70632 *
CVE-2026-71971 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71971 *
CVE-2026-71972 (CVSSv3: 5.9, CVSSv4: 6.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71972 *
CVE-2026-71973 (CVSSv3: 5.2, CVSSv4: 5.2): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71973 *
CVE-2026-71974 (CVSSv3: 4.8, CVSSv4: 4.3): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71974 *
CVE-2026-72031 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72031 *
CVE-2026-72064 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72064 *
CVE-2026-72091 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72091 *
CVE-2026-72315 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72315 *
CVE-2026-72329 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72329 *
CVE-2026-72331 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72331 *
CVE-2026-72334 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72334 *
CVE-2026-72337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72337 *
CVE-2026-72345 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72345 *
CVE-2026-72355 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72355 *
CVE-2026-72370 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72370 *
CVE-2026-72377 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72377 *
CVE-2026-72380 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72380 *
CVE-2026-72388 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72388 *
CVE-2026-72397 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72397 *
CVE-2026-72402 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72402 *
CVE-2026-72404 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72404 *
CVE-2026-72413 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72413 *
CVE-2026-72423 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72423 *
CVE-2026-72438 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72438 *
CVE-2026-72439 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72439 *
CVE-2026-72440 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72440 *
CVE-2026-72454 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72454 *
CVE-2026-72463 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72463 *
CVE-2026-72477 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72477 *
CVE-2026-72485 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72485 *
CVE-2026-72493 (CVSSv3: 9.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72493 *
CVE-2026-72494 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72494 *
CVE-2026-72496 (CVSSv3: 9.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72496 *
CVE-2026-72497 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72497 *
CVE-2026-72499 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72499 *
CVE-2026-73070 (CVSSv3: 5.5, CVSSv4: 6.8): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73070 *
CVE-2026-73433 (CVSSv3: 6.6): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73433 *
CVE-2026-73434 (CVSSv3: 6.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73434 *
CVE-2026-73619 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73619 *
CVE-2026-73620 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73620 *
CVE-2026-73621 (CVSSv3: 5.4, CVSSv4: 5.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73621 *
CVE-2026-73622 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73622 *
CVE-2026-73623 (CVSSv3: 8.8, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73623 *
CVE-2026-73624 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73624 *
CVE-2026-73625 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73625 *
CVE-2026-74220 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74220 *
CVE-2026-74221 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74221 *
CVE-2026-74222 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74222 *
CVE-2026-74225 (CVSSv3: 7.1, CVSSv4: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74225 *
CVE-2026-74258 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74258 *
CVE-2026-74260 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74260 *
CVE-2026-74269 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74269 *
CVE-2026-74272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74272 *
CVE-2026-74273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74273 *
CVE-2026-74277 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74277 *
CVE-2026-74289 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74289 *
CVE-2026-74291 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74291 *
CVE-2026-74294 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74294 *
CVE-2026-74307 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74307 *
CVE-2026-74317 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74317 *
CVE-2026-74336 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74336 *
CVE-2026-74338 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74338 *
CVE-2026-74342 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74342 *
CVE-2026-74347 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74347 *
CVE-2026-74350 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74350 *
CVE-2026-74354 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74354 *
CVE-2026-74367 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74367 *
CVE-2026-74368 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74368 *
CVE-2026-74373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74373 *
CVE-2026-74374 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74374 *
CVE-2026-74375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74375 *
CVE-2026-74407 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74407 *
CVE-2026-74419 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74419 *
CVE-2026-74449 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74449 *
CVE-2026-74466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74466 *
CVE-2026-74496 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74496 *
CVE-2026-74521 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74521 *
CVE-2026-74527 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74527 *
CVE-2026-74529 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74529 *
CVE-2026-74530 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74530 *
CVE-2026-74542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74542 *
CVE-2026-74544 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74544 *
CVE-2026-74558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74558 *
CVE-2026-74561 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74561 *
CVE-2026-74562 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74562 *
CVE-2026-74568 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74568 *
CVE-2026-74571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74571 *
CVE-2026-74605 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74605 *
CVE-2026-74713 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74713 *
CVE-2026-74715 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74715 *
CVE-2026-74716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74716 *
CVE-2026-74721 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74721 *
CVE-2026-74723 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74723 *
CVE-2026-74729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74729 *
CVE-2026-74733 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74733 *
CVE-2026-74735 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74735 *
CVE-2026-74745 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74745 *
CVE-2026-74747 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74747 *
CVE-2026-74750 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74750 *
CVE-2026-74752 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74752 *
CVE-2026-74754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74754 *
CVE-2026-75141 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75141 *
CVE-2026-75142 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75142 *
CVE-2026-75143 (CVSSv3: 9.8, CVSSv4: 9.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75143 *
CVE-2026-75144 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75144 *
CVE-2026-75145 (CVSSv3: 5.8, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75145 *
CVE-2026-75146 (CVSSv3: 8.1, CVSSv4: 7.2): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75146 *
CVE-2026-75147 (CVSSv3: 7.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75147 *
CVE-2026-75818 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75818 *
CVE-2026-75819 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75819 *
CVE-2026-75820 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75820 *
CVE-2026-76217 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76217 *
CVE-2026-76218 (CVSSv3: 8.8, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76218 *
CVE-2026-76219 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76219 *
CVE-2026-76220 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76220 *
CVE-2026-76221 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76221 *
CVE-2026-76222 (CVSSv3: 8.2, CVSSv4: 8.4): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76222 *
CVE-2026-76844 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-76844 *
CVE-2026-77214 (CVSSv3: 8.2, CVSSv4: 8.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-77214 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-78675 (CVSSv3: 8.4, CVSSv4: 8.6): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78675 *
CVE-2026-78676 (CVSSv3: 9.8, CVSSv4: 9.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78676 *
CVE-2026-78677 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78677 *
CVE-2026-78678 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78678 *
CVE-2026-78679 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78679 *
CVE-2026-80230 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-80230 *
CVE-2026-80231 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-80231 *
CVE-2026-80255 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-80255 *
CVE-2026-80521 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80521 *
CVE-2026-80524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80524 *
CVE-2026-80579 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80579 *
CVE-2026-80580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80580 *
CVE-2026-80631 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80631 *
CVE-2026-80634 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80634 *
CVE-2026-80655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80655 *
CVE-2026-80657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80657 *
CVE-2026-80668 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80668 *
CVE-2026-80692 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80692 *
CVE-2026-80693 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80693 *
CVE-2026-80698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80698 *
CVE-2026-80705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80705 *
CVE-2026-80729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80729 *
CVE-2026-80734 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80734 *
CVE-2026-80738 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80738 *
CVE-2026-80747 (CVSSv3: 8.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80747 *
CVE-2026-80785 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80785 *
CVE-2026-80786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80786 *
CVE-2026-80866 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80866 *
CVE-2026-80884 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80884 *
CVE-2026-80899 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80899 *
CVE-2026-82208 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82208 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-82560 (CVSSv3: 7.5): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-86145 (CVSSv3: 8.2): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86145 *
CVE-2026-87817 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87817 *
CVE-2026-87818 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87818 *
CVE-2026-87819 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87819 *
CVE-2026-88806 (CVSSv3: 7.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-88806 *
CVE-2026-88807 (CVSSv4: 8.9): libxrender:libxrender-native https://nvd.nist.gov/vuln/detail/CVE-2026-88807 *
CVE-2026-89156 (CVSSv3: 5.9): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89156 *
CVE-2026-89157 (CVSSv3: 7.4): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89157 *
CVE-2026-89158 (CVSSv3: 6.5): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89158 *
CVE-2026-89160 (CVSSv3: 6.5): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89160 *
CVE-2026-89161 (CVSSv3: 7.8): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89161 *
CVE-2026-89162 (CVSSv3: 3.3): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89162 *
CVE-2026-89513 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89513 *
CVE-2026-89527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89527 *
CVE-2026-89534 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89534 *
CVE-2026-89537 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89537 *
CVE-2026-89568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89568 *
CVE-2026-89584 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89584 *
CVE-2026-89601 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89601 *
CVE-2026-89610 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89610 *
CVE-2026-89611 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89611 *
CVE-2026-89642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89642 *
CVE-2026-89654 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89654 *
CVE-2026-89705 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89705 *
CVE-2026-89709 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89709 *
CVE-2026-89718 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89718 *
CVE-2026-89755 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89755 *
CVE-2026-89764 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89764 *
CVE-2026-89772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89772 *
CVE-2026-89792 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89792 *
CVE-2026-89796 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89796 *
CVE-2026-89805 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89805 *
CVE-2026-89812 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89812 *
CVE-2026-89813 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89813 *
CVE-2026-89815 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89815 *
CVE-2026-89827 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89827 *
CVE-2026-89838 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89838 *
CVE-2026-89840 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89840 *
CVE-2026-89859 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89859 *
CVE-2026-89862 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89862 *
CVE-2026-89866 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89866 *
CVE-2026-89868 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89868 *
CVE-2026-89907 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89907 *
CVE-2026-90040 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90040 *
CVE-2026-90061 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90061 *
CVE-2026-90079 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90079 *
CVE-2026-90082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90082 *
CVE-2026-90087 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90087 *
CVE-2026-90093 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90093 *
CVE-2026-90095 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90095 *
CVE-2026-90098 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90098 *
CVE-2026-90099 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90099 *
CVE-2026-90104 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90104 *
CVE-2026-90105 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90105 *
CVE-2026-90106 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90106 *
CVE-2026-90111 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90111 *
CVE-2026-90121 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90121 *
CVE-2026-90142 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90142 *
CVE-2026-90144 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90144 *
CVE-2026-90154 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90154 *
CVE-2026-90155 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90155 *
CVE-2026-90156 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90156 *
CVE-2026-90162 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90162 *
CVE-2026-90167 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90167 *
CVE-2026-90174 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90174 *
CVE-2026-90177 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90177 *
CVE-2026-90182 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90182 *
CVE-2026-90183 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90183 *
CVE-2026-90206 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90206 *
CVE-2026-90208 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90208 *
CVE-2026-90211 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90211 *
CVE-2026-90217 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90217 *
CVE-2026-90234 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90234 *
CVE-2026-90237 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90237 *
CVE-2026-90242 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90242 *
CVE-2026-90261 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90261 *
CVE-2026-90263 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90263 *
CVE-2026-90267 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90267 *
CVE-2026-90273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90273 *
CVE-2026-90289 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90289 *
CVE-2026-90300 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90300 *
CVE-2026-90301 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90301 *
CVE-2026-90311 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90311 *
CVE-2026-90315 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90315 *
CVE-2026-90317 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90317 *
CVE-2026-90320 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90320 *
CVE-2026-90321 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90321 *
CVE-2026-90323 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90323 *
CVE-2026-90330 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90330 *
CVE-2026-90335 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90335 *
CVE-2026-90336 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90336 *
CVE-2026-90337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90337 *
CVE-2026-90345 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90345 *
CVE-2026-90346 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90346 *
CVE-2026-90347 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90347 *
CVE-2026-90355 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90355 *
CVE-2026-90359 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90359 *
CVE-2026-90365 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90365 *
CVE-2026-90380 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90380 *
CVE-2026-90381 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90381 *
CVE-2026-90401 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90401 *
CVE-2026-90408 (CVSSv3: 7.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90408 *
CVE-2026-90409 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90409 *
CVE-2026-90412 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90412 *
CVE-2026-90417 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90417 *
CVE-2026-90421 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90421 *
CVE-2026-90427 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90427 *
CVE-2026-92392 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92392 *
CVE-2026-92480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92480 *
CVE-2026-92482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92482 *
CVE-2026-92485 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92485 *
CVE-2026-92503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92503 *
CVE-2026-93044 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93044 *
CVE-2026-93047 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93047 *
CVE-2026-93081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93081 *
CVE-2026-93096 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93096 *
CVE-2026-93099 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93099 *
CVE-2026-93104 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93104 *
CVE-2026-93105 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93105 *
CVE-2026-93116 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93116 *
CVE-2026-93122 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93122 *
CVE-2026-93125 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93125 *
CVE-2026-93129 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93129 *
CVE-2026-93135 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93135 *
CVE-2026-93144 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93144 *
CVE-2026-93148 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93148 *
CVE-2026-93164 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93164 *
CVE-2026-93168 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93168 *
CVE-2026-93175 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93175 *
CVE-2026-93176 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93176 *
CVE-2026-93179 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93179 *
CVE-2026-93181 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93181 *
CVE-2026-93201 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93201 *
CVE-2026-93216 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93216 *
CVE-2026-93221 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93221 *
CVE-2026-93248 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93248 *
CVE-2026-93251 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93251 *
CVE-2026-93260 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93260 *
CVE-2026-93270 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93270 *
CVE-2026-93272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93272 *
CVE-2026-93282 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93282 *
CVE-2026-93284 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93284 *
CVE-2026-93285 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93285 *
CVE-2026-93286 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93286 *
CVE-2026-93287 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93287 *
CVE-2026-93288 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93288 *
CVE-2026-93541 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93541 *
CVE-2026-93542 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93542 *
CVE-2026-93543 (CVSSv3: 7.4): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93543 *
CVE-2026-93544 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93544 *
CVE-2026-93545 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93545 *
CVE-2026-93781 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93781 *
CVE-2026-93782 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93782 *
CVE-2026-93783 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93783 *
CVE-2026-93784 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93784 *
CVE-2026-93785 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93785 *
CVE-2026-93786 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93786 *
CVE-2026-93787 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93787 *
CVE-2026-93788 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93788 *
CVE-2026-93789 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93789 *
CVE-2026-93790 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93790 *
CVE-2026-93791 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93791 *
CVE-2026-93792 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93792 *
CVE-2026-93793 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93793 *
CVE-2026-93794 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93794 *
CVE-2026-93795 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93795 *
CVE-2026-93796 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93796 *
CVE-2026-93797 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93797 *
CVE-2026-93798 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93798 *
CVE-2026-93799 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93799 *
CVE-2026-93800 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93800 *
CVE-2026-93801 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93801 *
CVE-2026-93802 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93802 *
CVE-2026-93803 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93803 *
CVE-2026-93804 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93804 *
CVE-2026-93805 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93805 *
CVE-2026-93806 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93806 *
CVE-2026-93807 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93807 *
CVE-2026-93808 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93808 *
CVE-2026-93810 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93810 *
CVE-2026-93811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93811 *
CVE-2026-93812 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93812 *
CVE-2026-93813 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93813 *
CVE-2026-93814 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93814 *
CVE-2026-93815 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93815 *
CVE-2026-93816 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93816 *
CVE-2026-93817 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93817 *
CVE-2026-93818 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93818 *
CVE-2026-93819 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93819 *
CVE-2026-93820 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93820 *
CVE-2026-93821 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93821 *
CVE-2026-93822 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93822 *
CVE-2026-93823 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93823 *
CVE-2026-93824 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93824 *
CVE-2026-93825 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93825 *
CVE-2026-93826 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93826 *
CVE-2026-93827 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93827 *
CVE-2026-93828 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93828 *
CVE-2026-93829 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93829 *
CVE-2026-93830 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93830 *
CVE-2026-94281 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94281 *
CVE-2026-94282 (CVSSv3: 5.6): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94282 *
CVE-2026-94283 (CVSSv3: 6.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94283 *
CVE-2026-94284 (CVSSv3: 5.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94284 *
CVE-2026-94285 (CVSSv3: 5.1): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94285 *
CVE-2026-94286 (CVSSv3: 7.1): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-94286 *
CVE-2026-96611 (CVSSv3: 7.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-96611 *
CVE-2026-96674 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96674 *
CVE-2026-96675 (CVSSv3: 3.3, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96675 *
CVE-2026-97407 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97407 *
CVE-2026-97408 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97408 *
CVE-2026-97409 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97409 *
CVE-2026-97410 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97410 *
CVE-2026-97411 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97411 *
CVE-2026-97412 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97412 *
CVE-2026-97413 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97413 *
CVE-2026-97414 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97414 *
CVE-2026-97415 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97415 *
CVE-2026-97416 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97416 *
CVE-2026-97417 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97417 *
CVE-2026-97418 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97418 *
CVE-2026-97419 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97419 *
CVE-2026-97420 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97420 *
CVE-2026-97421 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97421 *
CVE-2026-97422 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97422 *
CVE-2026-97423 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97423 *
CVE-2026-97424 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97424 *
CVE-2026-97425 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97425 *
CVE-2026-97426 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97426 *
CVE-2026-97427 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97427 *
CVE-2026-97428 (CVSSv3: 7.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97428 *
CVE-2026-97429 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97429 *
CVE-2026-97430 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97430 *
CVE-2026-97431 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97431 *
CVE-2026-97432 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97432 *
CVE-2026-97433 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97433 *
CVE-2026-97434 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97434 *
CVE-2026-97435 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97435 *
CVE-2026-97436 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97436 *
CVE-2026-97437 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97437 *
CVE-2026-97438 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97438 *
CVE-2026-97439 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97439 *
CVE-2026-97440 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97440 *
CVE-2026-97441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97441 *
CVE-2026-97442 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97442 *
CVE-2026-97443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97443 *
CVE-2026-97444 (CVSSv3: 7.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97444 *
CVE-2026-97445 (CVSSv3: 7.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97445 *
CVE-2026-97446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97446 *
CVE-2026-97447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97447 *
CVE-2026-97448 (CVSSv3: 7.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97448 *
CVE-2026-97449 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97449 *
CVE-2026-97450 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97450 *
CVE-2026-97451 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97451 *
CVE-2026-97452 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97452 *
CVE-2026-97453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97453 *
CVE-2026-97454 (CVSSv3: 7.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97454 *
CVE-2026-97455 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97455 *
CVE-2026-97456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97456 *
CVE-2026-97472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97472 *
CVE-2026-97473 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97473 *
CVE-2026-97474 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97474 *
CVE-2026-97475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97475 *
CVE-2026-97476 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97476 *
CVE-2026-97477 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97477 *
CVE-2026-97478 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97478 *
CVE-2026-97479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97479 *
CVE-2026-97480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97480 *
CVE-2026-97481 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97481 *
CVE-2026-97482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97482 *
CVE-2026-97483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97483 *
CVE-2026-97484 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97484 *
CVE-2026-97485 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97485 *
CVE-2026-97486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97486 *
CVE-2026-97487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97487 *
CVE-2026-97488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97488 *
CVE-2026-97489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97489 *
CVE-2026-97490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97490 *
CVE-2026-97491 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97491 *
CVE-2026-97492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97492 *
CVE-2026-97493 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97493 *
CVE-2026-97494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97494 *
CVE-2026-97495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97495 *
CVE-2026-97496 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97496 *
CVE-2026-97497 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97497 *
CVE-2026-97498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97498 *
CVE-2026-97499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97499 *
CVE-2026-97500 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97500 *
CVE-2026-97501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97501 *
CVE-2026-97502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97502 *
CVE-2026-97503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97503 *
CVE-2026-97504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97504 *
CVE-2026-97505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97505 *
CVE-2026-97506 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97506 *
CVE-2026-97507 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97507 *
CVE-2026-97508 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97508 *
CVE-2026-97509 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97509 *
CVE-2026-97510 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97510 *
CVE-2026-97511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97511 *
CVE-2026-97512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97512 *
CVE-2026-97513 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97513 *
CVE-2026-97514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97514 *
CVE-2026-97515 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97515 *
CVE-2026-97516 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97516 *
CVE-2026-97517 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97517 *
CVE-2026-97518 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97518 *
CVE-2026-97519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97519 *
CVE-2026-97520 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97520 *
CVE-2026-97521 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97521 *
CVE-2026-97522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97522 *
CVE-2026-97523 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97523 *
CVE-2026-97524 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97524 *
CVE-2026-97525 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97525 *
CVE-2026-97526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97526 *
CVE-2026-97527 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97527 *
CVE-2026-97528 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97528 *
CVE-2026-97529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97529 *
CVE-2026-97530 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97530 *
CVE-2026-97531 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97531 *
CVE-2026-97532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97532 *
CVE-2026-97533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97533 *
CVE-2026-97534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97534 *
CVE-2026-97535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97535 *
CVE-2026-97536 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97536 *
CVE-2026-97537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97537 *
CVE-2026-97538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97538 *
CVE-2026-97539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97539 *
CVE-2026-97540 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97540 *
CVE-2026-97541 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97541 *
CVE-2026-97542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97542 *
CVE-2026-97543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97543 *
CVE-2026-97544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97544 *
CVE-2026-97545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97545 *
CVE-2026-97546 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97546 *
CVE-2026-97547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97547 *
CVE-2026-97548 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97548 *
CVE-2026-97549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97549 *
CVE-2026-97550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97550 *
CVE-2026-97551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97551 *
CVE-2026-97552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97552 *
CVE-2026-97554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97554 *
CVE-2026-97555 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97555 *
CVE-2026-97556 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97556 *
CVE-2026-97557 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97557 *
CVE-2026-97558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97558 *
CVE-2026-97559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97559 *
CVE-2026-97560 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97560 *
CVE-2026-97561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97561 *
CVE-2026-97562 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97562 *
CVE-2026-97563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97563 *
CVE-2026-97564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97564 *
CVE-2026-97565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97565 *
CVE-2026-97566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97566 *
CVE-2026-97567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97567 *
CVE-2026-97568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97568 *
CVE-2026-97571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97571 *
CVE-2026-97572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97572 *
CVE-2026-97573 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97573 *
CVE-2026-97574 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97574 *
CVE-2026-97575 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97575 *
CVE-2026-97576 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97576 *
CVE-2026-97577 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97577 *
CVE-2026-97578 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97578 *
CVE-2026-97579 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97579 *
CVE-2026-97581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97581 *
CVE-2026-97582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97582 *
CVE-2026-97583 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97583 *
CVE-2026-97584 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97584 *
CVE-2026-97585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97585 *
CVE-2026-97586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97586 *
CVE-2026-97587 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97587 *
CVE-2026-97588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97588 *
CVE-2026-97589 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97589 *
CVE-2026-97590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97590 *
CVE-2026-97591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97591 *
CVE-2026-97592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97592 *
CVE-2026-97593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97593 *
CVE-2026-97594 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97594 *
CVE-2026-97595 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97595 *
CVE-2026-97596 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97596 *
CVE-2026-97597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97597 *
CVE-2026-97598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97598 *
CVE-2026-97599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97599 *
CVE-2026-97600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97600 *
CVE-2026-97601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97601 *
CVE-2026-97602 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97602 *
CVE-2026-97603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97603 *
CVE-2026-97604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97604 *
CVE-2026-97605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97605 *
CVE-2026-97606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97606 *
CVE-2026-97607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97607 *
CVE-2026-97608 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97608 *
CVE-2026-97609 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97609 *
CVE-2026-97610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97610 *
CVE-2026-97611 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97611 *
CVE-2026-97612 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97612 *
CVE-2026-97613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97613 *
CVE-2026-97614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97614 *
CVE-2026-97615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97615 *
CVE-2026-97616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97616 *
CVE-2026-97617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97617 *
CVE-2026-97618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97618 *
CVE-2026-97619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97619 *
CVE-2026-97620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97620 *
CVE-2026-97621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97621 *
CVE-2026-97687 (CVSSv3: 8.1, CVSSv4: 7.6): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-97687 *
CVE-2026-97688 (CVSSv3: 5.3, CVSSv4: 6.9): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-97688 *
CVE-2026-97689 (CVSSv3: 7.5, CVSSv4: 8.9): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-97689 *
CVE-2026-97876 (CVSSv3: 6.4): grub:grub-efi:grub-native https://nvd.nist.gov/vuln/detail/CVE-2026-97876 *
CVE-2026-97899 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97899 *
CVE-2026-97900 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97900 *
CVE-2026-97901 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97901 *
CVE-2026-97902 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97902 *
CVE-2026-97903 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97903 *
CVE-2026-97904 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97904 *
CVE-2026-97905 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97905 *
CVE-2026-97906 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97906 *
CVE-2026-97907 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97907 *
CVE-2026-97908 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97908 *
CVE-2026-97909 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97909 *
CVE-2026-97910 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97910 *
CVE-2026-97915 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97915 *
CVE-2026-97916 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97916 *
CVE-2026-97917 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97917 *
CVE-2026-97918 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97918 *
CVE-2026-97919 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97919 *
CVE-2026-97920 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97920 *
CVE-2026-97921 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97921 *
CVE-2026-97922 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97922 *
CVE-2026-97923 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97923 *
CVE-2026-97924 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97924 *
CVE-2026-97925 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97925 *
CVE-2026-97926 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97926 *
CVE-2026-97927 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97927 *
CVE-2026-97928 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97928 *
CVE-2026-97929 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97929 *
CVE-2026-97930 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97930 *
CVE-2026-97931 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97931 *
CVE-2026-97933 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97933 *
CVE-2026-97934 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97934 *
CVE-2026-97935 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97935 *
CVE-2026-97936 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97936 *
CVE-2026-97938 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97938 *
CVE-2026-97939 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97939 *
CVE-2026-97940 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97940 *
CVE-2026-97942 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97942 *
CVE-2026-97943 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97943 *
CVE-2026-97944 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97944 *
CVE-2026-97945 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97945 *
CVE-2026-97946 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97946 *
CVE-2026-97947 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97947 *
CVE-2026-97948 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97948 *
CVE-2026-97949 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97949 *
CVE-2026-97950 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97950 *
CVE-2026-97951 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97951 *
CVE-2026-97952 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97952 *
CVE-2026-97953 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97953 *
CVE-2026-97954 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97954 *
CVE-2026-97955 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97955 *
CVE-2026-97956 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97956 *
CVE-2026-97957 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97957 *
CVE-2026-97958 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97958 *
CVE-2026-97959 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97959 *
CVE-2026-97960 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97960 *
CVE-2026-97961 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97961 *
CVE-2026-97962 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97962 *
CVE-2026-97963 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97963 *
CVE-2026-97964 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97964 *
CVE-2026-97965 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97965 *
CVE-2026-97966 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97966 *
CVE-2026-97967 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97967 *
CVE-2026-97968 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97968 *
CVE-2026-97969 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97969 *
CVE-2026-97970 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97970 *
CVE-2026-97972 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97972 *
CVE-2026-97973 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97973 *
CVE-2026-97974 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97974 *
CVE-2026-97975 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97975 *
CVE-2026-97976 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97976 *
CVE-2026-97977 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97977 *
CVE-2026-97978 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97978 *
CVE-2026-97979 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97979 *
CVE-2026-97981 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97981 *
CVE-2026-97982 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97982 *
CVE-2026-97984 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97984 *
CVE-2026-97985 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97985 *
CVE-2026-97986 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97986 *
CVE-2026-97987 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97987 *
CVE-2026-97988 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97988 *
CVE-2026-97989 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97989 *
CVE-2026-97990 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97990 *
CVE-2026-97991 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97991 *
CVE-2026-97992 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97992 *
CVE-2026-97993 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97993 *
CVE-2026-97994 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97994 *
CVE-2026-97995 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97995 *
CVE-2026-97996 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97996 *
CVE-2026-97997 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97997 *
CVE-2026-97998 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97998 *
CVE-2026-98000 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98000 *
CVE-2026-98001 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98001 *
CVE-2026-98003 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98003 *
CVE-2026-98004 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98004 *
CVE-2026-98006 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98006 *
CVE-2026-98007 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98007 *
CVE-2026-98008 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98008 *
CVE-2026-98009 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98009 *
CVE-2026-98010 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98010 *
CVE-2026-98011 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98011 *
CVE-2026-98012 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98012 *
CVE-2026-98013 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98013 *
CVE-2026-98014 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98014 *
CVE-2026-98015 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98015 *
CVE-2026-98016 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98016 *
CVE-2026-98017 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98017 *
CVE-2026-98018 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98018 *
CVE-2026-98019 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98019 *
CVE-2026-98020 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98020 *
CVE-2026-98021 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98021 *
CVE-2026-98022 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98022 *
CVE-2026-98023 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98023 *
CVE-2026-98024 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98024 *
CVE-2026-98025 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98025 *
CVE-2026-98026 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98026 *
CVE-2026-98027 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98027 *
CVE-2026-98028 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98028 *
CVE-2026-98029 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98029 *
CVE-2026-98030 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98030 *
CVE-2026-98031 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98031 *
CVE-2026-98032 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98032 *
CVE-2026-98033 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98033 *
CVE-2026-98034 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98034 *
CVE-2026-98037 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98037 *
CVE-2026-98038 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98038 *
CVE-2026-98039 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98039 *
CVE-2026-98041 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98041 *
CVE-2026-98043 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98043 *
CVE-2026-98044 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98044 *
CVE-2026-98045 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98045 *
CVE-2026-98046 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98046 *
CVE-2026-98047 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98047 *
CVE-2026-98048 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98048 *
CVE-2026-98049 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98049 *
CVE-2026-98050 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98050 *
CVE-2026-98051 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98051 *
CVE-2026-98052 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98052 *
CVE-2026-98053 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98053 *
CVE-2026-98054 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98054 *
CVE-2026-98055 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98055 *
CVE-2026-98056 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98056 *
CVE-2026-98057 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98057 *
CVE-2026-98058 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98058 *
CVE-2026-98059 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98059 *
CVE-2026-98060 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98060 *
CVE-2026-98061 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98061 *
CVE-2026-98062 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98062 *
CVE-2026-98063 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98063 *
CVE-2026-98064 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98064 *
CVE-2026-98066 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98066 *
CVE-2026-98067 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98067 *
CVE-2026-98068 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98068 *
CVE-2026-98069 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98069 *
CVE-2026-98070 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98070 *
CVE-2026-98071 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98071 *
CVE-2026-98072 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98072 *
CVE-2026-98073 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98073 *
CVE-2026-98074 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98074 *
CVE-2026-98075 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98075 *
CVE-2026-98076 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98076 *
CVE-2026-98077 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98077 *
CVE-2026-98078 (CVSSv3: 4.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98078 *
CVE-2026-98079 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98079 *
CVE-2026-98080 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98080 *
CVE-2026-98081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98081 *
CVE-2026-98082 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98082 *
CVE-2026-98083 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98083 *
CVE-2026-98084 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98084 *
CVE-2026-98085 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98085 *
CVE-2026-98086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98086 *
CVE-2026-98087 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98087 *
CVE-2026-98088 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98088 *
CVE-2026-98089 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98089 *
CVE-2026-98090 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98090 *
CVE-2026-98091 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98091 *
CVE-2026-98092 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98092 *
CVE-2026-98093 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98093 *
CVE-2026-98094 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98094 *
CVE-2026-98095 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98095 *
CVE-2026-98096 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98096 *
CVE-2026-98097 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98097 *
CVE-2026-98098 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98098 *
CVE-2026-98099 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98099 *
CVE-2026-98101 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98101 *
CVE-2026-98102 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98102 *
CVE-2026-98103 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98103 *
CVE-2026-98104 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98104 *
CVE-2026-98105 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98105 *
CVE-2026-98106 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98106 *
CVE-2026-98107 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98107 *
CVE-2026-98108 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98108 *
CVE-2026-98109 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98109 *
CVE-2026-98110 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98110 *
CVE-2026-98111 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98111 *
CVE-2026-98113 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98113 *
CVE-2026-98114 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98114 *
CVE-2026-98115 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98115 *
CVE-2026-98116 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98116 *
CVE-2026-98117 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98117 *
CVE-2026-98118 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98118 *
CVE-2026-98119 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98119 *
CVE-2026-98120 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98120 *
CVE-2026-98121 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98121 *
CVE-2026-98122 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98122 *
CVE-2026-98123 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98123 *
CVE-2026-98124 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98124 *
CVE-2026-98126 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98126 *
CVE-2026-98127 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98127 *
CVE-2026-98128 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98128 *
CVE-2026-98129 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98129 *
CVE-2026-98130 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98130 *
CVE-2026-98131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98131 *
CVE-2026-98134 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98134 *
CVE-2026-98142 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98142 *
CVE-2026-98146 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98146 *
CVE-2026-98147 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98147 *
CVE-2026-98148 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98148 *
CVE-2026-98151 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98151 *
CVE-2026-98152 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98152 *
CVE-2026-98153 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98153 *
CVE-2026-98154 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98154 *
CVE-2026-98155 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98155 *
CVE-2026-98156 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98156 *
CVE-2026-98157 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98157 *
CVE-2026-98158 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98158 *
CVE-2026-98159 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98159 *
CVE-2026-98162 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98162 *
CVE-2026-98167 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98167 *
CVE-2026-98168 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98168 *
CVE-2026-98169 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98169 *
CVE-2026-98170 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98170 *
CVE-2026-98171 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98171 *
CVE-2026-98172 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98172 *
CVE-2026-98173 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98173 *
CVE-2026-98174 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98174 *
CVE-2026-98175 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98175 *
CVE-2026-98176 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98176 *
CVE-2026-98177 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98177 *
CVE-2026-98179 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98179 *
CVE-2026-98180 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98180 *
CVE-2026-98181 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98181 *
CVE-2026-98182 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98182 *
CVE-2026-98184 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98184 *
CVE-2026-98185 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98185 *
CVE-2026-98186 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98186 *
CVE-2026-98187 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98187 *
CVE-2026-98188 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98188 *
CVE-2026-98189 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98189 *
CVE-2026-98190 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98190 *
CVE-2026-98191 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98191 *
CVE-2026-98192 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98192 *
CVE-2026-98193 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98193 *
CVE-2026-98194 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98194 *
CVE-2026-98195 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98195 *
CVE-2026-98196 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98196 *
CVE-2026-98197 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98197 *
CVE-2026-98198 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98198 *
CVE-2026-98199 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98199 *
CVE-2026-98200 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98200 *
CVE-2026-98201 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98201 *
CVE-2026-98202 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98202 *
CVE-2026-98203 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98203 *
CVE-2026-98204 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98204 *
CVE-2026-98205 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98205 *
CVE-2026-98206 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98206 *
CVE-2026-98207 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98207 *
CVE-2026-98208 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98208 *
CVE-2026-98209 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98209 *
CVE-2026-98210 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98210 *
CVE-2026-98211 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98211 *
CVE-2026-98212 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98212 *
CVE-2026-98213 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98213 *
CVE-2026-98214 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98214 *
CVE-2026-98215 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98215 *
CVE-2026-98216 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98216 *
CVE-2026-98217 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98217 *
CVE-2026-98218 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98218 *
CVE-2026-98221 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98221 *
CVE-2026-98222 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98222 *
CVE-2026-98223 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98223 *
CVE-2026-98224 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98224 *
CVE-2026-98226 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98226 *
CVE-2026-98227 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98227 *
CVE-2026-98228 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98228 *
CVE-2026-98229 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98229 *
CVE-2026-98230 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98230 *
CVE-2026-98231 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98231 *
CVE-2026-98232 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98232 *
CVE-2026-98233 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98233 *
CVE-2026-98234 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98234 *
CVE-2026-98235 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98235 *
CVE-2026-98236 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98236 *
CVE-2026-98237 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98237 *
CVE-2026-98238 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98238 *
CVE-2026-98239 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98239 *
CVE-2026-98240 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98240 *
CVE-2026-98241 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98241 *
CVE-2026-98244 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98244 *
CVE-2026-98245 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98245 *
CVE-2026-98246 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98246 *
CVE-2026-98247 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98247 *
CVE-2026-98248 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98248 *
CVE-2026-98249 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98249 *
CVE-2026-98251 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98251 *
CVE-2026-98252 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98252 *
CVE-2026-98253 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98253 *
CVE-2026-98254 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98254 *
CVE-2026-98255 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98255 *
CVE-2026-98256 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98256 *
CVE-2026-98257 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98257 *
CVE-2026-98258 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98258 *
CVE-2026-98259 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98259 *
CVE-2026-98260 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98260 *
CVE-2026-98261 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98261 *
CVE-2026-98262 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98262 *
CVE-2026-98263 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98263 *
CVE-2026-98264 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98264 *
CVE-2026-98265 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98265 *
CVE-2026-98266 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98266 *
CVE-2026-98267 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98267 *
CVE-2026-98269 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98269 *
CVE-2026-98270 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98270 *
CVE-2026-98271 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98271 *
CVE-2026-98272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98272 *
CVE-2026-98273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98273 *
CVE-2026-98274 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98274 *
CVE-2026-98275 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98275 *
CVE-2026-98276 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98276 *
CVE-2026-98277 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98277 *
CVE-2026-98279 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98279 *
CVE-2026-98281 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98281 *
CVE-2026-98282 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98282 *
CVE-2026-98283 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98283 *
CVE-2026-98284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98284 *
CVE-2026-98285 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98285 *
CVE-2026-98286 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98286 *
CVE-2026-98287 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98287 *
CVE-2026-98288 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98288 *
CVE-2026-98289 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98289 *
CVE-2026-98290 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98290 *
CVE-2026-98291 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98291 *
CVE-2026-98292 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98292 *
CVE-2026-98293 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98293 *
CVE-2026-98294 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98294 *
CVE-2026-98295 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98295 *
CVE-2026-98296 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98296 *
CVE-2026-98297 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98297 *
CVE-2026-98298 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98298 *
CVE-2026-98299 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98299 *
CVE-2026-98300 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98300 *
CVE-2026-98301 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98301 *
CVE-2026-98302 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98302 *
CVE-2026-98303 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98303 *
CVE-2026-98304 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98304 *
CVE-2026-98306 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98306 *
CVE-2026-98307 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98307 *
CVE-2026-98308 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98308 *
CVE-2026-98309 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98309 *
CVE-2026-98311 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98311 *
CVE-2026-98312 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98312 *
CVE-2026-98313 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98313 *
CVE-2026-98314 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98314 *
CVE-2026-98316 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98316 *
CVE-2026-98317 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98317 *
CVE-2026-98319 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98319 *
CVE-2026-98320 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98320 *
CVE-2026-98321 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98321 *
CVE-2026-98322 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98322 *
CVE-2026-98323 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98323 *
CVE-2026-98325 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98325 *
CVE-2026-98326 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98326 *
CVE-2026-98327 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98327 *
CVE-2026-98328 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98328 *
CVE-2026-98329 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98329 *
CVE-2026-98330 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98330 *
CVE-2026-98331 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98331 *
CVE-2026-98332 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98332 *
CVE-2026-98333 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98333 *
CVE-2026-98334 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98334 *
CVE-2026-98335 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98335 *
CVE-2026-98336 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98336 *
CVE-2026-98337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98337 *
CVE-2026-98338 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98338 *
CVE-2026-98339 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98339 *
CVE-2026-98340 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98340 *
CVE-2026-98341 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98341 *
CVE-2026-98342 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98342 *
CVE-2026-98343 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98343 *
CVE-2026-98344 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98344 *
CVE-2026-98345 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98345 *
CVE-2026-98346 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98346 *
CVE-2026-98347 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98347 *
CVE-2026-98348 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98348 *
CVE-2026-98349 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98349 *
CVE-2026-98350 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98350 *
CVE-2026-98351 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98351 *
CVE-2026-98352 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98352 *
CVE-2026-98353 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98353 *
CVE-2026-98354 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98354 *
CVE-2026-98355 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98355 *
CVE-2026-98356 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98356 *
CVE-2026-98357 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98357 *
CVE-2026-98358 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98358 *
CVE-2026-98359 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98359 *
CVE-2026-98360 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98360 *
CVE-2026-98361 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98361 *
CVE-2026-98362 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98362 *
CVE-2026-98363 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98363 *
CVE-2026-98364 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98364 *
CVE-2026-98365 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98365 *
CVE-2026-98366 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98366 *
CVE-2026-98367 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98367 *
CVE-2026-98368 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98368 *
CVE-2026-98369 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98369 *
CVE-2026-98370 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98370 *
CVE-2026-98371 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98371 *
CVE-2026-98372 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98372 *
CVE-2026-98373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98373 *
CVE-2026-98374 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98374 *
CVE-2026-98375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98375 *
CVE-2026-98376 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98376 *
CVE-2026-98377 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98377 *
CVE-2026-98378 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98378 *
CVE-2026-98379 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98379 *
CVE-2026-98380 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98380 *
CVE-2026-98381 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98381 *
CVE-2026-98382 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98382 *
CVE-2026-98383 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98383 *
CVE-2026-98384 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98384 *
CVE-2026-98386 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98386 *
CVE-2026-98387 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98387 *
CVE-2026-98388 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98388 *
CVE-2026-98389 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98389 *
CVE-2026-98390 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98390 *
CVE-2026-98392 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98392 *
CVE-2026-98393 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98393 *
CVE-2026-98394 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98394 *
CVE-2026-98398 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98398 *
CVE-2026-98399 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98399 *
CVE-2026-98400 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98400 *
CVE-2026-98401 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98401 *
CVE-2026-98402 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98402 *
CVE-2026-98403 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98403 *
CVE-2026-98404 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98404 *
CVE-2026-98405 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98405 *
CVE-2026-98406 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98406 *
CVE-2026-98407 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98407 *
CVE-2026-98408 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98408 *
CVE-2026-98409 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98409 *
CVE-2026-98410 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98410 *
CVE-2026-98411 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98411 *
CVE-2026-98412 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98412 *
CVE-2026-98413 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98413 *
CVE-2026-98414 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98414 *
CVE-2026-98415 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98415 *
CVE-2026-98416 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98416 *
CVE-2026-98417 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98417 *
CVE-2026-98419 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98419 *
CVE-2026-98421 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98421 *
CVE-2026-98422 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98422 *
CVE-2026-98423 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98423 *
CVE-2026-98424 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98424 *
CVE-2026-98425 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98425 *
CVE-2026-98426 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98426 *
CVE-2026-98427 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98427 *
CVE-2026-98428 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98428 *
CVE-2026-98429 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98429 *
CVE-2026-98430 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98430 *
CVE-2026-98432 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98432 *
CVE-2026-98433 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98433 *
CVE-2026-98435 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98435 *
CVE-2026-98436 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98436 *
CVE-2026-98437 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98437 *
CVE-2026-98439 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98439 *
CVE-2026-98440 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98440 *
CVE-2026-98441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98441 *
CVE-2026-98442 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98442 *
CVE-2026-98443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98443 *
CVE-2026-98445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98445 *
CVE-2026-98446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98446 *
CVE-2026-98447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98447 *
CVE-2026-98448 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98448 *
CVE-2026-98450 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98450 *
CVE-2026-98451 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98451 *
CVE-2026-98452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98452 *
CVE-2026-98453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98453 *
CVE-2026-98454 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98454 *
CVE-2026-98455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98455 *
CVE-2026-98456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98456 *
CVE-2026-98457 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98457 *
CVE-2026-98458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98458 *
CVE-2026-98459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98459 *
CVE-2026-98460 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98460 *
CVE-2026-98461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98461 *
CVE-2026-98462 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98462 *
CVE-2026-98463 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98463 *
CVE-2026-98464 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98464 *
CVE-2026-98465 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98465 *
CVE-2026-98466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98466 *
CVE-2026-98467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98467 *
CVE-2026-98468 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98468 *
CVE-2026-98469 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98469 *
CVE-2026-98471 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98471 *
CVE-2026-98472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98472 *
CVE-2026-98473 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98473 *
CVE-2026-98474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98474 *
CVE-2026-98475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98475 *
CVE-2026-98476 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98476 *
CVE-2026-98477 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98477 *
CVE-2026-98479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98479 *
CVE-2026-98480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98480 *
CVE-2026-98481 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98481 *
CVE-2026-98482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98482 *
CVE-2026-98483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98483 *
CVE-2026-98484 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98484 *
CVE-2026-98485 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98485 *
CVE-2026-98486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98486 *
CVE-2026-98487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98487 *
CVE-2026-98488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98488 *
CVE-2026-98489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98489 *
CVE-2026-98490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98490 *
CVE-2026-98491 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98491 *
CVE-2026-98492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98492 *
CVE-2026-98493 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98493 *
CVE-2026-98494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98494 *
CVE-2026-98495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98495 *
CVE-2026-98496 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98496 *
CVE-2026-98497 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98497 *
CVE-2026-98498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98498 *
CVE-2026-98499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98499 *
CVE-2026-98501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98501 *
CVE-2026-98502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98502 *
CVE-2026-98503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98503 *
CVE-2026-98504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98504 *
CVE-2026-98505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98505 *
CVE-2026-98506 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98506 *
CVE-2026-98507 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98507 *
CVE-2026-98508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98508 *
CVE-2026-98509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98509 *
CVE-2026-98510 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98510 *
CVE-2026-98511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98511 *
CVE-2026-98512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98512 *
CVE-2026-98513 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98513 *
CVE-2026-98514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98514 *
CVE-2026-98515 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98515 *
CVE-2026-98516 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98516 *
CVE-2026-98517 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98517 *
CVE-2026-98519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98519 *
CVE-2026-98521 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98521 *
CVE-2026-98522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98522 *
CVE-2026-98523 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98523 *
CVE-2026-98524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98524 *
CVE-2026-98525 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98525 *
CVE-2026-98526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98526 *
CVE-2026-98527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98527 *
CVE-2026-98528 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98528 *
CVE-2026-98529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98529 *
CVE-2026-98531 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98531 *
CVE-2026-98532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98532 *
CVE-2026-98533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98533 *
CVE-2026-98534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98534 *
CVE-2026-98535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98535 *
CVE-2026-98536 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98536 *
CVE-2026-98537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98537 *
CVE-2026-98538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98538 *
CVE-2026-98539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98539 *
CVE-2026-98541 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98541 *
CVE-2026-98542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98542 *
CVE-2026-98543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98543 *
CVE-2026-98544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98544 *
CVE-2026-98545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98545 *
CVE-2026-98546 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98546 *
CVE-2026-98547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98547 *
CVE-2026-98548 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98548 *
CVE-2026-98549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98549 *
CVE-2026-98550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98550 *
CVE-2026-98551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98551 *
CVE-2026-98552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98552 *
CVE-2026-98553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98553 *
CVE-2026-98554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98554 *
CVE-2026-98555 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98555 *
CVE-2026-98556 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98556 *
CVE-2026-98558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98558 *
CVE-2026-98559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98559 *
CVE-2026-98561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98561 *
CVE-2026-98562 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98562 *
CVE-2026-98563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98563 *
CVE-2026-98564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98564 *
CVE-2026-98565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98565 *
CVE-2026-98566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98566 *
CVE-2026-98567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98567 *
CVE-2026-98568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98568 *
CVE-2026-98569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98569 *
CVE-2026-98571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98571 *
CVE-2026-98572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98572 *
CVE-2026-98573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98573 *
CVE-2026-98574 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98574 *
CVE-2026-98575 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98575 *
CVE-2026-98576 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98576 *
CVE-2026-98577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98577 *
CVE-2026-98578 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98578 *
CVE-2026-98579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98579 *
CVE-2026-98580 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98580 *
CVE-2026-98581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98581 *
CVE-2026-98582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98582 *
CVE-2026-98583 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98583 *
CVE-2026-98584 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98584 *
CVE-2026-98585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98585 *
CVE-2026-98586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98586 *
CVE-2026-98588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98588 *
CVE-2026-98589 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98589 *
CVE-2026-98590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98590 *
CVE-2026-98591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98591 *
CVE-2026-98592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98592 *
CVE-2026-98593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98593 *
CVE-2026-98594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98594 *
CVE-2026-98595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98595 *
CVE-2026-98596 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98596 *
CVE-2026-98597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98597 *
CVE-2026-98598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98598 *
CVE-2026-98599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98599 *
CVE-2026-98601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98601 *
CVE-2026-98602 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98602 *
CVE-2026-98603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98603 *
CVE-2026-98604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98604 *
CVE-2026-98605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98605 *
CVE-2026-98606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98606 *
CVE-2026-98607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98607 *
CVE-2026-98608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98608 *
CVE-2026-98609 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98609 *
CVE-2026-98610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98610 *
CVE-2026-98611 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98611 *
CVE-2026-98612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98612 *
CVE-2026-98613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98613 *
CVE-2026-98614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98614 *
CVE-2026-98615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98615 *
CVE-2026-98616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98616 *
CVE-2026-98617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98617 *
CVE-2026-98618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98618 *
CVE-2026-98620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98620 *
CVE-2026-98621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98621 *
CVE-2026-98622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98622 *
CVE-2026-98623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98623 *
CVE-2026-98624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98624 *
CVE-2026-98625 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98625 *
CVE-2026-98626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98626 *
CVE-2026-98628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98628 *
CVE-2026-98629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98629 *
CVE-2026-98630 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98630 *
CVE-2026-98631 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98631 *
CVE-2026-98632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98632 *
CVE-2026-98633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98633 *
CVE-2026-98634 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98634 *
CVE-2026-98636 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98636 *
CVE-2026-98637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98637 *
CVE-2026-98638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98638 *
CVE-2026-98639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98639 *
CVE-2026-98640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98640 *
CVE-2026-98641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98641 *
CVE-2026-98642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98642 *
CVE-2026-98643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98643 *
CVE-2026-98644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98644 *
CVE-2026-98646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98646 *
CVE-2026-98647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98647 *
CVE-2026-98648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98648 *
CVE-2026-98652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98652 *
CVE-2026-98655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98655 *
CVE-2026-98656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98656 *
CVE-2026-98657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98657 *
CVE-2026-98658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98658 *
CVE-2026-98659 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98659 *
CVE-2026-98660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98660 *
CVE-2026-98661 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98661 *
CVE-2026-98662 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98662 *
CVE-2026-98663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98663 *
CVE-2026-98664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98664 *
CVE-2026-98665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98665 *
CVE-2026-98666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98666 *
CVE-2026-98668 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98668 *
CVE-2026-98669 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98669 *
CVE-2026-98670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98670 *
CVE-2026-98671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98671 *
CVE-2026-98672 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98672 *
CVE-2026-98673 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98673 *
CVE-2026-98674 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98674 *
CVE-2026-98675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98675 *
CVE-2026-98676 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98676 *
CVE-2026-98677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98677 *
CVE-2026-98678 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98678 *
CVE-2026-98679 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98679 *
CVE-2026-98680 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98680 *
CVE-2026-98681 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98681 *
CVE-2026-98683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98683 *
CVE-2026-98684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98684 *
CVE-2026-98686 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98686 *
CVE-2026-98687 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98687 *
CVE-2026-98689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98689 *
CVE-2026-98690 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98690 *
CVE-2026-98691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98691 *
CVE-2026-98692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98692 *
CVE-2026-98693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98693 *
CVE-2026-98694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98694 *
CVE-2026-98695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98695 *
CVE-2026-98696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98696 *
CVE-2026-98697 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98697 *
CVE-2026-98698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98698 *
CVE-2026-98699 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98699 *
CVE-2026-98700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98700 *
CVE-2026-98701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98701 *
CVE-2026-98702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98702 *
CVE-2026-98703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98703 *
CVE-2026-98704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98704 *
CVE-2026-98705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98705 *
CVE-2026-98706 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98706 *
CVE-2026-98707 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98707 *
CVE-2026-98708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98708 *
CVE-2026-98709 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98709 *
CVE-2026-98710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98710 *
CVE-2026-98711 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98711 *
CVE-2026-98713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98713 *
CVE-2026-98714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98714 *
CVE-2026-98715 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98715 *
CVE-2026-98716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98716 *
CVE-2026-98717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98717 *
CVE-2026-98720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98720 *
CVE-2026-98721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98721 *
CVE-2026-98722 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98722 *
CVE-2026-98723 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98723 *
CVE-2026-98724 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98724 *
CVE-2026-98725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98725 *
CVE-2026-98726 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98726 *
CVE-2026-98727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98727 *
CVE-2026-98728 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98728 *
CVE-2026-98729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98729 *
CVE-2026-98730 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98730 *
CVE-2026-98731 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98731 *
CVE-2026-98732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98732 *
CVE-2026-98733 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98733 *
CVE-2026-98734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98734 *
CVE-2026-98735 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98735 *
CVE-2026-98736 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98736 *
CVE-2026-98737 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98737 *
CVE-2026-98738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98738 *
CVE-2026-98739 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98739 *
CVE-2026-98740 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98740 *
CVE-2026-98741 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98741 *
CVE-2026-98742 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98742 *
CVE-2026-98743 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98743 *
CVE-2026-98744 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98744 *
CVE-2026-98745 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98745 *
CVE-2026-98746 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98746 *
CVE-2026-98747 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98747 *
CVE-2026-98748 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98748 *
CVE-2026-98749 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98749 *
CVE-2026-98750 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98750 *
CVE-2026-98751 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98751 *
CVE-2026-98752 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98752 *
CVE-2026-98753 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98753 *
CVE-2026-98754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98754 *
CVE-2026-98755 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98755 *
CVE-2026-98756 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98756 *
CVE-2026-98757 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98757 *
CVE-2026-98758 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98758 *
CVE-2026-98759 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98759 *
CVE-2026-98760 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98760 *
CVE-2026-98761 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98761 *
CVE-2026-98762 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98762 *
CVE-2026-98763 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98763 *
CVE-2026-98764 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98764 *
CVE-2026-98765 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98765 *
CVE-2026-98766 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98766 *
CVE-2026-98767 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98767 *
CVE-2026-98768 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98768 *
CVE-2026-98769 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98769 *
CVE-2026-98770 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98770 *
CVE-2026-98771 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98771 *
CVE-2026-98772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98772 *
CVE-2026-98773 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98773 *
CVE-2026-98774 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98774 *
CVE-2026-98775 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98775 *
CVE-2026-98777 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98777 *
CVE-2026-98778 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98778 *
CVE-2026-98779 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98779 *
CVE-2026-98780 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98780 *
CVE-2026-98781 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98781 *
CVE-2026-98782 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98782 *
CVE-2026-98783 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98783 *
CVE-2026-98784 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98784 *
CVE-2026-98785 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98785 *
CVE-2026-98786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98786 *
CVE-2026-98788 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98788 *
CVE-2026-98789 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98789 *
CVE-2026-98790 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98790 *
CVE-2026-98791 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98791 *
CVE-2026-98792 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98792 *
CVE-2026-98793 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98793 *
CVE-2026-98794 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98794 *
CVE-2026-98795 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98795 *
CVE-2026-98796 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98796 *
CVE-2026-98797 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98797 *
CVE-2026-98798 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98798 *
CVE-2026-98801 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98801 *
CVE-2026-98802 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98802 *
CVE-2026-98803 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98803 *
CVE-2026-98804 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98804 *
CVE-2026-98805 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98805 *
CVE-2026-98807 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98807 *
CVE-2026-98808 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98808 *
CVE-2026-98809 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98809 *
CVE-2026-98810 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98810 *
CVE-2026-98811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98811 *
CVE-2026-98812 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98812 *
CVE-2026-98814 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98814 *
CVE-2026-98815 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98815 *
CVE-2026-98816 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98816 *
CVE-2026-98818 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98818 *
CVE-2026-98819 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98819 *
CVE-2026-98820 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98820 *
CVE-2026-98821 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98821 *
CVE-2026-98822 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98822 *
CVE-2026-98823 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98823 *
CVE-2026-98824 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98824 *
CVE-2026-98825 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98825 *
CVE-2026-98826 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98826 *
CVE-2026-98827 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98827 *
CVE-2026-98828 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98828 *
CVE-2026-98829 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98829 *
CVE-2026-98830 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98830 *
CVE-2026-98831 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98831 *
CVE-2026-98833 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98833 *
CVE-2026-98835 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98835 *
CVE-2026-98836 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98836 *
CVE-2026-98837 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98837 *
CVE-2026-98838 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98838 *
CVE-2026-98839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98839 *
CVE-2026-98840 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98840 *
CVE-2026-98841 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98841 *
CVE-2026-98842 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98842 *
CVE-2026-98843 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98843 *
CVE-2026-98844 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98844 *
CVE-2026-98845 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98845 *
CVE-2026-98846 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98846 *
CVE-2026-98847 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98847 *
CVE-2026-98848 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98848 *
CVE-2026-98849 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98849 *
CVE-2026-98850 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98850 *
CVE-2026-98851 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98851 *
CVE-2026-98852 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98852 *
CVE-2026-98853 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98853 *
CVE-2026-98854 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98854 *
CVE-2026-98855 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98855 *
CVE-2026-98856 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98856 *
CVE-2026-98857 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98857 *
CVE-2026-98858 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98858 *
CVE-2026-98859 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98859 *
CVE-2026-98860 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98860 *
CVE-2026-98861 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98861 *
CVE-2026-98862 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98862 *
CVE-2026-98863 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98863 *
CVE-2026-99999 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99999 *
CVE-2026-100072 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100072 *
CVE-2026-100689 (CVSSv3: 5.9, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-100689 *
CVE-2026-102555 (CVSSv3: 8.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102555 *
CVE-2026-102556 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102556 *
CVE-2026-102557 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102557 *
CVE-2026-102558 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102558 *
CVE-2026-102559 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102559 *
CVE-2026-102560 (CVSSv3: 9.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102560 *
CVE-2026-102633 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-102633 *
CVE-2026-102991 (CVSSv3: 6.5): python3-mako:python3-mako-native https://nvd.nist.gov/vuln/detail/CVE-2026-102991 *
CVE-2026-103111 (CVSSv3: 7.6): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-103111 *
CVE-2026-103658 (CVSSv3: 5.9): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-103658 *
CVE-2026-105712 (CVSSv3: 3.6): gnupg:gnupg-native https://nvd.nist.gov/vuln/detail/CVE-2026-105712 *
CVE-2026-105840 (CVSSv3: 7.5, CVSSv4: 7.7): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105840 *
CVE-2026-105841 (CVSSv3: 7.5, CVSSv4: 7.7): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105841 *
CVE-2026-105842 (CVSSv3: 6.4, CVSSv4: 6.1): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105842 *
CVE-2026-106552 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106552 *
CVE-2026-106553 (CVSSv3: 7.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106553 *
CVE-2026-106555 (CVSSv3: 7.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106555 *
CVE-2026-106582 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106582 *
CVE-2026-106583 (CVSSv3: 7.8): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106583 *
CVE-2026-106584 (CVSSv3: 3.3): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106584 *
CVE-2026-106585 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106585 *
CVE-2026-106586 (CVSSv3: 4.3): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106586 *
CVE-2026-106587 (CVSSv3: 3.6): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106587 *
CVE-2026-106588 (CVSSv3: 3.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106588 *
CVE-2026-106589 (CVSSv3: 2.9): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106589 *
CVE-2026-107660 (CVSSv3: 4.8, CVSSv4: 6.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107660 *
CVE-2026-107675 (CVSSv3: 5.9, CVSSv4: 6.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107675 *
CVE-2026-107676 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107676 *
CVE-2026-107677 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107677 *
CVE-2026-107678 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107678 *
CVE-2026-107695 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107695 *
CVE-2026-107696 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107696 *
CVE-2026-107697 (CVSSv3: 4.3, CVSSv4: 5.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107697 *
CVE-2026-107885 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107885 *
CVE-2026-107886 (CVSSv3: 2.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107886 *
CVE-2026-107888 (CVSSv3: 5.1): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107888 *
CVE-2026-107890 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107890 *
CVE-2026-109828 (CVSSv2: 5.0, CVSSv3: 4.3, CVSSv4: 5.3): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2026-109828 *
CVE-2026-110855 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110855 *
CVE-2026-110856 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110856 *
CVE-2026-110857 (CVSSv3: 7.5, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110857 *
CVE-2026-110858 (CVSSv3: 8.1, CVSSv4: 9.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110858 *
CVE-2026-110859 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110859 *
CVE-2026-111269 (CVSSv3: 6.1, CVSSv4: 6.9): libical:libical-native https://nvd.nist.gov/vuln/detail/CVE-2026-111269 *

Summary of CVE counts by recipe:
  linux-yocto: 1464
  rsync:rsync-native: 39
  python3-git: 33
  ffmpeg: 24
  libsoup: 15
  openssh: 11
  curl:curl-native: 10
  cups: 9
  python3:python3-native: 8
  u-boot-tools: 8
  libpcre2:libpcre2-native: 8
  libxi:libxi-native: 7
  libgit2: 6
  python3-urllib3: 4
  aspell: 4
  libx11:libx11-native: 4
  libsndfile1: 3
  qemu:qemu-native:qemu-system-native: 3
  popt:popt-native: 3
  busybox: 3
  lrzsz: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  perl:perl-native: 2
  tar: 2
  ghostscript: 2
  acl:acl-native: 2
  gstreamer1.0: 2
  zlib:zlib-native: 2
  expat:expat-native: 2
  webkitgtk: 2
  alsa-lib:alsa-lib-native: 2
  libgcrypt:libgcrypt-native: 1
  cairo:cairo-native: 1
  avahi: 1
  rpm-sequoia: 1
  gdk-pixbuf:gdk-pixbuf-native: 1
  libtheora: 1
  graphene: 1
  epiphany: 1
  bluez5: 1
  cryptodev-linux: 1
  libxfont: 1
  libsolv: 1
  python3-lxml:python3-lxml-native: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  attr:attr-native: 1
  bison:bison-native: 1
  coreutils:coreutils-native: 1
  python3-cryptography: 1
  vim: 1
  sudo: 1
  libxrender:libxrender-native: 1
  libxtst:libxtst-native: 1
  grub:grub-efi:grub-native: 1
  python3-mako:python3-mako-native: 1
  gnupg:gnupg-native: 1
  libical:libical-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

