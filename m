Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC2BEB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:18 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.14632.1687447930742434557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oyCtNRh7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-668711086f4so585906b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447930; x=1690039930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPc+HrPQKkMRyx3tHmbNlY9FI7P8UdB0sfUhIX19ULs=;
        b=oyCtNRh7L6EKXAvelNYPDSC6nIBw1LImocyet2PRBLwXMd12vgm+fEibWhIKCK0SQr
         kCa06AX/jGPAcj4TSMGtix3EjFaDQIBaxr51Fs8MNq0EsUJBMocOvu4BdnZ4tM8JIkIj
         C8Qy7NPQKAiooZNbpYZjwx1MuoiGZhDYlRTjc/RmA17kA5heJ8eVu/GQ58U7XVzWQE3d
         4J811CrRn/uKhuCBIV2JJGnup17g3kKP4ByPk1MgP5GzsBwib59Lpv3Rj4UUAiaERD/Q
         oB/x+uNVboPITy5RYi1aSLYRmJ3/50HNj13nVaHwdedbz7RvwBA5RzawykgScdtobCIC
         ZW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447930; x=1690039930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPc+HrPQKkMRyx3tHmbNlY9FI7P8UdB0sfUhIX19ULs=;
        b=DBsfRc4U99zQKWuMIe/QIwzifZWVJXSOzFpjtIoqKcGP9//NWO5CQd20aT8WhlljZ/
         QJy6pn2JimT+ac+0e7hnxDIY+ZkHiwKSEFZQT3+izEEDWtJB/Cgq8HQNhek707VY790I
         75LFyqSsdVHeVAKLyzGVWfxsFkp2gPIK7K0Q2mrPiHYZ3ZdRlo4eh3HsrbS9+SCtB458
         42Dec31yKa+9ZLDe8j0+q/L9Q8zQo0p2roL4Jt8xrYquLd05Xh2YRzcM9+LRchqr8/qf
         2eQcJMzCj9qyD3DYYoEwQwM2CeQK7HROuOPSRIfagK6UqCKkY0kG5WdBTXZ9lMp6HQow
         KRiw==
X-Gm-Message-State: AC+VfDzF/xXP2N/kvrIzm6Q5f5aWWuk600ALi6UZ7WZNaHbWN8uGwhEG
	KDrrjF/CH8xKZaSYug8Dmdkc+WpYDs2MsztyC4c=
X-Google-Smtp-Source: ACHHUZ6zhLaoQZHIaj3yoMYICHCR6NGoc4bq6urf13JlagnMnBoDLjc7PzPmPs89k4bQ/Pzoq8r1Cg==
X-Received: by 2002:a05:6a00:2353:b0:666:b22d:c6e0 with SMTP id j19-20020a056a00235300b00666b22dc6e0mr23962187pfj.11.1687447929563;
        Thu, 22 Jun 2023 08:32:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] uninative.bbclass: handle read only files outside of patchelf
Date: Thu, 22 Jun 2023 05:31:39 -1000
Message-Id: <3680fcbf9ba327aedb32bb4eb647dd56fcccfd51.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183257

We are seeing autobuilder failures with the latest uninative:

patchelf: open: Permission denied

See upstream discussion which suggests handling
read-only files explicitly outside of patchelf:
https://github.com/NixOS/patchelf/pull/89

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uninative.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 2940935dd7..4d4f53ad4d 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -169,5 +169,7 @@ python uninative_changeinterp () {
             if not elf.isDynamic():
                 continue
 
+            os.chmod(f, s[stat.ST_MODE] | stat.S_IWUSR)
             subprocess.check_output(("patchelf-uninative", "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f), stderr=subprocess.STDOUT)
+            os.chmod(f, s[stat.ST_MODE])
 }
-- 
2.34.1


