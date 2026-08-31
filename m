Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E97C624C6
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 08:35:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25280.1788165303947043862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 01:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xbSTPC8e;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so31816335e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 01:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788165302; x=1788770102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bawTP913kVj2XSw8dgrg6jjvqbNJmY5ENvM5lKUhJxA=;
        b=xbSTPC8e7yoBB44VQEC35L2HDFgu2ogKuNJ4KON9dqgEhY8oO2GbaAum0U120MZLcW
         /48GrHuOykaSkT/Y80gVtTzQL3bpEsWivMpKl+HUcOv7G6QtH2hrVUf4hx8EiTXCr3I0
         dWQmI3YDzNIy5MVAirp3+AQlPQz1uXidc6kJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165302; x=1788770102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bawTP913kVj2XSw8dgrg6jjvqbNJmY5ENvM5lKUhJxA=;
        b=ZAIqlaRKP2IaPR/XpLSfz77aOy2790CrFyOLVaEEdSSLFiBaRphYpYQaW+fDrm0uLn
         T81ftYmSpHIpjRcw4RhJjjeRX3Eu5vVb9bm9yoaBiDSAJAJjuFVRrMaJVC/kUmGdL3rG
         3uR4Sqab//nxVssR7u9WI9Fam6BMoLfQS1LYse8lEC7ndyh1dykxqTSgN8jH7Rnkwkz1
         ghWDjq3o59y5shyDcP6u4skjPOt9EgPiaWTOBwmlqV98r2omhQJ9wAdCUW0ajGwIbHCw
         sv3oOkSGmrBu6XnD7pkAb3YL98s4PTe2AJ8uLL3zjva7hESvhZNiiQkUcD0DHK2DPIDJ
         VJSw==
X-Gm-Message-State: AFuF++m/lPhoPtwQiyJlyE3y4YjLLqmSKJGFhmblts/MCk1Y8afwiI/V
	8hnuM0lFFSdG6X1FgaTq+GV0xUPc0dEbsPokOOAZShil8jAGDMW/ndRuvdB2yiNgwLswq2TpqwP
	jGNGJsRY=
X-Gm-Gg: AR+sD13RoP59yilyqt9wkBd7aq5xN1C6Ycz/Vbhzp3Iw3xtjsrBBk/RxlfyKSGbhhVN
	dl/UVUQZIfPkr8fx5rycWd/UrElzVq9qzkmBJ8XcqiIQ9cycIYzuD3xWzqjuCAnGH5BSfZGYx+x
	mhYOVPj9LeN0RnlVUZUKJi8Fii4jySTXc1xUQFHlT597fPe8TVkyTyKWuAiVSXep+haOJcdlHza
	xn/61IgeCsWeTxXwrDwM2J3qBHFrQSo9u7GxSDXccxUoIeNwNlW8jCilabQkYbaNQvps3T+BcV2
	8D+9UXgGvv5Qeu7QCBkpxNfBtH+IwU+1lzyjed0HendEL2oo1HJ3mkeol9eUZeuaEYQM8PM+1bp
	wK8kz4zX2S9K7cU07+XDwF8l1HGofOu9S9+J8O1gOpPAms2uViSkbGD5Ph47FqCT4wizZKw4AQX
	TitWGthxyxUH6t+at5CqixaY6GaxL/qlCInRwRvLa+qxRHSVi9PHJzuuqaLjjymuFhEhzUgWhjC
	rnQtktW0aWqQnP/6v7QzWvc1M56+Oede3IGvHcg+HrqhLHvgNWNKi3o7kOsLc3WFPS6tI/f3C5q
	ofl8gSXDtHMN7b2IHT63DDgSzntpWBqTzA==
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr364883935e9.1.1788165301119;
        Mon, 31 Aug 2026 01:35:01 -0700 (PDT)
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm169384105e9.4.2026.08.31.01.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:35:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Aug 31 06:02:23 2026
Date: Mon, 31 Aug 2026 08:34:58 +0000
Message-ID: <20260831083500.24-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 08:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244739

