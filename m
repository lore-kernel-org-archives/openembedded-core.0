Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.1257.1593029613471676852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 13:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZgdYK6CJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: matt.ranostay@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id l2so2238319wmf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QCbOOdzI9oxKqUAfkli1YT1wNLBxv//qyqZ4EOjHvUE=;
        b=ZgdYK6CJ6Ec9r6gc/+o4o8D1olAxuLQVV7T+1MKxdFLac+rHt5ZwIeO+G08a7QLTck
         aaQgWRka+lWj3gV5sqyslVLShoKG0nZKqn5YTN+0crdHiphKAPiHljQcL9ieNn1hLKdc
         83zWo5IL56g0R2zjyDlb7y6qTjy3s2Y7RMBjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QCbOOdzI9oxKqUAfkli1YT1wNLBxv//qyqZ4EOjHvUE=;
        b=NxTTxsyn0RyBwcXJ+OGrQSsOwz2nD9KgJNb8UVoYhNnHzKJDwKzzx+zAe6YLEdLezx
         m56EbWnEp+p90TTEn9sOFjEMZRlBMq96qGn/d51PM4KZrLzoptN+VdOsfrOTRYQ9ak/8
         Ab5mrjdFOBs3rJH1+DfaLM7lEyWCP5ulvfk91qiyaMMAqeyiOg4JCTpIbedZDP4oR+hX
         kEDrKJG46+TjIzNqpRYgMLY7gFjVOMoNrx8VBapjIXVLP8yAkTMgcw5FZFzoG84t8dze
         GotPfv0azVtWE/XjO/QbFuadNjVbKzTg+G3zBVssvrgHg8tL+PpRJj5HLroK5O4wLRrI
         1mWQ==
X-Gm-Message-State: AOAM531uqfTBnCUXvB1VQ4M/bqacVtxOty6JBN5/dhqDXj3Ei1oi2byR
	I1GObfWi6wUUSunzdCqBqRuj2yRKMO/9ZA==
X-Google-Smtp-Source: ABdhPJwpqyOJ8rejOJSW4h3IieJzzCJptBDg2oJEAQf9oD+ifH9TitLaa8JToLrbaYkTQmGsi7tx9Q==
X-Received: by 2002:a1c:b103:: with SMTP id a3mr8606835wmf.186.1593029611492;
        Wed, 24 Jun 2020 13:13:31 -0700 (PDT)
Return-Path: <matt.ranostay@konsulko.com>
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d9sm28200840wre.28.2020.06.24.13.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 13:13:30 -0700 (PDT)
From: "Matt Ranostay" <matt.ranostay@konsulko.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][zeus][PATCH 2/2] python3: un-break disabling the readline PACKAGECONFIG
Date: Wed, 24 Jun 2020 23:13:26 +0300
Message-Id: <20200624201326.1225-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200624201326.1225-1-matt.ranostay@konsulko.com>
References: <20200624201326.1225-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Previously the readline module would have been built regardless of
readline's presence in the sysroot, and the recipe would
fail at package_qa.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.7.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index be67c81..4d2578c 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -107,6 +107,7 @@ do_configure_prepend () {
     cat > ${B}/Modules/Setup.local << EOF
 *disabled*
 ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
+${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
 EOF
 }
 
-- 
2.20.1

