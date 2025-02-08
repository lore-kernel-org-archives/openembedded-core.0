Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70679C021A0
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.9208.1739023512143595006
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UqIqRJUb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f50895565so23709985ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023511; x=1739628311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZVmySLUee9A2kPT3zsH5BdRUfe8ApE56vNhVZP/XN4=;
        b=UqIqRJUbsK++bnVVkUc8CHdlNYzSVBeyczQaewVWY9jEGPxVjNK0rBBaOhE14DpB9H
         TFvnIB2YSlQU2LjmbEQ5RbOqI9FIzNXve3Z8EgcsaJPNAUCKadlbyXwmgcCkK2DHR0sx
         BzgAQ10kef43v9MXFYIcELXIBmR4VZ/jWWM8eVpSRM2x2HapvdJFfTTOVbF9tc+6vjeK
         PhKT1yCcQQ5ecKsK+L50kRoWvTszTKA2aKseNEGVqMPJKA3/ALbejyjqDqGA14g7piuW
         imHCvlygr+k9z8qqPBZkzQn1lYpX2ky3oFIB08aLtVMNpHoRo5fxPYp/f441FTGncK1/
         MN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023511; x=1739628311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZVmySLUee9A2kPT3zsH5BdRUfe8ApE56vNhVZP/XN4=;
        b=KzUGWo5JY9U+0dr3cLeh4TDTEQeo62ZJ592517s9g7qEPRITTcFP6Z2NehuZEYvaQ2
         I8DyYIewWrqtxNhNRueLTYswq/5eXdJbbBGID6SNZANkuf8XrpDUWpv/OmIWQOSkmchF
         1VyVUziYjf+F6TKRFiaZrE+PbKhSz/QKG7zpmLwruo0epyHAtSwjooifk2iaOsw0VYPF
         rnvBM9ytDO9H4bY25Rdpy3smyk4ZKshkP6/MICgmHsXD15k8teXaHbx6mKArvBVypqvy
         HXP2sYrdKeH8wwjtAqoK9CxLqRpVYLA3nr6RMEx8EE77+oMktShGCd4LsUa8zxH+V7N/
         wu9w==
X-Gm-Message-State: AOJu0YxH4I0/2qSDAvmuwFhRPmF2KQTZYgciMf683qz/pUlH1h9J+X5G
	7p3o8GqSNqzpOMgyuvYaElSuTti0LMUkUjnrrixnpJOXXBNSliAeR7QkzTCprr7jXjFr/vU6oD8
	q
X-Gm-Gg: ASbGncuiOVEl74m2du/E7dzbzTlRRpP8SvziIOiEtRbikO2HiHU+S3BhxLNV/uedu7o
	G14Jwr+ohphDkIj5VGr+ROlOk+BksouO+xyopLzW730LEXwVtGGaU4DO8mjtPWI4amQIVrcM06q
	qTsTBFgqHj/A1lWpsbDMvvCYZ76Mf9LFCNl5d0972JjFcvXLmf+7LqmnHDNT2qp/g2aEOV5hNUT
	BUgYtF6pzklZwX6bx/J98+d3UiZ0tjenkPxPiWspCLoy5dNhCFtXnpp7ML4VIt262NQWrlHj6cS
	2CDa
X-Google-Smtp-Source: AGHT+IF12OnH+ddMHqR9Qq05yMi9N/xjkADxQFvFzGd/01CQW193/twEIT3wCbn5AnUpGhQseQmcOg==
X-Received: by 2002:a17:902:e143:b0:216:50fb:5dfc with SMTP id d9443c01a7336-21f4e1cc2c1mr75049145ad.9.1739023511502;
        Sat, 08 Feb 2025 06:05:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/13] files: overlayfs-create-dirs: Improve mount unit dependency
Date: Sat,  8 Feb 2025 06:04:52 -0800
Message-ID: <e00920c55a44058e8d2b063bf865df11e59a6185.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211025

From: Esben Haabendal <esben@geanix.com>

The RequiresMountsFor configuration option of systemd.unit (added in
systemd version 201) not only adds the Requires and After options for
the required mount unit, but it adds them for all mount units required
to access the specified path.

So this change is both a simplification, and an improvement.

Not only will all needed mount units be added to Requires and After, but
the overlay path does not have to be a mountpoint, but can be at any
directory level beneath a mountpoint.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
(cherry picked from commit fa2422232a143b21aeea3728abca82100946dbc4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/overlayfs-create-dirs.service.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
index d8d916365a..c8431548d7 100644
--- a/meta/files/overlayfs-create-dirs.service.in
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -1,7 +1,6 @@
 [Unit]
 Description=Overlayfs directories setup {LOWERDIR}
-Requires={DATA_MOUNT_UNIT}
-After={DATA_MOUNT_UNIT}
+RequiresMountsFor={DATA_MOUNT_POINT}
 DefaultDependencies=no
 
 [Service]
-- 
2.43.0


