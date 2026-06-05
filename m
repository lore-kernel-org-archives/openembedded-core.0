Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6C3CD8C93
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6275.1780698865453226901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sK84iewo;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46019b190b6so1799729f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698864; x=1781303664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0vwozuwuhb1uDc7JL6rQIb9wjaxVfxZpbKvHgjG0js=;
        b=sK84iewor5CBo1/TTQnljaEgen+qwjuQ52LIBTHG/liKecd9PrAExuR/mlvLnlMuJn
         BzVbBhWdf2tbFVn/7zwmznVALcwZIHulfCnm3okfOsyXmKNM4+2i1aqMA6VWKGG2+/cf
         8oTHnjFnHX7uew8x0BBPsEbeWnWBLyJdoCBRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698864; x=1781303664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C0vwozuwuhb1uDc7JL6rQIb9wjaxVfxZpbKvHgjG0js=;
        b=i2rF7boRFjqXkEVsuxR5ZkoGlFMNL5vJn9efJbGYab5kuJdh4352fC9xH13kFlOnRc
         uP1VwLJDrsVy3VojFNqt6xdxJfR9ogtAnsvMIyQWS2dnMkQOhxGU9AfRCLGGI/fCHN4H
         4Hd7TA7L6XkO6c+TxLNxAbcmEZ6T3CQGtVtVR87Wp6GdRG64s4+z3zSA/giWLLn4O+lb
         MKjWJiK2+513sd0uaMGIPQvwdfZVch0LKJU6tdyC+3tXxJlfYSjXr7LlXKjh0135jHbu
         Wmqqx5TAHYNMZouMs5mHhd00POIfy8W89vYogsp63kY4kFIzJb3Mh4PobLVtlcHcj+O/
         bmXA==
X-Gm-Message-State: AOJu0YzMSPZ7yZpDpMe0BWXZKl5K0U4ajW1pzZhuLNgljdqbZG99bREW
	z44uTxTDIwIrI2GZcfQft1BGliQ4b9Ka5Q2KtuqU1I3bPynRPcPhajvL/fiVECbUpNK5gj++o+Q
	JtAn2
X-Gm-Gg: Acq92OEzwQkayMa2ULz8MRxI/g9cdljKEyFn3iDw5WGYAOVjtY5CInqGR5qepy2jQfe
	TxZ1QQnhxZQmHR3ekgONK0A09q2fladzau8BOA1X8Hs/pV9IyfKh/h1t1LGpqKHnJS9QkcuxjkU
	myLl7vD8IRS919QYMZYn0aI1QE5Ov08hThDhYBYJiSMukaTV2/FMxYfSdxSB0FjcYm/E1vpqMLv
	HruLt2KwjVFyuwgf68nbomCTPEPbs2U8NRMD0+Kdyq4Ze+I+RF3gIC0WcSosN7NDRDpOZ2MSRdZ
	8AoeP9T9llOM6kfQHX1L8vUN9eh6iGUUHUNUFiIrlExD/KYASphIhKQsjUf8t2k6QgvR1r3NgMY
	GKaKljOqObKLjyoJFTPFPSQM8PmQwkQOMd/vnDZ2MIYTd4t/QzoatV51K+mxSHZxENL8CeDVS+l
	LT+VSueO+wNhRjbCLJtRq3btT/WvQ2fGL9ZdO5FZezQ4rEXnb1D3oeqk81uWBr8i5uMpLkRz0d0
	mhVLtikg2YLW+FsBPCzqREvEKm12VdDeEB2P3g=
X-Received: by 2002:adf:f90f:0:b0:45e:f867:39bd with SMTP id ffacd0b85a97d-4603063d402mr7134822f8f.36.1780698863841;
        Fri, 05 Jun 2026 15:34:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/25] classes/base: prefer gnu-prefixed HOSTTOOLS
Date: Sat,  6 Jun 2026 00:34:03 +0200
Message-ID: <b797cc729f6e6951baa988e1c04bac9fb8183a1c.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238205

From: Ross Burton <ross.burton@arm.com>

Ubuntu 25.10 has changed the default coreutils implementation from GNU
coreutils to uutils/coreutils. Unfortunately this causes build problems:

  couldn't allocate absolute path for 'null'.
  tail: cannot open 'standard input' for reading: No such file or directory
  install: failed to chown '...': Invalid argument (os error 22)

Clear build failures happen in 'install' and 'tail', but there may be
further breakage.

Luckily, Ubuntu also installs GNU coreutils with a binary prefix of
'gnu', so whilst these issues are root-caused and fixed in either pseudo
or uutils we can prefer the gnu-prefixed binaries where they are present.

[ YOCTO #16028 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 16f2684ebeffa72b5d90525cf9102751b68c298e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/base.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ecf0fd711f7..edf2149e6f1 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -111,7 +111,11 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             # clean up dead symlink
             if os.path.islink(desttool):
                 os.unlink(desttool)
-            srctool = bb.utils.which(path, tool, executable=True)
+
+            # Prefer gnu-prefixed binaries, if available
+            srctool = (bb.utils.which(path, "gnu" + tool, executable=True) or
+                       bb.utils.which(path, tool, executable=True))
+
             # gcc/g++ may link to ccache on some hosts, e.g.,
             # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
             # would return /usr/local/bin/ccache/gcc, but what we need is

