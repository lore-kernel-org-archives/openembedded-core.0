Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.6864.1605614800670221624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 04:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id d9so20034523qke.8
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 04:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=Kv45m+ZnWT1s+JP3vYU1JL3L48mQbIVIB9tp0fr/Kzg=;
        b=rIcjNhZav820+5tsSOwvgmrqgvk1WbmAjNlvPxcuG94TZaCQ8i1y0e47KwTR8uJ+am
         DiPIgCEZIkAPjtdsggNmYUiY9eKwAsiCda9+23gP5g7v2Dhr2uDb4iN2EhP/OwSQCuQ3
         df0U68ElDstlDZCyjFYdJ6+plNFBjN7w+eqLgCYVIb6cwGlZ3Nu3o/6TH7Npa/SlZA95
         QNiE6SMuXM0Ix1i4rElJH1c0sVDTOH5rjoh/3+duB0npxNxYonzyV6M3WnDDVoeC0NAA
         tLTidkqJhQ7dPW7biNvA33dyXrWAErbDLwdCPlAmwhpnf12WingqrDCGqFllNPIZUh/H
         tAdQ==
X-Gm-Message-State: AOAM530X6Ne3ceX7sNAi1l0v3zHtgpxor2NFlHEev+rAtuM1HhrpdTP/
	DUSzS1uDrhHyXkCSPc5q1vPKVZZnY0B/JA==
X-Google-Smtp-Source: ABdhPJzJ8CHTaIENBPyfB8JbESZBcXmLcrtTiBJrK0KkSbV/IPAWCd5rH+x7GbqdgnNuz5ZLfoqxFA==
X-Received: by 2002:a37:c20b:: with SMTP id i11mr19011152qkm.52.1605614799377;
        Tue, 17 Nov 2020 04:06:39 -0800 (PST)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost (191-221-68-106.user3p.brasiltelecom.net.br. [191.221.68.106])
        by smtp.gmail.com with ESMTPSA id d140sm14126959qke.59.2020.11.17.04.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 04:06:38 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backports PATCH] python3: add ldconfig rdepends for python3-ctypes
Date: Tue, 17 Nov 2020 09:06:35 -0300
Message-Id: <20201117120635.1150516-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

The ctypes module needs to use "ldconfig -p" to find the
library path and it simply has below logic if no ldconfig
installed.
  except OSError:
      pass

Before the patch:
  >>> from ctypes.util import find_library
  >>> lib_path = find_library('archive')
  >>> print(lib_path)
  None

After the patch:
  >>> from ctypes.util import find_library
  >>> lib_path = find_library('archive')
  >>> print(lib_path)
  libarchive.so.13

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ddb96902a124a6e1f035f0fd868b0139989bc1bc)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/python/python3_3.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 169bc87988..758ed87546 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -345,6 +345,7 @@ FILES_${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS_libpython3_append_libc-glibc = " libgcc"
+RDEPENDS_${PN}-ctypes_append_libc-glibc = " ${MLPREFIX}ldconfig"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.29.2

