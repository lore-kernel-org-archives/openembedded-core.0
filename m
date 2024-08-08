Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEEFC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 04:11:24 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.52302.1723090275099328088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 21:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=Z+gKVfug;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 200AA4C64;
	Thu,  8 Aug 2024 06:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723090273;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=X5a92YyiVdY588QW+lHGsrQYglSm8bsNY+qf0/OPu1Q=;
	b=Z+gKVfug0pAfCH7IbuVFuS1LblDcMp9oSfBSM1y/Q3Rrx2V+0J/LRvAK3CDD4SEY
	AOqes8wO6vYcMpUJBbOqNTGFWHJ9Hw7pjQKaWg4zj/abas/Bh3G7h/KeGInvO0dMtAZ
	rkys2sC743aWloxnV6//zJvVpFUUQ+WbdZKuzVz6gkzyvClRA4RO0h4+bIdAQJX9bNG
	E3dUzyuOrMQErrbtNbGN4MX7wqJvWKbrv1BHnBza3nG1t3mvG+0DagtB3b8vl0hL06u
	ZSYrJYf+spLi/EACrW56uK24GpB1+I7S6HD9koqSaEbWwJ/dpGXl2gkQNBJl1uFVjx1
	1yG+ut7Qvw==
Received: by smtp.mailfence.com with ESMTPSA ; Thu, 8 Aug 2024 06:11:10 +0200 (CEST)
From: robert.joslyn@redrectangle.org
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH v2] curl: Update to 8.9.1
Date: Wed,  7 Aug 2024 21:07:26 -0700
Message-ID: <20240808040726.1461912-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 04:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203111

From: Robert Joslyn <robert.joslyn@redrectangle.org>

This update contains minor features, bugfixes, and addresses several CVEs=
:
* https://curl.se/docs/CVE-2024-6197.html
* https://curl.se/docs/CVE-2024-6874.html
* https://curl.se/docs/CVE-2024-7264.html

Full relese notes available at https://curl.se/ch/8.9.1.html

Backport a patch to fix a SIGPIPE issue found shortly after release:
https://curl.se/mail/distros-2024-08/0002.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 ...e-struct-so-that-first-apply-ignores.patch | 38 +++++++++++++++++++
 .../curl/{curl_8.8.0.bb =3D> curl_8.9.1.bb}     |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-sigpipe-init-the-=
struct-so-that-first-apply-ignores.patch
 rename meta/recipes-support/curl/{curl_8.8.0.bb =3D> curl_8.9.1.bb} (97%=
)

diff --git a/meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-=
so-that-first-apply-ignores.patch b/meta/recipes-support/curl/curl/0001-s=
igpipe-init-the-struct-so-that-first-apply-ignores.patch
new file mode 100644
index 0000000000..15c69e1430
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that=
-first-apply-ignores.patch
@@ -0,0 +1,38 @@
+From 3eec5afbd0b6377eca893c392569b2faf094d970 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 5 Aug 2024 00:17:17 +0200
+Subject: [PATCH] sigpipe: init the struct so that first apply ignores
+
+Initializes 'no_signal' to TRUE, so that a call to sigpipe_apply() after
+init ignores the signal (unless CURLOPT_NOSIGNAL) is set.
+
+I have read the existing code multiple times now and I think it gets the
+initial state reversed this missing to ignore.
+
+Regression from 17e6f06ea37136c36d27
+
+Reported-by: Rasmus Thomsen
+Fixes #14344
+Closes #14390
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3eec5afbd=
0b6377eca893c392569b2faf094d970]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/sigpipe.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/sigpipe.h b/lib/sigpipe.h
+index b91a2f513..d78afd905 100644
+--- a/lib/sigpipe.h
++++ b/lib/sigpipe.h
+@@ -39,6 +39,7 @@ struct sigpipe_ignore {
+ static void sigpipe_init(struct sigpipe_ignore *ig)
+ {
+   memset(ig, 0, sizeof(*ig));
++  ig->no_signal =3D TRUE;
+ }
+=20
+ /*
+--=20
+2.44.2
+
diff --git a/meta/recipes-support/curl/curl_8.8.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.9.1.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_8.8.0.bb
rename to meta/recipes-support/curl/curl_8.9.1.bb
index 2b058e4e82..72ef4fab62 100644
--- a/meta/recipes-support/curl/curl_8.8.0.bb
+++ b/meta/recipes-support/curl/curl_8.9.1.bb
@@ -14,8 +14,9 @@ SRC_URI =3D " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patc=
h \
 "
-SRC_URI[sha256sum] =3D "0f58bb95fc330c8a46eeb3df5701b0d90c9d9bfcc42bd1cd=
08791d12551d4400"
+SRC_URI[sha256sum] =3D "f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97=
612ae590643801e5"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
--=20
2.44.2


