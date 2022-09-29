Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF472C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 15:11:16 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web12.11634.1664464272920573180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 08:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout07.t-online.de (Postfix) with SMTP id 3082FF68E;
	Thu, 29 Sep 2022 17:10:55 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.42.234]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1odvBc-1Br0PA0; Thu, 29 Sep 2022 17:10:52 +0200
Date: Thu, 29 Sep 2022 17:10:46 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] wic-imager-direct.py: use fstab update also for
 root device
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Message-Id: <YT8ZIR.9TC1ID633SY71@t-online.de>
In-Reply-To: 
	<CANNYZj-=0t5jxJq_JhW0gUz5-P_Ni_P0mCjRb0ikRdso-oiN-w@mail.gmail.com>
References: <20220929125750.3338743-1-f_l_k@t-online.de>
	<CANNYZj-=0t5jxJq_JhW0gUz5-P_Ni_P0mCjRb0ikRdso-oiN-w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6ThJUl9p4RG3WiD+/Dus"
X-TOI-EXPURGATEID: 150726::1664464252-01449CE0-2CD2D29E/0/0 CLEAN NORMAL
X-TOI-MSGID: 8c06b828-aaac-45de-bd4c-9ba7de1c541b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 15:11:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171191

--=-6ThJUl9p4RG3WiD+/Dus
Content-Type: text/plain; charset=us-ascii; format=flowed

Sure. I've sent a v2

Am Do, 29. Sep 2022 um 15:08:48 +0200 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Can you describe in more detail what the problem is (e.g. an example
> of incorrect output), and what changes with this patch?
> 
> Alex
> 
> On Thu, 29 Sept 2022 at 14:58, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  Remove the hardcoded root device entry from fstab when updating to
>>  avoid duplicate entries.
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>> 
>>  diff --git a/scripts/lib/wic/plugins/imager/direct.py 
>> b/scripts/lib/wic/plugins/imager/direct.py
>>  index da483daed5..fd86a094d9 100644
>>  --- a/scripts/lib/wic/plugins/imager/direct.py
>>  +++ b/scripts/lib/wic/plugins/imager/direct.py
>>  @@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
>>           updated = False
>>           for part in self.parts:
>>               if not part.realnum or not part.mountpoint \
>>  -               or part.mountpoint == "/" or not 
>> part.mountpoint.startswith('/'):
>>  +               or not part.mountpoint.startswith('/'):
>>                   continue
>> 
>>               if part.use_uuid:
>>  @@ -145,6 +145,11 @@ class DirectPlugin(ImagerPlugin):
>>               fstab_lines.append(line)
>>               updated = True
>> 
>>  +        for line in fstab_lines:
>>  +            if '/dev/root' in line:
>>  +                fstab_lines.remove(line)
>>  +                updated = True
>>  +
>>           if updated:
>>               self.updated_fstab_path = os.path.join(self.workdir, 
>> "fstab")
>>               with open(self.updated_fstab_path, "w") as f:
>>  --
>>  2.34.1
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171187): 
> <https://lists.openembedded.org/g/openembedded-core/message/171187>
> Mute This Topic: <https://lists.openembedded.org/mt/93993381/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-6ThJUl9p4RG3WiD+/Dus
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Sure. I've sent a v2</div></div><div id="geary-quote" dir="auto"><br>Am Do, 29. Sep 2022 um 15:08:48 +0200 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Can you describe in more detail what the problem is (e.g. an example
of incorrect output), and what changes with this patch?

Alex

On Thu, 29 Sept 2022 at 14:58, Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Remove the hardcoded root device entry from fstab when updating to
 avoid duplicate entries.

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
 --
 2.34.1


 

</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#171187): <a href="https://lists.openembedded.org/g/openembedded-core/message/171187">https://lists.openembedded.org/g/openembedded-core/message/171187</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/93993381/3618223">https://lists.openembedded.org/mt/93993381/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-6ThJUl9p4RG3WiD+/Dus--


