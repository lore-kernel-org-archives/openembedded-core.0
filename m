Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7292.1793976106643602057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=z6pMNajj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 600934E4145B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:41:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 367EC5FFBC;
	Fri,  6 Nov 2026 14:41:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2477B103288D3;
	Fri,  6 Nov 2026 15:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793976103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=oEOEoLTM/s0zDUMIc1edldowvW2vpmVS8tYNogPNhPA=;
	b=z6pMNajj6uz65icENJcyDi8ZSKTSG6X6nNxHreotYzaiwqrerwcyPsE3gbQB1okN4jEE7Z
	3SZ7PMzRdDxi8GyCX7Ef/Bp3WUU0+FOCg62XgiC7OahwNhUt/KrI9IQW5KSSJMwB7UqnQt
	KgDQy373IH4Q0PEC+RE3BA25dPauKr3hSL7Wf82qpNjVGqBG8UsDfXfomBbCtQJyIwlZOl
	yhfuaZN/8EV5JoEagWK05E9JsSLS7L5lTVdcmYSMs74mBkqfKt5/0mZ3tCkvFlPy/fJE5n
	5kG1XeXhyayBZLAmP858LEkU1nnTuTIt+rq6dLy3dTVDPfRZvzKzEINPMsZmCA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 0/7] curl: fix High scored CVEs
Date: Fri,  6 Nov 2026 15:41:27 +0100
Message-ID: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249655

Hello,

Not all of the backports include new test cases, but I tested this
series anyway with core-image-ptest-curl (qemux86-64) and I didn't
observe any failures, aside from one info in 3595:

(...)
PASS: 3020 - HTTP with invalid --connect-to syntax
PASS: 3025 - CURLOPT_HTTP200ALIASES
PASS: 3026 - curl_global_init thread-safety
PASS: 3029 - HTTP with multiple -D
PASS: 3030 - HTTP with multiple transfers in one -D
PASS: 3101 - HTTP auth without redirection protocols
PASS: 3103 - CURLOPT_COOKIELIST without expiry
Test case 3595 has no server(s) specified at runner.pm line 599.
PASS: 3201 - HTTP GET when PROXY Protocol enabled and spoofed client IP
PASS: 3202 - HTTP-IPv6 GET with PROXY protocol with spoofed client IP
PASS: 3028 - HTTP GET when PROXY Protocol enabled behind a proxy
TESTDONE: 1701 tests were considered during 177 seconds.
TESTDONE: 858 tests out of 858 reported OK: 100%

Best regards,

Jo=C3=A3o Marcos Costa (Schneider Electric) (7):
  curl: fix CVE-2026-86409
  curl: fix CVE-2026-87864
  curl: fix CVE-2026-87865
  curl: fix CVE-2026-92386
  curl: fix CVE-2026-92389
  curl: fix CVE-2026-92391
  curl: fix CVE-2026-94266

 .../curl/curl/CVE-2026-86409.patch            |  36 +++
 .../curl/curl/CVE-2026-87864.patch            |  55 ++++
 .../curl/curl/CVE-2026-87865.patch            | 212 ++++++++++++
 .../curl/curl/CVE-2026-92386.patch            |  32 ++
 .../curl/curl/CVE-2026-92389.patch            |  56 ++++
 .../curl/curl/CVE-2026-92391.patch            | 185 +++++++++++
 .../curl/curl/CVE-2026-94266-pre.patch        | 302 ++++++++++++++++++
 .../curl/curl/CVE-2026-94266.patch            | 222 +++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   8 +
 9 files changed, 1108 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92391.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266-pre.pat=
ch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266.patch

--=20
2.55.0

