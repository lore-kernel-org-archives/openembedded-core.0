Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web09.16682.1606470174261863165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 01:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cQRX3cD0;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id r18so5260944ljc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HTb0aBXdMhLbDjJAMgIAoTEUc6NIKJDtv2HDlBMCahw=;
        b=cQRX3cD0GCZcqYxlX+0bAig9A+8bXDBXiB1iatB/VoG5hNkcUB9KpZB8BcdJrvA6kP
         2XOxWbekaYxWoWxYMMP7SmHckfrwk0YD/mUZ9LEKKUZ9ygp640bW5l9H0ZMO+Yr1KU8b
         FxLs97rYz0P6ox4zfPmhERWj077Z8RP2+dQbdRJA9K3Hkfhhqeo24Gn+aJ4gzanpNAgx
         V6uiWq/V5GKn5WjLG2+FMaBwUyK2H5WkCyMuXgl9wTjJjYDpzyWfA7VxK/Ur8bbpcx+t
         NSafUYMvqO1HrNTHszHmrpfgnBpVR/WhNFevsnkLL/UWSQ9zsR2gOS+y95m9GtW2epG2
         /4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HTb0aBXdMhLbDjJAMgIAoTEUc6NIKJDtv2HDlBMCahw=;
        b=GJd06uF2SCRXKhU0+TZ+HFC7PYhzSV+vmigSnkZzCjyDO7RIA/8QqIcEVSWvlLR595
         KKublNzcwWlHQngMaArKZ29d4GKNrQO64eDe/kvP9hUd5pQ6FkLEVhRNfuQzf+SWKXXt
         OzSt0qug2fywGecV0AvEiZKlj18NVoVjDQgfyOLjZdR58/Smn6A2O+PS4Zew8U46saZy
         /TPEFOXmteT1JFAk75+cOdDDxOGjuv87FGhipxkHdSfA0Oe67cVW2YdxYjuk1g+6L+qZ
         JYZab1JnuE4u4uwEfRhOQ1px7W2Fsjlb9xaj1CWfkH9R8YnVLrJiu6zQNZ0Fu+Mi+XiY
         PIow==
X-Gm-Message-State: AOAM532489gVomyV0QfBvYQsBuuGKKZQ/TPWZ5ddAqefNoJdtPeI6XQf
	DGZaG4CvvpLrKi4amNMVOPMuuJwiatHptPgjKeo=
X-Google-Smtp-Source: ABdhPJy96m7BieWVyJGTuDPwXQSRdgcBkBqZh919d63ZxRSIwD/RIRpUU/AtDgr3iLdVwC18dwZAXQ==
X-Received: by 2002:a2e:a408:: with SMTP id p8mr2845400ljn.411.1606470171347;
        Fri, 27 Nov 2020 01:42:51 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id m8sm476225lfg.134.2020.11.27.01.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:42:50 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [pseudo][PATCH v2] pseudo_client: Print PSEUDO_LOGFILE path in abort message on path mismatches
Date: Fri, 27 Nov 2020 10:44:55 +0100
Message-Id: <20201127094455.18760-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logfile path should be more visible so it's easier investigate the error.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 pseudo_client.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/pseudo_client.c b/pseudo_client.c
index 116d926..ea9d551 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -1965,7 +1965,9 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 		if (result) {
 			pseudo_debug(PDBGF_OP, "(%d) %s", getpid(), pseudo_res_name(result->result));
 			if (result->result == RESULT_ABORT) {
-				pseudo_diag("abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.\n");
+				char *local_state_dir = pseudo_get_value("PSEUDO_LOCALSTATEDIR");
+				pseudo_diag("abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.\n"
+					"Check logfile: %s/%s\n", local_state_dir, PSEUDO_LOGFILE);
 				abort();
 			}
 			if (op == OP_STAT || op == OP_FSTAT) {
-- 
2.29.2

