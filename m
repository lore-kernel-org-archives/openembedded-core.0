Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.60748.1629318604557213755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 13:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Quz72OgH;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id q11so5420278wrr.9
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 13:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k3C8QB4q3wcNhkJTJ3Rcp8jwa7ey+6pwfRq+29uuAKI=;
        b=Quz72OgH8gEfy96o7JnNCNDzpL4YlX69TgvmpFHU/mEY+0Vdof6e64XcvEFXehJ6ot
         kG7vROXfzVeY7xUfhp3wDmh0+y6sooGi/zFn2kFqNlc5L/7GQIMQBLpHJY4QtHfGr9RA
         tzJTGF50NS5jJFBl/hwf1MFz6/xnlq+K/7bTLucTmF9Li0eHF3k+kJgq9HifJAlqKzfl
         lIHEse4LK8YQR2F+RT3uNtQovpGWrBWfpW2k6Md7S9SWDQQA/AQtjJ6pGfPyo3ZWaBxd
         IchGubOlXDoOMiY/54soL9ZylBbvNjwiOoYcV1sk+aqXXBnuBjsImkO9clbP2S2CO2QA
         OaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k3C8QB4q3wcNhkJTJ3Rcp8jwa7ey+6pwfRq+29uuAKI=;
        b=bfmQzHYBsYX0XAbgV2iCZhBZXB/JJJY5N0z97aK4OUUSQnVoFPIhha3ALIAmg1zWU1
         Zfc1wqdT/2fuCE9XsAPZCCjfor2a3Qauibtss6CgNp1sCbqiqYPPfkF2RhrK8cZ7wgeO
         lUHzJcBz3EkQNLfjXWjCWCXYdo2F2zFjhJ68pldcojoJ6eOfnjAcJybYJZQnUJNhocrv
         NA+cr2B7vWj5eTIn25G1xLntDX7FmBGQTsACoFwuokOp+Jv/bdyMo0Pwf3kH+kQ4FK+Y
         6mfB++KzE50EGY4EfWT7/o7RXUeExGZqVqcEQS9z/UmWUFWK3MdJBYs64VxjKRfPsPLA
         a3Vw==
X-Gm-Message-State: AOAM531QE+hEAJM3nQqsjvbUi/Q8QvdQoFWrHsN4sJMz2EwJhRrL5Gph
	sL0kcLrKKH9utq6icFF9oY6ewKeDnek=
X-Google-Smtp-Source: ABdhPJypzEF2RxGR9bH2v0/WiDa1MfO/WZQY4WgdQ0SxwVNVvWSIGnAsbPCiajOypma7Ni0HppCzHQ==
X-Received: by 2002:a5d:4e01:: with SMTP id p1mr12773707wrt.73.1629318602757;
        Wed, 18 Aug 2021 13:30:02 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id d145sm5966189wmd.3.2021.08.18.13.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:30:02 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 3/4] sstate.bbclass: get the number of threads from BB_NUMBER_THREADS
Date: Wed, 18 Aug 2021 21:29:53 +0100
Message-Id: <20210818202954.143099-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210818202954.143099-1-quaresma.jose@gmail.com>
References: <20210818202954.143099-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- bitbake BB_NUMBER_THREADS uses cpu_count from oe utils that uses
the python os.sched_getaffinity and it is more acurrate.

 grep -nH ^BB_NUMBER_THREADS meta/conf/bitbake.conf
 meta/conf/bitbake.conf:806:BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"

- multiprocessing.cpu_count() returns the number of CPUs on the host,
not the number of usable CPUs on the host. If the user is using
scheduler affinity then the number of usable CPUs may be less,
so when determining how many cores we can use check the affinity instead.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c3c145e7f3..e86c003726 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -964,13 +964,12 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             tasklist.append((tid, sstatefile))
 
         if tasklist:
+            nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
+
             if len(tasklist) >= min_tasks:
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
-            import multiprocessing
-            nproc = min(multiprocessing.cpu_count(), len(tasklist))
-
             bb.event.enable_threadlock()
             pool = oe.utils.ThreadedPool(nproc, len(tasklist),
                     worker_init=checkstatus_init, worker_end=checkstatus_end)
-- 
2.33.0

