Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEA8C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 11:19:14 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.30717.1713093553503522997
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 04:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hfDF8Q8a;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.180, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78edc0f9636so69593385a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 04:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713093552; x=1713698352; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDw5///UdaO8PiFLqPE2TQy1/lRpHjUGLgxbegZkEV4=;
        b=hfDF8Q8a9YreKD+beQOluDf7+KQQ6Ej72FLNWEjS7iHb/3CmTQFXmkDlTVLfKGA2F5
         4+csBzP6VNc7t7wZipDILDBg5rHjvg8O9sVHe/Dx+DATIJr75t/e5Njulx83lApadpgE
         rF/hcpssmGLN7/D0jyh2AVei9etkbIOFbzgErCdOBifGWpGT1e4ksSxxkCdqfZfynccl
         Rk6DDihwsuRfk6PrJfmMqmJzv5/9u6svvVhjoNyBBHj6YWUkzhnSafcHQR8dGR7BJdTx
         mp5oROS4/ONiHnXtOqoYvzgnfPQV1N5+KVK7h2tlIBN5iuZdUaaj0AVpKdJLZjVWoiiV
         ra3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713093552; x=1713698352;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDw5///UdaO8PiFLqPE2TQy1/lRpHjUGLgxbegZkEV4=;
        b=oczduvxj7lg8QmIzZ2GWnVPo+REeAJtpA48Chps4B864Uq9+0meJz+g1ep4BOZiV+A
         kH1L4u/Pr8piPDZ/afvdtvlp4hE0gXij5/rFQBK9teJ7cXh/DO1ZFXYbCcOSNOSPMSQp
         m0YcxeKuGmUn2awgGMVjd2zRPrUa8hXwyJo0CjC6+m3ApL10ALqm/JmRJSbspKwoeWey
         BYv+LsVyhPz8AI11TV6HvTVl7gZ+59K4WbPSLJUVuJSB7qjdtFV1YaOuRV+NZr/4QCAo
         UtKKOrKV3RP7/yJKCdlbdrXkLqOkZTDem4bpY9XYsELOXLFsn2lRs5Z/RR7/S0ASIFdD
         VktA==
X-Gm-Message-State: AOJu0Yzndlr8HAfuKJUthlgzkGyfrVWJftfM6DbdJNyq7+5SuWdzfeSp
	QmowtjUwd5lbNPV5CaWnm9KR3kqsM/HhGiO0Nj0ev2zvBuagOi0cUq8TdenNCi1zdSLLwlFUwwa
	fwug=
X-Google-Smtp-Source: AGHT+IG731Rl0NfaAhz4zFGYMY7B9VMpGCFjSSZkx8+XWs6+CTcHfuC0aHKIQeCLjCjAtyur3LLE+g==
X-Received: by 2002:ae9:e40e:0:b0:78a:34a0:6354 with SMTP id q14-20020ae9e40e000000b0078a34a06354mr7813552qkc.42.1713093552268;
        Sun, 14 Apr 2024 04:19:12 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id vv10-20020a05620a562a00b0078d6c4b0b3bsm4948846qkn.26.2024.04.14.04.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 04:19:11 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id B074E1068DB; Sun, 14 Apr 2024 01:19:10 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 14 Apr 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 14 Apr 2024 01:19:10 -1000
Message-Id: <20240414111910.B074E1068DB@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 11:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198206

Branch: master

New this week: 0 CVEs

Removed this week: 21 CVEs
CVE-2014-4859 (CVSS3: 6.8 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-4859 *
CVE-2014-4860 (CVSS3: 6.8 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-4860 *
CVE-2019-14553 (CVSS3: 4.9 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14553 *
CVE-2019-14559 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14559 *
CVE-2019-14562 (CVSS3: 5.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14562 *
CVE-2019-14563 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14563 *
CVE-2019-14575 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14575 *
CVE-2019-14586 (CVSS3: 8.0 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14586 *
CVE-2019-14587 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14587 *
CVE-2022-36763 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36763 *
CVE-2022-36764 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36764 *
CVE-2022-36765 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36765 *
CVE-2023-45229 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45229 *
CVE-2023-45230 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45230 *
CVE-2023-45231 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45231 *
CVE-2023-45232 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45232 *
CVE-2023-45233 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45233 *
CVE-2023-45234 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45234 *
CVE-2023-45235 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45235 *
CVE-2023-45236 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45236 *
CVE-2023-45237 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45237 *

Full list:  Found 37 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6270 *
CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6356 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6536 *
CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7042 *
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0841 *
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-21803 *
CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23307 *
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24857 *
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24858 *
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24861 *
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25739 *
CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25740 *

Summary of CVE counts by recipe:
  linux-yocto: 28
  busybox: 4
  cpio: 1
  gnupg:gnupg-native: 1
  nasm:nasm-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

