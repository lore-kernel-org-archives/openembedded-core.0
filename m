Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AE3C5DF8C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 04:58:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10027.1787547500706185466
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 21:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z8uiwGYv;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so13041925e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 21:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787547499; x=1788152299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KPmctOA8HsAupOdNBSiLMMP4aEhIZG3eT+sChJWDaE=;
        b=z8uiwGYvyhV4WwWbewso6oH5DsvzDY//fPlkzt1BIlSyfJOOo9gABSViDO2wbW45Dx
         gMLG4+gOcu/PEKEJgCSH/jF0AwWMfFk+Pki6LP89eK+N8d9QddHw1m7MQMmiC7HVGPU3
         gRswqazr5UhMHbTPKFjhgUxxYofMd/SyDVmho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787547499; x=1788152299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4KPmctOA8HsAupOdNBSiLMMP4aEhIZG3eT+sChJWDaE=;
        b=n3JGUfKzdHiKceRVFnn8OT/XvWTDgjb94A+onXQmLimcpQU8m3H94GON/VQKzQPGfi
         WcsFMgseIDgeleYS7p5u2+CtADj08gqnuOu0Eh3nw3BmX0/dhzCf2lpKT9iFXqPgAvKd
         h1NdT29Th/uAEqQJZTS2PkY0JbKKMhxgT0azDeHJ0MXd6k4NURUnRV437/MsyI/EaaXF
         Wh6q7OLRctp0Vm7v+V6fgC/Xge3Em6ovL7ZiRwu7x9/HbS/CCnuMae+cpQ+hvT1JNdRZ
         YDPWnBGiLLlTsA9gkxO4HbGroklprMzHOIH4s2BuT1vEYM/rrfgiRWjL9T/QS4RQ29MY
         qX0g==
X-Gm-Message-State: AFuF++kmW9p9weqvp3W3IcJGEarjKAC1AjntJncks9jbHCf2OmYivMI2
	eAtBaG8OBdDiCOmoRn1q0m2zBqNyrswI3MGEHcjnXv3ex/P1VGCAAUI4SDJyALqcB9nNS6ufPWY
	+0+84K2Y=
X-Gm-Gg: AR+sD10K5MRIqCXElmXhpc8E8VNdfEb3SR56Phoojx6N+q2Z5VnP5NX9TuvJ3nx9bgL
	DXWgz+qKEajeaEVKOs6fvkh0qP+xvDzLRnmZnCOqRdKrQoSWvlbvjj8IdGRlYakIrXj0XEo997C
	6hdZx4Hfkw3RYhxvX4mZAhW/Wn5DPryQAn4UGG9ooCKHJRtNT4jtWXufXdkbkAuoEXwwdyvPnmU
	HpMbKPimMvnT8/PEXST2zER50exk0FJ/qVcI4/XdTNOn/eytObd+zZnFbOq/edbfaZcfsu0zGE0
	lTxhXLuc3Ra4hlDdH0NoMr6exLuCVXL0MiOyU6+plvgzZszZdJwxZ3bhgzxeGmV2uIHGiSKdNTp
	qf/xaGpu5gJ1xdzSUcwnzRwGtZsdREH043QF896jzVKllF+zvQRMXe1oF5IBrxrf2OE0DjGffwF
	dd01/HfZrgQcLybzSOm8w4cqTbqdhbha3N3YqavtCGtxXczyhhnxgG8dotQxHGzwWBkWZDL1NkO
	m83+mVvStiILAvz6OFRkGlSSm30EUZf8KlgpOP4GFC+iYEL5UgihrmGbBpm6VClh+ASBqLZI6y/
	FuONsQtQi2w0/DyCW3LjrP9BCEAeTOcI
X-Received: by 2002:a05:600c:64c6:b0:499:afcb:24c1 with SMTP id 5b1f17b1804b1-499b82e8528mr296883795e9.5.1787547498036;
        Sun, 23 Aug 2026 21:58:18 -0700 (PDT)
