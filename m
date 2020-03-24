Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.1381.1585085850585709697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 14:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k4IDZlh0;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id a25so473149wrd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSsW0DhBAvRr1EWcikM+WFdW5JUbW0UaU1rcAId212A=;
        b=k4IDZlh0qVazWqsyj4bS6xzJzpq+Re10izbg8f/oykO6JWFpaqg+ocGfQ++MLWgwHp
         TmDkRg52rrJIvToJQLV+4X2ZGW9wdUKrU+ppHlM+h5bxP604/Rojs5u3lFu/XcjYGG9o
         lS3o0IcIYt88QZ4lwFcNtl+q/8h7xR+rX2p8RVQx6aRP6mc4N2+mOaJExDGTJomckM6c
         97qotqmAfpBsr2JQljzQotKXY9ZzCVD35vPQBXAvcT787vV6Q26XedLpDBuCVdvmtUIv
         hNiQsx4M/LAz72YxvTiMqsIZcO9HOskP3sFp+xm0zqBYZc2VVucR9+B2IY3y+NdpEWHU
         UJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSsW0DhBAvRr1EWcikM+WFdW5JUbW0UaU1rcAId212A=;
        b=cze11kuNFXejP+VH1ijtUS0GVsDR+GblqNIerC/gl9WK/Zn7+8vE3Wb/AdvpjsBAE0
         85+PQzmJ+g0Ti6Q7GprxqLEzmk5fGLT00dtkqEkFfZBp1rrsH+FHh9nhbRe8DYCHpYFj
         ttWsrWEnN9uzrvNzykBU7ulCzNnqxcvJl0A7VcwghUEtnPzyH+ixEUkiSt46c0qoOTis
         8c6wsosIVWPVZ8CzmQJMJJqulbD3xliWspSQSmcmlKNXw+lQ7rVl7djJ+doY8YUc4eII
         yR2xYAMDkJx83XFnnlxomabwrJJK6XAdImPYacBQmbgF2/Nq+1Fpq5dmkm9OID1w7BU7
         4cSA==
X-Gm-Message-State: ANhLgQ0Dj0kNfjOuXJpuchE2wuOcTU++3jPLUUwKNyazv2l+LB6prG6q
	bbCJVoAlr+iFW3yeXTGTwSOnRPNxghI=
X-Google-Smtp-Source: ADFU+vsXwowzE0/e5FXhvXqm8c18EMxM6aB7ZcvgDmGHfcfckMWjxSbIwjkjbiQzd1S9ftTMwugcUA==
X-Received: by 2002:adf:c651:: with SMTP id u17mr40879359wrg.40.1585085848508;
        Tue, 24 Mar 2020 14:37:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.93.197])
        by smtp.gmail.com with ESMTPSA id z188sm6167782wme.46.2020.03.24.14.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:37:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] quilt: do not test patch-wrapper as it is not enabled
Date: Tue, 24 Mar 2020 22:36:46 +0100
Message-Id: <20200324213647.20829-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream only enables the test if --with-patch-wrapper
was supplied to ./configure, and so should we.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index d6d06c049c..d2db079e0b 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -71,6 +71,9 @@ do_install_ptest() {
 	tar -c --exclude=mail.test --exclude=delete.test test/ | ( cd ${D}${PTEST_PATH} && tar -xf - && chmod 777 test)
 	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
 	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
+
+	# This is specifically excluded when --with-patch-wrapper is absent during ./configure
+	rm ${D}${PTEST_PATH}/test/patch-wrapper.test
 }
 
 PACKAGES += "guards guards-doc"
-- 
2.25.1

