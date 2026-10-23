Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3827.1792750977313640941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Y3fgZqyH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2A291650;
	Fri, 23 Oct 2026 03:22:53 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C1083F7B4;
	Fri, 23 Oct 2026 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792750976; bh=dXWlN9jjjiluWUqL6zp/YHn3+7Ka0goVIsug7Ve6W40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y3fgZqyHeF0M/TU4mY+a+ASwzeUu0R03ALhJHm5TDHKnjePGoHRzs5k8rWgYOebjV
	 +p4edqphbyJHB9fati25VRDyOjMOsV72azM0YGVKnOLYLDdwHOuopWxUTUpAJL8Sx9
	 7JNESsTNBiw1WyWNeZ2YuhlRexjNih+igzr05IIQ=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 4/5] devtool: Record kernel baseline after revision validation
Date: Fri, 23 Oct 2026 11:22:14 +0100
Message-ID: <20261023102215.4043005-5-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
References: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248502
Content-Type: text/plain; charset="utf-8"

Devtool creates its kernel branch before the source is reset
to the commit specified by the recipe. This can leave the
workspace on the wrong kernel version and fail the build.

Create the devtool branch after revision validation so it
uses the commit specified by the recipe.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta/classes/devtool-source.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-s=
ource.bbclass
index f29f40588f..24f8a3b616 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -52,7 +52,8 @@ python() {
     # Hook in pre/postfuncs
     is_kernel_yocto =3D bb.data.inherits_class('kernel-yocto', d)
     if is_kernel_yocto:
-        unpacktask =3D 'do_kernel_checkout'
+        # Record the devtool baseline after the kernel SRCREV is enforce=
d.
+        unpacktask =3D 'do_validate_branches'
         d.appendVarFlag('do_configure', 'postfuncs', ' devtool_post_conf=
igure')
     else:
         unpacktask =3D 'do_unpack'
