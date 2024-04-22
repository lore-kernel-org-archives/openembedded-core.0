Return-Path: <m.glembo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C161EC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 14:46:23 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web10.20357.1713797174023837420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 07:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UtkFmnX1;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: m.glembo@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4dc9f17c27bso1274831e0c.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713797173; x=1714401973; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:references:in-reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kedu01ef7Dpd8CV2RVFLR9X3wFNflVL6CkLpA66h62E=;
        b=UtkFmnX1iBocUWzWhH0fSs7DvEN0VV6O2zYM6YQ3A8zDNnXsxlUAAo5En8PuGNrphu
         2hrfCqWy9cEfeR6ciwQRvwsn6ehxOPOk0YAIOOJEj2D4ut64l8eg51ntWzeNqSehdDSr
         32tdGPp7PCZPnFJ+17aup5IT+A1LfCjoGcyGDGePbkG99976SEZFQj6TT1jXSibgTi4S
         znwL5aOXp6UajDdRA0temAhNX4RTEjmvBsABrmA2N4NrHmQwBhFfXFfGpmpqdBAkvRJa
         CQVVko1inDDHWz2ZAUmF4gfAgBohR0lhfPOua34qi1xNL+UTax+4tYfoal1fQPGkgAvF
         Gy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713797173; x=1714401973;
        h=to:subject:message-id:date:from:references:in-reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kedu01ef7Dpd8CV2RVFLR9X3wFNflVL6CkLpA66h62E=;
        b=jAGNCRZ1n78GkTx1ZkLCPq86pfGmqZCry5mXEmFvmK2k2PBcWqEXrmG158ua6qJWcr
         S3MIQi9UwDkG3cnXRPIy4515L2Loaxo7R4957St7HbVoaGEPEa6fhgZffmyjYvsXH/8Q
         cIg7CIem26Hgi0c6hJ4pz7VzsuNC8pCLlRJA+vgqSPQjOxAYLZzUAsix418rYXg7fNYb
         PvrVsyGlDdh83fkhSW5uCF6JoQTgvWjtxQfbWJfRWsJ8OHNY9jQ0B2hdDjQVrH+8RChM
         zRPixs1mFPS6lLdGV29JQxFClufqj2N/WyX/LDKKjRQVFZCmFwhuhH70NVEOt23FRrgR
         U9hg==
X-Gm-Message-State: AOJu0YzzvMi9rJ+gOG8Va2JkxlF1uUaHEgMqMuhi45trM8iW9vmlodHc
	CwMIDFJ5ZyL+jXZccJl8QpPsEe0prh0WTEC572HnFpNXc+U7lw2s0+9xB/XZGFawC94YGx/T7Pk
	w2zuFigyVs50K/YE5D2SnboKvg2NrwQ==
X-Google-Smtp-Source: AGHT+IFysVi4BsooU7ZgE5VmGLmsk0uIBcIqoYoo0lSJXHUuhUroICL4DPbhB7lpk8V6CcJhJkqnkBj8M6rOfFAQGjs=
X-Received: by 2002:a05:6122:1d41:b0:4da:9d3e:a7df with SMTP id
 gd1-20020a0561221d4100b004da9d3ea7dfmr11811870vkb.5.1713797172476; Mon, 22
 Apr 2024 07:46:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6124:c97:b0:39a:ca5:2e0a with HTTP; Mon, 22 Apr 2024
 07:46:11 -0700 (PDT)
In-Reply-To: <20240422135552.83928-1-Michael.Glembotzki@iris-sensing.com>
References: <20240422135552.83928-1-Michael.Glembotzki@iris-sensing.com>
From: Michael <m.glembo@gmail.com>
Date: Mon, 22 Apr 2024 16:46:11 +0200
Message-ID: <CAKDoKkPr57uXMpmDVZba_WCgH47hbRxU0HmOp6B27xQ2wh-MrQ@mail.gmail.com>
Subject: [master][scarthgap][poky][PATCH] rootfs-postcommands.bbclass: Only
 set DROPBEAR_RSAKEY_DIR once
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aec6d30616b07f6a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 14:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198589

--000000000000aec6d30616b07f6a
Content-Type: text/plain; charset="UTF-8"

If DROPBEAR_RSAKEY_DIR has already been set before, e.g. by overwriting
the file dropbear.default, the line will still be appended a second time.

DROPBEAR_RSAKEY_DIR="/path/to/dropbear"
DROPBEAR_EXTRA_ARGS="-B"
DROPBEAR_RSAKEY_DIR=/var/lib/dropbear

Signed-off-by: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass
b/meta/classes-recipe/rootfs-postcommands.bbclass
index e81b69a239..920da94ba2 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -206,7 +206,9 @@ read_only_rootfs_hook () {
                # Also tweak the key location for dropbear in the same way.
                if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
                        if [ ! -e
${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key
]; then
-                               echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear"
>> ${IMAGE_ROOTFS}/etc/default/dropbear
+                               if ! grep -q "^DROPBEAR_RSAKEY_DIR="
${IMAGE_ROOTFS}/etc/default/dropbear ; then
+                                       echo
"DROPBEAR_RSAKEY_DIR=/var/lib/dropbear"
>> ${IMAGE_ROOTFS}/etc/default/dropbear
+                               fi
                        fi
                fi
        fi
-- 
2.44.0

--000000000000aec6d30616b07f6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If DROPBEAR_RSAKEY_DIR has already been set before, e.g. by overwriting<br>
the file dropbear.default, the line will still be appended a second time.<b=
r>
<br>
DROPBEAR_RSAKEY_DIR=3D&quot;/path/to/<wbr>dropbear&quot;<br>
DROPBEAR_EXTRA_ARGS=3D&quot;-B&quot;<br>
DROPBEAR_RSAKEY_DIR=3D/var/lib/<wbr>dropbear<br>
<br>
Signed-off-by: Michael Glembotzki &lt;<a href=3D"mailto:Michael.Glembotzki@=
iris-sensing.com">Michael.Glembotzki@iris-<wbr>sensing.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/rootfs-<wbr>postcommands.bbclass | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/rootfs-<wbr>postcommands.bbclass b/meta/cl=
asses-recipe/rootfs-<wbr>postcommands.bbclass<br>
index e81b69a239..920da94ba2 100644<br>
--- a/meta/classes-recipe/rootfs-<wbr>postcommands.bbclass<br>
+++ b/meta/classes-recipe/rootfs-<wbr>postcommands.bbclass<br>
@@ -206,7 +206,9 @@ read_only_rootfs_hook () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Also tweak the ke=
y location for dropbear in the same way.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -d ${IMAGE_ROO=
TFS}/etc/dropbear ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/<wbr>dropbear_rsa_host_ke=
y ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;DROPBEAR_RSAKEY_DIR=3D/var=
/lib/<wbr>dropbear&quot; &gt;&gt; ${IMAGE_ROOTFS}/etc/default/<wbr>dropbear=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! grep -q &quot;^DROPBEAR_RSAKEY_D=
IR=3D&quot; ${IMAGE_ROOTFS}/etc/default/<wbr>dropbear ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quo=
t;DROPBEAR_RSAKEY_DIR=3D/var/lib/<wbr>dropbear&quot; &gt;&gt; ${IMAGE_ROOTF=
S}/etc/default/<wbr>dropbear<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-- <br>
2.44.0<br>
<br>
<br>

--000000000000aec6d30616b07f6a--

