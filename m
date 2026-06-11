Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB678CD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:05:36 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42193.1781172763912827984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 03:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZWiOzA/c;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: leoreis.costa@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-138405b7bc5so2083783c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781172763; x=1781777563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeVApfDBzHev3/zaWXjZZ6sIkIY5buqcG6jRz3+I9X0=;
        b=ZWiOzA/cRYmkkjqpcMAcLaaFja5vsqJnFOhYOg7U0WH0u2B/7BAj5m4+VjaLoryWXU
         M7D4Rz/NdIpY6zI8F2XCB8q8DS8XPsSrL2pD5TLCtrcftC0E6piPbJVt9Cw2DmeSsl1z
         91G7HKCr8pgFRpmg54p9iPG0HI3w1RLN3PND+UpVcNG5g+X/YTTvbdQjpmm60weTxYrq
         4Hh9OgM2uW5n/mel8d0CKCnLFd8PCWulOw2+tC20wSj/LlifyGmaDk6re/tzL33jtJRy
         jz8tXxn88gDddr0hMIrcncnvTehPt+JQ0vdqCfyt6C3QvO7z5IboSz62j2EDurrJyhY4
         iyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172763; x=1781777563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OeVApfDBzHev3/zaWXjZZ6sIkIY5buqcG6jRz3+I9X0=;
        b=ipXh+5PKZqhk+/JtwDKoMYaQb7oAopVK3JruezDo0Zbz/Kbpvk7MOxNE675ta4n0ok
         IUEO7NzSM80JTuuuJwdqKGMfmMHG405+Cc0z6GzKc8Ij0Z4kwj5BSzaK4a16Dio0nmoH
         3ARZOR4OLSe+dP7XZ4MusG1xKvL0tcStJfKxIUbypBqxxVib1he6eeqz15oUhWZHCsPx
         xYCB3Igb22zT9S4+b+4m2q6GNLCnAU0SH6BE3OdNO3qG3oK4eNUasQn1OsKhOckLq0SG
         9/xAqUhrN2mvdYZGywfh+ZSpO0jqk6lSnFTtAV7d6AdXoCZhH5voQWiINtPi0uqX5OpN
         tA6A==
X-Forwarded-Encrypted: i=1; AFNElJ8smmMoHpOKL6wqbe7jDySecZBOs9eEBiqWXDUshBi9V6JSQojX7cn//ahKVrr/SrJEBzgSvtjVR2oc+zZmQrJAOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxbzC4ao4VLLViE/4dbmKwKLoBPe2Q1n5XSJ9edUq0VYjkpLeit
	mnR0hCmNl1fcaklXzS7CUzdK1zJVX1WsgkSASJxzDwyl5XE+DYh696Py
X-Gm-Gg: Acq92OHo031W3WcREagfxLFX/QjKK86WCO6mI/G4f8nu4bis/A5fhbnSlaV8MHWXtef
	KnkngPcRv5Vh/ftCQtvzkaWrutk8r6PajLXLsIlsh1mYcG/51dj5Oy0Ad9YBLbDYZJdftqLdkQ5
	3UKqlrGIQ1ln9HAqwNWBIPC02mNZuKDm0SCUje8EzFxhVxGlNSXgIN4uv7rAw8SoGZQuC3UES8d
	3POlMUU6olGwkl1kB2go0b8bXtnlH/hi7JKiIVBp6d9fqjlZ3r0A7DFy8fRWSJf4+Msko+muMO2
	LvNubF6BxUc5yk2VSeXJidSjNf/7918hQJx1lJRTx3TpvXplAotsPHOzl06qHaRjeNepkfeUx5X
	GiUgAlm3lslib9KbIRGUKFLRctBFZztsDsYgJBdqdpLkx93KaltS61Rb5Wt3A5652u1/0Q5WcV7
	7kPUL514wGUomSYAL6oYqKjLl/DN9xgfFJV6h0SvvF4+72uEzqKncWtnoC6bzggacpEKCPcZVs9
	vZLG53URhNEjP6T4besXWVhijja
X-Received: by 2002:a05:7022:403:b0:138:364e:3213 with SMTP id a92af1059eb24-1384215bd40mr1512523c88.14.1781172763104;
        Thu, 11 Jun 2026 03:12:43 -0700 (PDT)
Received: from leonardoc-nb ([177.62.232.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384302548asm1196972c88.9.2026.06.11.03.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:12:42 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: jpewhacker@gmail.com
Cc: leonardo.costa@toradex.com,
	leoreis.costa@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] [RFC] Bootloader components missing from image SBOM
Date: Thu, 11 Jun 2026 07:11:17 -0300
Message-ID: <20260611101230.93013-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJdd5GZK9YB2CQssL0XZfApZFKtqd7vj5hDx8QgdOELWPBXGKw@mail.gmail.com>
References: <CAJdd5GZK9YB2CQssL0XZfApZFKtqd7vj5hDx8QgdOELWPBXGKw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238449

Hi Joshua,

> LGTM. I will pull this onto my local branch since it depends on my
changes; would you be OK if I squashed it into my change that adds the
task, or would you prefer it be a separate commit?

Yes, it's OK if you squash it, and thanks for looking into this!

Leonardo

