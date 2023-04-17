Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD9FC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 16:22:31 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.182.1681748547239877346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 09:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Bf9gw7So;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id v21-20020a17090a459500b0024776162815so5393088pjg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681748546; x=1684340546;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi+gy35hzLfiZdD7vJzkZQOCz3Wsmv68RAAcpBEcehw=;
        b=Bf9gw7SoqKBeyUZy0WdMYq/8x3Y5LGlrfNP43zfrB+JMYRr29lkxGJyrW2x5v4ic94
         UhhUKBWmLvKR9loYDIwwDhA/3B2ujTAcu1plmhI5sEui5al5nOQbF1bmYP48DbPUIe8R
         YdY89CzfpSPWyep61xlG7Zz6GNkn2gwqsbOfXadsZmD2KDW/9bnHIrI4pP7YwpvGT5Ro
         DZW4IH4aOHr4RM5kFO3gqPleZcql5vj7nv+Jb0jOp8l+0KZIBQO25jwNXQd/YLhhuyOd
         sJJv0pYBnUXmIr+1XJ2BMLfcA1tfbVBTJ1rb01k93wVvEqFgVvd6d7xD/Bd901OLNscY
         MTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681748546; x=1684340546;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zi+gy35hzLfiZdD7vJzkZQOCz3Wsmv68RAAcpBEcehw=;
        b=P8ufKB3IydOqY+B20qX4knI1lwE6BYV1HU5GmvdwtXW0KZuLVCwYQxUBTIByXks/Wm
         YqjGeThjVaBAWewzX6D3nKKdE3qAHcuCWXfAhlOUJINp2TMq+6uLYgmM+HyhvahkIvyT
         +f63WCU6lhWYwvhbSSQvF9cxAxvvAuquRG0SPkkVtJQacZrgU7UMw0AYs4D/FB1sPB7n
         HEP15tU6FJ9VLW+BI1aXCe9yD6s2FW1kJe9RpLl26oguJjxGdD9YLck5Rza4qs/dlOqb
         mRUbFDJBGO5o423QsvGRlprxH9bb1sVoQAxYd6tVOQN7QQcTDCtBNUjekTzzplAk8RK/
         Q44g==
X-Gm-Message-State: AAQBX9d+EgxjPNm0Lv3Kc7FqrNXXkfcZyImxRWl7Ojvm1xLIqAfWrLPS
	gO8Pq0qBFgbVbGj9EMnW9cF/PxE5PaU6Hxs731o=
X-Google-Smtp-Source: AKy350ZDQ9TkHG0qeDne7umI0rWjGDBP49MHHhB467X9TzmnFe8EKNDO+lpFOAQcFVYlBpyhf/R7AQ==
X-Received: by 2002:a17:902:e846:b0:1a6:9f09:866d with SMTP id t6-20020a170902e84600b001a69f09866dmr16969346plg.61.1681748546361;
        Mon, 17 Apr 2023 09:22:26 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709027c9000b001a21b871824sm1867079pll.119.2023.04.17.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 09:22:25 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id DC05596015F; Mon, 17 Apr 2023 06:22:23 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Mon 17 Apr 2023 06:19:57 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Mon, 17 Apr 2023 06:22:23 -1000
Message-Id: <20230417162223.DC05596015F@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 16:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180162

Branch: langdale

New this week: 5 CVEs
CVE-2023-24537 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24626 (CVSS3: 7.8 HIGH): screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24626 *
CVE-2023-27535 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27535 *
CVE-2023-27536 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27536 *
CVE-2023-27538 (CVSS3: 5.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27538 *

Removed this week: 1 CVEs
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *

Full list:  Found 34 unpatched CVEs
CVE-2020-10735 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10735 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-44370 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44370 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-4645 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4645 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0664 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0664 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-23914 (CVSS3: 9.1 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23914 *
CVE-2023-23915 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23915 *
CVE-2023-23916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23916 *
CVE-2023-24329 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24329 *
CVE-2023-24537 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24626 (CVSS3: 7.8 HIGH): screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24626 *
CVE-2023-25358 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25358 *
CVE-2023-25360 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25360 *
CVE-2023-25361 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25361 *
CVE-2023-25362 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25362 *
CVE-2023-25363 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25363 *
CVE-2023-27533 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27533 *
CVE-2023-27534 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27534 *
CVE-2023-27535 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27535 *
CVE-2023-27536 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27536 *
CVE-2023-27538 (CVSS3: 5.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27538 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-28879 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28879 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

