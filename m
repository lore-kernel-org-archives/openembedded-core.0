Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.208.1630174496078071922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=J2NXmqKG;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.51, mailfrom: steve@sakoman.com)
Received: by mail-io1-f51.google.com with SMTP id a13so13517636iol.5
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U2+FmvaAJ7lh9J0S4CDOGfET38Nn2yjt6Y23o67KPG4=;
        b=J2NXmqKGMYzvxu6mtDiphuHapISmyJQ4EsMFFnti3MbKkGEp1JlofGZI2zbJWMg4lf
         AvpcUvuXS877vOpKczHsHBrarT7vjvd3bFs4MFe+6Ag/ycpSUIND7Sw4e4b1jx09xyai
         Wzgps2RYmDSzPwUSrvqI4QFolPSB4huK5FjGvacnk4Oj4A0vzdjT8TifRFMDw2UCYnRl
         LhPRXDraZAaMOeKTt0HNrQ0MR5AlxrNu7KAhhA85ycrHbhvOQ6JhpHQV02dX1aGvNTy4
         O+0hYrUDdbgr+JVkCxhbebwFKG4Wv2W785xpCfbeFlgvctLsumoQ+YRZCEaakYlpXPk5
         Yawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U2+FmvaAJ7lh9J0S4CDOGfET38Nn2yjt6Y23o67KPG4=;
        b=cMbh7UuMCx398GV8aZBU/iD0x2Jm582+WS59+pkVTYLymgD9RMfYVwJyTOiX42dQS4
         fftrUMJsK+KNJS9KrO5o4Vl4NozlZircTZn4wW79I3xeVrEFSoicD+ASlzwUvfHrWnVo
         i7Qzq6q8DXQpRDZXC/mI424oQRgF67CydeAG8bc1p0A6PcS+qq8tvfvm7PLpapBk8a9M
         pBPgQ/1579QkFvkxUqa1cnDGPmhHRIYAGjjRi4IJ9HfQojaQM8sixB9HxrvPSNsbaV9H
         zbqTwUL3wraH1AHlXyiwKUDcjK3z6BD5dgLkxXnffP0o6cyetqlPlSa5KuUBNffn8h80
         pbbA==
X-Gm-Message-State: AOAM531zLb/uC1yWNQNKhBUdmfgBi8pJZXoik6MVjD7gh9MiOkHjAtLb
	ONqDIchz45jNvjLdRqX15a/0b2FEU1PTr/pT
X-Google-Smtp-Source: ABdhPJz+6e6VhjW0UoeyXZfkY2Ia4KrKD33pWtJyzqut7mlyHHtBHhLXeTZQF5SYA+tVSirmUJwpdA==
X-Received: by 2002:a5e:df0d:: with SMTP id f13mr12509854ioq.108.1630174495021;
        Sat, 28 Aug 2021 11:14:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/36] parselogs.py: ignore intermittent CD/DVDROM identification failure
Date: Sat, 28 Aug 2021 08:11:23 -1000
Message-Id: <ae65f4a6a10ad9ca7cf94d653b3b07039b483e72.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We don't use the CD/DVD ROM drive in any of our tests, but it
periodically fails discovery and that leads to a QA error:

    [    6.403477] ata3.00: failed to IDENTIFY (I/O error, err_mask=0x4)

The only way to disable the optical ROM drive in qemu is to use
the '-nodefaults' option, which disables the CDROM (among other things).
We can't be sure that none of our tests, or extended users are relying
on default devices, so using that option is more of a risk than adding
the message to our ignore list.

To date, no one has sent a patch to just disable the optical drive
(either in qemu or the BIOS), but that is something we could consider
in the future.

[YOCTO #14528]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 143fc5504539c69752ca87717507c197a8920ce5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index f703927660..88279c6013 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -97,6 +97,7 @@ ignore_errors = {
     'qemux86' : [
         'Failed to access perfctr msr (MSR',
         'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
+        'failed to IDENTIFY (I/O error, err_mask=0x4)',
         ] + qemux86_common,
     'qemux86-64' : qemux86_common,
     'qemumips' : [
-- 
2.25.1

