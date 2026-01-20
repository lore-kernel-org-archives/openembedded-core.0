Return-Path: <fred.w.bacon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB92CD29C4A
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:57:57 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9743.1768924673252002324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 07:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kC+G6SjG;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: fred.w.bacon@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c531473fdcso735563585a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768924672; x=1769529472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LN85BVCmKLizfcpptZiwCkBBsoNhVWmq/R0p36MRr8c=;
        b=kC+G6SjG853U3xE4aDApCGVu1J0VgRpiO0Qbl4+gGSCOb4Wi7JuEwaAv78B/tlwWfD
         +TSVuvUjjbLpbpoyt/Xf0q7x9sagfutvvBu4Zr6JurTEHwymBU/PqBlIKMDiiSyWNi1z
         eC077urAo2SWrmlBdYHkVt6ZDyQkI8tmjgZY6c6xexU//lYvZ9fL5kjjfN0WnUyv7evk
         0+juW2sSd8NW47KXYomIpy9Bk4vQT/zkOeI3ut2cdxVMWqP7MnExFKzJIoTfabsPygxZ
         FIhRqqbdhppr8k5Qd9tNUs0vaSgcVxk5pqrB9IDGhUnBpz6t17JKwdXPcEnZrTQixbjN
         ckiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768924672; x=1769529472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN85BVCmKLizfcpptZiwCkBBsoNhVWmq/R0p36MRr8c=;
        b=RDdwXKzdJTxE8+f1aILgI4QeztzQ7dsC7r/PugyRP5bWZZSMOBseLYwJeSc+b5e4sx
         l65wSa+LP9yWSirNXYscL5vUCdS9DMHIiQp9iUWYvNUlr7JFOyRbIkNY09tcFGNa58DA
         sgl3147Csy5FwK1W1sY90bRkW6jrVrsSSO8WBYwIlHifOrEQCAxM7ZQFpojRHmyt0h+D
         XshKTgoZzAzRILJxuveDUDu6zyDJJvI34zoGcJ48/6QBhdvZRhPC2a+Roskk8KNXwbu1
         4MWJVXDaRrORWVpr9IKBa6V5TclWuYxmebRlbGZoytq2IrkaWeq82xitbuL/XMgAVK1m
         PY6g==
X-Gm-Message-State: AOJu0Yw0hnlknv5AWxqjvlQ0TMldCvgBNaR3C6ykrAOWY1YjsG7SCaAd
	ZOGGXj/njgXacB/wgDpO/N4hF5YkMhX5Au3ljhFHUbfUiqk0CYJ1F1U1GflamQ==
X-Gm-Gg: AY/fxX5CDcn8mx74vJHgCa1SknM8wZaLn3iIwNVWpFlddRkmGGxe2RUC4N2l9bg5l/e
	jiXQt0+WH05ofrQJaqmlhmw5J411/wwivf29Ap5MsQkkc0ChgjvSr9KWsukgzeGlnaE87/4jlNG
	+G+XRmxJN7U9+w2Okd2NY5Hcc/nMmFYq2GymzhsUIrlGFcHfh+1HkSdMJQdQv4ECUUatEwY6cn7
	spAi705mB12seYLWFk7oYpw6hqWZyqfAr7enrwPajG5KXaFvI6ecl5YyX6XwyJ2oWlX8JjyFOAE
	Yzu/imS4ZCZTEdN5dENQbVA2q89+EtzWcVSUJuUtR7uk34djS95yWIJlSyvTT4m3cIWekvZjIWz
	L0OhflhJ4Z38YY+LWGDbWWsTRhO164ZMd6pWC6nBvdlzpPF48kZK8H6JTNrVoctfVXWmc20AQwe
	LERecCndMFZ2BXlzei+FR1IwdzHLYPfup47A==
X-Received: by 2002:a05:620a:4413:b0:8c6:d34e:9c51 with SMTP id af79cd13be357-8c6d34e9d12mr17779385a.24.1768924671915;
        Tue, 20 Jan 2026 07:57:51 -0800 (PST)
Received: from rl80220dt-bacon.aerodyne.com ([208.211.193.106])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602f3sm1059103985a.40.2026.01.20.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:57:51 -0800 (PST)
From: fred.w.bacon@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Fred Bacon <fred.w.bacon@gmail.com>
Subject: [scarthgap][PATCH 0/1] lighttpd: fix trailing '/' on files in dirlisting
Date: Tue, 20 Jan 2026 10:57:47 -0500
Message-ID: <20260120155748.32482-1-fred.w.bacon@gmail.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 15:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229741

From: Fred Bacon <fred.w.bacon@gmail.com>

Backporting an upstream bug fix for lighttpd's mod_dirlisting. 

Fred Bacon (1):
  lighttpd: Fix trailing slash on files in mod_dirlisting

 .../lighttpd/0001-mod_dirlisting.patch        | 48 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.74.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch


