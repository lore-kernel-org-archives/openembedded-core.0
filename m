Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69512ECAAD2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 13:03:39 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.59063.1661691807406709651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 06:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nzJFGm9l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id y127so5838062pfy.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc;
        bh=rgGc+kJSuMcQ4mnEdNRK3cf1ltKNRGnQME2n4mRzm3Y=;
        b=nzJFGm9lfBpz9rKCNk+6ez0rGB9sC87jps8Q1AKIHw8jnZ4Ek8ek5VIK3AhgaWNEaK
         OJgR7ddgH183nyu0h6lqBh948JNwEYTlXiN3SJiiv2pFqlSpJFTfh+tztB1ClSJH6MHY
         j1FwOCcw97NgiYnmGHfp8GnI4uylxLWLDGcKXPTJhnhFIcM4A+xa9PG6xUxizlPlL3Sh
         mTMNvMPjYqwfLSQbXkM/UZzWmLwOlSlzrSrT7sTUkFf8s6STYKxJ/Js0ZWw/xKFmzLmh
         l2Jh3XVuUOIKvytG0XqtHE8Z1vL2ccEZDWzI8Z8lPEKx4DmXiOtPfuaro+NeQJqvb2xM
         UCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc;
        bh=rgGc+kJSuMcQ4mnEdNRK3cf1ltKNRGnQME2n4mRzm3Y=;
        b=z4MvYaI30gVs1+ocE+db7bvfMPBeeCyTCAWecYx9jbve5SQUghGHVGHYtHFajfUSBi
         Yl6rc92FE2frVXDKtN/sphKnGjphlPG6ZfEI3Gy+EakvIuRJAxwWYtxbtZVaW/bIYhE4
         p5TQ9Hl3OxlNWxeNXQaNU8OG55vm3HdPC2M0IBG14hJ7t4yb3HtmZvgzGSbvhLMGixy3
         ampLuAup6zg5/MlEUzZ+xyjmEid+rNNs4x9H4d472E91Y4YXu4R02BHPWVIgoXhQbFz/
         ajTMZfKt7j5rUDbBVEnEOVrbJLRQfa0ufUk3Fg+drjNh1MnNul5G9Pkx9iJif1G/evPF
         DMMQ==
X-Gm-Message-State: ACgBeo1OTqtbTWLrd+hMfApFLjlYsVngyWkEvSGAe0iJXClqL9CbknX1
	zDhntYO8Va0y7ane9yc38SmIDrzXN16RDc4o
X-Google-Smtp-Source: 
 AA6agR6FoOk8Fln+LvFyL6alrOXUpB7eC6Eokk5nneNtqJS6syQ1CUJyE8KUVtwwoi8P5gd05cs8gA==
X-Received: by 2002:a63:1459:0:b0:411:b06f:646f with SMTP id
 25-20020a631459000000b00411b06f646fmr10326881pgu.338.1661691805939;
        Sun, 28 Aug 2022 06:03:25 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a170902e54200b0016d1bee1519sm5340306plf.102.2022.08.28.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 06:03:25 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6EA799623B1; Sun, 28 Aug 2022 03:03:23 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 28 Aug 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220828130323.6EA799623B1@nuc.router0800d9.com>
Date: Sun, 28 Aug 2022 03:03:23 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 13:03:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169984

Branch: kirkstone

New this week: 3 CVEs
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *

Removed this week: 20 CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2021-46829 (CVSS3: 7.8 HIGH): gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46829 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2509 *
CVE-2022-2571 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2571 *
CVE-2022-2580 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2580 *
CVE-2022-2581 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2581 *
CVE-2022-2598 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2598 *
CVE-2022-2816 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2816 *
CVE-2022-2817 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2817 *
CVE-2022-2819 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2819 *
CVE-2022-2845 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2845 *
CVE-2022-2849 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2849 *
CVE-2022-2862 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2862 *
CVE-2022-2874 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2874 *
CVE-2022-2889 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2889 *
CVE-2022-32189 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32189 *
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32292 *
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32293 *
CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37434 *

Full list:  Found 11 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35737 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

