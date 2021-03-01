Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.5896.1614557849943652784
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 16:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R/8M+Xev;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id b18so7786347wrn.6
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 16:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=J55LiHdlK9ugVAo5lNQVYfZPejuIMH5VomjMMFoLhV8=;
        b=R/8M+XevEoO/iptCzMkeqBIQdXFHEhQIzdU39575Gbc94m3r7aOgp9Ke/iTunmeTBs
         xLTL642Lj1wQkjJGLMGUGzebvKRFnJ0WotwUONVAYvrpoIIumqUKh4YDAOSSRmqcuE14
         6zG/wE2tI13u5+3ahaN+7QAzvmDdFrHRhJwt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J55LiHdlK9ugVAo5lNQVYfZPejuIMH5VomjMMFoLhV8=;
        b=Hvv5Cj+HJ8Q4lHVpn8ZLqVGB2uql6RdZ3T3ilSeDNqDTWadieRbxhZipbCqcMm6ccF
         TYwW8FdglJ6Y9WdDVa+IkCkI9cPLQQ+f6sTCpW9AdQjlFQ0oklL/EXSSdYpYOStx5hO4
         ALtDAdxiIoZa9xh21FnldQEmcleLhTdHQKDCbu2KHLjcmOK3mDm0ER9NtjRXdl0k7uzK
         cXhm07cYiEkXayjaYGbykpv91M5aMJeJA0ZMmvsFpsvvAny62XkbCbMf3MKJPdyUYUJ0
         bwHfPGMOOV3oxDSQj3XtJWS1n13he5Lnn/BDG2I0PLIQ6InQVRaai3xOmE0OClL1Me8H
         A31A==
X-Gm-Message-State: AOAM530hmXWPBzF5GthZxo3qRcqTggy63SuwbJbopUhXjIbgA2Z1GnCq
	t9nK05ZFR3Rly1tgBfxidqVdULYt9qBlrw==
X-Google-Smtp-Source: ABdhPJzS4XWfUPpisQrY8sBpfhjBTvXK1/kEvzTeTHGz9xZ7lXvakwMYTxP5kyMfPu39XvyJjvyGXg==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr13855223wrt.80.1614557848335;
        Sun, 28 Feb 2021 16:17:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id c11sm22653836wrs.28.2021.02.28.16.17.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 16:17:28 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] gstreamer1.0-python: Set internal python library path correcty
Date: Mon,  1 Mar 2021 00:17:26 +0000
Message-Id: <20210301001727.2163322-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301001727.2163322-1-richard.purdie@linuxfoundation.org>
References: <20210301001727.2163322-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The library hardcodes paths to the python library internally and currently
these are build paths. Fix this to use the correct target path and
fix reproducibility in the process.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py                    | 1 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 1fb2806f2a8..a15601e5e5d 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -35,7 +35,6 @@ exclude_packages = [
 	'go-runtime',
 	'go_',
 	'go-',
-	'gstreamer1.0-python',
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
index 897d2467937..de78fe84452 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
@@ -15,6 +15,8 @@ PNREAL = "gst-python"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
+EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
+
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
-- 
2.27.0