Branch: master

New this week: 102 CVEs
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-15310 (CVSSv4: 2.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15310 *
CVE-2026-16599 (CVSSv4: 5.1): wget https://nvd.nist.gov/vuln/detail/CVE-2026-16599 *
CVE-2026-18374 (CVSSv3: 4.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-18374 *
CVE-2026-64581 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64581 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-74734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74734 *
CVE-2026-74736 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74736 *
CVE-2026-74737 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74737 *
CVE-2026-74738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74738 *
CVE-2026-74739 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74739 *
CVE-2026-74740 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74740 *
CVE-2026-74741 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74741 *
CVE-2026-74742 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74742 *
CVE-2026-74743 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74743 *
CVE-2026-74744 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74744 *
CVE-2026-74745 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74745 *
CVE-2026-74746 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74746 *
CVE-2026-74747 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74747 *
CVE-2026-74748 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74748 *
CVE-2026-74750 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74750 *
CVE-2026-74752 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74752 *
CVE-2026-74753 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74753 *
CVE-2026-74754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74754 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-80519 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80519 *
CVE-2026-80520 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80520 *
CVE-2026-80522 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80522 *
CVE-2026-80524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80524 *
CVE-2026-80525 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80525 *
CVE-2026-80526 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80526 *
CVE-2026-80527 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80527 *
CVE-2026-80528 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80528 *
CVE-2026-80529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80529 *
CVE-2026-80530 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80530 *
CVE-2026-80531 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80531 *
CVE-2026-80532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80532 *
CVE-2026-80533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80533 *
CVE-2026-80534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80534 *
CVE-2026-80535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80535 *
CVE-2026-80536 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80536 *
CVE-2026-80537 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80537 *
CVE-2026-80538 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80538 *
CVE-2026-80539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80539 *
CVE-2026-80540 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80540 *
CVE-2026-80541 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80541 *
CVE-2026-80542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80542 *
CVE-2026-80547 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80547 *
CVE-2026-80548 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80548 *
CVE-2026-80549 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80549 *
CVE-2026-80550 (CVSSv3: 7.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80550 *
CVE-2026-80551 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80551 *
CVE-2026-80552 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80552 *
CVE-2026-80553 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80553 *
CVE-2026-80554 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80554 *
CVE-2026-80555 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80555 *
CVE-2026-80556 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80556 *
CVE-2026-80557 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80557 *
CVE-2026-80558 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80558 *
CVE-2026-80559 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80559 *
CVE-2026-80560 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80560 *
CVE-2026-80561 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80561 *
CVE-2026-80562 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80562 *
CVE-2026-80563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80563 *
CVE-2026-80564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80564 *
CVE-2026-80565 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80565 *
CVE-2026-80566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80566 *
CVE-2026-80567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80567 *
CVE-2026-80568 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80568 *
CVE-2026-80569 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80569 *
CVE-2026-80570 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80570 *
CVE-2026-80571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80571 *
CVE-2026-80572 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80572 *
CVE-2026-80573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80573 *
CVE-2026-80574 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80574 *
CVE-2026-80575 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80575 *
CVE-2026-80576 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80576 *
CVE-2026-80577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80577 *
CVE-2026-80578 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80578 *
CVE-2026-80579 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80579 *
CVE-2026-80580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80580 *
CVE-2026-80581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80581 *
CVE-2026-80583 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80583 *
CVE-2026-80584 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80584 *
CVE-2026-80585 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80585 *
CVE-2026-80586 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80586 *
CVE-2026-80587 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80587 *
CVE-2026-80588 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80588 *
CVE-2026-80589 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80589 *
CVE-2026-80590 (CVSSv3: 8.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80590 *
CVE-2026-80631 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80631 *
CVE-2026-80634 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80634 *
CVE-2026-80655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80655 *
CVE-2026-80657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80657 *
CVE-2026-80668 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80668 *
CVE-2026-80693 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80693 *
CVE-2026-80705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80705 *
CVE-2026-80724 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80724 *
CVE-2026-80725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80725 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *

Removed this week: 11 CVEs
CVE-2022-0400 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0400 *
CVE-2022-1247 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1247 *
CVE-2023-4010 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-4010 *
CVE-2026-14456 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-14456 *
CVE-2026-58470 (CVSSv3: 5.3, CVSSv4: 6.9): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58470 *
CVE-2026-63380 (CVSSv4: 5.7): libevent https://nvd.nist.gov/vuln/detail/CVE-2026-63380 *
CVE-2026-73071 (CVSSv3: 3.3): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73071 *
CVE-2026-73072 (CVSSv4: 8.5): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73072 *
CVE-2026-73073 (CVSSv4: 7.1): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73073 *
CVE-2026-73076 (CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73076 *
CVE-2026-73434 (CVSSv3: 6.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73434 *

Full list: Found 516 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
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
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-15310 (CVSSv4: 2.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15310 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-16599 (CVSSv4: 5.1): wget https://nvd.nist.gov/vuln/detail/CVE-2026-16599 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18295 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18295 *
CVE-2026-18296 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18296 *
CVE-2026-18297 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18297 *
CVE-2026-18298 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18298 *
CVE-2026-18299 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18299 *
CVE-2026-18374 (CVSSv3: 4.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-18374 *
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
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-58049 (CVSSv3: 8.6, CVSSv4: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-58049 *
CVE-2026-58051 (CVSSv3: 6.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-58051 *
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
CVE-2026-64581 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64581 *
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
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
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
CVE-2026-73433 (CVSSv3: 6.6): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73433 *
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
CVE-2026-74580 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74580 *
CVE-2026-74582 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74582 *
CVE-2026-74583 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74583 *
CVE-2026-74585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74585 *
CVE-2026-74586 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74586 *
CVE-2026-74587 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74587 *
CVE-2026-74588 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74588 *
CVE-2026-74589 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74589 *
CVE-2026-74590 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74590 *
CVE-2026-74591 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74591 *
CVE-2026-74592 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74592 *
CVE-2026-74593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74593 *
CVE-2026-74594 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74594 *
CVE-2026-74595 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74595 *
CVE-2026-74597 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74597 *
CVE-2026-74598 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74598 *
CVE-2026-74599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74599 *
CVE-2026-74600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74600 *
CVE-2026-74601 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74601 *
CVE-2026-74602 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74602 *
CVE-2026-74603 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74603 *
CVE-2026-74604 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74604 *
CVE-2026-74606 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74606 *
CVE-2026-74607 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74607 *
CVE-2026-74608 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74608 *
CVE-2026-74609 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74609 *
CVE-2026-74610 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74610 *
CVE-2026-74611 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74611 *
CVE-2026-74612 (CVSSv3: 10.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74612 *
CVE-2026-74613 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74613 *
CVE-2026-74614 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74614 *
CVE-2026-74615 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74615 *
CVE-2026-74616 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74616 *
CVE-2026-74617 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74617 *
CVE-2026-74618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74618 *
CVE-2026-74619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74619 *
CVE-2026-74620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74620 *
CVE-2026-74621 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74621 *
CVE-2026-74622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74622 *
CVE-2026-74623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74623 *
CVE-2026-74624 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74624 *
CVE-2026-74625 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74625 *
CVE-2026-74626 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74626 *
CVE-2026-74627 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74627 *
CVE-2026-74628 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74628 *
CVE-2026-74629 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74629 *
CVE-2026-74630 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74630 *
CVE-2026-74631 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74631 *
CVE-2026-74632 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74632 *
CVE-2026-74633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74633 *
CVE-2026-74634 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74634 *
CVE-2026-74635 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74635 *
CVE-2026-74636 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74636 *
CVE-2026-74637 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74637 *
CVE-2026-74638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74638 *
CVE-2026-74639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74639 *
CVE-2026-74640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74640 *
CVE-2026-74641 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74641 *
CVE-2026-74642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74642 *
CVE-2026-74643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74643 *
CVE-2026-74644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74644 *
CVE-2026-74646 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74646 *
CVE-2026-74647 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74647 *
CVE-2026-74648 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74648 *
CVE-2026-74649 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74649 *
CVE-2026-74650 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74650 *
CVE-2026-74651 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74651 *
CVE-2026-74652 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74652 *
CVE-2026-74653 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74653 *
CVE-2026-74654 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74654 *
CVE-2026-74655 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74655 *
CVE-2026-74656 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74656 *
CVE-2026-74657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74657 *
CVE-2026-74658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74658 *
CVE-2026-74659 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74659 *
CVE-2026-74660 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74660 *
CVE-2026-74661 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74661 *
CVE-2026-74662 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74662 *
CVE-2026-74663 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74663 *
CVE-2026-74664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74664 *
CVE-2026-74665 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74665 *
CVE-2026-74666 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74666 *
CVE-2026-74667 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74667 *
CVE-2026-74668 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74668 *
CVE-2026-74669 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74669 *
CVE-2026-74670 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74670 *
CVE-2026-74671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74671 *
CVE-2026-74672 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74672 *
CVE-2026-74673 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74673 *
CVE-2026-74675 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74675 *
CVE-2026-74676 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74676 *
CVE-2026-74677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74677 *
CVE-2026-74678 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74678 *
CVE-2026-74679 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74679 *
CVE-2026-74680 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74680 *
CVE-2026-74681 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74681 *
CVE-2026-74682 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74682 *
CVE-2026-74683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74683 *
CVE-2026-74684 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74684 *
CVE-2026-74685 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74685 *
CVE-2026-74687 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74687 *
CVE-2026-74688 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74688 *
CVE-2026-74689 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74689 *
CVE-2026-74690 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74690 *
CVE-2026-74691 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74691 *
CVE-2026-74692 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74692 *
CVE-2026-74693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74693 *
CVE-2026-74694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74694 *
CVE-2026-74695 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74695 *
CVE-2026-74696 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74696 *
CVE-2026-74697 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74697 *
CVE-2026-74698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74698 *
CVE-2026-74700 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74700 *
CVE-2026-74701 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74701 *
CVE-2026-74702 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74702 *
CVE-2026-74703 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74703 *
CVE-2026-74704 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74704 *
CVE-2026-74705 (CVSSv3: 10.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74705 *
CVE-2026-74707 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74707 *
CVE-2026-74708 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74708 *
CVE-2026-74709 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74709 *
CVE-2026-74710 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74710 *
CVE-2026-74711 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74711 *
CVE-2026-74712 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74712 *
CVE-2026-74713 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74713 *
CVE-2026-74714 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74714 *
CVE-2026-74715 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74715 *
CVE-2026-74716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74716 *
CVE-2026-74717 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74717 *
CVE-2026-74718 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74718 *
CVE-2026-74719 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74719 *
CVE-2026-74720 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74720 *
CVE-2026-74721 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74721 *
CVE-2026-74722 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74722 *
CVE-2026-74723 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74723 *
CVE-2026-74724 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74724 *
CVE-2026-74725 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74725 *
CVE-2026-74726 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74726 *
CVE-2026-74727 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74727 *
CVE-2026-74728 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74728 *
CVE-2026-74729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74729 *
CVE-2026-74730 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74730 *
CVE-2026-74732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74732 *
CVE-2026-74734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74734 *
CVE-2026-74736 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74736 *
CVE-2026-74737 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74737 *
CVE-2026-74738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74738 *
CVE-2026-74739 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74739 *
CVE-2026-74740 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74740 *
CVE-2026-74741 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74741 *
CVE-2026-74742 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74742 *
CVE-2026-74743 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74743 *
CVE-2026-74744 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74744 *
CVE-2026-74745 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74745 *
CVE-2026-74746 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74746 *
CVE-2026-74747 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74747 *
CVE-2026-74748 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74748 *
CVE-2026-74750 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74750 *
CVE-2026-74752 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74752 *
CVE-2026-74753 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74753 *
CVE-2026-74754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74754 *
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
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-80519 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80519 *
CVE-2026-80520 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80520 *
CVE-2026-80522 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80522 *
CVE-2026-80524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80524 *
CVE-2026-80525 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80525 *
CVE-2026-80526 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80526 *
CVE-2026-80527 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80527 *
CVE-2026-80528 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80528 *
CVE-2026-80529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80529 *
CVE-2026-80530 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80530 *
CVE-2026-80531 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80531 *
CVE-2026-80532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80532 *
CVE-2026-80533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80533 *
CVE-2026-80534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80534 *
CVE-2026-80535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80535 *
CVE-2026-80536 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80536 *
CVE-2026-80537 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80537 *
CVE-2026-80538 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80538 *
CVE-2026-80539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80539 *
CVE-2026-80540 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80540 *
CVE-2026-80541 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80541 *
CVE-2026-80542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80542 *
CVE-2026-80547 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80547 *
CVE-2026-80548 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80548 *
CVE-2026-80549 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80549 *
CVE-2026-80550 (CVSSv3: 7.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80550 *
CVE-2026-80551 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80551 *
CVE-2026-80552 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80552 *
CVE-2026-80553 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80553 *
CVE-2026-80554 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80554 *
CVE-2026-80555 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80555 *
CVE-2026-80556 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80556 *
CVE-2026-80557 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80557 *
CVE-2026-80558 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80558 *
CVE-2026-80559 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80559 *
CVE-2026-80560 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80560 *
CVE-2026-80561 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80561 *
CVE-2026-80562 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80562 *
CVE-2026-80563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80563 *
CVE-2026-80564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80564 *
CVE-2026-80565 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80565 *
CVE-2026-80566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80566 *
CVE-2026-80567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80567 *
CVE-2026-80568 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80568 *
CVE-2026-80569 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80569 *
CVE-2026-80570 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80570 *
CVE-2026-80571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80571 *
CVE-2026-80572 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80572 *
CVE-2026-80573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80573 *
CVE-2026-80574 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80574 *
CVE-2026-80575 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80575 *
CVE-2026-80576 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80576 *
CVE-2026-80577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80577 *
CVE-2026-80578 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80578 *
CVE-2026-80579 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80579 *
CVE-2026-80580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80580 *
CVE-2026-80581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80581 *
CVE-2026-80583 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80583 *
CVE-2026-80584 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80584 *
CVE-2026-80585 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80585 *
CVE-2026-80586 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80586 *
CVE-2026-80587 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80587 *
CVE-2026-80588 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80588 *
CVE-2026-80589 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80589 *
CVE-2026-80590 (CVSSv3: 8.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80590 *
CVE-2026-80631 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80631 *
CVE-2026-80634 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80634 *
CVE-2026-80655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80655 *
CVE-2026-80657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80657 *
CVE-2026-80668 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80668 *
CVE-2026-80693 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80693 *
CVE-2026-80705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80705 *
CVE-2026-80724 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80724 *
CVE-2026-80725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80725 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *

Summary of CVE counts by recipe:
  linux-yocto: 435
  ffmpeg: 29
  libsoup: 9
  gstreamer1.0: 6
  python3:python3-native: 5
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
  expat:expat-native: 4
  busybox: 3
  libsndfile1: 2
  tar: 2
  popt:popt-native: 2
  openssh: 2
  libgcrypt:libgcrypt-native: 1
  cups: 1
  cairo:cairo-native: 1
  libtheora: 1
  perl:perl-native: 1
  wget: 1
  glibc: 1
  epiphany: 1
  cryptodev-linux: 1
  bison:bison-native: 1
  libssh2:libssh2-native: 1
  webkitgtk: 1
  sudo: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

