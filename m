Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.2645.1585247847489249354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 11:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=HKPPaQNH;
 spf=pass (domain: essensium.com, ip: 209.85.208.49, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-ed1-f49.google.com with SMTP id de14so8107154edb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CAy7TUKKGsSry02YBVWabKAulzelhbKUK3VWdPLBHB0=;
        b=HKPPaQNHsC9RkW3t30TqiOnN8btABbs7e8FHoYe4VtVghdFPUM/+IikNnyhpbDTPWA
         ygrgjsBM6BEaevly0phlntwv91R95p+fGYZ5GL6oshCOXEXX+Pls/mpV2B5flSmGftcu
         eOdlwL0R5gilMlxIk8oU3V2+XAxUDQMvcgTMeCleXih+AoXhqSOqS83669kyE0sUGcSe
         dtzJz7Xq8etYDzjH8X1073HBXUQQL9eMxVkzwOJrqwQpKOTuvmiEQfwceUXir5W4SayT
         nRGUmFD3vrBOIHuvTI/JAgX4D7j0MEsMPfI6vX07+4lbOudWd09AI3xyULeG6kw1ftJQ
         GY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CAy7TUKKGsSry02YBVWabKAulzelhbKUK3VWdPLBHB0=;
        b=mXF77pzMoDGr7H81DOePsnylYyWTj72M26pLAVs/Rvb26XLtC8TyMlpQXNjXvttRfs
         Z5FK44sOFsbW+gAkQ0/5TJBJyLvXrf88+AroL7b/8paQulNtYY9Ars85+e1+aUh/z/Fq
         nVQqTSHxQnwYG5Tfro5II2GqSTaxvAht9TEwsVQ6gouemunDT8XyHrgp5i1mnTGD6A0X
         n8cWdVyup9qGAgmS3YrMIu4r2Iz6nJFE4akOu8YNACpjS86u5xR8101lxsFl4Kf2fska
         SK1wOzYh6LGCiD1g3mAnNpCRiwQ3I6LpdVqwu9Bdy+PdiwamAXcatCQa9k0OJpOmoshL
         bnMg==
X-Gm-Message-State: ANhLgQ1dEPtSupQB7OqDtoOOvZQbP/BDHX7vsqwc7lhIjJx7HPVlPQJe
	FbvBbuH1ks0OD1hxo3SzuW7HffuxUwM66Q==
X-Google-Smtp-Source: ADFU+vvfwTgxVMYEHOkUQbTRZcJ9tDjztu5xnGbBVwzEPfPhx8G/kJCzNAgfAvb2HjIE8ZnKA6qAmw==
X-Received: by 2002:a17:906:484:: with SMTP id f4mr9215923eja.61.1585247845636;
        Thu, 26 Mar 2020 11:37:25 -0700 (PDT)
Return-Path: <charles-antoine.couret@essensium.com>
Received: from localhost.localdomain ([2a02:a03f:c930:4300:2b1a:3a25:ef77:ee9e])
        by smtp.googlemail.com with ESMTPSA id m4sm396309ejg.78.2020.03.26.11.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 11:37:24 -0700 (PDT)
From: charles-antoine.couret@mind.be
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH] utils: fix gcc 10 version detection
Date: Thu, 26 Mar 2020 19:37:16 +0100
Message-Id: <20200326183716.132772-1-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utils can not detect GCC 10 correctly due to wrong regex.
It generates this error "ERROR: Can't get compiler version from gcc  --version output"

The major version should be 1 or more digits instead of 1 only.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index aee4336482..a4cdce6ff0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -391,7 +391,7 @@ def host_gcc_version(d, taskcontextonly=False):
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
 
-    match = re.match(r".* (\d\.\d)\.\d.*", output.split('\n')[0])
+    match = re.match(r".* (\d+\.\d)\.\d.*", output.split('\n')[0])
     if not match:
         bb.fatal("Can't get compiler version from %s --version output" % compiler)
 
-- 
2.26.0

