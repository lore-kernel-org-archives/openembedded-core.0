Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C84C55AB9
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 23:27:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5612.1785799615532022854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 16:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BUJwelpm;
 spf=pass (domain: konsulko.com, ip: 209.85.214.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccf2360620so35020665ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 16:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785799615; x=1786404415; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNSCeonUCf8zOCjVJbBF1IfyarfoS2b+i6IjQhF5nRI=;
        b=BUJwelpmLTrwBVVuyDU4jT57SYRD6AGDxpI3loS9CyLoKn3rAhNCbW/g13mXwFyrx9
         sUsfhg51eDWERBlMZs8pgoqbdNtbfCCSBwymUrsOsjS7iYS6TjXIEhjpISfe+mj7aHO7
         GFtpP3uc1OABIrwMLD7MltISfcecbBG/MOM9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799615; x=1786404415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNSCeonUCf8zOCjVJbBF1IfyarfoS2b+i6IjQhF5nRI=;
        b=UsKvp/+iSlmJBCyb6ZCDMb1H+Wjvhi4Q9fQ8UbCdy7NevDlBYLP1KeuN/BJY/Nmcuf
         fdiBuWbzTpXIS+O4YIZv/XfjAn3z1WWXdjd/+kBxWpMG+HtM7chMXjCEggxzWO/PulWe
         R/3yb9CRlWB5YtZax0cg3o6wYEnaxJmhNs7SYKhsG7QJNQ7NCXVB9YG423YhyzXJv53j
         qckDurrICJK0sMJ4Ipj3dAOKEE9jwYzySGiQV0Hdd0TesozOHHwU327dhDE636bPR/Ms
         Z83HDreA/A3md7f3Bqb5fDApkzYec324BQUFiDOP6EiitcAn7epDKGkf+uzR1fy4lZwh
         wBzQ==
X-Gm-Message-State: AOJu0YyIq55ayXUqoiti/pb4P5F0OsUAwA3XCYGYez0S6NwL6115gUma
	Rtx3f5zLpqcF5r27qi2AM6WoB3Mz8g8WfIjnsnKbAnG8fK29ecHua51hPGAUbb8JPMz1Xw/BNIk
	Zdxww
X-Gm-Gg: AR+sD128saV8DC+2lhy9IQf5HAin0wtZfKQLsULbVZUBy5SN5N/98dCRP/yZ+dqhfdd
	23/IwYhpnugasL0MEqUTomCgQVQpfbZlMvgWTfMGyDUlw15yv3KEhkYtIc8USnBTIBkbNumeQEj
	oHY3vPoI3frN74LgYo4YRNHZvUSJBHugw7uE3WohQ0BMkDn/tfHbz3P9lSXrmEEA6HvJ1eAyr6S
	7MjeOyNyTzYvb54fpQllzr6u+TAu5CIq1KdXNL+qOM434tyqP1uzc/GKn0WEZmzqpgUL9WwQRwx
	ryPaAAY51/BuhrkTflSopGs4e5uX93GDr/FY90tlyWbDtqCnv5Fl1AWSkCACzSh3fud5WIKKbeW
	xjXdKYUHKcY3dsz7AZ0agKIP4kofDAcN9t3DZ9IvcMErBmEMURCnP0d7vsjpBNPAhXij705n78g
	pexviJvNOEpfVBPOf+uXQ7oV78bG18hUcc6TlvkrobA4cx2evIZkiGiPQuqKwxT/z5Vzblc9dyQ
	IZ85g==
X-Received: by 2002:a17:903:1ab0:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d0523bcf4bmr109547675ad.23.1785799614752;
        Mon, 03 Aug 2026 16:26:54 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6808:583f:6e91:c834])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11f99csm44342545ad.58.2026.08.03.16.26.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:26:54 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-websockets: upgrade 16.1.1 -> 17.0.1
Date: Mon,  3 Aug 2026 16:26:40 -0700
Message-ID: <42c8178788700115a1680b23402ee52df51fbbf6.1785799308.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785799308.git.tim.orling@konsulko.com>
References: <cover.1785799308.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 23:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242675

