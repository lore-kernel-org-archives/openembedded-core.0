Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2CD6D6C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 16:02:25 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id p197so2000504lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=dwQ2pdbsdO3tjFZG5/szvh5fqXQmcn8bog9p5jTyVkQ=;
	b=t9DfFsQYxUwa50ivTWWB1UcOcUHHCfzbrcLe+g7ZA59cMhtMeGrwFE8VO1bUXqFNab
	5IOfMAgUbIBIDyxD8ZfdjMD/avIRZ6VsZUe0r4WQ7IZFMIIz3jZGdK9PI+HtUHZVbeC5
	DdMhksbBrpVAcAYxjyt6v0dXm3+xkwza8m3+OMLfQENuENS9R4YiySy0cA425VfVSp+m
	a/RKsRId84KJ4RNjgo3XVf3cTVPbFC0IiwRYx3/nUI+N21fZmzhJQVEW7ZO+S6wFWyh+
	eTy//jvWoLqxAv7JUdOmZzWHTQV5MVr3lbIwdDBAB1smr0eexh3BgSvN0ACq86wa/TDI
	5hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dwQ2pdbsdO3tjFZG5/szvh5fqXQmcn8bog9p5jTyVkQ=;
	b=tjh7/q+6B0N7RiXawbJHjhJLo2nNJl2/BWknITJkpFD1jCc0UwuRtir0ZpvPdxLIb3
	pM9n8u/+Eiuf3u1tpU7ku/uFIfYIiD/pXPTlpnFbwEKgVRAM8nLSBnF4x01sbWpmzWAv
	w0bNHEsI9ycrIw4O+wxJVs7mIV1WeS/yBOMhk7ChMbN7bT+3D886bvdBI3RdDcZGxEuY
	QLT0IZFOPUhPNutNJc3aZDJaVNSJVx0U6H3RMmKLzmTigdjOM6aH3e3VqLWZ7/0E8Q/4
	Nk3y7KywxVVCgvfvywd9U2cKkR/SE5z7lkasW5t2GzjuBltedrDvagRHohKFA19JgSYK
	VrZQ==
X-Gm-Message-State: APjAAAWyNd42goxJU1Gx1dFYHxbcoCi/kJx4HZsqAXAEilF9cnvvXnD/
	Gy/lquiMOpMEPxX5wPSF3bBYPXZyt/I=
X-Google-Smtp-Source: APXvYqxdlAoHB1NLIAovxe5q4Jh9FAtFOwF0OVwDGcdCVsoyk9m2C9ir+/vBp/BwsNqpXZg4R4wAWA==
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr2687015lfa.174.1565884946092; 
	Thu, 15 Aug 2019 09:02:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id f1sm538893ljf.53.2019.08.15.09.02.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 09:02:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2019 18:02:10 +0200
Message-Id: <20190815160210.20828-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bitbake: runqueue: Ensure data is handled correctly
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
X-List-Received-Date: Thu, 15 Aug 2019 16:02:26 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This doesn't appear to have ill effects right now but there is a correctness
issue which this so fix it.

(Bitbake rev: a5e084a266f63c2fd370122327615e49beaeb94e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/runqueue.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 53031740bd..4e64ddfdad 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -2306,6 +2306,8 @@ class RunQueueExecute:
                 self.scenequeue_notcovered.remove(tid)
             if tid in self.scenequeue_covered:
                 self.scenequeue_covered.remove(tid)
+            if tid in self.scenequeue_notneeded:
+                self.scenequeue_notneeded.remove(tid)
 
             (mc, fn, taskname, taskfn) = split_tid_mcfn(tid)
             self.sqdata.stamps[tid] = bb.build.stampfile(taskname + "_setscene", self.rqdata.dataCaches[mc], taskfn, noextra=True)
-- 
2.17.1


