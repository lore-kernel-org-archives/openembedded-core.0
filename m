Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.352.1611586357935760008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nOe2LeEJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id n10so9025591pgl.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mR94WhzW8B1tc+7biAk75UvSNmPpztNsXHYDFrlzgHw=;
        b=nOe2LeEJpeYMLJThfUKTG6vpWfRUAhIpje7DZcTrKZ7rAZaf+7y/hoPvxzbJGKw7QR
         hdEPHE6Um37D1DwP4dW0pps0d3cRwMmJ/aiAIWQfOPJGJ74W3ZWFSgGuUP8cwt3ubzve
         p0ttSrHPl988tHf6kwU6k7/s6R78VyFoOV7KHJCL3Z3GhsklUQ2ZTUq17hAY7aCOQLqw
         8xqnxpuEBphhD2B1AjWyFM1kjXjmb9SejrE8UXb1WyQRGxKnHHjomSCkIKTLEjGsrhsj
         e/wSQ5v85fFVGiSq90gJ0oJcuTzuxpzp0ZIn4mUR7oGY0sQ9QIwK+NvamNN0i0DJaIvu
         lS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mR94WhzW8B1tc+7biAk75UvSNmPpztNsXHYDFrlzgHw=;
        b=nzKddDSJF7CxeSK6P9G7mzyF3uXoIOhmmo0C78fnX3KzJiRMRVTpJmC3vlorAt2l62
         edoXMCDrqaz3UCbgR+MEoLKG9mXdXXOctgdZtoEYc47ITrfeQNj4hA6e2PHAj5jovPxI
         UptyNXVizn8MLW8P1/Xwpy37o0U8eEY3Zp9uqcVnkaxwsj1JSEHW2ThEUMgHxaXxqFM3
         aZBDN4fHkmrHEq/osjNHTfvD/mHsiYxRA7oDVQaHJZFqvMXT9meao35dwU6Vc5jw9YE6
         TNs7AAYhu4coEAr2E0OmQjF1cykYUoimCaAbSpdP4gJWznnn99S3W98gKzp+R1/NIkLu
         VW7w==
X-Gm-Message-State: AOAM531LK93VsfSapMXk7qHYafDaSz11g6Wqg+nMojP+V1pXQfCvuogp
	IJoO2Lr5HPTIwnpDQi+SK5W10DEJdRQjZTNsaIQ=
X-Google-Smtp-Source: ABdhPJzo40/avls/1G5WTnrjJYmfYUQebbPjDWE5owS398KK4xbTII5Rih3dP3et82j4b9NjKbFMFg==
X-Received: by 2002:a63:a804:: with SMTP id o4mr970784pgf.67.1611586357105;
        Mon, 25 Jan 2021 06:52:37 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:36 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/47] abi_version,sanity: Tell users TMPDIR must be clean after pseudo changes
Date: Mon, 25 Jan 2021 04:50:52 -1000
Message-Id: <566ff9ef5339b48a56573fcf118821ab11b2107f.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

After the recent path ignore changes, there are invalid entries in exiting
pseudo databases which will trip up users with the new abort() (proving
how common the pseudo potential corrpution is!). Inform them a clean TMPDIR
is needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 016ee90e210c9b15b80e8370d83f41a14867a413)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 3 +++
 meta/conf/abi_version.conf  | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1486cce357..cdef8e0c7d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -619,6 +619,9 @@ def sanity_handle_abichanges(status, d):
                 f.write(current_abi)
         elif int(abi) <= 11 and current_abi == "12":
             status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please delete TMPDIR (%s).\n" % d.getVar("TMPDIR"))
+        elif int(abi) <= 13 and current_abi == "14":
+            status.addresult("TMPDIR changed to include path filtering from the pseudo database.\nIt is recommended to use a clean TMPDIR with the new pseudo path filtering so TMPDIR (%s) would need to be removed to continue.\n" % d.getVar("TMPDIR"))
+
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
             status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 0a3fb307c8..251d43bb21 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -4,7 +4,7 @@
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-OELAYOUT_ABI = "12"
+OELAYOUT_ABI = "14"
 
 #
 # HASHEQUIV_HASH_VERSION is injected into the output hash calculation used by
-- 
2.25.1

