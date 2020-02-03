Return-Path: <joel.stan@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB3C960B74
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 06:35:03 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t14so5430799plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 22:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=szKPlLZrMRn6lF9EIYr7fcoReKVsuTqZqtTwwAYYggw=;
	b=UIwZMpvXdMnP6dEkbhAmB1CSJBKisqLwF3Qgjn39ruNXC1ZjXlPlVKB8k4Yh5vCwsD
	pvGkrROl/vIal9HSejexYtRxUOrYv2i/XZRaayd6i3wYFySTVgWI8NzLMv2igXfLt7/8
	qcq94mr7A2ilv9uA3Q2YuMYeTpYIHWVnnKKJdUcJBipDk28KNXQG1PDuZQsIt600gr+c
	JjFgGnqo6OGb87Ov8cIftv9fy1+nY6Uezqz+TUyHxYqH3ncPJ7FI+CAq8Vmk3gX7lCsJ
	V+4D/ZvN7hueSI19z32auiKP6r2zgRb/pavHeKD4WspyNNWa2DaN8Dx+OyJcSYa5UhKk
	4QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=szKPlLZrMRn6lF9EIYr7fcoReKVsuTqZqtTwwAYYggw=;
	b=BSeXDSd/A8GSSAfwl3cbfHulNqmCti3jIQ7bQGlnl6NCDtiFDIxpSbXJZWdXYfjFwL
	NNoZH0NJN3GVPInyREsKi1Lmyi9uOltcv/dEcGA/a6iGu5ibRd56LxwitfAt/ZTzdY01
	ht0bQglLD0aXh+X3DtWC5ktAkw0JH6W963JpR6HmHr2rgidCxJG13P+yfcR9tUrwE0dT
	UUb/u7XVYE/uK/3RfgkZ/QR0aFlwdsAmjA2pLMcU9boGl3o6EzT3UxB8PqOEkICJoqou
	JE63RO2xjKZ53++o8frKws7D/Rg97KjOVAw3U7U1La1JSA1cvBl22UB+WG0AX7Tm1YmR
	knQA==
X-Gm-Message-State: APjAAAVLYrkn2j95HD99FXeLqiQlicgq/nYfcDmMrYCwDXXt20CydSFG
	QLVVrkyi56mP2pIt2EeK0CRpDcQT
X-Google-Smtp-Source: APXvYqyduxqoALcoMWx+4DUp0eoUTTfXWayoHZIF7QksqnGBLIuozasuhf2cw7kaMDlK1qvgSpSAEg==
X-Received: by 2002:a17:90a:154b:: with SMTP id
	y11mr27567214pja.78.1580711704163; 
	Sun, 02 Feb 2020 22:35:04 -0800 (PST)
Received: from voyager.lan ([45.124.203.14]) by smtp.gmail.com with ESMTPSA id
	p3sm18817481pfg.184.2020.02.02.22.35.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 22:35:03 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 17:04:55 +1030
Message-Id: <20200203063455.417119-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH] perf: Additional fixes for 5.5+
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
X-List-Received-Date: Mon, 03 Feb 2020 06:35:03 -0000
Content-Transfer-Encoding: 8bit

In e5c4f3127521 ("perf: fix build for v5.5+") this recipe was fixed for
5.5 kernels, however testing shows that there's a few other changes
required.

perf's build system uses a file from the scripts/ directory to
generate a bpf header, so this must be added to the list of files to
perform a replace on.

Additionally the replacement would run on all occurrences of
/usr/bin/python first, resulting in lines that contained
"/usr/bin/env python32". This re-orders the sed lines to avoid that.

This fixes warnings such the following:

   File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
 ModuleNotFoundError: No module named '_sysconfigdata'

Change-Id: I8d0011908c87d5fbcf1c3aefb362fe6beb64d22e
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Found when attempting to use 5.5 with OpenBMC.

The sed method of fixing this may be fragile, and moving to patching the
source tree may be preferred in the future.

 meta/recipes-kernel/perf/perf.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 6d1b06693d26..1e0be467c024 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -239,11 +239,11 @@ do_configure_prepend () {
     fi
 
     # use /usr/bin/env instead of version specific python
-    for s in `find ${S}/tools/perf/ -name '*.py'`; do
-        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
+    for s in `find ${S}/tools/perf/ -name '*.py'` scripts/bpf_helpers_doc.py; do
         sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
     done
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
-- 
2.24.1


