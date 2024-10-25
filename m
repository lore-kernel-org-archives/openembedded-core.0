Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440B3D0C610
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 13:47:48 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.12413.1729864064488838536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 06:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J4Z5Ztlv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f72c913aso2713894e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729864062; x=1730468862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=54mqyjNQq2K7ZxC5cCKoTkH9hOI38x8ZCWpBHhUyZMU=;
        b=J4Z5ZtlvwF1KauuujmAAmbwLdACzhb7WPs9V9QDIZYpiEY8mJtxGWVt1rx5uMS9pCg
         /o/HRaKJGbEaLjfo035O+TVCkLkRpYJaOx4WSsi11O0DHwh22P8WIWvTH9DO9GaAVzdJ
         CkGzl0tlY/7ljkWU+T2g+HBxAvEnTBCva5aX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729864062; x=1730468862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54mqyjNQq2K7ZxC5cCKoTkH9hOI38x8ZCWpBHhUyZMU=;
        b=gTqfwFlETRsrPuNISqCBA6YqPJZUtyVCdoBJNyi7pMd2WpA5e5dWlDN7SmpK3D1zTa
         PTTd+5A07ztqK6quAQvlIA+N8HO3BZg1YvimyM6L8YwAi9q90V6yaFw8TbEJjVfzH0mp
         /WPoNfKYCie05Ro68mhc+kPPp0tSJYJzevpYJFyWSPSu7Jo96am7y9OFmbPEdUHc8VCr
         or9O8KotOPLyQMgCqstTJQTTCSyFJuXx92GKyQVChEZVinwlgC6XLQRqyIOASnvOtSJP
         qqTIaFbrX1MaI93A9L4BWUQ2GYwahD7bv4C2J4xiIdPR/HL5mHCQq5SaLEpmZwZQf+Eh
         XNlg==
X-Gm-Message-State: AOJu0YxlFULniSpf+6IKdn4dKg4H0NDqXNrfoObJmAE/Tn0sj4MofYVK
	mVptkCax3ISPAayH4pnxXb0RSWipnR9CE/M9XY9y+TYcEilxiDM5iUTn9yK/69WEcaWxqFWzoWR
	oxV0=
X-Google-Smtp-Source: AGHT+IHAsrFIofekUPeceA8e3EhlYKwTBExh39UQao8ODkZL9wzL814IzoVPXVWIZPRr5Mxwm1o9iA==
X-Received: by 2002:a05:6512:3985:b0:539:e873:6e6 with SMTP id 2adb3069b0e04-53b23e8e8b9mr4254791e87.43.1729864061775;
        Fri, 25 Oct 2024 06:47:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5e58:696f:3954:9f3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b472sm50034095e9.43.2024.10.25.06.47.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:47:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] do_package/sstate/sstatesig: Change timestamp clamping to hash output only
Date: Fri, 25 Oct 2024 14:47:40 +0100
Message-ID: <20241025134740.4011110-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 13:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206350

The code was changing the timestamps of the files in the do_pcakage output,
particularly the files added for debug sources. This was to do two things:

a) make do_package sstate more reproducible
b) ensure better hash equivalence matching

Unfortuately the debug source files are hardlinks into the source tree for
efficiency so touching these, touches a lot of files in ${B} and ${S}. This
causes unpredictable effects if compile is run again for example, or could
cause compiling in the install task.

The hash equivalence matching is of key importance but we can mimic that
using clamping of the file timestamps in the depsig output used to generate
the hashes.

This patch drops the global timestamp clamping, instead allowing the files
to retain their creation timestamps into sstate. This makes do_package sstate
slightly less reproducibile. We could clamp the sstate timestamps but that
would lead to two different sets of timestamps depending on whether the
data came from sstate or not. I'd prefer to have consistent code behaviour,
rather than differing behavhour depending on whether data came from sstate
or not.

If we wanted to have reproducibiliy and fix the "corruption" of S/B and have
consistent codepaths, the only other option would be two copies of the
sources, which could end up huge and seems the least desireable option.

This patch therefore drops the timestamp clamping in the sstate files
and tweaks the depsig data generation to clamp the timestamps for do_package
instead since this seems the best compromise.

I validated that rpm/deb/ipk files still generate correctly as before.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 16 ----------------
 meta/lib/oe/sstatesig.py           |  7 ++++++-
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 11bb892a42a..8e0391c666f 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -641,15 +641,6 @@ def sstate_package(ss, d):
 
     tmpdir = d.getVar('TMPDIR')
 
-    fixtime = False
-    if ss['task'] == "package":
-        fixtime = True
-
-    def fixtimestamp(root, path):
-        f = os.path.join(root, path)
-        if os.lstat(f).st_mtime > sde:
-            os.utime(f, (sde, sde), follow_symlinks=False)
-
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
     sde = int(d.getVar("SOURCE_DATE_EPOCH") or time.time())
     d.setVar("SSTATE_CURRTASK", ss['task'])
@@ -664,8 +655,6 @@ def sstate_package(ss, d):
         # to sstate tasks but there aren't many of these so better just avoid them entirely.
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files + dirs:
-                if fixtime:
-                    fixtimestamp(walkroot, file)
                 srcpath = os.path.join(walkroot, file)
                 if not os.path.islink(srcpath):
                     continue
@@ -687,11 +676,6 @@ def sstate_package(ss, d):
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
         bb.utils.rename(plain, pdir)
-        if fixtime:
-            fixtimestamp(pdir, "")
-            for walkroot, dirs, files in os.walk(pdir):
-                for file in files + dirs:
-                    fixtimestamp(walkroot, file)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f883497292d..1f976067631 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -564,6 +564,7 @@ def OEOuthashBasic(path, sigfile, task, d):
     if task == "package":
         include_timestamps = True
         include_root = False
+        source_date_epoch = float(d.getVar("SOURCE_DATE_EPOCH"))
     hash_version = d.getVar('HASHEQUIV_HASH_VERSION')
     extra_sigdata = d.getVar("HASHEQUIV_EXTRA_SIGDATA")
 
@@ -655,7 +656,11 @@ def OEOuthashBasic(path, sigfile, task, d):
                         raise Exception(msg).with_traceback(e.__traceback__)
 
                 if include_timestamps:
-                    update_hash(" %10d" % s.st_mtime)
+                    # Need to clamp to SOURCE_DATE_EPOCH
+                    if s.st_mtime > source_date_epoch:
+                        update_hash(" %10d" % source_date_epoch)
+                    else:
+                        update_hash(" %10d" % s.st_mtime)
 
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):

