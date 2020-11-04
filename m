Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web08.9460.1604471047234960773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 22:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tc9jyWn9;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id j18so16473759pfa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 22:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lj5cfdg0ZXRdYxS/BJBCtLqQkjW5vjFfHXA4VrzRh1c=;
        b=Tc9jyWn9RGQIQ1DxKmwuEfTV4GfcZLnO5pz3us65Jj6kG8tFqUtesBCQ0ckoCywIuQ
         BXHfpdqjaGj7hV22lmTu3+3zGaKqXPR4UMSZsQX0WmTfb+FCrXGu17atyzmUm4PVwynz
         8y7P/XZGeMsfwaxvNNxUUx8FS7S0JFMLIaVd/Hx01GXHDuykmRkC8LPYPO8pPiY+4JNl
         lA6YID69oZwSkt6EXA2b+/8GCMISL8v1oFS1fFmlppI6InV3RutUx3aWfid/0dWu6HWC
         ut4rLJOYP3DSa5BZr9XeLzbqeWyDj8ncyWlw6nsANHabBsG6X+R+c8ulsWrltrD7f/9k
         tWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lj5cfdg0ZXRdYxS/BJBCtLqQkjW5vjFfHXA4VrzRh1c=;
        b=WYxOmWpLN+laRbyFapjFakcN2a/SEx+HH7JqfvfVwz3qQfRvc/mQtFbr5HxYr5IJVK
         O5nmywg570wwnHlgA1m5EoIS5GWnl0GhdnpA1GK9OAkBRUwjjwetZF7X5TAPMdi1kFjv
         EJSpppKlN5HDey85oEmbwaIfWTUxszAEXCfOwhYykNpaLjUTyb9Iphf/9/5bk5Ul4xOk
         PyF7wH6qL4sLi+MI+g4/fxyyLZP8FART1NfwkRwiYAiVXSPo2xEjxyVGbdIYJrIQDGUr
         7jjDh6V5OWpVdxEEx2uaI44p8Hw0UCHDfd1jR9f1Dg04wfJxk5QDQXwKReMs2vv2tdFb
         UCEw==
X-Gm-Message-State: AOAM5332nVEKRkGz4FV53S0BM8xr1FOjFA7VNcPFG5NXPjnPb56oKfAL
	RQoXz5D9196TX1qnvI3QGESoKfCWxvMKpg==
X-Google-Smtp-Source: ABdhPJz0AIbYl5w/zCcMOD3MJcegf5lr13JMHvGqN7mdw9AvMhAsy8WMmQSQwPlR1Rq9VboGDWj//Q==
X-Received: by 2002:a63:4a21:: with SMTP id x33mr15529118pga.365.1604471046365;
        Tue, 03 Nov 2020 22:24:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id y137sm1083375pfc.77.2020.11.03.22.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 22:24:05 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] numactl: Link with libatomic on rv64/rv32
Date: Tue,  3 Nov 2020 22:24:03 -0800
Message-Id: <20201104062403.1795146-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bring a missing commit from meta-oe

Fixes
riscv64-yoe-linux/10.2.0/ld: ./.libs/libnuma.so: undefined reference to `__atomic_fetch_and_1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/numactl/numactl_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 5640173aa9..6c8a667a41 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -22,6 +22,9 @@ SRC_URI = "git://github.com/numactl/numactl \
 
 S = "${WORKDIR}/git"
 
+LDFLAGS_append_riscv64 = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
+
 do_install() {
     oe_runmake DESTDIR=${D} prefix=${D}/usr install
     #remove the empty man2 directory
-- 
2.29.2

