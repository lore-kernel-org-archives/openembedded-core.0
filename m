Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 402E07F280
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 05:31:22 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id v4so861712pff.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 22:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=C2Ep+QIHf3rlZNRK0Oi71adLRk3y1MCUQJ6u94iMZok=;
	b=khql2KOZCdgjotvi+rkYH4o5B7SZTYAew89cH83yMAu0masC1tnsg4XdIEXXS+wbyK
	keGo0KxrcIQxH4H+KW2fEr4qNE8B/rJRZTRyRmvAaXZOZ2GOOl8OgVdxp1UkIKwoVDQ6
	5KjJLkl2QWUDNcimYMCMzYkxi6+EjhMb38FpwbxTdfuHy+NmJc2AW+xejVo6H/po/3z6
	qjKR4xKWLLp4Bxi/MkXZSksdEPr+/RiBqjCnSRoe09EXFl21NJs0WCR+MLjlfcUlH4lM
	U8Bw/WMaBpKSBknxRevKgH3P14MLMJR7tvDmf7mY/53yc0SOk4TQdwBlVXIiCrY7SnK8
	yVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=C2Ep+QIHf3rlZNRK0Oi71adLRk3y1MCUQJ6u94iMZok=;
	b=LU2IyantEbExyA84eOzwawMcRvVutFUUQ3PkLeAwZrl6jN26HTH4eeS/UngJ3oecj/
	DBvEpmkA8clJRs8y3xnm0MlZ3+738YLXCzRbdY3tSgywypEt/IraTHKVVssuECLzx94k
	SDybOJjidgEhLtrvhyF1bSR53sNIN0OzJngqJ3ykO+w7MHMJBFmXSeVIKClphUmB+o7h
	vIbkNpJKLnhNBMOGmqgGg6hyIaoF4Hta2HWfOXLg6S6NEnoDbncKTqt9ObNbwpOx4ohL
	/VBspqkLek0az8FtgeH/i2dCKF1As3/MERtIM5M5ShovbTebA8lpxLlk7ZUgt9f7MVvR
	Vc2g==
X-Gm-Message-State: APjAAAW4uCJvChpnPGmYtDiRTw9iuj/Rba4rGoDsN1A7IrJSSYog1Ab4
	vOuqObHF02rGkOpPWmM02BJDng==
X-Google-Smtp-Source: APXvYqxY3VL5JhBmR4tgAxPGXyUgieclsF8B3V9ghOINUuZ9kxL7KNvJnpSyuj0vHvqWR/1lRFTbjw==
X-Received: by 2002:a17:90a:2e06:: with SMTP id
	q6mr7670663pjd.139.1569562283218; 
	Thu, 26 Sep 2019 22:31:23 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.51.94])
	by smtp.gmail.com with UTF8SMTPSA id
	e1sm3520831pgd.21.2019.09.26.22.31.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 22:31:22 -0700 (PDT)
Date: Fri, 27 Sep 2019 05:31:08 +0000
Message-Id: <20190927053108.14495-2-nathan@nathanrossi.com>
In-Reply-To: <20190927053108.14495-1-nathan@nathanrossi.com>
References: <20190927053108.14495-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/core/case.py: Encode binary data of log
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 05:31:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Do not decode the log content into a string only to re-encode it as
binary data again. Some logs might un-intentionally contain bytes that
do not decode as utf-8, as such preserve the log file content as it was
on disk.

Handle the decoding on the resulttool side, but also handle the failure
to decode the data.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/core/case.py            | 4 ++--
 scripts/lib/resulttool/resultutils.py | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index 180635ac6c..aae451fef2 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -59,7 +59,7 @@ class OEPTestResultTestCase:
     """
     @staticmethod
     def _compress_log(log):
-        logdata = log.encode("utf-8")
+        logdata = log.encode("utf-8") if isinstance(log, str) else log
         logdata = zlib.compress(logdata)
         logdata = base64.b64encode(logdata).decode("utf-8")
         return {"compressed" : logdata}
@@ -80,7 +80,7 @@ class OEPTestResultTestCase:
         if log is not None:
             sections[section]["log"] = self._compress_log(log)
         elif logfile is not None:
-            with open(logfile, "r") as f:
+            with open(logfile, "rb") as f:
                 sections[section]["log"] = self._compress_log(f.read())
 
         if duration is not None:
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 177fb25f93..7cb85a6aa9 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -126,7 +126,11 @@ def decode_log(logdata):
         if "compressed" in logdata:
             data = logdata.get("compressed")
             data = base64.b64decode(data.encode("utf-8"))
-            return zlib.decompress(data).decode("utf-8")
+            data = zlib.decompress(data)
+            try:
+                return data.decode("utf-8")
+            except UnicodeDecodeError:
+                return data
     return None
 
 def ptestresult_get_log(results, section):
---
2.23.0

