Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.5198.1614440103859997983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WYU2IeHY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id i9so9401494wml.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ImzNMz4TB+OBp7GMgwEg/GVLkVwmboHGEkVORwg6m4s=;
        b=WYU2IeHYeUEC1gH+IZsDKY9hDD+yjGwNYdYmi60aEEXQ2r1RnHV8OmFLic+3JLPV0G
         xDpls/+6HA7oiPRtFqqHzDCROQp5fK2v3vobKGwPjBtZNqOsYuJ7nsvmr3qhFVEi7DXZ
         efC2AGLcjfV4Jalmh5jfv3pRmSmiJ0UD/k8Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ImzNMz4TB+OBp7GMgwEg/GVLkVwmboHGEkVORwg6m4s=;
        b=m0jliLCnyuNiUe3WkFqpm3bYODyUjT5fQzzZR8H8qJVpfs8FzAjIj18YwdnHwu/vPH
         p5uNaOX33sSjQuzNwl087vVDNjHaaRezl6NcK1/SBkmoG7PykH3U7HgISkUolsCf6FMj
         pthP9HgTLOUyUh3F82DMuxwn9oX0bjW/x3HylPv8HCclBPxiw8+8/LlTt7WLmLx7rMbE
         02V4kC4FiLtguGo1/7sdpCBXO0f8S/YW1nnSs83Fgq2kw4E9xNiDhjdBBoXzArQo8tCy
         WePqpuUsaywWhJ5wE6eiEkqx+vFP6dRwjMXiBUTxGtJQbCOimxZQFKVUiLwbvMne45wm
         tVGg==
X-Gm-Message-State: AOAM531J5Axuh9uHg1g8ZtzjGn/9E1Xm7lkGX/Xs1AKT4kTg4zU1gtDc
	js7J286IkH0Ew9YMHVnCXzj9LdFaj61hnA==
X-Google-Smtp-Source: ABdhPJzt6may87RXJGf8yQ0W3a8mC68ZI3L2mgV642ICsih50s8j2N0gw7cm41vSP/yweVWjsYKbUw==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id g6mr7665598wmq.72.1614440102159;
        Sat, 27 Feb 2021 07:35:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:78c6:baba:ab09:bdce])
        by smtp.gmail.com with ESMTPSA id 18sm1955708wmj.21.2021.02.27.07.35.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 07:35:02 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] libid3tag: Fix reproducibility issue
Date: Sat, 27 Feb 2021 15:35:00 +0000
Message-Id: <20210227153500.3963357-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210227153500.3963357-1-richard.purdie@linuxfoundation.org>
References: <20210227153500.3963357-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure was swallowing our cflags meaning the resulting binaries were
not reproducible. Tweak configure not to do that and fix reproducibility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 .../libid3tag/libid3tag/cflags_filter.patch   | 21 +++++++++++++++++++
 .../libid3tag/libid3tag_0.15.1b.bb            |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index cb633f91177..63ffc2d4bd6 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -37,7 +37,6 @@ exclude_packages = [
 	'go-',
 	'gstreamer1.0-python',
 	'libaprutil',
-	'libid3tag',
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
new file mode 100644
index 00000000000..0d1d0dc381c
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
@@ -0,0 +1,21 @@
+configure contains CFLAGS filtering code which was removing our prefix-map
+flags. We need those to generate reproducible binaries. Allow them through.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: libid3tag-0.15.1b/configure.ac
+===================================================================
+--- libid3tag-0.15.1b.orig/configure.ac
++++ libid3tag-0.15.1b/configure.ac
+@@ -99,6 +99,10 @@ do
+ 	-mno-cygwin)
+ 	    shift
+ 	    ;;
++	-fmacro-prefix-map*|-fdebug-prefix-map*)
++	    CFLAGS="$CFLAGS $1"
++	    shift
++	    ;;
+ 	-m*)
+ 	    arch="$arch $1"
+ 	    shift
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 0312a610c07..80581765ac2 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
            file://0001-Fix-gperf-3.1-incompatibility.patch \
            file://10_utf16.patch \
            file://unknown-encoding.patch \
+           file://cflags_filter.patch \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
-- 
2.27.0

