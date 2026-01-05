Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D638AC79F9F
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 14:44:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65290.1767624242738327639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 06:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ihXEkEqJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso7205e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 06:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767624241; x=1768229041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThFPNMKWmXx5Czn/vAmPLTmsGI9Q67X+47/OCWwACBQ=;
        b=ihXEkEqJg8dEkjPufZAyhNprUNy3snbiawWnwLHwow2Q7pflAUKEapboPv5xuiwoDg
         WzQhiqD9SAqhpYOEEfQNqz4juJokxBa3YBZtwQASYt8Bj6lQUWYLWp4mQK5se4sqkYhc
         kDjB2/9n3je0zq7oqH/1gvpzcX6YDTt/a1gxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624241; x=1768229041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThFPNMKWmXx5Czn/vAmPLTmsGI9Q67X+47/OCWwACBQ=;
        b=lgCJlxcVXtLCuPF9RAkGfBDPJ2nKTztJ6XuO4u+os7UzJwZsIkzlu1GjtULsmL9Lbu
         /wjSY8YyrbSysIC6UeBJ0o3Co5lKVd5+zg0WjFECQo7SzbiiSlEC0TyW+TzrcPm46ceV
         074d7Sm0YNgFNpLICkycvU9rM1OtF3N7+juj+7i02JOmuFd5s4qWGTx2kILAjOGhLso/
         jNkBPUm5w8NufJBXLCJ4yizUomq7wA2uC4cyoED9L7CZHMpIVMrya/iv51J4kSdnueR7
         KEnXqoXFmgS2NfSeh/LS6S3xHDN5tTXEkuGnYAjANiM+Cd1EKZvZuyWEUXV56b9M7lxf
         ai1Q==
X-Gm-Message-State: AOJu0YyrmOyqgD8qe0B5Jr99eD23fNVUnIpAQSKapMf/JyyLO7mIm208
	rtBMDq2xRjJ5Ltc6D/aC4/A+G6+jMsD90E7Yn+yxmb+gjunu3ehGuUMR0f6qeuOt+gAckyERZui
	7/la6
X-Gm-Gg: AY/fxX4AXv82FrCZSYlXFeztXP9IIqfvFJiwKX3WL9LzvBjYZRrAKcXXkIGstNRHlXj
	ov7h1fb79O/KAsdeVgL87BPH2jvQqr7fFy6tJSlkgoLULsPORSdR2cvKKq4bq4HRTMqG2q7Tzvu
	NsiGALx9HX/Hck0gsCrC/2YLLx4LU168EVlfYWFLi4W59dIyAxikKBNkjqNcI/q+1fWSsemTBkV
	nHBLmT5yI5cznvQTuwJT56T3wf29xZ9MNsoUXHFc5zPfRuhbZPu4Kb9xdNh5YeH0x1K9yzl3upU
	rrzKJXAzS6b0sneeBx1x7MNoYz9X7BY36sn95K3Yg9FQq+Y9WcUBIFMQrAEvxd7DkD4Lph0hYBb
	Q6/mQW7E6LGOJNbR0fdRsIcBwUExUngy7XVWPCYrjePxksx53qCfLAydt76yImllLa2/iJ4qI7r
	onX8MJp35UVBvumjQVOMCCrxC+mj9zKKfJuRYaIAY=
X-Google-Smtp-Source: AGHT+IFWkwucpQQt8DXWrad0NxmEEJSLfrIuVtuZBn4mMjFaNLKSHYL06aoCtMvTmP4w5UGPMacJkw==
X-Received: by 2002:a05:600c:1e1c:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47d6ba81c6dmr106225995e9.6.1767624240389;
        Mon, 05 Jan 2026 06:44:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d03c:1a9c:2893:c2a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c08ef66sm57403995e9.10.2026.01.05.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:43:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Subject: [PATCH] Revert "glibc: Enable NFS local file locking for glibc tests"
Date: Mon,  5 Jan 2026 14:43:58 +0000
Message-ID: <20260105144358.3105446-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 14:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228870

This reverts commit ba4cc296f8cb9d91084f0d55382bf9ee3c1dda97.

We're seeing NFS hangs on the autobuilder in the glibc toolchain tests
when run under qemu system mode. It appears the unfs server
fails and the image than fails trying to access the NFS mount. I can't yet
find a way to see why the unfs3 nfs server fails.

Whilst I don't know for sure this commit is the issue, it does seem likely this
could be the cause, so revert for now to see if the hangs stop.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index b2b115972ff..15ba5a83525 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -79,7 +79,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # setup nfs mount
             if qemu.run("mkdir -p \"{0}\"".format(tmpdir))[0] != 0:
                 raise Exception("Failed to setup NFS mount directory on target")
-            mountcmd = "mount -o noac,nfsvers=3,local_lock=all,port={0},mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
+            mountcmd = "mount -o noac,nfsvers=3,port={0},mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
             status, output = qemu.run(mountcmd)
             if status != 0:
                 raise Exception("Failed to setup NFS mount on target ({})".format(repr(output)))

