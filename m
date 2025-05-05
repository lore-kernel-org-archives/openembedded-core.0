Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7702C3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:01:55 +0000 (UTC)
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
 by mx.groups.io with SMTP id smtpd.web11.46208.1746435709120565662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 02:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=Q0OwCkJo;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.188, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([178.143.45.236])
	by cmgsmtp with ESMTPSA
	id BrhqudDbH75drBrhquW5Rj; Mon, 05 May 2025 11:01:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1746435706; bh=YoNaLmbrP2KsKRDF1xNCoiQMvcIa16s/2NQFhG2WmJg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
	b=Q0OwCkJouxVb5o5cR+YyY0czKNhqXQIZRWMj+EmN16mgQRD8zL0diOrLHDC/Onk5V
	 Zb6CznmRCwBL41RIWSNoiwQnUZblJ7fpl/N9bcPBGkV6Rdz4jR0ha9GUsc4eJwvxLQ
	 ZgowLHcyHvgEdVGjvVRZvMBbll1XvZrcztSfUmo/XixjsEiYeKJ3BX2gb3Kh7CYFqK
	 B+F2xyzyUqWD4S5tgbap72cXPgC3Sv/YWZ2tJbcwsLqSGhC/+vqCYuEY/c/Fj9HYAW
	 nUrPf1UiUWskEUyOrISFj92ydXAxtMEVDTqIZrKJ6aaLZ34yxNvhvPzNNwiq+VX2lo
	 X/FQtncfVWBZw==
Message-ID: <293f7923-ff8f-452c-a05e-fdf1f48ab38c@skyrain.eu>
Date: Mon, 5 May 2025 11:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Andrej Valek <andrej.v@skyrain.eu>
Subject: [oe]linux-kernel-modules RDEPENDS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFSIAuu+oP2tO8bjVGyb/dOMDvYNZ6Up0uQlPHAjNzysQgzPozb3JyBvMdqhR2XZqI0wSnnM4/CmfQbAlmb6n6stXnnezoOFJ0egXOF5VlQ+sTJ1Oaos
 pp8EdXHjx6NAFl701D+aSfuRdMoX58R/eH5nTwIYK6t5YyKBCdVQQrMMFFl0PjOGoUv7irN4skufb0JlSO6aiVV6BJi0yx1NmvXwy7RiOC0JufqQeUEzLPMI
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 09:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215995

Dear community!

I have a question about runtime dependency to linux-kernel-module.

Lets assume I have a recipe "kernel-module-xxx" which is providing some 
headers (dev-package) and kernel-object (normal package). I have an 
application "my-app" which needs these headers for compilation and for 
runtime as well. How to properly add these dependencies and what is the 
proper way for it?

- Option1
PACKAGECONFIG ??= " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'my_feature', 'feature', 
'', d)} \
"
PACKAGECONFIG[feature] = "-DWITH_FEATURE=ON, -DDWITH_FEATURE=OFF, 
kernel-module-xxx, kernel-module-xxx"

- Option2
PACKAGECONFIG ??= " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'my_feature', 'feature', 
'', d)} \
"
PACKAGECONFIG[feature] = "-DWITH_FEATURE=ON, -DDWITH_FEATURE=OFF, 
kernel-module-xxx"
RRECOMMENDS:${PN} = "kernel-module-xxx" or via RDEPDENS?


My module is installed automatically via packagegroup anyway, so maybe I 
shouldn't touch the runtime deps in recipe anyway:

IMAGE_INSTALL += "packagegroup-my-base"
MACHINE_FEATURE_PACKAGES = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'my_feature', 
'packagegroup-myfeature-support', '', d)} \
"
RDEPENDS:packagegroup-my-base = " \
     ${MACHINE_FEATURE_PACKAGES} \
"

SUMMARY:packagegroup-myfeature-support= "My feature support"
RDEPENDS:packagegroup-myfeature-support= " \
     kernel-module-xxx \
"

Next question is about adding the this module into SDK. But I think it 
could be handled by adding my (application/kernel-module) recipe 
dev-package into TOOLCHAIN_TARGET_TASK, right?

Many thanks for support,
Andy

