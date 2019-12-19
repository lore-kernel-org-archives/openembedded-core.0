Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id B06387F8A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 14:53:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p17so5936825wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eh0YahltZ4IkFRQXUdJeCXSozl4x2zAjJRAwXLrr4Ko=;
	b=L9Q9HVzbbvtTXiRS+HENRNVW+PW7irpideepXT0qznQv/zWIwEqxpCQTW5Z6G/jlXW
	sNRrKPlgOXXLhnrAzDof0ms2rgGmYYFzMl+SRs8O0aOH7VCb9RDSBLFN+Gpt2bYQcU1M
	e25Fn2DfHTw8tW6Q0hAulxuZcdsjmSEerLSWGyhWI+AkALlpT8kJfHF8HrYdiwOuSOiM
	fLB8Ku+8+Owau9L2M3+D/5XbkA2n7FMxMwZ6QbXRip6KoSe1t/ZSr3w3NXDGVspm6+WA
	tkWkLFhRv+3uheOgABKY5oLYAo7evsj2UpxkJ2zhxOcEPu6ZOzZTvMfFct9CpFumr709
	wcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eh0YahltZ4IkFRQXUdJeCXSozl4x2zAjJRAwXLrr4Ko=;
	b=pWGPTjXdHphI5wEwcLQx6472G09spPDB82YFxPk7CJ1XXVh7KAxqUbXnLcIuF2i93A
	xf0rAv4I0VZ2Py7+/7f57dF4dUa41iMiD6PNtGROWW1BeoPG2+eKvgC+VhqlU4zt9i2I
	ABoBLLAPS/F+BLlLvBLxgQzc/Ir15dYROJ3L246Mvn/BSzSdU4GYoG81kdze4/29EFSq
	yZrrNmGmZzSrY3TpN85F8vwaZP7WaxRw4CxpIPFqG9+EugyTJr1BFa3X++kPu82hKPGA
	pm6M0GB2w0hYlP20PAPW8eeOmG0r+VXuU/u3dMl1WqngHN7B9Nc2Yu5/XZT1jahe6aGf
	eqjg==
X-Gm-Message-State: APjAAAUdLmH4JRiqmUBTXkcuHCrHUTdCpupH3ZFpMdcTje4X4dv07r/7
	pCNvSgLzQ8umlt98sIhSpTD6K3pawJk=
X-Google-Smtp-Source: APXvYqy27acgiexS2pWPd+MSPjDfVW+79qyTF6E8GN539E0GBkkCmkBlCF/XvALKjadAUVQzz7nINw==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr10680036wmj.47.1576767229787; 
	Thu, 19 Dec 2019 06:53:49 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	u13sm6378445wmd.36.2019.12.19.06.53.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 06:53:48 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:53:21 +0000
Message-Id: <20191219145322.31083-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] bitbake: fetch2/wget: checkstatus: cleanup URLError exception
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
X-List-Received-Date: Thu, 19 Dec 2019 14:53:50 -0000
Content-Transfer-Encoding: 8bit

The exception for urllib.error.URLError can only happen on the

  with opener.open(r) as response:

line.
Limit the try except span to this line and move the retry logic of
commit 312f1a5e741 outside of the try/except catch

see also commit:
  312f1a5e741: bitbake: fetchption: attempt checkstatus again if it fails

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>

Change-Id: I72fd4dd663412660632e4c5d3bfac0f4282270e2
---
 bitbake/lib/bb/fetch2/wget.py | 60 +++++++++++++++++------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index 90aa9b190a..180fe9aacd 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -375,42 +375,40 @@ class Wget(FetchMethod):
             handlers.append(urllib.request.HTTPSHandler(context=ssl._create_unverified_context()))
         opener = urllib.request.build_opener(*handlers)
 
-        try:
-            uri = ud.url.split(";")[0]
-            r = urllib.request.Request(uri)
-            r.get_method = lambda: "HEAD"
-            # Some servers (FusionForge, as used on Alioth) require that the
-            # optional Accept header is set.
-            r.add_header("Accept", "*/*")
-            def add_basic_auth(login_str, request):
-                '''Adds Basic auth to http request, pass in login:password as string'''
-                import base64
-                encodeuser = base64.b64encode(login_str.encode('utf-8')).decode("utf-8")
-                authheader = "Basic %s" % encodeuser
-                r.add_header("Authorization", authheader)
-
-            if ud.user and ud.pswd:
-                add_basic_auth(ud.user + ':' + ud.pswd, r)
+        uri = ud.url.split(";")[0]
+        r = urllib.request.Request(uri)
+        r.get_method = lambda: "HEAD"
+        # Some servers (FusionForge, as used on Alioth) require that the
+        # optional Accept header is set.
+        r.add_header("Accept", "*/*")
+        def add_basic_auth(login_str, request):
+            '''Adds Basic auth to http request, pass in login:password as string'''
+            import base64
+            encodeuser = base64.b64encode(login_str.encode('utf-8')).decode("utf-8")
+            authheader = "Basic %s" % encodeuser
+            r.add_header("Authorization", authheader)
+
+        if ud.user and ud.pswd:
+            add_basic_auth(ud.user + ':' + ud.pswd, r)
 
-            try:
-                import netrc
-                n = netrc.netrc()
-                login, unused, password = n.authenticators(urllib.parse.urlparse(uri).hostname)
-                add_basic_auth("%s:%s" % (login, password), r)
-            except (TypeError, ImportError, IOError, netrc.NetrcParseError):
-                pass
+        try:
+            import netrc
+            n = netrc.netrc()
+            login, unused, password = n.authenticators(urllib.parse.urlparse(uri).hostname)
+            add_basic_auth("%s:%s" % (login, password), r)
+        except (TypeError, ImportError, IOError, netrc.NetrcParseError):
+            pass
 
+        try:
             with opener.open(r) as response:
                 pass
+            return True
         except urllib.error.URLError as e:
-            if try_again:
-                logger.debug(2, "checkstatus: trying again")
-                return self.checkstatus(fetch, ud, d, False)
-            else:
-                # debug for now to avoid spamming the logs in e.g. remote sstate searches
-                logger.debug(2, "checkstatus() urlopen failed: %s" % e)
-                return False
-        return True
+            logger.debug(2, "checkstatus() urlopen failed: %s" % e)
+        if try_again:
+            logger.debug(2, "checkstatus: trying again")
+            return self.checkstatus(fetch, ud, d, False)
+        return False
 
     def _parse_path(self, regex, s):
         """
-- 
2.20.1


