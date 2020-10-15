Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.6151.1602740210299608303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 22:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=syn7LzZm;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id l18so1190625pgg.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 22:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WvrvnWkTXVJaSonU/KwOP52Q0U/rTuP7rNAo90Wjwo=;
        b=syn7LzZmnWXyMNG4yK8nlymD4h6F1PKBGPDKgcm3v6pAnBdi4sIUIwBRVabDExIq2Q
         MfeFD9CXAiEgeIu6ayQwYkaqJwZdIBqMd3ZsEpYJx0yAKhUi+qchPhXrHVgFjJ/Mn6gC
         umlSNepMyhy1wRcztjuGPS8KV10JIjEWTGtuylALjOOMC7rb2SVphkv/dsCO/9cBBfih
         jZ71aaE7loTwAU3CB+xAxEMQpuVrHv1L0TTl9c3TC1ZJ//RgAZ5+uQyZt8ESad9Pp9Uf
         z01PxbhTV8wL3NRkzF28rPVBnN/Kfp7/mX5ZVMG8vXb2giOf0Tku6mI9r6rSNvUCnCXB
         QwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WvrvnWkTXVJaSonU/KwOP52Q0U/rTuP7rNAo90Wjwo=;
        b=dGXa4SbnmlejIJ/tAmT66uh9FrODcrtBVIbToMKGIuPMJBcQKK8RZ049877moQhxM0
         k/Yu+/By3iFJcASDMHHyFUfcQZo6+5FSD0PJZPT5T60JQi9YJssxCYfKGeRK0RGdmd3+
         MYlpkI3I/sYKi3wdZZnQ11AqnGa3qkWI5sjwd1fPvWGwHADzZQXEGmmDwaFQ+rMjBbC4
         MetkPDh9kuOvZKX8t/mVDr4uxrojq4DjI90aYbeLjw+AseDGIEtUm5I21qD45oPirZTY
         HefF6WwU+8DcN1cyvKo8uo4uK76PIh4D4CwFNgAqYnWbohikgUIM5L04KAS1M9vIgTre
         wmNw==
X-Gm-Message-State: AOAM533UyDiAX6Q1TJrUzxsG88RCREU2HnihiZZvqa9L4nrFMKDKjGHF
	XxJrRiQQhgFMLB2ONX4P479Yj1Zronm4eA==
X-Google-Smtp-Source: ABdhPJxhSdJkfijM35fpWTX57GaFMw7BcQBdrkUhn15pvurqARJI6rUvWu9JLstqx3lLzU5orNmLng==
X-Received: by 2002:a62:ed11:0:b029:155:4bd9:6ade with SMTP id u17-20020a62ed110000b02901554bd96ademr2614393pfh.6.1602740209275;
        Wed, 14 Oct 2020 22:36:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id n12sm1540720pjt.16.2020.10.14.22.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 22:36:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] autotools.bbclass: Order CONFIG_SHELL before CACHED_CONFIGUREVARS
Date: Wed, 14 Oct 2020 22:36:45 -0700
Message-Id: <20201015053645.654085-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps in overriding CACHED_CONFIGUREVARS with wrappers to run
configure under e.g. for static analysers like scan-build from clang,
while it should not change the functionality in normal case.

Since CONFIG_SHELL was introduced, it silently broke this use case and
failed running static analyser on autotool based recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 1f3c771c69..70804b82b4 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -90,7 +90,7 @@ oe_runconf () {
 	cfgscript=`python3 -c "import os; print(os.path.relpath(os.path.dirname('${CONFIGURE_SCRIPT}'), '.'))"`/$cfgscript_name
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		if ! ${CACHED_CONFIGUREVARS} CONFIG_SHELL=/bin/bash $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
+		if ! CONFIG_SHELL=/bin/bash ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
 			bbnote "The following config.log files may provide further information."
 			bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
 			bbfatal_log "configure failed"
-- 
2.28.0

