Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC512C63707
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9354.1672830355694061789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cpdQ9MBX;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j17so27210266wrr.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3MG0Z5Mu9eLz3k5XulhXMOQwdlQGKxHLTJa+9I0dTQ=;
        b=cpdQ9MBXm5aYWyVcnRijQEpqUV7/tQewzsp3tDUyKEwAHmbpvImKQykzpTmCR5W00f
         O+JZ5UU9LAdgpnsARgGt6pinAZfBfKP654SNQaKxafpB7nSwCrUQGYx6ETuMf6ayFz9W
         5IdxWhTWSZAamHqb7mqkJE5WYljdN86PEWJ8fWphmWUD02n4nQLsvp3jW9RPuNWwvwJU
         pvQGbJmaPM7DNaR0fjb+XlNuN8Hjxe/TEDAYFmt3OfAcbHq+dzA5jBozr7QgjGSy5mQv
         aXqc63tShK+KmqgYxzEo3ksZdegCp21p4i3SmjEhbLygC3EWbUI6Rd0TMMtNOEUVWpIH
         q6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3MG0Z5Mu9eLz3k5XulhXMOQwdlQGKxHLTJa+9I0dTQ=;
        b=VyE3CLNfsk2lvtRdMJ8M5UgHbKGI3ZzWEQ0iBnegy6RoSwvU3hnOEQM1CFdx4zkZSU
         RpJVnEH70NJX+FxV67UWOoF4a9rCuo7588C4ORWRHG1OlmaTLzJBvvUzNnBAtyMerZ41
         YVh0fARKnC2WiCIn0kLRlUUOIrLEBu0X6nTQG9Z+gJf5NxCQp0XFRET3HAYBTT4bEQZ/
         SXPUl39FiSB/GAQjhb0ecKDlEp/egd0UPhbwesWnOkKtMwCsvjCIbTZ65QgjNYzSMf9B
         ygaeLM49bHgru8vM6+pnsDkvupQ6RV86YGibR0sDv2q7DuGGG156KLHqYtG9+a7hinbj
         IrKw==
X-Gm-Message-State: AFqh2koIgAowsPyIq9quBzUXhZl0xvRpr65PGYexTN7oSKRlw/6nPnaF
	Find1chaHy7jXaxp+CS2J6BLEf9FR+w=
X-Google-Smtp-Source: AMrXdXtyaVasqMpc7OuvPJ26YGOAGSaJIr8L3s332txKksuBi5ywNofLOtc/w/sI/zMz+bRYo0KNEA==
X-Received: by 2002:a5d:6808:0:b0:272:3a86:29c1 with SMTP id w8-20020a5d6808000000b002723a8629c1mr26840179wru.16.1672830363702;
        Wed, 04 Jan 2023 03:06:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/77] python3-pycryptodomex: upgrade 3.15.0 -> 3.16.0
Date: Wed,  4 Jan 2023 12:04:45 +0100
Message-Id: <20230104110548.2537259-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175399

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-pycryptodomex_3.15.0.bb => python3-pycryptodomex_3.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.15.0.bb => python3-pycryptodomex_3.16.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.16.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.16.0.bb
index e22ce30833..36ef772863 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.16.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "7341f1bb2dadb0d1a0047f34c3a58208a92423cdbd3244d998e4b28df5eac0ed"
+SRC_URI[sha256sum] = "e9ba9d8ed638733c9e95664470b71d624a6def149e2db6cc52c1aca5a6a2df1d"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.30.2


