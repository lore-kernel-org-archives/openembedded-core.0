Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.24600.1627655361094958447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 07:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NPoyiwtt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id h14so11536534wrx.10
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uwSQf2Dcb3g2OyrihumFOjGeb/uOznVbQtW9A7E8hi8=;
        b=NPoyiwtt1rVBswyxK/XTFX4YSf0dr9e0lU8+z2aNB9QJ6VSV+3DVTmvVJqod+Fc/LI
         qagbfdxSwmBiR6L/zmh9g0yAlgZZbmwjjY9Gmtzxf4dsLJjZOxEuc47fm+SHdVhA667S
         mj8a5/FFlVFXZgZJY5t1iXIB7JI6/CecnAT7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uwSQf2Dcb3g2OyrihumFOjGeb/uOznVbQtW9A7E8hi8=;
        b=LNcZo88f/8GPz+qWLfQK/3ZJ2BIAl/7lPhwjag3TRrAYbcd+yk9gpNjoqRReeczdiP
         XotcMVYeCoVWQBkypxKCBdYVi8Emdjt2UukFsSDvKkQuobf0Ns7ek8amIxnkaqyXryQf
         SL5erv7T81U0lcVrRdI+4kgYosuESlUM00xh00srS4aBtDWllscJC7qYmwv3Z7oC3iKJ
         oKtDVfP9eqF2i0DFdAO2/HromLgH1cW0zdKUOPyDgofr0TIuWZ4V6iYlndj2O/nFUJOx
         JISprYi6B3ZFXAi+EjMVGnQ1p9FY5VbAABH7j/GoDTLLGBZigSvPBTKCl3VPjrmmX/vF
         YdLw==
X-Gm-Message-State: AOAM532dakQMYN4CdpzRsjk52gjxLOiik5zdeeqqreHQv7zqzyrLUObp
	VJm2oHR3qvALWUAQcTvh7nN0xwC3KuMx8w==
X-Google-Smtp-Source: ABdhPJzrCRoo+yA2hv5METvlEagBSZ/113m2TtovVZaI2iKhXeoBDh91gj8+LKL/5F/KYbTCfeOfEw==
X-Received: by 2002:adf:f7cf:: with SMTP id a15mr3378476wrq.95.1627655359563;
        Fri, 30 Jul 2021 07:29:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id l7sm1782696wmj.9.2021.07.30.07.29.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:29:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] convert-overrides: Allow script to handle patch/diffs
Date: Fri, 30 Jul 2021 15:29:18 +0100
Message-Id: <20210730142918.3364939-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730142918.3364939-1-richard.purdie@linuxfoundation.org>
References: <20210730142918.3364939-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is handy to be able to have the script convert a single patch file
and it turns out to be straightforward to make it do this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/convert-overrides.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index bfdf785719f..6505b18cf09 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -68,15 +68,15 @@ packagevars = packagevars + imagevars
 
 vars_re = {}
 for exp in vars:
-    vars_re[exp] = (re.compile('((^|[\'"\s])[A-Za-z0-9_\-:${}]+)_' + exp), r"\1:" + exp)
+    vars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}]+)_' + exp), r"\1:" + exp)
 
 shortvars_re = {}
 for exp in shortvars:
-    shortvars_re[exp] = (re.compile('((^|[\'"\s])[A-Za-z0-9_\-:${}]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
+    shortvars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
 
 package_re = {}
 for exp in packagevars:
-    package_re[exp] = (re.compile('(^|[\'"\s]+)' + exp + '_' + '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
+    package_re[exp] = (re.compile('(^|[\'"\s\-\+]+)' + exp + '_' + '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
 
 # Other substitutions to make
 subs = {
@@ -123,6 +123,10 @@ def processfile(fn):
 ourname = os.path.basename(sys.argv[0])
 ourversion = "0.9.1"
 
+if os.path.isfile(sys.argv[1]):
+    processfile(sys.argv[1])
+    sys.exit(0)
+
 for targetdir in sys.argv[1:]:
     print("processing directory '%s'" % targetdir)
     for root, dirs, files in os.walk(targetdir):
-- 
2.30.2

