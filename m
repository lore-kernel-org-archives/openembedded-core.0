Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.21.1613422331488500526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 12:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q4/uFPte;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id x4so10529422wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 12:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y9UnxJzIOWYYeSRsTDfbRoT+2XjschiaA2lpoNTV83g=;
        b=Q4/uFPteYLtHksBI0OoxpYKCTG3Pdl7NdpJY/dWckVSZ3b+xM/I19P0HAkyX+7Z3uz
         YMdXtYv/25xRgu8K2m3YATmAItMTe3UGWGY5WGKqPgfKfhpphlCC0A0cMcqY6YSt8ACy
         kNuGC8+RKz5NV2JqIFf1TE3nxLqE7JOmksi0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y9UnxJzIOWYYeSRsTDfbRoT+2XjschiaA2lpoNTV83g=;
        b=Yr/DF+W+PBcuxFPMDtXbS0DWkN1ildDUOBPZ79rLBJlcVmHxdM7SNdg/p4ZH7bYeC9
         IoA0Er1FZgfY8gX+lQCYsGgQ41xatjmNUE8MDlhy4QuA5LqmNWZIU8SEv5nBlMbz+KwC
         ZCkzK0RJrFKy7tMSyPXrVyWoop6LM78E+eUu79s8npJ9RzeZ+iW0n+0/3Fe1xncnzqpO
         6AIj1jZDWdY//njpMrB88IO9pI3X6xDHDxEInyPnwNC/5OBC9VSkbN9c+IbhboXY6OVW
         LtH7JGmD6ALx3p8zNvqYiZrl6jOZbVBG96WaNPoXAFK0AsVwr1PEFyxHy/9Awa8jR9D5
         6y6g==
X-Gm-Message-State: AOAM530u9aUVRO5TNNYiRQtw8D7HkHQw8NkW/lZ3BT1/s/C0bgZ7FgPB
	34m8zc4BB/TVbHo6KC69eg9XlHwd52lIUg==
X-Google-Smtp-Source: ABdhPJwtFMtIwCtiKhnuwDVlNvXdVxDvqaWrTZZzcDYbtM3W76DtJtXMwuNVLz12o5ZaSHQY/NoxAQ==
X-Received: by 2002:a05:600c:898:: with SMTP id l24mr569059wmp.154.1613422330025;
        Mon, 15 Feb 2021 12:52:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3015:c6e2:686f:34ff])
        by smtp.gmail.com with ESMTPSA id q2sm18706253wrx.79.2021.02.15.12.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 12:52:09 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 2/2] makewrappers: Fix glibc 2.33 fstatat usage issues
Date: Mon, 15 Feb 2021 20:52:08 +0000
Message-Id: <20210215205208.2001387-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210215205208.2001387-1-richard.purdie@linuxfoundation.org>
References: <20210215205208.2001387-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In glibc 2.33 it makes calls like:

fstatat64 (pathfd, "", &st, AT_EMPTY_PATH);

where pathfd may be a symlink. This interacts badly with pseudo_root_path()
since the empty path is replaced with a pathname from the open fd but
AT_SYMLINK_NOFOLLOW is not set, hence the link is resolved and pseudo
throws an abort() due to inode mismatch.

Where the path is empty, an fd is passed and AT_EMPTY_PATH is set,
we can imply that AT_SYMLINK_NOFOLLOW is also effectly set. Adjust
the wrapper functions to ensure this, allowing the functions to behave
correctly in the AT_EMPTY_PATH case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 makewrappers | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/makewrappers b/makewrappers
index 6681e11..818834e 100755
--- a/makewrappers
+++ b/makewrappers
@@ -372,6 +372,11 @@ class Function:
             prefix = path[:-4]
             if prefix not in self.specific_dirfds:
                 prefix = ''
+            if self.dirfd != "AT_FDCWD" and "flags" in self.flags \
+                    and "AT_SYMLINK_NOFOLLOW" in self.flags:
+                fix_paths.append(
+                    "if (%s && !*%s && (flags & AT_EMPTY_PATH))\n"
+                    "\t\t\tflags |= AT_SYMLINK_NOFOLLOW;" % (path, path))
             fix_paths.append(
                 "%s = pseudo_root_path(__func__, __LINE__, %s%s, %s, %s);" %
                 (path, prefix, self.dirfd, path, self.flags))
-- 
2.27.0

