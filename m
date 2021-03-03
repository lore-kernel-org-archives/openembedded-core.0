Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.6284.1614777092435948653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b1DEj+XZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id w1so42107601ejf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 05:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SsVa9pJwCiS6KjvgVvkxv1CT0MOZKdmcIiFvZxdZJWQ=;
        b=b1DEj+XZxF9/NNZhRk7j4xekJfvlRFwxD087X5NvDQpUZCSo2wBW6ZfsLg9EqEIRMN
         2TjZKgSot8yugXxtPfbCo2LGJVGXW16xI8nPTJkip6Pshh+Fn1mdl9NjJzD9N2bleYZa
         6LQm38ngnjcnB0cVPZK2jmOB/05tVFVn9ES59xjYKja9wLcNxq8T979HzT9VpfAFRVDf
         IISn13TKqNfMJhkKD0E86c4qGilijVu1qo5XmNtQ0RXzyE4dQXPyx5gNpg2A95ROm8WY
         WicXcpACt+ib1a3172StGeojFll+uz+W1vcRzf1Hz5obn+gLg3TziMsE3jJeqxwYG93q
         YECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SsVa9pJwCiS6KjvgVvkxv1CT0MOZKdmcIiFvZxdZJWQ=;
        b=eqx+GQvECX8fhtDPkX9CcmnrbVBzPlqpjFFS0zWJKlVNUWJH/ddezhaTJsJJITP7Ek
         PntdVIjMuFxifdiNcbars3Q5VY6FFO9cdnzIp3WGd01ImhG39bviDaJfKELy5jvtNINf
         wgYOo+jtoa/19rcdQDjgRkXGUBj/5e5Jm8JusA1iuddsf8vSoJNs/QQpMHQG2+tdtB7e
         Wsn7p+/SrMN9fkrJA/xkr3UIC3NAZtBL7RRHXnpffnIMsEyllIQXfj3U2nJoBBkFTse/
         +bIKT3imO+3Enx5ZBl3+UeNAOnYBbGyZm1ChfF6EF1QirfNNJ81P4l7cACnZtQhLjEzk
         2dbA==
X-Gm-Message-State: AOAM532u1SgSTdhlk/XnV7dCWtKsViJ0jQvY1K6xF7LW6p9deXpNbxjc
	DZiEe1qmtImNwOiaKWspFr1h/N0Ey0bBXQ==
X-Google-Smtp-Source: ABdhPJwOi6iXDpRbdwYM4PBH3gISS/6xCY2D7Z5eOF8L5M4h1yb7A1/gRcAZqDa/t6Or6BJ19NPk3g==
X-Received: by 2002:a17:906:a147:: with SMTP id bu7mr25080215ejb.383.1614777090904;
        Wed, 03 Mar 2021 05:11:30 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([5.28.91.120])
        by smtp.gmail.com with ESMTPSA id w18sm19472472ejn.23.2021.03.03.05.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:11:30 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/3] oeqa/weston: correctly run wayland-info when systemd is in use
Date: Wed,  3 Mar 2021 14:06:41 +0100
Message-Id: <20210303130641.604699-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210303130641.604699-1-alex.kanavin@gmail.com>
References: <20210303130641.604699-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under systemd weston's socket is in /run, not in /run/user/0.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/weston.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index a1c7183213..b3a7c2776d 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -53,7 +53,11 @@ class WestonTest(OERuntimeTestCase):
 
     @OEHasPackage(['wayland-utils'])
     def test_wayland_info(self):
-        status, output = self.target.run(self.get_weston_command('wayland-info'))
+        if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
+            command = 'XDG_RUNTIME_DIR=/run wayland-info'
+        else:
+            command = self.get_weston_command('wayland-info')
+        status, output = self.target.run(command)
         self.assertEqual(status, 0, msg='wayland-info error: %s' % output)
 
     @OEHasPackage(['weston'])
-- 
2.29.2

