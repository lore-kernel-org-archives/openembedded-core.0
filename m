Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F441C0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 10:31:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.13071.1737455477883009572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 02:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tx4uwDwi;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so26650435e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737455476; x=1738060276; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZpclnJCyqv/rNhTIIlT4KB1Fr/lCB6WdTG/ak/fk5A=;
        b=Tx4uwDwibYcei3XEX9V4man29+0mUHodMms3AcW5p7bCxP4aUjBMgi5mxzK6ngISWW
         FVrI50an3FYNJjp9n65zo/TNYDon+EzgzH00Dszaa9KRDVl3cpAzJ0paNanL5yAvN82K
         qP73UfzaJSUUQKqp/lS0D96PZBTvEE9TtSPTrJnF9O0eUdvKH2aunDoG+G7+9Z8AYNSB
         yo57JKtxXE8fOucSpzx0Y6fokwBQIa5FFIF7H00crOyRImGLMlGEiGgf5XRQz1tHhHlo
         v6VGKDdU8I5UJ4C+woDsIjO9pyqtZwt8AYLUDbYhajYZOn4w5R3v6tw07ccJgLmoJbS2
         Buag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455476; x=1738060276;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZpclnJCyqv/rNhTIIlT4KB1Fr/lCB6WdTG/ak/fk5A=;
        b=i3VkeycoB2pxC2CdpNXoSUOCuaAoDl47CnbjuX3JVPgGN308nKu31hC+idul4kLiZm
         BiHi/1qX88EmgXpsnl6/BXMOezE2b1YCXrt2E7ax4OhtWT6rPfyerZzcdhPDCdNLYVXf
         rJ/eQNM1jgkNMlolBnDXwyzuRhZ05zT+07fxIlllCx0IJAPs/yTsBgBUqW7rtStJ1LgV
         A+FEgaBPn/9OS+LN5/XudKunboKlb3NnvJ8mS6CsAis+rprOs+kHKi2+LG82bGLJ3o3x
         xv5F/k8w6kASTKvx67sboTzyMZxxpcL7i+le3hd48UjTRRryMLuKuyXblyxzw8bnIlSo
         64iA==
X-Gm-Message-State: AOJu0YzT7cM5sbHWWgCVF/7XVn2xwwHARGNCpwBGswohiKj0cs78VDZ9
	VW2tq1y3AoKrLiBYR8MVDp5M0u5ZIi3R3+vUdYBftRlFyMW9Grrjnm2JEg==
X-Gm-Gg: ASbGncteKQM7gdGoaEPx9JWiDt7jGV7pCObTzv8TqX3H/a2uMTY1nU/mU4dIYSTIDzi
	fj+1oVg5aTRjtEU6ngSM/wthR49TDS0saKxeXIlxAsYQ3UZfOpSOmPY9UZEfQE0C3iuZlEuh6BT
	YF01QX05qI0CICMHIMyIRfVUHwT3zJf466nY3uDBkgiqnyqavRfNrIJz2PQ9fsyQidOx3DGZKD9
	naW//FQTvfirBvDy2HhtPNBa4V5oXKkVttwpeLltJECLoxyGCRvwCa5AxOpi5c8mHxsK7IZl68Z
	2waRn9vvyGNkJ2NKDhgfADn0yco=
X-Google-Smtp-Source: AGHT+IG8ktmFlO+CEBLGcbfyRUTnMwznDxA+hPIoW9CZOSNDoqirROgYYOMHiJhlt6g76S6YZpBV8w==
X-Received: by 2002:a7b:cd0a:0:b0:438:a1f5:3e38 with SMTP id 5b1f17b1804b1-438a1f53e8fmr119600685e9.30.1737455475362;
        Tue, 21 Jan 2025 02:31:15 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74995f6sm236896515e9.1.2025.01.21.02.31.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 02:31:15 -0800 (PST)
Message-ID: <264405d9-4f89-4102-acf2-320e73235a59@gmail.com>
Date: Tue, 21 Jan 2025 11:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: npm based packages omit dependencies since Yocto 5.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210084

Hi,

I have a minimalistic recipe for pm2 (https://www.npmjs.com/package/pm2):
==================================
node-pm2_5.3.1.bb
==================================
SUMMARY = "Production process manager for Node.JS applications with a built-in load balancer."
HOMEPAGE = "http://pm2.keymetrics.io/"
LICENSE = "AGPL-3.0-or-later"
LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=9f9fa01c099265d62f73735e404ff8bb"

SRC_URI = " \
     npm://registry.npmjs.org/;package=pm2;version=${PV} \
     npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
     "

S = "${UNPACKDIR}/npm"

inherit npm

do_install:append () {
         rm -rf ${D}${libdir}/node_modules/pm2/lib/templates/init-scripts/openrc.tpl
}

RDEPENDS:${PN} = "bash"
==================================

Previously this recipe has built and worked correctly under
Yocto 4.3 and 5.0, as in the package included its own internal
dependencies in /usr/lib/node_modules/pm2/node_modules.
Yocto 4.3 ships nodejs 20.8.1, Yocto 5.0 ships nodejs 20.12.2.

With Yocto 5.1 (node 20.18.0) and master (22.12.0), the package
only has the pm2 module contents in /usr/lib/node_modules/pm2
but no dependencies.

It seems that at some point, nodejs 20.x LTS upgraded npm
to a version with a breaking change which now flattens the
dependencies into a single level in /usr/lib/node_modules
from the previously accustomed dependency tree in
/usr/lib/node_modules/pm2/node_modules.

Is there an incantation of EXTRA_OENPM or the npm:// SRC_URI
that would allow either to unflatten the dependency tree, or
include the dependencies as well as the main node module?

Thanks in advance,
Zoltán Böszörményi


