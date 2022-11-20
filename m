Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841AEC433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:15:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.13266.1668953740641967628
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=31J6OAXu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id k5so8350879pjo.5
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zy8qbGtxFYFJ03AlrnZRDgraob1cAUm+uU+DzCJau3Y=;
        b=31J6OAXuP6sv9A8D9XyCIFe/uscr/IqmzuJZGAIDJqd35KNYZOcD5YPaB1SEienKEc
         sMsLmwV+n2J/qfHXpCzsQbDtyOzBFVQ1owMPGBQr4Rl6S6YW8iloE87ZT/wqE2b2A9Zx
         NW8Mjys3CiYc6BUvFWO+ebNJ5TWShGHUYmQ6VWQjLYk+2FQx6Y41Garw0gSCcJ/g5twN
         QypfudyommOANaUdZQrF0I6USOtHHg7pAy1PyHfDsRFh8sZHHisVq+HHRhebnv5ItEKF
         Lg7McbHK1WBOkHmRiEfc0B5gvVMinFnOchH0UmsLXPLPpT6glbOjAwleQ+rB++vb1WPr
         bt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy8qbGtxFYFJ03AlrnZRDgraob1cAUm+uU+DzCJau3Y=;
        b=M2AAnOQbAtDyOIYIsAOYSeagxHmIQwquIq9cSduqWFYBXcu7NEeHHSSBXyxdgMt4lp
         tFQaDLNjyheuJasZ2qmKp3LC2Lho8dnCn7Rkwco2hET68MvTrDWAR575frXL3QLsCeC7
         vTczV3LzOyNzsepqsNO7YGnSEUKmq4rWYGAUBi64LKitE7O9/22DqcMJEnto2QlwE6jo
         jNn7VTEm+uduxiQPqcqXHQ+8747VDmO3k6IR/JTHfcKveErcdvRsY5KDeJ56XNOzqZyl
         suwA2TEe9E7+Qy38pLkrpSEwn/aWybcfiES8dc8n55KlWM/9xsJrthvo1GtPO9zzqR+J
         ugCg==
X-Gm-Message-State: ANoB5pnUiHQlUnDY4fW7AGSMFMejF3b4o68qda3AwMXdct+sq3asvTbn
	SbmY0Ny6O1++ZT3TaHkQEMymgoZH/5TD93Ly0YE=
X-Google-Smtp-Source: AA0mqf54js8fJgG2dR/gDtqIkZPVDQlMZNZezI9uxGTOoU9mAXyt+K8g0vUt3SPXJ1lSY6wfkZdVuw==
X-Received: by 2002:a17:90a:f3d3:b0:213:241f:1939 with SMTP id ha19-20020a17090af3d300b00213241f1939mr22941972pjb.70.1668953739583;
        Sun, 20 Nov 2022 06:15:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/35] dbus: fix CVE-2022-42011 dbus-daemon can be crashed by messages with array length inconsistent with element type
Date: Sun, 20 Nov 2022 04:14:51 -1000
Message-Id: <5d96a3c244388623d87a2999dafaa25d0bd216b6.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173602

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Backport a patch from upstream[1] to fix CVE-2022-42011 dbus-daemon can be crashed by messages with array length inconsistent with element type
[1] https://gitlab.freedesktop.org/dbus/dbus/-/commit/b9e6a7523085a2cfceaffca7ba1ab4251f12a984

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...idate-Validate-length-of-arrays-of-f.patch | 61 +++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.14.0.bb         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
new file mode 100644
index 0000000000..f953326f78
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
@@ -0,0 +1,61 @@
+From b9e6a7523085a2cfceaffca7ba1ab4251f12a984 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Mon, 12 Sep 2022 13:14:18 +0100
+Subject: [PATCH] dbus-marshal-validate: Validate length of arrays of
+ fixed-length items
+
+This fast-path previously did not check that the array was made up
+of an integer number of items. This could lead to assertion failures
+and out-of-bounds accesses during subsequent message processing (which
+assumes that the message has already been validated), particularly after
+the addition of _dbus_header_remove_unknown_fields(), which makes it
+more likely that dbus-daemon will apply non-trivial edits to messages.
+
+Thanks: Evgeny Vereshchagin
+Fixes: e61f13cf "Bug 18064 - more efficient validation for fixed-size type arrays"
+Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/413
+Resolves: CVE-2022-42011
+
+Upstream-Status: Backport from
+[https://gitlab.freedesktop.org/dbus/dbus/-/commit/b9e6a7523085a2cfceaffca7ba1ab4251f12a984]
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+(cherry picked from commit 079bbf16186e87fb0157adf8951f19864bc2ed69)
+Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
+---
+ dbus/dbus-marshal-validate.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/dbus/dbus-marshal-validate.c b/dbus/dbus-marshal-validate.c
+index ae68414d..7d0d6cf7 100644
+--- a/dbus/dbus-marshal-validate.c
++++ b/dbus/dbus-marshal-validate.c
+@@ -503,13 +503,24 @@ validate_body_helper (DBusTypeReader       *reader,
+                  */ 
+                 if (dbus_type_is_fixed (array_elem_type))
+                   {
++                    /* Note that fixed-size types all have sizes equal to
++                     * their alignments, so this is really the item size. */
++                    alignment = _dbus_type_get_alignment (array_elem_type);
++                    _dbus_assert (alignment == 1 || alignment == 2 ||
++                                  alignment == 4 || alignment == 8);
++
++                    /* Because the alignment is a power of 2, this is
++                     * equivalent to: (claimed_len % alignment) != 0,
++                     * but avoids slower integer division */
++                    if ((claimed_len & (alignment - 1)) != 0)
++                      return DBUS_INVALID_ARRAY_LENGTH_INCORRECT;
++
+                     /* bools need to be handled differently, because they can
+                      * have an invalid value
+                      */
+                     if (array_elem_type == DBUS_TYPE_BOOLEAN)
+                       {
+                         dbus_uint32_t v;
+-                        alignment = _dbus_type_get_alignment (array_elem_type);
+ 
+                         while (p < array_end)
+                           {
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index 4577da782c..e1efa9e058 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch \
+           file://0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch \
 "
 
 SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
-- 
2.25.1


