Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web12.36661.1598811498251030677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Dul7x9rI;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id c6so4682213ilo.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2iNBujT0gTgf5eZhw7brpiI3DYc2V3K0lYiszrKJNKA=;
        b=Dul7x9rI5cnBhi9Oipy8926hx0D+2mn0DI/pIJIu1Hhh4ONMS17GxszX2TBYzEUZko
         LmNqLzjc3QxQB8GGR3fvhwHrNgmV85pQ1/kKAyJeWFpti43fLcO9adwl9ohAO/VbtBqS
         lCctT5ZK8dLJkq1E/X3gHzYf7SjSQD19k4iVvUJTmcwJgLA0SKRxofP5JeL1kh5BY9HO
         GE0pYxyBkQDIAMk8BH1c9j3h5+jZW3YmQiEZtQ1PLC03G0U+7hUjHfadspoSA/P4+Uw2
         0k3DNSG9Y1eJj8B+cFsVvrruhtCu8Q1PADT7GGOJNgtNb1dcLp+DVZ1l5DBMuUeqKTdC
         ugRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2iNBujT0gTgf5eZhw7brpiI3DYc2V3K0lYiszrKJNKA=;
        b=IdLj4IrF0NIaKqiI5B86NR9aM7AN/m+H5MibezaA/qVLKhr8rT/POpjqsbUb+kfYgk
         POJsDV4VFx0in856MzR6iGg2F+PcX5Ptg5aO6L0pLyiF3CoqjDzTSbaWSZDCiIRR7kw/
         rlI5EczPKy+AsCdpE78lWP2qMoJO7nZ8ad+WQkKqZH1uDhv2un9PHp/zZToRE4Yj8pTJ
         ht4Nk79zxC6fwVxgcBAZRLXqcKzOL17CFqEPAWlG6ZH5RU8DpSaQffBl8UYzU9TRMBzF
         WwxwG6wNZudIIf+fUVAbHif7DrjMw8a3R8F7lnEZiNa7Q5NXqaNKQ0SRK14SmM2FxqQi
         FcdQ==
X-Gm-Message-State: AOAM530Q/4CIPdhU5WnfGkzRIGTPkQlA7jOE7rOX386dZj3KA3KVUTkF
	7jOTUxMyiMUMeOBVMm5Rg1dp/9WVwJ2kfNT3HJs=
X-Google-Smtp-Source: ABdhPJwfNc0h1rFYY/2Pqe/qSgx970C+KOdCJfApi+TdkXX+TmeR4/WTpkMVAmdIx3xhNwE0jzlsIg==
X-Received: by 2002:a05:6e02:e04:: with SMTP id a4mr6052311ilk.189.1598811496935;
        Sun, 30 Aug 2020 11:18:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/25] package.bbclass: explode the RPROVIDES so we don't think the versions are provides
Date: Sun, 30 Aug 2020 08:16:01 -1000
Message-Id: <663d6a6bc7c033b2223e1c335bf4186a1b2669cf.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

emit_pkgdata() creates symlinks for each of the RPROVIDES in
pkgdata/MACHINE/runtime-rprovides.  However this string can contain
versions which results in directories called (=2.32), so pass the
RPROVIDES string through bb.utils.explode_deps() to strip the versions
out.

Helps mitigate - but not solve - #13999.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a5395dec34192db233bfb2a060e5ccc99708f03)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2d96e646da..23ff4772fa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1544,7 +1544,7 @@ fi
         # Symlinks needed for rprovides lookup
         rprov = d.getVar('RPROVIDES_%s' % pkg) or d.getVar('RPROVIDES')
         if rprov:
-            for p in rprov.strip().split():
+            for p in bb.utils.explode_deps(rprov):
                 subdata_sym = pkgdatadir + "/runtime-rprovides/%s/%s" % (p, pkg)
                 bb.utils.mkdirhier(os.path.dirname(subdata_sym))
                 oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, True)
-- 
2.17.1

