Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F8ECA0EFB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:15 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.3354.1755634089291997053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kZXA3hEp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso6829846b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634088; x=1756238888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDXK0fLJTvs+qOOsQDixN/zkvD/NuCj0HOODMZBoQJ8=;
        b=kZXA3hEpwUTcqXnMIHgTG6cmJG2bfs82N0zwedqpUTYzPB8NSoQ5E9Fd7HqUEGRmtm
         WrzINnsrR0tgKMXmZOADvMWELtZq+4QXDJdFelvo9hP+AawPktGQW7RF/NTf+eVeeRJD
         URMqLB/5/oRjOcmE94+BtA37sSfnD5iwXNB8ZEW5lfwXT2Oq1ZsbxjFL/ilEjOexpEqK
         NQRHhdC57WBDHjlzYW26JiwxP+Kz+1bRXk5CDi04TUm5oJFi4RWdNwdc7YYtjNhJ1zYz
         89To7wO1DFszKnKSZFnD3tzbJX4cBlJucf3Lpl4YpdzYnwEkKaFNrvcNwjeZQ9xdyGx4
         y8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634088; x=1756238888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDXK0fLJTvs+qOOsQDixN/zkvD/NuCj0HOODMZBoQJ8=;
        b=BAsnZNxa4jVtCPPXioc130ZNVxLeouwWsLUg9gddb1zziWRu7HgmsHKU5LiUW3N/1O
         q3korv9fM3FnETW1YWvpxVbeuGEIz2JlqNK/oiqyyg3/kM3xYuDdrj8nMrGII1lvHbCH
         rZaEb5FiAPXbdN7isccoDvkAwHkg0tX4h1kLM/yX4NXlAHZwRBTsefRKHg/l6hLawQkW
         McJeJnAgKjIMtFB5vP0vd+P44QHaDC7E5UgEI0PlWKkzXoISJ1vVpo/2REd6NMeUKnxK
         OjrDj/QCWLvsbFkyUNUIxfMPTt3EjzY+ECz9DQoK6AdZSwvHVC7oUc3HNRHHM9sfsVna
         eBJg==
X-Gm-Message-State: AOJu0YxrbDEeEOp+KH7Rfo97jS/4envfj9oxTTFzGKrR+Nv7GHOvYoLL
	RMi7FW4/jGC+XTqyB7VWSbNgCXpH1VGlziIDXTzEM7dP9EZ3KlrsUxN5P8lbX2zGPiUWA+1bCBD
	iPgks
X-Gm-Gg: ASbGnctLdgmCPUyf/fhQ7PZjjR+6HhIfiUGN36V4KOizQnIO9jfedySUdw7Qm//0x6R
	h65dB8IgS5atPFseubFBRCfvTqA4VsQGsjGUOy8FfeGwVeJByvR1B235M20ZXB/Sr6S4K9Qt4N4
	NrXunOoUkopChG5L8Q6+1B2ajC5ZCrQW+YyXOntr6FaYOFEcRYfUQYZTCkeFOrXAvgK7GmfwkDP
	QbgFsnMvEmwQlzlbn3Qdhd4IClFwHmJFfXJtSTbBPpOkwf+rinxMrcBte/V9/4sMlASQHRDiOwn
	Fe+GOcWasAtm5iwCmFr+qVv8Z9MqFj0EW4jpVpn/MuD9moyMOtFRZ5/qhIobfBbM6r8Sg31Jrw4
	/y7dlkXmPjvM9Ao9h+MMF8mFY
X-Google-Smtp-Source: AGHT+IFU43q0SiFwqjWwoWyxV9T559Ar94/UFBbUgXyyYT+fwVVhC/dFHjsoHp6UrF6d4GFg6uJYkw==
X-Received: by 2002:a05:6a00:992:b0:76b:e0d7:c3cf with SMTP id d2e1a72fcca58-76e8dc4354dmr642256b3a.4.1755634088332;
        Tue, 19 Aug 2025 13:08:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/10] glib-2.0: ignore CVE-2025-4056
Date: Tue, 19 Aug 2025 13:07:47 -0700
Message-ID: <5858567a9222d9fff6f0a282cf7c7bda4e19af57.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222131

From: Peter Marko <peter.marko@siemens.com>

NVD report [1] says:
A flaw was found in GLib. A denial of service on **Windows platforms**
may occur if an application attempts to spawn a program using long
command lines.

The fix [3] (linked from [2]) also changes only files
glib/gspawn-win32-helper.c
glib/gspawn-win32.c

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4056
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3668
[3] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4570

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index e1a3b57270..53e0543045 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -66,3 +66,5 @@ def find_meson_cross_files(d):
 python () {
     find_meson_cross_files(d)
 }
+
+CVE_STATUS[CVE-2025-4056] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.43.0


