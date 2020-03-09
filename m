Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5A761082
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 14:21:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p9so10135776wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2OuENzyghV7GawhXyahp5mpHLdmlS7J5vN9W+5lFIIA=;
	b=QxuLn4QzK0I0hSrldSovQ6w5Vqe1ge4p/wF4Fmx+TwxCK6hRmq6Kkw4gkPXdoTQK/u
	XkUQ2DJDTXdW7NPYYm57H7h6OD+aFJtQDktO+DGrzevOAZ7DG0CkdgtBQ6Y8wfzpIPHu
	gt5Lv+nbbh2GAe41Bi+36n4H5hx0vEXHoK0nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2OuENzyghV7GawhXyahp5mpHLdmlS7J5vN9W+5lFIIA=;
	b=l/Negq+U+P3JFNLDlkuhP6pQGLHPmGlf64skI5/f2vLISs7ij6VdoTb9zMt3Dpn4K2
	i1HQqDQW2g68dHhWoQe5R68wy8n/VVgf3Pp1EJpaQD+1XbnJvOIQfesYeRot3X8wwnrL
	AEmL47UNDHfKDLLFICgv8GgTBXLJP+1mFfxv1p+uIi4FHBK3BPTR/mEgjQ2qEHtYq+28
	0pkwiIfJln3ZYyw3t3h6VLTedQJ8OUoe2wjrah+ZVP4u3bdav1TBS3yg5RtpeJdUFtR4
	QfTLtbfBnyoBGjfuK90hvvCnQcXGicFyCHuwtX+qD6SaEze302/S8VIrsItUNSwk41Ga
	0pxQ==
X-Gm-Message-State: ANhLgQ16Bxt6ZvQTYZGi8+L3oy4Vw5Lm8/N5V6a8W+cPfXD51N7brjxZ
	28ueQ7zrym2ty8djAwgdgcp2ArHlAmqvVUON
X-Google-Smtp-Source: ADFU+vtFaPkK5x/sa+YImfQM5cLCkDWrn64NzjIBqGwS2h2a5uN7Oj0nUPJMqpH7q4UBextvnkKsuA==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr20008502wmi.174.1583763714899; 
	Mon, 09 Mar 2020 07:21:54 -0700 (PDT)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	z10sm25780577wmk.31.2020.03.09.07.21.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 07:21:54 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 14:21:38 +0000
Message-Id: <20200309142139.15741-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309142139.15741-1-pbarker@konsulko.com>
References: <20200309142139.15741-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] perf: Fix externalsrc support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Mar 2020 14:21:55 -0000
Content-Transfer-Encoding: 8bit

When the externalsrc class is used the tasks listed in
SRCTREECOVEREDTASKS are deleted to prevent them being executed. If
externalsrc is used for the kernel then this will include
virtual/kernel:do_patch.

We can depend on do_shared_workdir instead as this will survive when
externalsrc is used.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 10a5b88260..e005eb082b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -52,7 +52,7 @@ export PYTHON_SITEPACKAGES_DIR
 #kernel 3.1+ supports WERROR to disable warnings as errors
 export WERROR = "0"
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 
 # needed for building the tools/perf Perl binding
 include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}
-- 
2.20.1


