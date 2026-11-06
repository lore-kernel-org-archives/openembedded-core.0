Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7297.1793976112490857600
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=cbO4jP7y;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF8631A14EE
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:41:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90FBC5FFBC;
	Fri,  6 Nov 2026 14:41:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD5AE103293BD;
	Fri,  6 Nov 2026 15:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793976110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QmuwB6A0UiHqGlurUe5bYOfLGii/60i6wqvyeeRK/6Q=;
	b=cbO4jP7yy0UhoP7/GUBxwpf5DlJ2S/UHcVG2KO9Er+opm83OLW4+FlsI6uolkvLrhZQphN
	EqfXPrINyG0mq74aHfp6Z3Q702KaDTTMM3VTailjyqOqBTj+byYMavf5irfao5nrZ3Locl
	5/zjW6FJiIldfxFJAlXTo7bl3Td4116FniB3GxvjbK9HPnUzDByYZhp1k9lDE5WG+0iJ99
	L1I35sdMrQ5lCiw2WrbfvUPkKZ5dhO1rL/wQz3g0LEgt9DaRryiopwz/ZBxuIUkzVDXfeq
	UYPJYqkRm2TeouZQTLsl/p8wTudbmystkNhw3vAmqlknvPqkS5HtMY+dF2PFZw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 5/7] curl: fix CVE-2026-92389
Date: Fri,  6 Nov 2026 15:41:32 +0100
Message-ID: <20261106144134.1370928-6-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249660

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.7.1.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-92389
[2] https://curl.se/docs/CVE-2026-92389.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-92389.patch            | 56 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92389.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92389.patch
new file mode 100644
index 0000000000..1f568fe2a0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
@@ -0,0 +1,56 @@
+From ab9213549c9c7f087cbaa818492705b482c4309d Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Fri, 6 Nov 2026 10:31:16 +0100
+Subject: [PATCH] tftp: verify direction in a few places
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Closes #22974
+
+CVE: CVE-2026-92389
+Upstream-Status: Backport [https://github.com/curl/curl/commit/63dd390fa=
b905a239a97e2700532929343ebc4e9]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/tftp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index ff2b7b7457..def944ddd5 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -545,10 +545,14 @@ static CURLcode tftp_send_first(struct tftp_state_=
data *state,
+     break;
+=20
+   case TFTP_EVENT_ACK: /* Connected for transmit */
++    if(!data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result =3D tftp_connect_for_tx(state, event);
+     break;
+=20
+   case TFTP_EVENT_DATA: /* Connected for receive */
++    if(!data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result =3D tftp_connect_for_rx(state, event);
+     break;
+=20
+@@ -709,6 +713,9 @@ static CURLcode tftp_tx(struct tftp_state_data *stat=
e, tftp_event_t event)
+   char *bufptr;
+   bool eos;
+=20
++  if(!data->state.upload)
++    return CURLE_TFTP_ILLEGAL;
++
+   switch(event) {
+=20
+   case TFTP_EVENT_ACK:
+@@ -1131,6 +1138,8 @@ static CURLcode tftp_receive_packet(struct Curl_ea=
sy *data)
+=20
+     switch(state->event) {
+     case TFTP_EVENT_DATA:
++      if(!data->state.upload)
++        return CURLE_TFTP_ILLEGAL;
+       /* Don't pass to the client empty or retransmitted packets */
+       if(state->rbytes > 4 &&
+          (NEXT_BLOCKNUM(state->block) =3D=3D getrpacketblock(&state->rp=
acket))) {
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index 12db6c0c24..39e804a1c3 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -47,6 +47,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-87864.patch \
            file://CVE-2026-87865.patch \
            file://CVE-2026-92386.patch \
+           file://CVE-2026-92389.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0

