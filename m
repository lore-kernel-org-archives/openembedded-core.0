Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.428.1600445746422245678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 09:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VmUgj/HW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id l126so3753388pfd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QpAPm26ryCSvMb2lhV0bp0S4uC7nMvC1uje0BEx2E5k=;
        b=VmUgj/HWTRge5OebU4Ai9ZpluRRnZfUIqWD4mSs2f130C/pdfHjmQv3aqxCitd7bVz
         3DDuyQVkrxEcXv87LJKXzEtol2b2p2At96yUUFsEKPGOiEEw+/a1OTsdQotcW2ZARb6i
         jjXvXWbHrjtVZxCwnOxz3aSANKgxALGp3yNq+0xoO8v/K5HgNwq5jaQ6jWZJyfjj23J6
         B7SOURW6yIGUVPe91IjVfQqgCvqxEMU/WDKVjwe9YzHjlcg57dFqiVvu5wNqqyBW9bPV
         JVQwcKBy/SnJHB1WORrEhWbSFkLnMAvV5b2K/T87BwVimoANBpVjiGn5J1KczKA7/HmS
         qiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QpAPm26ryCSvMb2lhV0bp0S4uC7nMvC1uje0BEx2E5k=;
        b=nD+smJ3xy1AU7rcibK2tZcrig/Lm2f+eenmZ3ItA40VJbPzXAyhDHhroy97SYBMD8s
         DcW8oxm5fIzVIb8geGHxQyy3zDczh0qfzU14f5T1Q2v37a2z/3xcNY4mJxQynRrY3nit
         spCP1K2/djRoy+xE1kCMz2IMeyxKBjd7yHSv/gSRDohSYtQixbvNvtAnD3WBPk9fLAxT
         dJwagcZ4FnyM1OfyogHimIcAV2Q86mVmoUVojwDPTZ3Yj7lmJYaWcbsIKjTg+hjQwwRQ
         8VhPAQ8Iy5kMHoe+BNDq0ZTVItRAw+MSkjr57GEhPw0tEh3/srecC39PwYZtG4MWhJax
         F8kA==
X-Gm-Message-State: AOAM532MWbW2UUo6rZsKwuPJgrcnqAOcE1jeciJ0JeVgxt+BwNQ6N1Vy
	+FC6HsSeUWNLfPe6wanuRUEfvXHUdcOn0AJeIXU=
X-Google-Smtp-Source: ABdhPJybTqoC5ou2YpHkgoPC27eGFiixuFh7qzq5hz8M3erZ1l5ogo3dHHXYhH08b9eqCC9hnxEkVQ==
X-Received: by 2002:aa7:93a2:0:b029:142:2501:39f4 with SMTP id x2-20020aa793a20000b0290142250139f4mr16380017pff.67.1600445745509;
        Fri, 18 Sep 2020 09:15:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15sm3260100pje.29.2020.09.18.09.15.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 09:15:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] Revert "kernel.bbclass: run do_symlink_kernsrc before do_patch"
Date: Fri, 18 Sep 2020 06:15:15 -1000
Message-Id: <a6a9913575aab96f4347bdf979e26115aa0fd716.1600445624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600445624.git.steve@sakoman.com>
References: <cover.1600445624.git.steve@sakoman.com>

This reverts commit 914d8a00e34a8edf75a349da6f5978e4ed60e6d5.

Due to bug introduced for externalsrc

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14044

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9eb9bd2844..9e3c34ad48 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -152,7 +152,7 @@ python do_symlink_kernsrc () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-addtask symlink_kernsrc before do_patch after do_unpack
+addtask symlink_kernsrc before do_configure after do_unpack
 
 inherit kernel-arch deploy
 
-- 
2.17.1