From: Tim Orling <tim.orling@konsulko.com>

For a full comparison of changes (82 commits, changing 137 files), see:
https://github.com/python-websockets/websockets/compare/16.1.1...17.0.1

Upstream release notes:
https://websockets.readthedocs.io/en/stable/project/changelog.html

17.0.1
======
July 31, 2026

Bug fixes
---------

* Restored compatibility of serve_forever() in the asyncio implementation
  with third-party event loops such as uvloop.
* Prevented the Trio implementation from crashing when backpressure kicks
  in, i.e. when receiving data faster than the application can process it.

17.0
====
July 29, 2026

Backwards-incompatible changes
------------------------------

* websockets 17.0 requires Python ≥ 3.11.
  - websockets 16.1 is the last version supporting Python 3.10.
* Aliases for modules moved or deprecated in 9.0 are removed.
  - See the changelog of version 9.0 for details.
* process_request may receive requests using an HTTP method other than
  GET or using the HTTP/1.0 protocol.
  - Previously, the server closed the connection without returning an HTTP
    response. Now, process_request runs and can return an HTTP response.
* Several boolean arguments are now keyword-only.
  - If you were passing some of the following as positional arguments, you
    must update your code to pass them as keyword arguments.
    * send(text=...)
    * ping(ack_on_close=...)
    * broadcast(raise_exceptions=...)
* Encoding and decoding non-ASCII headers in handshake requests and
  responses changed.
  - The previous behavior was undocumented, inconsistent, and didn’t match
    the HTTP specification. If you relied on the encoding being UTF-8 or
    ASCII with surrogate escapes, depending on the context, you must
    switch to ISO-8859-1.
* In the threading implementation, the socket argument is renamed to sock.
  - The first argument of ClientConnection and ServerConnection is renamed
    from socket to sock for consistency with connect() and serve(). The
    first argument of Server is also renamed. If you’re passing it as a
    keyword argument, you must change your code.

New features
------------

* websockets 17.0 introduces a trio implementation.
  - It is an alternative to the asyncio implementation.
  - See websockets.trio.client.connect()
    and websockets.trio.server.serve() for details.
* Validated compatibility with Python 3.15.
* Added broadcast() to the threading implementation.
* Made the set of active connections available in the Server.connections
  property in the threading implementation.
* Closed connections when shutting down the server in the threading
  implementation. See shutdown() for details.
* Added the --insecure option to the websockets CLI to disable TLS
  certificate validation.

Improvements
------------

* Supported non-ASCII headers consistently in handshake requests and
  responses, using ISO-8859-1 encoding.
* Replied with HTTP 405 Method Not Allowed when the handshake request
  doesn’t use the GET method, and with HTTP 505 HTTP Version Not
  Supported when it doesn’t use HTTP/1.1, instead of closing the
  connection.
* Replied with HTTP 414 URI Too Long or 431 Request Header Fields Too
  Large when the handshake request exceeds a security limit, instead of
  closing the connection.
* Reduced noise in server logs when clients fail to establish a
  connection.
* Clarified logs when process_request sends a plain HTTP response, without
  attempting to open a WebSocket connection.
* Added the reconnect_delays argument for customizing the delays between
  reconnection attempts in connect(), beyond existing WEBSOCKETS_BACKOFF_*
  environment variables.
* Added wheels for Windows ARM64 and Linux i686.

Bug fixes
---------

* Restored compatibility of the websockets CLI with Windows.
* Fixed serve_forever() in the asyncio implementation so that canceling
  it always closes connections gracefully.
* Fixed a bug that could delay or block the client in the threading
  implementation on macOS when the opening handshake fails.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-websockets_16.1.1.bb => python3-websockets_17.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_16.1.1.bb => python3-websockets_17.0.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb b/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-websockets_16.1.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.0.1.bb
index 6baa744fac..b84aa0dcef 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
+SRC_URI[sha256sum] = "5baa9bc0dfbae8c507e51c8cf1b6d4628086f7a87bbd3a9952bd5f035451f1cc"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


