Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.25194.1591602533102385786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P/Ql9i0q;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id m21so12563340eds.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4muZ+xYb31yczWG6QW+/3i5mhQgjkQIA7M9r0UoFTro=;
        b=P/Ql9i0qfS18WKvOlMnj1M58rY9YkFy4CfOlyY86IqF7ffMno7xW9YW/cCPgike5iM
         kqtt2pYIBuBn/oywUe3gGF4NtOmTUBkx+sg2dqpaeXfXau9zwmezNcag9hT6lwfzO4B4
         Z14ZYvYYMMSmitgVluAStbzqyzuqf1G0eoAzNYjOEHnINvh0PFmi+cCwcDQXuTmIKsGy
         kQvcSt0RcxdYsDHPoXqnCAyZwQOyUPpeMEUXBL5B17GbrVEuJ43QBCVtZM5WeOoCc4QY
         ZwApg4derF+H9giJJ4YjKKZciLMfZaqBXEgwjwx6Y27v0oUYGfCmUN+25wcFZauu8i8a
         uI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4muZ+xYb31yczWG6QW+/3i5mhQgjkQIA7M9r0UoFTro=;
        b=B2Ec5Q78StQ5BcD6wKKZubtCGIRsFXjqle405m5cA9Pi6/r/nDOPz/CkOk2JdJUIni
         /xKcJTbVihQo+varg6Pti5IKJbGc9ZsusPfNS3Pp9mDhGAHIC+ru4cQqa4219F2IkbE+
         n3Fjy6uMueTpkIBdeq3QLElhckpw2IcIS4QSJHMSg8d/f/0O4WiFb/jl1bYVLB+ToYmV
         RrLEgcZoDlxPBq6xOf2WS/ZPyhehnZQQlZimkzVVdkiZeY5JV/xJgJPkyY05iNdb5jcY
         Ak6XYrkLSQMZUgp0m261rPmtPruI6Cb0Kx7Krwn9A8cWJn1b0MEpA9bkzvqzK0+dk2aI
         mprg==
X-Gm-Message-State: AOAM5316lTNzUkw8jt3gpO6qg7sdlPTW9OeNptAoN/foD49Ag0iQy6tC
	skVYZ38gZ8k1V++Dgo4wSC5hJQnZ/gg=
X-Google-Smtp-Source: ABdhPJy7E3BAJoPFuT8E3qWdooCarYugMqUc4BxILJDxKR67rzeIJQVaAAFRF9XOtGOP/Ia16DGSZA==
X-Received: by 2002:aa7:d0cb:: with SMTP id u11mr19934359edo.381.1591602531468;
        Mon, 08 Jun 2020 00:48:51 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 42/42] build-sysroots: add sysroot paths with native binaries to PATH
Date: Mon,  8 Jun 2020 09:46:59 +0200
Message-Id: <20200608074659.7051-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

staging_populate_sysroot_dir() collects postinsts from the sysroot
and executes them. These postinsts, in turn, may call binaries that
are only available from the sysroot. This works fine with recipe-specific
sysroots, as all necessary paths are already in PATH, but breaks down
in this recipe which imitates the old global sysroot way but doesn't adjust
the PATH to include the binary paths from global sysroot.

To reproduce the failure:

$ bitbake docbook-xml-dtd4-native
$ bitbake -c build_native_sysroot build-sysroots

...

Exception: subprocess.CalledProcessError: Command '/home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status 127.

Subprocess output:
/home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog: 5: /home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog: xmlcatalog: not found
/home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog: 8: /home/akanavin/build/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog: xmlcatalog: not found

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/meta/build-sysroots.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index 7a712e2f38..ad22a75eb2 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -20,6 +20,8 @@ deltask populate_sysroot
 python do_build_native_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
     nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
+    import os
+    os.environ['PATH'] = "%s/bin:%s/usr/bin:%s" % (nativesysroot, nativesysroot, os.environ['PATH'])
     staging_populate_sysroot_dir(targetsysroot, nativesysroot, True, d)
 }
 do_build_native_sysroot[cleandirs] = "${STANDALONE_SYSROOT_NATIVE}"
@@ -29,6 +31,8 @@ addtask do_build_native_sysroot before do_build
 python do_build_target_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
     nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
+    import os
+    os.environ['PATH'] = "%s/bin:%s/usr/bin:%s" % (nativesysroot, nativesysroot, os.environ['PATH'])
     staging_populate_sysroot_dir(targetsysroot, nativesysroot, False, d)
 }
 do_build_target_sysroot[cleandirs] = "${STANDALONE_SYSROOT}"
-- 
2.26.2

