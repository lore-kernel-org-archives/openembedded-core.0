Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C47F3C9BE
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:35:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24617.1771950903941233562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XDQAiJeU;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4837907f535so51388585e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950902; x=1772555702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ0gE4DgGz93zrnwdDTSA+aGN8XvXZ2X7vc0PHwCIwU=;
        b=XDQAiJeUkjYG0DsgRNnUSIgdj5+yc8Cmg4jt6OVKGDlTf2+x63pLywV+cZAqrJh2xn
         XjAKIYLPLCZbWAT5j18DtJ2tXjxOAMP5Qny27G1J8Woqz0fanjopVkc9wbFQwqvVRkFJ
         lNi8oMPMlRCUYXtdsJ4GzeY3goi9SJNSc3jLFQcdMPmUk9KK+871UYQvfjj3OeLpYLwm
         iWi5kruilp9QJ+U4KRUb5xyH3kAGhJXyuXsb7bjr2npz5O+hh0vbgi4mds1aBZRPxtoA
         Y5N5KBKMTxduE0zm3viO3l2CICArSeSjn6ItuePVYrGAS5bZbjGQYfqKI6ni2EsZr1Zv
         +uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950902; x=1772555702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ0gE4DgGz93zrnwdDTSA+aGN8XvXZ2X7vc0PHwCIwU=;
        b=vDYXX2O+s5r5Si9P1q/RbD0XqVru4k/5dJiI8uc7Cfzm+9H8OeigrNVtUsI3yvwI0o
         NEhRoJcw99ZuZ8isVeCvCsLJNbo8nsJ2KeO2B+CAMG5Pqv20YWhhRe7dbEnMi5EGML1H
         OP3RhpE6SgkjbgaKfJMrfF9s4Lx4FNj6u7j8BgEEaQrYY0NVF84gnEQo6j9fWcoQOh9+
         2vnTW/q3Cal6sptfaOB/413Ui5l3oFN+xGwJ+TnIKYfQXXAyhasffT95ptcMhtkSjIbL
         UtaW1HUyr0GodpQsWS0qbga4f2dEdARKT9BGNgZ/twq6lWkMWkJ3kgXLO2Mfymn/IcCy
         mVGg==
X-Gm-Message-State: AOJu0YyiSw9rdFyzq+Y3j5k/lPHr4cFVifqKpBTdIdP+Tp0LWooqrNhs
	4q8hoJW5dUkt1YMGVbALcn8JwUZArZ7i7v8QWs9XZd8V/lgt35S6O9Hg7+/LUQVr
X-Gm-Gg: AZuq6aJGvGjYEk69Oq2VoeU1NwY8v+N6Bh8ygf6GRMftW5/FhaLjDkACQ0aslq6uUFn
	mDkrBbhw2h8E/jmL3CbiKmV4NkzZ5kMu2GOdC2ZjwpWSe7Suob9w44StimqioA9Rjej93fFGb3U
	lPh2ukd3Sksz8q+3btmc+pFFbxejhAedVS4g0nVc8iIyiIR07MTTURpLaZlxUt7J+7gH7Ion+ij
	hXe6mHce98vaO6q5/PkAPmhDzhtNExXw6C8hwVnIkxENxA+oCe/PxNA2JduhhHHN7g5/GcIkyyo
	VCKexISNL3o2fW8DR8bHCi5RzxSsox73nnXLV+56X/WA+8LQEbwVPYyCFaqmOE+uq7PjvH86jl0
	HQ4QnCYSnEUbldlME1HOALOMotdaJhomw2N5tErZlRz20xj5Q1OhlsyUe+Fbi7aE/Az/Q59/SCh
	KOyWwtE0mmbb1e/wj1ERv6wJUcETdcua8TyCOjABM43JnpalpNIqmu5RAuaX8/L05c8rGmYqVgl
	YQSaxfq
X-Received: by 2002:a05:600c:6296:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-483a95c6774mr228917785e9.9.1771950901444;
        Tue, 24 Feb 2026 08:35:01 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b8791a0esm80830905e9.0.2026.02.24.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:35:00 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com,
	Stefano Tondo <stondo@gmail.com>
Subject: Re: [PATCH v2 00/18] spdx30: SBOM enrichment, lifecycle scope, and documentation
Date: Tue, 24 Feb 2026 17:34:45 +0100
Message-ID: <20260224163445.4001884-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231889

This series has been superseded by [PATCH v3 00/11] which addresses
Joshua Watt's feedback and fixes test failures reported on the
autobuilder. Please disregard v2.

Thanks,
Stefano

