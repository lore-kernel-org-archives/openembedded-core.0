Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.16228.1606465917242621208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 00:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HeNxktzg;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id i17so5050013ljd.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 00:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HTb0aBXdMhLbDjJAMgIAoTEUc6NIKJDtv2HDlBMCahw=;
        b=HeNxktzgIybXVhk71veRUmEkfq5s2cxCAS2LkQOhj2NSz9cFJKaZFKeqbGaexYWPP9
         iR+USxfFuBcn7VNaFNRwzJf+itEIx5NCgRmtyeuZIxP0QvyXFoGBcXl3XzczFnrJjJWk
         mlfJG1kpVM4vpXzpBlgHXUu1oxWWf4jz1/BKwalFwg5l4Gu4nNdqKrhwoF6w1Xu9os5Z
         h4y3LP+F5n7gOnD8juDBGsuFzio5lm8d//FP8KfEmHIh39Z+jakJnqsqjiWC6Rai/fYj
         zRU4ZJoT6IuKcva0AR5tvDgAe1B2gNvO+T77RoFhnrZHSgDEnaaVdjIJy2le5ZkS2jiF
         wXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HTb0aBXdMhLbDjJAMgIAoTEUc6NIKJDtv2HDlBMCahw=;
        b=Z1UFhkaUUFjuK2asQJ4oB25UteeBgRMQoHYnSZmusy3Z5ry9res4xTwG23wAEV7Jwc
         X8vXIawJbiWCe6XJ3QBPMrbUn6CEfuaXUq0LZTtfOnS1FW1Ook2AllvcllYxnyF6YCfa
         1oulyesjqF7Lxj5J5u6dLGBR9QYEJVz898EORrtdmVd7V8C1M56vErxO3HIVwRvE6ndE
         kZ8MMUbUgFLrCRASpp869GmtbwU+tXwj18GigyQBjDkPsf4TZw04jAdReEcmzs7aTkJ5
         hO/ymFLwMZWUy96t/KK+lf8nuWQt0U023sh22pjq+cBnR+HHEpTOFPwqwlEr9TtNumJr
         9Zrg==
X-Gm-Message-State: AOAM53165rekvBFgtFjmUggZdWnSa6MkFj6zDxeT5m+5G2ZNLNlMnjat
	zEjNRqrdHhqRMI+F5XbXWc7d46oh8IDWfjFjCL4=
X-Google-Smtp-Source: ABdhPJyPRzZpU9fLslfGD8hQwFtpmqezvsRi/40u6CMOARa0aKcF83tGTw2ffd1+smsn2BCdYCKFGg==
X-Received: by 2002:a05:651c:510:: with SMTP id o16mr2900740ljp.198.1606465914825;
        Fri, 27 Nov 2020 00:31:54 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id w16sm603772lfq.285.2020.11.27.00.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 00:31:54 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [pseudo][PATCH] pseudo_client: Print PSEUDO_LOGFILE path to abort message on path mismatches
Date: Fri, 27 Nov 2020 09:32:42 +0100
Message-Id: <20201127083242.13869-1-tomasz.dziendzielski@gmail.com>
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

