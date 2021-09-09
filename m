Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.547.1631201777888935253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 08:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h/6PSFxm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id e26so1673040wmk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ltq2Bf5S+QnKKYfu4FfgCBV0X+TqWERozAjj1aM+CF4=;
        b=h/6PSFxmx7gzvasvGvOrqeYUZqNEEcYQgURMROxopBr0QM3tGaPqtYGi8uq8nYCS09
         G3uTSFjP1XipgOrPtcdelQlap/9bJCCijGuZEKK5XlGJqkjfqm3+akwSUwIzObmiQ1d0
         WwoFeTW4uLLGBdwpAAOJGa/mbMWjRsEc8mB5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ltq2Bf5S+QnKKYfu4FfgCBV0X+TqWERozAjj1aM+CF4=;
        b=G0b19dLSImhvQLkvOfpSXVKlMFPLMMYwKv+Tpt73e0GKr19Zjf40CQKlssDzGHWm5H
         surmQUjCfUzakExi4qCKzJYUxPnjXz1czgdHvmwaaOwi4Hq+KJF20F0oueGWGG8D7rK0
         HLe7CEW+5/2M1MIBGGnf6SAOuBrhT29G4C7q4kLk5LqJinb3rtj4bpBPHPHuWIj+zNE9
         T5sSqjMQb+WZnkf+FmLsH1GrNd6zpHcEWEKgHDbnSLn7Jz2vMMzKsq07hNxVCVN2Du9z
         mC0DjnAsEaB0kN+Onu/fzY1WBpZfjomddqVp1KnXQM68NZ8gQoMFTZaxAl8Mk4eg2lfH
         h4bQ==
X-Gm-Message-State: AOAM5306DW/rGK2+ZVgJqE4coIkejh2uEd4dBRHTvEL3ZLOhLSlFsYWh
	lZKG0OelR+ioSGRKt6YoBSFtIdAocYn5il5p
X-Google-Smtp-Source: ABdhPJxiwFbk7sd1LD6Fvis6IK+RlBMogDEe1uL8d1jr7JikxYE1zPSnd5Xp1tl+sTAuXCb0eoEjOA==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr3677831wmc.99.1631201776320;
        Thu, 09 Sep 2021 08:36:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a4a5:76db:a94c:ced7])
        by smtp.gmail.com with ESMTPSA id d29sm2245173wrc.6.2021.09.09.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:36:16 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net,
	Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/6] test-openat: Consider device as well as inode number
Date: Thu,  9 Sep 2021 16:36:10 +0100
Message-Id: <20210909153614.1225570-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
References: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Crowe <mac@mcrowe.com>

It just so happens that my /home/mac and /home directories have the same
inode number but on different filesystems.

This means that test-openat fails with "Recursion failed!" even when run
without pseudo.

Let's consider both the device number and the inode number before
assuming that we've found the same directory again.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 test/test-openat.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/test/test-openat.c b/test/test-openat.c
index b710285..df6655a 100644
--- a/test/test-openat.c
+++ b/test/test-openat.c
@@ -25,11 +25,13 @@ int main () {
     int fd, dir_fd;
     struct stat st;
     ino_t ino;
+    dev_t dev;
     char *path;
 
     fd = openat(AT_FDCWD, ".", O_DIRECTORY, 0);
     fstat(fd, &st);
     ino = st.st_ino;
+    dev = st.st_dev;
 
     while (1) {
         path = path_of(fd);
@@ -37,7 +39,7 @@ int main () {
 
         dir_fd = openat(fd, "../", O_DIRECTORY, 0);
         fstat(dir_fd, &st);
-        if (st.st_ino == ino) {
+        if (st.st_ino == ino && st.st_dev == dev) {
             if (strcmp(path, "/") == 0) {
                 //puts("Reached top of tree");
                 return 0;
@@ -49,6 +51,7 @@ int main () {
 
         free (path);
         ino = st.st_ino;
+        dev = st.st_dev;
         fd = dir_fd;
     }
     return 0;
-- 
2.32.0

