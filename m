Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.1338.1599497015482876288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j+cQFoZ9;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id a17so16409834wrn.6
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GcAiSJXgfqv6SQrhuXwAdpcnlVmGyJvpyh0Eq8hVU4s=;
        b=j+cQFoZ9kDqhLGGSutEIUq4iXhUhc482/lYqlYKIfCVJDWX2uic16Im26hmJw2Vocn
         vYV3qKRP7rbquLb+V7hEJues74b9Gq3Quo7fbr55K2C1RmgMz6zJP1DHh4Z3nVvA77Zf
         8v8RF+nnJzS/oFhnxyL6z+jo0qi/65Wupd/hyItrQAe8q6Dk0+w1WThunIXzYb7S9Hgl
         jTSjLS++0lid2qrNBXmYfO4W87hwPTD0wBqpxmmvO0h0ElgfMKxYB7ICW30yU+EwbxVO
         7CTQ1O0S1604KQeFqkOhP54RPBFGkh6IqnBSFA0tclEhTuVux8QPpvOwOtMz+bQqfCi+
         SsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GcAiSJXgfqv6SQrhuXwAdpcnlVmGyJvpyh0Eq8hVU4s=;
        b=YcM62WrH6SrevJiN+PTzZHRtIVBj94UJXrSrYkxL1sWbRay4GHdNYpcmZNe5FAlZHt
         csWy1yBRfBOftGOJtIC0Bda89zsomlL4gldtGo0a5Ocr4eH/yRklobD/D5TZgJN9KBF3
         O6muvsWH7hSfUzFJ1GXHrzYlZHiSwgY+NnKA4C2M6HO+Qzi+YQZjl3uAJ2VaPxqF1AhF
         uK9VAimGgLo++zCy7x0BvAn54Yj3ieVYmNogqf1jQkpP/zaP7Cu7rt4A43SOtCq/LOpH
         FRhG75Zn+TMdd+zgUQfTmmMHCMiz2Q4RLTFzYKnGY6tKk8z2lH55VIAkWPXUif6nTD6M
         XP0Q==
X-Gm-Message-State: AOAM531IIHBFcbdXAicx9d7XupusL7iafgSKwe7siHq5QG/dlwcs+UDj
	XeJGIh2Iu0echEoM1VfyuVubCKvCJNRTRg==
X-Google-Smtp-Source: ABdhPJzZvfdjRAIr4wkceTiuqcIGjSGqIDCn7XLXyEuHg/wKywXBt6VlZfGs8OlES/4rPeUZuBabyQ==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr21722258wrp.387.1599497013561;
        Mon, 07 Sep 2020 09:43:33 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id d5sm31538429wrb.28.2020.09.07.09.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 09:43:33 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 2/2] oe-publish-sdk: add --keep-orig option
Date: Mon,  7 Sep 2020 18:43:14 +0200
Message-Id: <20200907164314.888439-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907164314.888439-1-adrian.freihofer@siemens.com>
References: <20200907164314.888439-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support publishing the sdk-update as well as the sdk installer in one
go.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/oe-publish-sdk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 19a5d69864..deb8ae1807 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -94,7 +94,10 @@ def publish(args):
             logger.error('Failed to unpack %s to %s' % (dest_sdk, destination))
             return ret
     else:
-        cmd = "ssh %s 'sh %s -p -y -d %s && rm -f %s'" % (host, dest_sdk, destdir, dest_sdk)
+        rm_or_not = " && rm -f %s" % dest_sdk
+        if args.keep_orig:
+            rm_or_not = ""
+        cmd = "ssh %s 'sh %s -p -y -d %s%s'" % (host, dest_sdk, destdir, rm_or_not)
         ret = subprocess.call(cmd, shell=True)
         if ret == 0:
             logger.info('Successfully unpacked %s to %s' % (dest_sdk, destdir))
@@ -119,6 +122,7 @@ def main():
     parser = argparse_oe.ArgumentParser(description="OpenEmbedded extensible SDK publishing tool - writes server-side data to support the extensible SDK update process to a specified location")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+    parser.add_argument('-k', '--keep-orig', help='When published to a remote host, the eSDK installer gets deleted by default.', action='store_true')
 
     parser.add_argument('sdk', help='Extensible SDK to publish (path to .sh installer file)')
     parser.add_argument('dest', help='Destination to publish SDK to; can be local path or remote in the form of user@host:/path (in the latter case ssh/scp will be used).')
-- 
2.26.2

