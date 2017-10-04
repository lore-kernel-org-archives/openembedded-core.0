Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 164E06FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 13:13:27 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so9242447wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=pyR7ua5dHbykbq5vDq/v+v7v5XzH2N2DNU02Lehzk2k=;
	b=uV8ELZBgwlzLjnrE3WlIvB/fO14BVtRoikoE7CLGNhwvTW+hxmUa88JQ3O8wafUh4k
	N2k+U1aYKZclESeUQqyqB8m0Y6RrCqdhCMUGHvOgigdd8eIob3UKLrbzceQDKzEQtyyA
	yVr4EcYyFbQo5F4YggxvA49EE7ZSa7a4bXtrPselLFnv4QYn5PBp4Lje/kSUWieGZSB0
	/mW3IuWC+BncmuRD/LfEAHy+XmxF7tsXR+dW0PUXgxxD222I9c5C8oTksXK+TIJi74xM
	ttyj7sk2JekG+bZA9JfFmyQt7YVOsOyWlsZEbpHgsGcDxhm4sQ619MLyJRHZdAIOg/Om
	0ooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pyR7ua5dHbykbq5vDq/v+v7v5XzH2N2DNU02Lehzk2k=;
	b=a2lOtHJUO2pSBGjcCdDvfOBHB+hwyTtmUI4tmh2zNQwR7aEyfkn0iCzQ4hX9S/bsTs
	BA2econMpI8MELPpoH09sPSgWUepDAw7GULf5/ho/mLR2R4XvRUXgTBSs8l51wkb+urQ
	4OZpBbiWkw+G0TnVG4eRZUtsdgd25RGgzBeS7ikrhMxLuJvTpDzXLMxGgyNRoq3B2jn8
	IQQezqtPqZC6GTvq+osXwV1A7JMcrpE1vLGJ/JoZ0O3TDUBZe7Xzj4HUc8RYpjyKUdGJ
	xQpA5qrQWbKKJYh8qBnMuaMbxW8AAtR0CwJOPS36KswOOx02Jllh8SiQG/cQZP7l3bqL
	W7zw==
X-Gm-Message-State: AMCzsaUOrDOlyWQY5As7nG3mglQYZ9+UyDu8K/1wTvie4MsxqPJho7KI
	6OIU+LTujnlGm+LR0Zg3YauT9nVb
X-Google-Smtp-Source: AOwi7QAukLa8JFpYYyp83G88Af6IQG1kzu1xGJdJvye11WC19XsBukpUkFGPUjcLPVArVr9cWq8XPw==
X-Received: by 10.28.152.5 with SMTP id a5mr8133181wme.131.1507122808269;
	Wed, 04 Oct 2017 06:13:28 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 9sm15225847wml.24.2017.10.04.06.13.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 06:13:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Oct 2017 14:13:25 +0100
Message-Id: <20171004131325.26620-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oe-pkgdata-util: add unescape option to read-value
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
X-List-Received-Date: Wed, 04 Oct 2017 13:13:28 -0000

Some fields are multiline values which have been escaped, so add an option to
unescape the \n and \t.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-pkgdata-util | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index a690870b1c5..c6fba56c89b 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -197,6 +197,10 @@ def read_value(args):
                 # PKGSIZE is now in bytes, but we we want it in KB
                 pkgsize = (int(value) + 1024 // 2) // 1024
                 value = "%d" % pkgsize
+            if args.unescape:
+                import codecs
+                # escape_decode() unescapes backslash encodings in byte streams
+                value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
             if args.prefix_name:
                 print('%s %s' % (pkg_name, value))
             else:
@@ -552,6 +556,7 @@ def main():
     parser_read_value.add_argument('pkg', nargs='*', help='Runtime package name to look up')
     parser_read_value.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
     parser_read_value.add_argument('-n', '--prefix-name', help='Prefix output with package name', action='store_true')
+    parser_read_value.add_argument('-u', '--unescape', help='Expand escapes such as \\n', action='store_true')
     parser_read_value.set_defaults(func=read_value)
 
     parser_glob = subparsers.add_parser('glob',
-- 
2.11.0


