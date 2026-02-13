Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997F7EF99E5
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 23:01:57 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1689.1771023716370866145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 15:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nkq9vlzA;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: colinmca242@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40ea36b56b7so1108168fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 15:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771023715; x=1771628515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDOtaQklFCKiyXICumIzWCXsGRv6KX90srPPx3wn0gw=;
        b=Nkq9vlzAhLDqX8AiB5S1fIKlWt1FsgaM5AGEzok1tOAnBz5GyWiQxj/XbjgFZLMoT9
         hqclMceCoaNKND+x0P+qtzLiRjnIeEhepMe8bmvZhZ9qAGAZFT+VvnkvlXNYGAWqpuFS
         WJlrAxYEb3fKdHFkeKDe6vOckzdpEE79AGCG0vXNGUMWkdjZpWaio1LoS9tp85dlRFR3
         Pb0kvi8s6Q/iESplWVFWEPxIszwpWlLLIpS9XFqR++6BUKGC6pYv8RU8C1KwIWbHZzEL
         XTSfFo9BQ6trDfFl/vPH7YVCfYEAeDrMi6/k2FgAn+v2BMNJj5UDRGPtJ1oqkW7OBsPq
         5D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023715; x=1771628515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uDOtaQklFCKiyXICumIzWCXsGRv6KX90srPPx3wn0gw=;
        b=R7L3Fo6/epnxzFwWqBkH8e6NnnUu7/Mb5+EIqaq9l1zTtOqaaxWt+fHUA9cadUSbnw
         zoFTGvFOG3GtLXu/cAg2Op6T9cIWhM/pcsI4OUVmLAD+nbZc2Jdv2cjoGRzHh2gNzLL/
         K75qPm8ImyEZMnbnML20WaZvYDyGqead3gDgjzPKTlVU1N9TmEsaCEwa/uszZtHZhBjh
         y6MUeQBK9aQg+a3ZsMIjA+EKZ+bN/jS6o7u41B6ehZECEV9o/CYwLCN2GysFnAYtDqmi
         b06ZEb0z7xuSui8T+GgS2FPHmoUGfUTeSSdePDd7BLR3AcZkPVTsGtMgjubWRtW/DICL
         OexA==
X-Gm-Message-State: AOJu0YyPPpkeguw611sNKjDQ9/9FC/UkDy8URP605qhFDXGeSV+oblyq
	vJuGiDVG43sgTxi7Fnc+u2l9ZO9xb8KChqDaIrbBJSdWH/vkYKooBgTVJ5BhcA==
X-Gm-Gg: AZuq6aLZtP54fbvdJBVXLDdm0wzI6FYADVZaktXOrElVD7d818dYGtgRcBD8l0TBGAX
	YLhxyo92sQGPMKsGhNqalVK1M7u+OVkMAz+v4wU9wezUI7GjlP1DvMwNQJun3Lqh/oSh5NJcZyJ
	DTk/Q7xu4fjuo8YZ78h2/S5yvlyWDCC7uTf7G/eAbIK6F3RNnD0vJkIsFte20FddbWh1bu5oIGH
	QzPj9PHyXG+K+mfgGfmwzMl8XCY4AG60c9ty8gVsOxW2P4q2NAI6ECfR0SaDacxwd4tHMyPvOcU
	m1e8+nA6YsB7bYN/UxxIernyFdL/ospD4SXev3eVvPycuhHgC7oXE5ZSkpq6VmbqzqB7YfRedyd
	N6X72hItZThuDFIprL87tGuJIS6FmxjDupYSfSUs9ebfPH+7t08dICHq/BmSPZEqvSu+96fgOL9
	2FZYgiSZKB5sUN8jPJnCU=
X-Received: by 2002:a05:6870:d415:b0:3fd:9f68:b8c4 with SMTP id 586e51a60fabf-40ef3e70599mr1904197fac.28.1771023714941;
        Fri, 13 Feb 2026 15:01:54 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf101db0sm8092157fac.12.2026.02.13.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:01:54 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH v2 1/4] python3: Backport TLS test fix
Date: Fri, 13 Feb 2026 17:01:27 -0600
Message-ID: <20260213230130.757732-2-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213230130.757732-1-colinmca242@gmail.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
 <20260213230130.757732-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 23:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231141

Backports fix for Python3 that allows TLS 1.2 to be the minimum version.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
v2 changes:
* Add this patch to fix python3 ptest build failures

 ...Allow-TLS-v1.2-to-be-minimum-version.patch | 39 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.2.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch b/meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch
new file mode 100644
index 0000000000..3b0e98bf51
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch
@@ -0,0 +1,39 @@
+From bcd6e2535cb0dbf72b677eb6bddb644cb035ed51 Mon Sep 17 00:00:00 2001
+From: Colin McAllister <colinmca242@gmail.com>
+Date: Fri, 13 Feb 2026 11:17:53 -0600
+Subject: [PATCH 1/1] gh-144787: [tests] Allow TLS v1.2 to be minimum version
+ (GH-144790)
+
+Allow TLS v1.2 to be minimum version
+
+Updates test_min_max_version to allow TLS v1.2 to be minimum version if
+TLS 1.0 and 1.1 are disabled in OpenSSL.
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/f24009feeb78f605a3ee177d9e7cfb63d5890ee1]
+
+Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
+---
+ Lib/test/test_ssl.py | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index 6023c89bca..7e9ba735b3 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -1156,7 +1156,12 @@ def test_min_max_version(self):
+         ctx.maximum_version = ssl.TLSVersion.MINIMUM_SUPPORTED
+         self.assertIn(
+             ctx.maximum_version,
+-            {ssl.TLSVersion.TLSv1, ssl.TLSVersion.TLSv1_1, ssl.TLSVersion.SSLv3}
++            {
++                ssl.TLSVersion.TLSv1,
++                ssl.TLSVersion.TLSv1_1,
++                ssl.TLSVersion.TLSv1_2,
++                ssl.TLSVersion.SSLv3,
++            }
+         )
+ 
+         ctx.minimum_version = ssl.TLSVersion.MAXIMUM_SUPPORTED
+-- 
+2.49.1
+
diff --git a/meta/recipes-devtools/python/python3_3.14.2.bb b/meta/recipes-devtools/python/python3_3.14.2.bb
index 7481e70e13..6324151f4e 100644
--- a/meta/recipes-devtools/python/python3_3.14.2.bb
+++ b/meta/recipes-devtools/python/python3_3.14.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch \
 	   file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
+           file://0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-- 
2.53.0


