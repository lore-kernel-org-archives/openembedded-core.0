Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C9FC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 04:20:16 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.2078.1664511608702370877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 21:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout03.t-online.de (Postfix) with SMTP id 2EBFD46C4
	for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 06:20:07 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.45.187]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oe7VE-0OoFaS0; Fri, 30 Sep 2022 06:19:56 +0200
Date: Fri, 30 Sep 2022 06:19:50 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] wic-imager-direct.py: use fstab update also
 for root device
To: openembedded-core@lists.openembedded.org
Message-Id: <2D90JR.8BEGSNFRFN6M1@t-online.de>
In-Reply-To: <20220930041807.2509199-1-f_l_k@t-online.de>
References: <20220930041807.2509199-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-QKDaCG+iylCkfnMlch8a"
X-TOI-EXPURGATEID: 150726::1664511596-3BFEC81E-897CBA81/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e28248b-5df8-4cb6-9b73-fb685e47e6f7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 04:20:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171206

--=-QKDaCG+iylCkfnMlch8a
Content-Type: text/plain; charset=us-ascii; format=flowed

i had a mail delivery error for this, so i resent

Am Fr, 30. Sep 2022 um 06:18:07 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> wic imager is able to add entries for the partitions to fstab. This 
> patch also
> creates an entry for the root device, which was previously ignored. 
> The root
> device entry can now optionally be uuid or label based.
> 
> The stock fstab file provided by base-files.bb already contains an 
> entry for the
> root device. The result looks something like this:
> 
> /dev/root / auto defaults 1 1
> proc /proc proc defaults 0 0
> devpts /dev/pts devpts mode=0620,ptmxmode=0666,gid=5 0 0
> tmpfs /run tmpfs mode=0755,nodev,nosuid,strictatime 0 0
> tmpfs /var/volatile tmpfs defaults 0 0
> 
> UUID=055A-69B5 /boot vfat defaults 0 0
> UUID=0eb2df23-3638-4bbf-b045-9a425cb45954 / ext4 defaults 0 0
> 
> To avoid duplicate root device entries in fstab for wic images, the 
> "/dev/root"
> line is removed during the update.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py 
> b/scripts/lib/wic/plugins/imager/direct.py
> index da483daed5..fd86a094d9 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
>          updated = False
>          for part in self.parts:
>              if not part.realnum or not part.mountpoint \
> -               or part.mountpoint == "/" or not 
> part.mountpoint.startswith('/'):
> +               or not part.mountpoint.startswith('/'):
>                  continue
> 
>              if part.use_uuid:
> @@ -145,6 +145,11 @@ class DirectPlugin(ImagerPlugin):
>              fstab_lines.append(line)
>              updated = True
> 
> +        for line in fstab_lines:
> +            if '/dev/root' in line:
> +                fstab_lines.remove(line)
> +                updated = True
> +
>          if updated:
>              self.updated_fstab_path = os.path.join(self.workdir, 
> "fstab")
>              with open(self.updated_fstab_path, "w") as f:
> --
> 2.34.1
> 


--=-QKDaCG+iylCkfnMlch8a
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>i had a mail delivery error for this, so i resent</div></div><div id="geary-quote" dir="auto"><br>Am Fr, 30. Sep 2022 um 06:18:07 +0200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">wic imager is able to add entries for the partitions to fstab. This patch also
creates an entry for the root device, which was previously ignored. The root
device entry can now optionally be uuid or label based.

The stock fstab file provided by base-files.bb already contains an entry for the
root device. The result looks something like this:

/dev/root / auto defaults 1 1
proc /proc proc defaults 0 0
devpts /dev/pts devpts mode=0620,ptmxmode=0666,gid=5 0 0
tmpfs /run tmpfs mode=0755,nodev,nosuid,strictatime 0 0
tmpfs /var/volatile tmpfs defaults 0 0

UUID=055A-69B5 /boot vfat defaults 0 0
UUID=0eb2df23-3638-4bbf-b045-9a425cb45954 / ext4 defaults 0 0

To avoid duplicate root device entries in fstab for wic images, the "/dev/root"
line is removed during the update.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index da483daed5..fd86a094d9 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
+               or not part.mountpoint.startswith('/'):
                 continue
 
             if part.use_uuid:
@@ -145,6 +145,11 @@ class DirectPlugin(ImagerPlugin):
             fstab_lines.append(line)
             updated = True
 
+        for line in fstab_lines:
+            if '/dev/root' in line:
+                fstab_lines.remove(line)
+                updated = True
+
         if updated:
             self.updated_fstab_path = os.path.join(self.workdir, "fstab")
             with open(self.updated_fstab_path, "w") as f:
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-QKDaCG+iylCkfnMlch8a--