Received: from runner-glrt-sin-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9b54fd8sm70831995e9.3.2026.08.23.21.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:58:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Aug 24 03:04:23 2026
Date: Mon, 24 Aug 2026 04:58:15 +0000
Message-ID: <20260824045817.20-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 04:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244057

Branch: master

New this week: 171 CVEs
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18295 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18295 *
CVE-2026-18296 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18296 *
CVE-2026-18297 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18297 *
CVE-2026-18298 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18298 *
CVE-2026-18299 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18299 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-63380 (CVSSv4: 5.7): libevent https://nvd.nist.gov/vuln/detail/CVE-2026-63380 *
CVE-2026-64017 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64017 *
CVE-2026-64159 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64159 *
CVE-2026-66046 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-66046 *
CVE-2026-68431 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68431 *
CVE-2026-73073 (CVSSv4: 7.1): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73073 *
CVE-2026-73433 (CVSSv3: 6.6): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73433 *
CVE-2026-73434 (CVSSv3: 6.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73434 *
CVE-2026-74517 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74517 *
CVE-2026-74580 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74580 *
CVE-2026-74582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74582 *
CVE-2026-74583 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74583 *
CVE-2026-74585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74585 *
CVE-2026-74586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74586 *
CVE-2026-74587 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74587 *
CVE-2026-74588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74588 *
CVE-2026-74589 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74589 *
CVE-2026-74590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74590 *
CVE-2026-74591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74591 *
CVE-2026-74592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74592 *
CVE-2026-74593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74593 *
CVE-2026-74594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74594 *
CVE-2026-74595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74595 *
CVE-2026-74597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74597 *
CVE-2026-74598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74598 *
CVE-2026-74599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74599 *
CVE-2026-74600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74600 *
CVE-2026-74601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74601 *
CVE-2026-74602 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74602 *
CVE-2026-74603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74603 *
CVE-2026-74604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74604 *
CVE-2026-74606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74606 *
CVE-2026-74607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74607 *
CVE-2026-74608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74608 *
CVE-2026-74609 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74609 *
CVE-2026-74610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74610 *
CVE-2026-74611 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74611 *
CVE-2026-74612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74612 *
CVE-2026-74613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74613 *
CVE-2026-74614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74614 *
CVE-2026-74615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74615 *
CVE-2026-74616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74616 *
CVE-2026-74617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74617 *
CVE-2026-74618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74618 *
CVE-2026-74619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74619 *
CVE-2026-74620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74620 *
CVE-2026-74621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74621 *
CVE-2026-74622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74622 *
CVE-2026-74623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74623 *
CVE-2026-74624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74624 *
CVE-2026-74625 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74625 *
CVE-2026-74626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74626 *
CVE-2026-74627 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74627 *
CVE-2026-74628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74628 *
CVE-2026-74629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74629 *
CVE-2026-74630 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74630 *
CVE-2026-74631 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74631 *
CVE-2026-74632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74632 *
CVE-2026-74633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74633 *
CVE-2026-74634 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74634 *
CVE-2026-74635 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74635 *
CVE-2026-74636 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74636 *
CVE-2026-74637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74637 *
CVE-2026-74638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74638 *
CVE-2026-74639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74639 *
CVE-2026-74640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74640 *
CVE-2026-74641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74641 *
CVE-2026-74642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74642 *
CVE-2026-74643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74643 *
CVE-2026-74644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74644 *
CVE-2026-74646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74646 *
CVE-2026-74647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74647 *
CVE-2026-74648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74648 *
CVE-2026-74649 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74649 *
CVE-2026-74650 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74650 *
CVE-2026-74651 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74651 *
CVE-2026-74652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74652 *
CVE-2026-74653 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74653 *
CVE-2026-74654 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74654 *
CVE-2026-74655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74655 *
CVE-2026-74656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74656 *
CVE-2026-74657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74657 *
CVE-2026-74658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74658 *
CVE-2026-74659 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74659 *
CVE-2026-74660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74660 *
CVE-2026-74661 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74661 *
CVE-2026-74662 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74662 *
CVE-2026-74663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74663 *
CVE-2026-74664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74664 *
CVE-2026-74665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74665 *
CVE-2026-74666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74666 *
CVE-2026-74667 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74667 *
CVE-2026-74668 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74668 *
CVE-2026-74669 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74669 *
CVE-2026-74670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74670 *
CVE-2026-74671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74671 *
CVE-2026-74672 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74672 *
CVE-2026-74673 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74673 *
CVE-2026-74675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74675 *
CVE-2026-74676 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74676 *
CVE-2026-74677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74677 *
CVE-2026-74678 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74678 *
CVE-2026-74679 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74679 *
CVE-2026-74680 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74680 *
CVE-2026-74681 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74681 *
CVE-2026-74682 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74682 *
CVE-2026-74683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74683 *
CVE-2026-74684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74684 *
CVE-2026-74685 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74685 *
CVE-2026-74687 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74687 *
CVE-2026-74688 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74688 *
CVE-2026-74689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74689 *
CVE-2026-74690 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74690 *
CVE-2026-74691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74691 *
CVE-2026-74692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74692 *
CVE-2026-74693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74693 *
CVE-2026-74694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74694 *
CVE-2026-74695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74695 *
CVE-2026-74696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74696 *
CVE-2026-74697 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74697 *
CVE-2026-74698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74698 *
CVE-2026-74700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74700 *
CVE-2026-74701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74701 *
CVE-2026-74702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74702 *
CVE-2026-74703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74703 *
CVE-2026-74704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74704 *
CVE-2026-74705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74705 *
CVE-2026-74707 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74707 *
CVE-2026-74708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74708 *
CVE-2026-74709 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74709 *
CVE-2026-74710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74710 *
CVE-2026-74711 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74711 *
CVE-2026-74712 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74712 *
CVE-2026-74713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74713 *
CVE-2026-74714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74714 *
CVE-2026-74715 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74715 *
CVE-2026-74716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74716 *
CVE-2026-74717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74717 *
CVE-2026-74718 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74718 *
CVE-2026-74719 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74719 *
CVE-2026-74720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74720 *
CVE-2026-74721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74721 *
CVE-2026-74722 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74722 *
CVE-2026-74723 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74723 *
CVE-2026-74724 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74724 *
CVE-2026-74725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74725 *
CVE-2026-74726 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74726 *
CVE-2026-74727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74727 *
CVE-2026-74728 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74728 *
CVE-2026-74729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74729 *
CVE-2026-74730 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74730 *
CVE-2026-74732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74732 *
CVE-2026-75141 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75141 *
CVE-2026-75142 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75142 *
CVE-2026-75143 (CVSSv3: 9.8, CVSSv4: 9.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75143 *
CVE-2026-75144 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75144 *
CVE-2026-75145 (CVSSv3: 5.8, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75145 *
CVE-2026-75146 (CVSSv3: 8.1, CVSSv4: 7.2): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75146 *
CVE-2026-75147 (CVSSv3: 7.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75147 *
CVE-2026-76641 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76641 *
CVE-2026-76956 (CVSSv3: 5.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76956 *
CVE-2026-76957 (CVSSv3: 4.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76957 *

Removed this week: 149 CVEs
CVE-2011-3374 (CVSSv2: 4.3, CVSSv3: 3.7): apt https://nvd.nist.gov/vuln/detail/CVE-2011-3374 *
CVE-2026-15308 (CVSSv3: 7.5, CVSSv4: 8.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15308 *
CVE-2026-58471 (CVSSv3: 7.1, CVSSv4: 6.0): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58471 *
CVE-2026-63978 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63978 *
CVE-2026-63979 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63979 *
CVE-2026-64523 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64523 *
CVE-2026-64586 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64586 *
CVE-2026-68114 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68114 *
CVE-2026-68166 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68166 *
CVE-2026-68240 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68240 *
CVE-2026-68254 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68254 *
CVE-2026-68264 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68264 *
CVE-2026-68265 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68265 *
CVE-2026-68267 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68267 *
CVE-2026-68273 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68273 *
CVE-2026-68274 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68274 *
CVE-2026-68322 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68322 *
CVE-2026-68364 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68364 *
CVE-2026-68451 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68451 *
CVE-2026-68452 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68452 *
CVE-2026-68453 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68453 *
CVE-2026-72198 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72198 *
CVE-2026-72199 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72199 *
CVE-2026-72200 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72200 *
CVE-2026-72201 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72201 *
CVE-2026-72202 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72202 *
CVE-2026-72203 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72203 *
CVE-2026-72204 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72204 *
CVE-2026-72205 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72205 *
CVE-2026-72206 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72206 *
CVE-2026-72207 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72207 *
CVE-2026-72208 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72208 *
CVE-2026-72210 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72210 *
CVE-2026-72211 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72211 *
CVE-2026-74440 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74440 *
CVE-2026-74441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74441 *
CVE-2026-74442 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74442 *
CVE-2026-74443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74443 *
CVE-2026-74444 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74444 *
CVE-2026-74445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74445 *
CVE-2026-74446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74446 *
CVE-2026-74447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74447 *
CVE-2026-74448 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74448 *
CVE-2026-74451 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74451 *
CVE-2026-74452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74452 *
CVE-2026-74453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74453 *
CVE-2026-74454 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74454 *
CVE-2026-74455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74455 *
CVE-2026-74456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74456 *
CVE-2026-74457 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74457 *
CVE-2026-74458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74458 *
CVE-2026-74459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74459 *
CVE-2026-74460 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74460 *
CVE-2026-74461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74461 *
CVE-2026-74462 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74462 *
CVE-2026-74463 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74463 *
CVE-2026-74464 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74464 *
CVE-2026-74465 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74465 *
CVE-2026-74467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74467 *
CVE-2026-74468 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74468 *
CVE-2026-74469 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74469 *
CVE-2026-74470 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74470 *
CVE-2026-74471 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74471 *
CVE-2026-74472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74472 *
CVE-2026-74473 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74473 *
CVE-2026-74474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74474 *
CVE-2026-74475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74475 *
CVE-2026-74476 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74476 *
CVE-2026-74477 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74477 *
CVE-2026-74478 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74478 *
CVE-2026-74479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74479 *
CVE-2026-74480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74480 *
CVE-2026-74481 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74481 *
CVE-2026-74482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74482 *
CVE-2026-74484 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74484 *
CVE-2026-74485 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74485 *
CVE-2026-74486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74486 *
CVE-2026-74487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74487 *
CVE-2026-74488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74488 *
CVE-2026-74490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74490 *
CVE-2026-74491 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74491 *
CVE-2026-74492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74492 *
CVE-2026-74493 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74493 *
CVE-2026-74494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74494 *
CVE-2026-74495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74495 *
CVE-2026-74497 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74497 *
CVE-2026-74498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74498 *
CVE-2026-74499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74499 *
CVE-2026-74500 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74500 *
CVE-2026-74501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74501 *
CVE-2026-74502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74502 *
CVE-2026-74503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74503 *
CVE-2026-74504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74504 *
CVE-2026-74505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74505 *
CVE-2026-74506 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74506 *
CVE-2026-74507 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74507 *
CVE-2026-74508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74508 *
CVE-2026-74509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74509 *
CVE-2026-74510 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74510 *
CVE-2026-74511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74511 *
CVE-2026-74512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74512 *
CVE-2026-74513 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74513 *
CVE-2026-74514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74514 *
CVE-2026-74515 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74515 *
CVE-2026-74516 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74516 *
CVE-2026-74518 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74518 *
CVE-2026-74519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74519 *
CVE-2026-74520 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74520 *
CVE-2026-74522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74522 *
CVE-2026-74523 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74523 *
CVE-2026-74524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74524 *
CVE-2026-74525 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74525 *
CVE-2026-74531 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74531 *
CVE-2026-74532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74532 *
CVE-2026-74534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74534 *
CVE-2026-74535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74535 *
CVE-2026-74536 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74536 *
CVE-2026-74537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74537 *
CVE-2026-74538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74538 *
CVE-2026-74539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74539 *
CVE-2026-74540 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74540 *
CVE-2026-74541 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74541 *
CVE-2026-74543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74543 *
CVE-2026-74545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74545 *
CVE-2026-74546 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74546 *
CVE-2026-74547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74547 *
CVE-2026-74548 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74548 *
CVE-2026-74549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74549 *
CVE-2026-74550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74550 *
CVE-2026-74551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74551 *
CVE-2026-74552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74552 *
CVE-2026-74553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74553 *
CVE-2026-74555 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74555 *
CVE-2026-74556 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74556 *
CVE-2026-74557 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74557 *
CVE-2026-74559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74559 *
CVE-2026-74560 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74560 *
CVE-2026-74563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74563 *
CVE-2026-74564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74564 *
CVE-2026-74565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74565 *
CVE-2026-74566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74566 *
CVE-2026-74567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74567 *
CVE-2026-74569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74569 *
CVE-2026-74572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74572 *
CVE-2026-74573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74573 *
CVE-2026-74574 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74574 *
CVE-2026-74575 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74575 *
CVE-2026-74576 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74576 *
CVE-2026-74577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74577 *

Full list: Found 425 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-0400 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0400 *
CVE-2022-1247 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1247 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-4010 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-4010 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-50422 (CVSSv3: 2.9): cairo:cairo-native https://nvd.nist.gov/vuln/detail/CVE-2025-50422 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-71074 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71074 *
CVE-2025-71306 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71306 *
CVE-2025-71308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71308 *
CVE-2025-71313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71313 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3441 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3441 *
CVE-2026-3442 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3442 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-14456 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-14456 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18295 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18295 *
CVE-2026-18296 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18296 *
CVE-2026-18297 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18297 *
CVE-2026-18298 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18298 *
CVE-2026-18299 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18299 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18739 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18739 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-23328 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23328 *
CVE-2026-23374 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23374 *
CVE-2026-23377 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23377 *
CVE-2026-23459 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23459 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-31501 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31501 *
CVE-2026-31771 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31771 *
CVE-2026-31777 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31777 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-43009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43009 *
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
CVE-2026-43344 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43344 *
CVE-2026-43391 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43391 *
CVE-2026-43414 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43414 *
CVE-2026-43443 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43443 *
CVE-2026-45961 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45961 *
CVE-2026-45963 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45963 *
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
CVE-2026-53089 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53089 *
CVE-2026-53091 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53091 *
CVE-2026-53102 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53102 *
CVE-2026-53106 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53106 *
CVE-2026-53108 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53108 *
CVE-2026-53113 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53113 *
CVE-2026-53124 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53124 *
CVE-2026-53178 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53178 *
CVE-2026-53222 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53222 *
CVE-2026-53257 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53257 *
CVE-2026-53285 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53285 *
CVE-2026-53292 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53292 *
CVE-2026-53308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53308 *
CVE-2026-53313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53313 *
CVE-2026-53401 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53401 *
CVE-2026-55654 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55654 *
CVE-2026-55655 (CVSSv3: 6.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55655 *
CVE-2026-56390 (CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-58049 (CVSSv3: 8.6, CVSSv4: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-58049 *
CVE-2026-58051 (CVSSv3: 6.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-58051 *
CVE-2026-58470 (CVSSv3: 5.3, CVSSv4: 6.9): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58470 *
CVE-2026-63380 (CVSSv4: 5.7): libevent https://nvd.nist.gov/vuln/detail/CVE-2026-63380 *
CVE-2026-63811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63811 *
CVE-2026-63839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63839 *
CVE-2026-63879 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63879 *
CVE-2026-63941 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63941 *
CVE-2026-63977 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63977 *
CVE-2026-63983 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63983 *
CVE-2026-64013 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64013 *
CVE-2026-64017 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64017 *
CVE-2026-64019 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64019 *
CVE-2026-64020 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64020 *
CVE-2026-64040 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64040 *
CVE-2026-64057 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64057 *
CVE-2026-64067 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64067 *
CVE-2026-64068 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64068 *
CVE-2026-64070 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64070 *
CVE-2026-64079 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64079 *
CVE-2026-64082 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64082 *
CVE-2026-64117 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64117 *
CVE-2026-64123 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64123 *
CVE-2026-64146 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64146 *
CVE-2026-64154 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64154 *
CVE-2026-64159 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64159 *
CVE-2026-64160 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64160 *
CVE-2026-64210 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64210 *
CVE-2026-64283 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64283 *
CVE-2026-64325 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64325 *
CVE-2026-64341 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64341 *
CVE-2026-64388 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64388 *
CVE-2026-64830 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64830 *
CVE-2026-64831 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64831 *
CVE-2026-64832 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64832 *
CVE-2026-64833 (CVSSv3: 7.1, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64833 *
CVE-2026-64834 (CVSSv3: 7.5, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64834 *
CVE-2026-64835 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64835 *
CVE-2026-65703 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65703 *
CVE-2026-65704 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65704 *
CVE-2026-65705 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65705 *
CVE-2026-65706 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65706 *
CVE-2026-66036 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66036 *
CVE-2026-66037 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66037 *
CVE-2026-66038 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66038 *
CVE-2026-66039 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66039 *
CVE-2026-66040 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66040 *
CVE-2026-66041 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66041 *
CVE-2026-66046 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-66046 *
CVE-2026-68082 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68082 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-68103 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68103 *
CVE-2026-68105 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68105 *
CVE-2026-68138 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68138 *
CVE-2026-68159 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68159 *
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
CVE-2026-68399 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68399 *
CVE-2026-68404 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68404 *
CVE-2026-68431 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68431 *
CVE-2026-68436 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68436 *
CVE-2026-68441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68441 *
CVE-2026-68447 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68447 *
CVE-2026-68470 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68470 *
CVE-2026-70628 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70628 *
CVE-2026-70629 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70629 *
CVE-2026-70630 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70630 *
CVE-2026-70631 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70631 *
CVE-2026-70632 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70632 *
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
CVE-2026-72440 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72440 *
CVE-2026-72454 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72454 *
CVE-2026-72463 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72463 *
CVE-2026-72477 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72477 *
CVE-2026-72485 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72485 *
CVE-2026-72494 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72494 *
CVE-2026-72496 (CVSSv3: 9.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72496 *
CVE-2026-72497 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72497 *
CVE-2026-72499 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72499 *
CVE-2026-73071 (CVSSv3: 3.3): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73071 *
CVE-2026-73072 (CVSSv4: 8.5): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73072 *
CVE-2026-73073 (CVSSv4: 7.1): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73073 *
CVE-2026-73076 (CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73076 *
CVE-2026-73433 (CVSSv3: 6.6): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73433 *
CVE-2026-73434 (CVSSv3: 6.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73434 *
CVE-2026-74258 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74258 *
CVE-2026-74260 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74260 *
CVE-2026-74272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74272 *
CVE-2026-74273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74273 *
CVE-2026-74277 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74277 *
CVE-2026-74289 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74289 *
CVE-2026-74291 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74291 *
CVE-2026-74294 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74294 *
CVE-2026-74307 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74307 *
CVE-2026-74317 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74317 *
CVE-2026-74334 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74334 *
CVE-2026-74336 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74336 *
CVE-2026-74338 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74338 *
CVE-2026-74342 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74342 *
CVE-2026-74347 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74347 *
CVE-2026-74350 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74350 *
CVE-2026-74354 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74354 *
CVE-2026-74367 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74367 *
CVE-2026-74373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74373 *
CVE-2026-74374 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74374 *
CVE-2026-74375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74375 *
CVE-2026-74407 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74407 *
CVE-2026-74419 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74419 *
CVE-2026-74449 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74449 *
CVE-2026-74450 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74450 *
CVE-2026-74466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74466 *
CVE-2026-74483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74483 *
CVE-2026-74496 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74496 *
CVE-2026-74517 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74517 *
CVE-2026-74521 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74521 *
CVE-2026-74527 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74527 *
CVE-2026-74542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74542 *
CVE-2026-74544 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74544 *
CVE-2026-74558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74558 *
CVE-2026-74561 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74561 *
CVE-2026-74562 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74562 *
CVE-2026-74568 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74568 *
CVE-2026-74580 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74580 *
CVE-2026-74582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74582 *
CVE-2026-74583 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74583 *
CVE-2026-74585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74585 *
CVE-2026-74586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74586 *
CVE-2026-74587 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74587 *
CVE-2026-74588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74588 *
CVE-2026-74589 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74589 *
CVE-2026-74590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74590 *
CVE-2026-74591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74591 *
CVE-2026-74592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74592 *
CVE-2026-74593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74593 *
CVE-2026-74594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74594 *
CVE-2026-74595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74595 *
CVE-2026-74597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74597 *
CVE-2026-74598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74598 *
CVE-2026-74599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74599 *
CVE-2026-74600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74600 *
CVE-2026-74601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74601 *
CVE-2026-74602 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74602 *
CVE-2026-74603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74603 *
CVE-2026-74604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74604 *
CVE-2026-74606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74606 *
CVE-2026-74607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74607 *
CVE-2026-74608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74608 *
CVE-2026-74609 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74609 *
CVE-2026-74610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74610 *
CVE-2026-74611 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74611 *
CVE-2026-74612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74612 *
CVE-2026-74613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74613 *
CVE-2026-74614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74614 *
CVE-2026-74615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74615 *
CVE-2026-74616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74616 *
CVE-2026-74617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74617 *
CVE-2026-74618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74618 *
CVE-2026-74619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74619 *
CVE-2026-74620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74620 *
CVE-2026-74621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74621 *
CVE-2026-74622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74622 *
CVE-2026-74623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74623 *
CVE-2026-74624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74624 *
CVE-2026-74625 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74625 *
CVE-2026-74626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74626 *
CVE-2026-74627 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74627 *
CVE-2026-74628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74628 *
CVE-2026-74629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74629 *
CVE-2026-74630 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74630 *
CVE-2026-74631 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74631 *
CVE-2026-74632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74632 *
CVE-2026-74633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74633 *
CVE-2026-74634 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74634 *
CVE-2026-74635 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74635 *
CVE-2026-74636 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74636 *
CVE-2026-74637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74637 *
CVE-2026-74638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74638 *
CVE-2026-74639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74639 *
CVE-2026-74640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74640 *
CVE-2026-74641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74641 *
CVE-2026-74642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74642 *
CVE-2026-74643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74643 *
CVE-2026-74644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74644 *
CVE-2026-74646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74646 *
CVE-2026-74647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74647 *
CVE-2026-74648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74648 *
CVE-2026-74649 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74649 *
CVE-2026-74650 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74650 *
CVE-2026-74651 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74651 *
CVE-2026-74652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74652 *
CVE-2026-74653 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74653 *
CVE-2026-74654 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74654 *
CVE-2026-74655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74655 *
CVE-2026-74656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74656 *
CVE-2026-74657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74657 *
CVE-2026-74658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74658 *
CVE-2026-74659 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74659 *
CVE-2026-74660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74660 *
CVE-2026-74661 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74661 *
CVE-2026-74662 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74662 *
CVE-2026-74663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74663 *
CVE-2026-74664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74664 *
CVE-2026-74665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74665 *
CVE-2026-74666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74666 *
CVE-2026-74667 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74667 *
CVE-2026-74668 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74668 *
CVE-2026-74669 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74669 *
CVE-2026-74670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74670 *
CVE-2026-74671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74671 *
CVE-2026-74672 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74672 *
CVE-2026-74673 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74673 *
CVE-2026-74675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74675 *
CVE-2026-74676 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74676 *
CVE-2026-74677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74677 *
CVE-2026-74678 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74678 *
CVE-2026-74679 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74679 *
CVE-2026-74680 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74680 *
CVE-2026-74681 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74681 *
CVE-2026-74682 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74682 *
CVE-2026-74683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74683 *
CVE-2026-74684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74684 *
CVE-2026-74685 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74685 *
CVE-2026-74687 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74687 *
CVE-2026-74688 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74688 *
CVE-2026-74689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74689 *
CVE-2026-74690 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74690 *
CVE-2026-74691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74691 *
CVE-2026-74692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74692 *
CVE-2026-74693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74693 *
CVE-2026-74694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74694 *
CVE-2026-74695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74695 *
CVE-2026-74696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74696 *
CVE-2026-74697 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74697 *
CVE-2026-74698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74698 *
CVE-2026-74700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74700 *
CVE-2026-74701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74701 *
CVE-2026-74702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74702 *
CVE-2026-74703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74703 *
CVE-2026-74704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74704 *
CVE-2026-74705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74705 *
CVE-2026-74707 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74707 *
CVE-2026-74708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74708 *
CVE-2026-74709 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74709 *
CVE-2026-74710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74710 *
CVE-2026-74711 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74711 *
CVE-2026-74712 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74712 *
CVE-2026-74713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74713 *
CVE-2026-74714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74714 *
CVE-2026-74715 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74715 *
CVE-2026-74716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74716 *
CVE-2026-74717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74717 *
CVE-2026-74718 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74718 *
CVE-2026-74719 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74719 *
CVE-2026-74720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74720 *
CVE-2026-74721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74721 *
CVE-2026-74722 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74722 *
CVE-2026-74723 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74723 *
CVE-2026-74724 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74724 *
CVE-2026-74725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74725 *
CVE-2026-74726 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74726 *
CVE-2026-74727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74727 *
CVE-2026-74728 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74728 *
CVE-2026-74729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74729 *
CVE-2026-74730 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74730 *
CVE-2026-74732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74732 *
CVE-2026-75141 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75141 *
CVE-2026-75142 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75142 *
CVE-2026-75143 (CVSSv3: 9.8, CVSSv4: 9.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75143 *
CVE-2026-75144 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75144 *
CVE-2026-75145 (CVSSv3: 5.8, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75145 *
CVE-2026-75146 (CVSSv3: 8.1, CVSSv4: 7.2): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75146 *
CVE-2026-75147 (CVSSv3: 7.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75147 *
CVE-2026-76641 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76641 *
CVE-2026-76956 (CVSSv3: 5.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76956 *
CVE-2026-76957 (CVSSv3: 4.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76957 *

Summary of CVE counts by recipe:
  linux-yocto: 345
  ffmpeg: 29
  gstreamer1.0: 7
  libsoup: 5
  python3:python3-native: 4
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
  expat:expat-native: 4
  vim: 4
  busybox: 3
  libsndfile1: 2
  tar: 2
  popt:popt-native: 2
  openssh: 2
  libgcrypt:libgcrypt-native: 1
  cups: 1
  cairo:cairo-native: 1
  libtheora: 1
  openssl:openssl-native: 1
  perl:perl-native: 1
  epiphany: 1
  cryptodev-linux: 1
  bison:bison-native: 1
  libssh2:libssh2-native: 1
  wget: 1
  libevent: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

