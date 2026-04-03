Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEF8E7E37C
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 11:54:51 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10126.1775217284939702746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 04:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=YoYZ5XZT;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=WdLMvoY6;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F3A947A01A7;
	Fri,  3 Apr 2026 07:54:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 03 Apr 2026 07:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1775217283; x=1775303683; bh=iF
	oGXSomwYKjB6b6XUOAzybAyyMupT+QlAHFkZLoZIQ=; b=YoYZ5XZTxds3HBhRrD
	7aMWkPed6QF0tCdinb/FLilFTVaJoLbD+BmVvDR4i/qCIIgnDEGW/zVtmD/VVo7G
	gNNco/hQ3JFsBL+sUehGiKwQnZAIAPDecj1CN3HEfKB07gPRbt9+ZaCEyzrIXNf9
	z1sWLj/n+kFd8Yq4USfQTl81ZOBFK3kGPfF/MAlf0yqJ+fHZWCKf4x1rh+M7//mM
	KTI6Sv3dREpbTNtfb3WZR3B6Y+462zyM6/+Pcvuj8/phhkaXTPwgsBkY84pjgPtL
	6rvXCa+qJcrfWcar7NAl/jQnGNW90A/JyPDuieDLzH9Acfy7oaBTgwjPRXk7Rwov
	rxHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1775217283; x=1775303683; bh=iFoGXSomwYKjB6b6XUOAzybAyyMu
	pT+QlAHFkZLoZIQ=; b=WdLMvoY6yQ7atgOIJQkUcbsfU8mRCy7tRkK3rI9swq2Z
	z3xYmhZOiMjfTdO0SjpM29lxMZwtQmJu8SR4MN2eG9ZdIBUpC4nQwFVbF5qQ+85O
	qM5SJZjtwwaiFnWq6sr4vDBMVOxBzmXsvnZHE71e3QyWD8iF8xThAW4fxZ4YaFVR
	eQV7sfniaqTQKHIOWUeldz1bK0nCScr1lTfQAVyuj9uTqqUsNFgvjNXfxIV44sbh
	GH7d97TESBEUHSsuyJj6uy2UyBsEzyA2LthjOlNoWera6wi3TpD7JhA8j4ZdNw2l
	lpQ4zwfOSemvBAeYG7N+YfLpQcwrgHxz073rbZ3oHQ==
X-ME-Sender: <xms:g6rPaVff7usOr-VY3mSwnf9Kr5apqKupG0iM6mKS-v5Gqp5M71__lw>
    <xme:g6rPaZPhJECfGjQKrlfzSOFk2Yby-Uxu2OuJpbEZph9FhabgRELpBPDu3_DO2LG_4
    7qC3MybSVm0EjaGEblRayE-i9BPj9Yd9cn66aCweJ7cb5xqocAFtA>
X-ME-Received: <xmr:g6rPacITKxSzUZyV2OIl_yx9Pkk7t_DaCFqSUlQt46amXN32Vum1jy9U1ous1WlGg8VCg-K-M9zV5p9VlmAjeJ7Be2TE3ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtredtje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhepjeelteefleetkeduueefteffgeeltdeguefgveette
    ekveetieektdfftedtkefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhope
    dvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdq
    tghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhope
    hprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:g6rPaaH-yeQMqasoDTMHT3y7ckosiZQajmoc1YzWqexdGvL7lC78hA>
    <xmx:g6rPaUSO-Ch2N4EEnuczoDXmIYK1daC4fKaB8FkS7S0OUlYAYzpIrA>
    <xmx:g6rPaWGW7X2lTzSffcaAB6PVE-tsMCVrUM6mMIRGHA18Kz3F9LD67Q>
    <xmx:g6rPaQ_gRK7tZLga_LXQz6NWiKShReDapaZPqk2vZLTsrRqjpM2lhw>
    <xmx:g6rPaZBIZ47i1R9klnQ9vbx6DTbS0yjy2qZ3s3ft6tNpvrMla8TbvuV5>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 07:54:42 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 03 Apr 2026 12:54:35 +0100
Subject: [PATCH] sanity: Require tar 1.35 or later on rhel9-alike distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAHqqz2kC/yXM0QpAMBSA4VfRubaaDeFV5GLm4EjoDCnt3Q2XX
 /39NzhkQgdVdAPjSY7WJSCJI7CjWQYU1AWDkiqXqdSCR5xLsRsWhcxU25tSd0pD6DfGnq7vVTe
 /3dFOaPd3AN4/nE5qJ20AAAA=
X-Change-ID: 20260403-rhel9-tar-8052bfa93d23
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2867; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=lJW7THwtOYK9NriP9PvXEfXqiOcJj91PQTB/aF5nlqU=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSeX9VUuEBk/7GTDzqv/p2Upm4mcVyPaX7CNccVWq9X/
 1HPt3r6v6OUhUGMi0FWTJFlc8/X+097HXkzQm4pwMxhZQIZwsDFKQATqfrC8Id/gkfEI2+PnvVu
 woVvfwjNuH6r7tOBCOmcJTufxKxTtVzM8D/J/tYareZzRaymG3ZcWa02M1RF+3nRrAt/xJ7d+bB
 lhwArAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234582

tar 1.34 (and possibly earlier versions) is unable to extract tarballs
containing read-only files with xattrs. This was fixed upstream, but
it's unlikely at this point that the fix will be backported to RHEL9
related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The issue
affects these distros specifically because they have selinux enabled by
default and this uses xattrs.

The specific failure we've seen is with the /usr/lib/udev/hwdb.bin file
installed by the systemd recipe - this file is chmod 0444. This leads to
the following error, typically during do_image_wic (shortened and split
to make it readable):

    subprocess.CalledProcessError: Command
    'tar --xattrs --xattrs-include='*' -cf - -S -C .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
    tar --xattrs --xattrs-include='*' -xf - -C .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
    returned non-zero exit status 2.

That error message is likely to confuse users, and the fix is not
obvious. So, error out if tar 1.34 or earlier is present on affected
distros and recommend upgrading or using the buildtools tarball.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes-global/sanity.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index b5d905399b73..2e486966a93b 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -551,6 +551,21 @@ def check_tar_version(sanity_data):
     except subprocess.CalledProcessError as e:
         return "Unable to execute tar --help, exit code %d\n%s\n" % (e.returncode, e.output)
 
+    try:
+        distro = oe.lsb.distro_identifier()
+    except Exception:
+        distro = None
+
+    if distro:
+        rhel9_alike_prefixes = ("rhel-9", "centos-9", "rocky-9", "almalinux-9")
+        rhel9_tar_minimum_version = "1.35"
+        for prefix in rhel9_alike_prefixes:
+            if distro.startswith(prefix) and bb.utils.vercmp_string_op(version, rhel9_tar_minimum_version, "<"):
+                return ("Your version of tar is older than %s and crashes when extracting read-only files with xattrs. "
+                        "Your distro is %s which triggers this bug due to the presence of selinux attributes. "
+                        "Please install a newer version of tar (you could use the project's buildtools-tarball from "
+                        "our last release or use scripts/install-buildtools).\n" % (rhel9_tar_minimum_version, distro))
+
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later

---
base-commit: e954a94b5b528b2430e8da331107d7d58287f89b
change-id: 20260403-rhel9-tar-8052bfa93d23

Best regards,
--  
Paul Barker


