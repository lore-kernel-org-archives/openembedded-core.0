Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.4524.1591214864737157796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UFl1D3ZS;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id e1so3720991wrt.5
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dnbhYFm16DAIrHcJHcmmzK76vODNXwXtSVQDmF9oEkQ=;
        b=UFl1D3ZSl+O6L+oPDNb2uwGfijwKE8CE5ToJn6iZuGXjrfHCKY6u36OwRMVznxPiLZ
         Ccsbc0CwSjbOKef8GSyArbP7WUh+x7Bu7+agpBUK7cNsZBk6YQgMiqv607i4sxaOHEG6
         W5aGVy0TS8rt5Lb4rSd/mgCY08Iz0A0mKXLiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnbhYFm16DAIrHcJHcmmzK76vODNXwXtSVQDmF9oEkQ=;
        b=QifA6J7fxSXR2u6h59BGafErNSuzHQWpXqnDGneL2T3PSnwmdgvBFnShDXzJ47aDV0
         uj0wGDWdlKwH5sBIRNy+GvJSjf/1xn1POjLOCPU+XQ0lwS8MuDnOYHkYJdAi8+NqILu0
         bJ/fZ/96lprDKO7+UQ+lLoezD3A4FTB6r0nkdy7hF9qAs/Lh78VILoqpHGthnSMLgLRM
         wuZuPF/1XmG8m9UVIm9StIZqICqlnNx5V/AvZ+gS6Hq5Q21+baJjzPpEJbkaCNFYIyXx
         7rHEo8/oWkq3Mm93FGBm9Xr9clkLXjX+4bEA6AA67QX2mTMT0usFy0U5MNhy1wES3ryY
         KCxQ==
X-Gm-Message-State: AOAM5324FxyiodKOPn0JxMMciixHBUrqq1dPDqA2oHdsgiM+BGH6LbN1
	hIbB81+YskEf+WFWJ0WlFluBChP+OMno6g==
X-Google-Smtp-Source: ABdhPJxjrlk5ZuBT0N+GlHq9FM+dvRWJDhfllM2iItiBjfSqPSidt7y1BSn9BIObSebGLXhmQNhttQ==
X-Received: by 2002:a5d:6b83:: with SMTP id n3mr975137wrx.395.1591214863060;
        Wed, 03 Jun 2020 13:07:43 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id y19sm4186338wmi.6.2020.06.03.13.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 13:07:42 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 2/3] oe-selftest: Support verbose log output
Date: Wed,  3 Jun 2020 21:07:37 +0100
Message-Id: <20200603200738.23534-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603200738.23534-1-pbarker@konsulko.com>
References: <20200603200738.23534-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/lib/oeqa/core/context.py     | 2 ++
 meta/lib/oeqa/selftest/context.py | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 4705d608ac..7d3fa3b84a 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -156,6 +156,8 @@ class OETestContextExecutor(object):
         fh = logging.FileHandler(args.output_log)
         fh.setFormatter(formatter)
         logger.addHandler(fh)
+        if getattr(args, 'verbose', False):
+            logger.setLevel('DEBUG')
 
         return logger
 
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 17f2a0cf6b..7589ca3c1f 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -138,6 +138,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 help='Exclude all (unhidden) tests that match any of the specified tag(s). (exclude applies before select)')
 
         parser.add_argument('-B', '--newbuilddir', help='New build directory to use for tests.')
+        parser.add_argument('-v', '--verbose', action='store_true')
         parser.set_defaults(func=self.run)
 
     def _get_available_machines(self):
-- 
2.26.2

