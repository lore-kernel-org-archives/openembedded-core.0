Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.3263.1592856154007324641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 13:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ILW6NaMt;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id s10so8735352pgm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 13:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pUiuH0ZNa7kWFbHJSFG2LjNo45hlA+ho8rJol+gZx6c=;
        b=ILW6NaMt7xlUf19UX4cJfSrgu/H7Nqomv3v72uZ2PREFJOhZGKVye7/KcmI7LXoaN/
         4yiKnH4AIfoMaG/fHLxhgp4KJdEIpdS5C+qV2MPLrO/OmWsGox74wsrh1ITmBc98Nu68
         8rJERhzh7XanmawBg/OsYnfy4BeqnGu5Iv+SR2q2h73zcPMrgyjgMK/rgoFcA0cJ/6eP
         hJKsBjE1IxL+vAaiRdfFdg0g9FN9AkdHzwwCMnpTmpi+u1nx8G075dYlRS9ZSfqMMf1y
         vpzBBkMuzb1CdVnK6R7Vd49Ym2V/qBTsex0gNz5DR+GS4/tAnd+fA1iIWSYRiFNaHIkn
         PHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pUiuH0ZNa7kWFbHJSFG2LjNo45hlA+ho8rJol+gZx6c=;
        b=lIMENRMdcrDsOqeEmYjr5I3NjD572x+5RsBzmsmnzoAaz/1eQ6z3RtP1Kg0isBGxRd
         EVrEqncc0l0cm9Q41O2jsDXyQITh9mAIQEiPz1rG5KekjpW5rMNIW4y1W7Ly+vhWtJl2
         WrOfnOL55HqiFCygpRKwBR/S2sOGB1/llKMV71SWnkLAX3IvuPe+1JTaRIuwDyJJWFER
         40rsvC8qFFdtLVDHOLZlgZfEoJXDAeSeeMwd28PHJ7UKkwcV91cmb+DGZLJEABa4WbSQ
         6oDW/CX9mKqh7qBH4WgmknXIlysUjFkIviYiUnvO0nA0sOGsKeO332evsOrZbsqVXc54
         wY2w==
X-Gm-Message-State: AOAM532RW4U1OFGA05xDqlz/JyNSCMgJY3qfH5qaP15nnpChhMSn5mxI
	GFqIylnGj/cjQa4IfslZoedfLjFczVA=
X-Google-Smtp-Source: ABdhPJwVCFhieqZ3Dm7N10zF+oL3kx2tDDtBk77zeIGdSUQJtTCaZm3dAnmSncWgllFUdRmMzyysVw==
X-Received: by 2002:a65:5b05:: with SMTP id y5mr995911pgq.90.1592856153223;
        Mon, 22 Jun 2020 13:02:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id 71sm15007937pfb.20.2020.06.22.13.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 13:02:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/4] go-mod.bbclass: Add class for `go mod` support
Date: Mon, 22 Jun 2020 13:02:27 -0700
Message-Id: <20200622200230.54899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

When using Go Modules, the the current working directory MUST be at or
below the location of the 'go.mod' file when the go tool is used, and
there is no way to tell it to look elsewhere.  It will automatically
look upwards for the file, but not downwards.

To support this use case, we provide the `GO_WORKDIR` variable, which
defaults to `GO_IMPORT` but allows for easy override.

[YOCTO #13883]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/go-mod.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/classes/go-mod.bbclass

diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
new file mode 100644
index 0000000000..5871d02506
--- /dev/null
+++ b/meta/classes/go-mod.bbclass
@@ -0,0 +1,20 @@
+# Handle Go Modules support
+#
+# When using Go Modules, the the current working directory MUST be at or below
+# the location of the 'go.mod' file when the go tool is used, and there is no
+# way to tell it to look elsewhere.  It will automatically look upwards for the
+# file, but not downwards.
+#
+# To support this use case, we provide the `GO_WORKDIR` variable, which defaults
+# to `GO_IMPORT` but allows for easy override.
+#
+# Copyright 2020 (C) O.S. Systems Software LTDA.
+
+# The '-modcacherw' option ensures we have write access to the cached objects so
+# we avoid errors during clean task as well as when removing the TMPDIR.
+export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -modcacherw"
+
+inherit go
+
+GO_WORKDIR ?= "${GO_IMPORT}"
+do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
-- 
2.27.0

