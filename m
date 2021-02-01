Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web08.26961.1612139450373101584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 16:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RC2U4FGj;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id r14so17477051ljc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 16:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TvjUyHtZs2THc9jXgviudizeKQRMfWB4bpeKM1t6vIw=;
        b=RC2U4FGjoBzKgxHBVqIcN6sVTmMo8MUoZzhxiDizk0d/hu6cGVE0RO/c/0yn2LhuuQ
         iYAym4i/HcfMwS746SNoCmegq9IR0gyUeyp12XJ0pOvxWtq8SPvBEqiEiM81cXwfs0LO
         k377QJyOaboJwSHU0jKsXc4F3t5KvM2nenmpjmfOd2adk7T2W32WC7VbSCZRckl9P/Cv
         xORMErR7zQE7E8gD4NR+5v9xADPMYUiY7CdcdeMamIWjVgibv2KBsDiZRjCp2mBRCK6P
         7VsY8E7qhkUjReUeU9doUBvPugERbScPt6My16To8R28+vurKkfV/MGAGzmimbdXU6Fs
         BdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TvjUyHtZs2THc9jXgviudizeKQRMfWB4bpeKM1t6vIw=;
        b=IpUHRutytGG8b3EbncHLvpdVQuxXlRJaafBa6g2sAVijBWCChs0Gvy8mQybWvPcEPm
         r14DNeqeGeKBYMazkcdP/qEqtBxun8dHgUxpJFCxwigRr9fv4914JJ5cszCFnWuOuL1a
         Bh40q3bFN8fOUv6O3egoRYQPq6aXk3N4s99KFQEvemPC0XwtQuil6CtYfYY2LBZRY8je
         2quDhpp8izlnOWtSMMue3VM5h3w8oXQleoXrPjyeEWKfkFqd8/5IJoqrWb/cDCiNDHRJ
         ue96iZRIHKWf6zthnSzVw86YuGMdySwmA0tOATbFnvvDAuT3BE5PNOmzt71oTAMoSt5p
         cl8Q==
X-Gm-Message-State: AOAM531R6zv7/fznnrVGHrlbb0Y0t4U3llNOnVb6Vs3N/aE1kWqyO2LJ
	rU6bc6jj3GwFPRRac6XQeaG50YrCcZc=
X-Google-Smtp-Source: ABdhPJxVdinsM/ZMRgHQi2ddbbAWglxRuhM3tGAtTC2jOhPmdZv4kV4PtW2iD5Rw5KlADGcku8VLGg==
X-Received: by 2002:a2e:9c89:: with SMTP id x9mr8947108lji.469.1612139447967;
        Sun, 31 Jan 2021 16:30:47 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id 64sm2819288lfj.278.2021.01.31.16.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 16:30:47 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] sstatesig: Add descriptive error message to getpwuid/getgrgid "uid/gid not found" KeyError
Date: Mon,  1 Feb 2021 01:32:56 +0100
Message-Id: <20210201003256.22788-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If path is not owned by any user installed on target it gives
insufficient error "getpwuid(): uid not found" which may be misleading.
This exception occurs if uid/gid of path was not found in PSEUDO_PASSWD
files, which simply means the path is owned by host user and there is
host user contamination.

Add more information to the exception message to make it easier for user
to debug.

[YOCTO #14031]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/sstatesig.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index adfe2e403b..84999ee94d 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -552,9 +552,11 @@ def OEOuthashBasic(path, sigfile, task, d):
                     try:
                         update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
                         update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
-                    except KeyError:
+                    except KeyError as e:
                         bb.warn("KeyError in %s" % path)
-                        raise
+                        msg = ("KeyError: %s\nPath %s is owned by uid %d, gid %d, which doesn't match "
+                            "any user/group on target. This may be due to host contamination." % (e, path, s.st_uid, s.st_gid))
+                        raise Exception(msg).with_traceback(e.__traceback__)
 
                 if include_timestamps:
                     update_hash(" %10d" % s.st_mtime)
-- 
2.30.0

