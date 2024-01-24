Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D5EC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 13:42:08 +0000 (UTC)
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net [46.105.63.230])
 by mx.groups.io with SMTP id smtpd.web10.22544.1706103727246759952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 05:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.63.230, mailfrom: jonathan@joggee.fr)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.139.212])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4F7AC2AF36
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:42:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wqn29 (unknown [10.110.178.131])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A29831FEF9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:42:03 +0000 (UTC)
Received: from joggee.fr ([37.59.142.101])
	by ghost-submission-6684bf9d7b-wqn29 with ESMTPSA
	id DCvEIKsTsWV0EgAAjcH0Sw
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:42:03 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004ac18c8e5-af90-4c58-8aa9-e35d0b574bad,
                    1B92D9850C999843FE7D729D211862C1FD43503D) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
Message-Id: <CYMZAM6BPMA3.2ER0ZFNTM8VFA@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 24 Jan 2024 13:29:19 +0000
Subject: [PATCH] udev-extraconf: fix unmount directories containing
 octal-escaped chars
X-Ovh-Tracer-Id: 1417226508820548731
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeluddgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepieefgefgfeefheejhfdtleejhfevgeeggfeuheehjefhieekgfejuddvueeitdfhnecuffhomhgrihhnpehmohhunhhtrdhshhenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194273

USB devices are auto-mounted in a directory named like theirs labels.
Special characters like whitespace are octal-escaped in /proc/mounts
output. Using directly this output file as an argument for umount failed
and the mount directory can't be removed as still busy.
Using printf allows these special characters to be unescaped.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 0cd51fcde8..c19e2aa68a 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -211,7 +211,7 @@ if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [
         logger "mount.sh/remove" "cleaning up $DEVNAME, was mounted by the auto-mounter"
         for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
         do
-                $UMOUNT $mnt
+                $UMOUNT "`printf $mnt`"
         done
         # Remove mount directory created by the auto-mounter
         # and clean up our tmp cache file

base-commit: a0b236c52dd7ef702a367c6d3e544f21b416ecf2
-- 
2.43.0

