Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B7AC77B7E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 13:56:17 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.29362.1685282172088605521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 06:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id 06897174E5;
	Sun, 28 May 2023 15:56:10 +0200 (CEST)
Received: from [192.168.178.156] ([79.219.225.43]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q3GsS-2Kzzvc0; Sun, 28 May 2023 15:56:08 +0200
Date: Sun, 28 May 2023 15:56:03 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <F1GDVR.2NNB0NO3B75X1@t-online.de>
In-Reply-To: 
	<CANNYZj8Mx-o8=L7N_hrC71c-4urBgXJx1gM1nERUjQL-87Kmyw@mail.gmail.com>
References: <20230527133252.284132-1-f_l_k@t-online.de>
	<20230527133252.284132-2-f_l_k@t-online.de>
	<CANNYZj8Mx-o8=L7N_hrC71c-4urBgXJx1gM1nERUjQL-87Kmyw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ubQkjXoa7TQZnG6nANEo"
X-TOI-EXPURGATEID: 150726::1685282168-5AE6F570-1475A32B/0/0 CLEAN NORMAL
X-TOI-MSGID: 88169861-871e-41bd-9732-5e474979b47b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 13:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181826

--=-ubQkjXoa7TQZnG6nANEo
Content-Type: text/plain; charset=us-ascii; format=flowed

I noticed this because I was trying to see if my image could reproduce 
itself. To do this I installed some build tools, perl and python 
modules and tried if a core-image-minimal can be built in this 
environment.

This failed for some packages because crypt() was missing. I did not 
have any dev packages installed, so my guess was that it was because my 
image was missing crypt.h.

To reproduce this on my host machine (Ubuntu 22.04), I ran
sudo mv /usr/include/crypt.h /usr/include/crypt.h.old
sudo rm -r tmp sstate-cache

Now I also had errors on my host system

Am So, 28. Mai 2023 um 15:39:47 +0200 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Can you please show how it looks like? We do have a test for host
> contamination via headers, so I'd like to see what happens exactly and
> where the test isn't catching it.
> 
> Same for patches 3/4, 4/4.
> 
> Alex
> 
> On Sat, 27 May 2023 at 15:33, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  crypt.h is otherwise taken from the host machine
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta/recipes-devtools/python/python3_3.11.2.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>>  diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb 
>> b/meta/recipes-devtools/python/python3_3.11.2.bb
>>  index 421a305e22..1ca4ad35be 100644
>>  --- a/meta/recipes-devtools/python/python3_3.11.2.bb
>>  +++ b/meta/recipes-devtools/python/python3_3.11.2.bb
>>  @@ -72,7 +72,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = 
>> "${bindir}/python${PYTHON_MAJMIN}-config
>>   ALTERNATIVE_TARGET[python3-config] = 
>> "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
>> 
>> 
>>  -DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl 
>> sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid 
>> libtirpc libnsl2 autoconf-archive-native ncurses"
>>  +DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl 
>> sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid 
>> libtirpc libnsl2 autoconf-archive-native ncurses libxcrypt-native"
>>   DEPENDS:append:class-target = " python3-native"
>>   DEPENDS:append:class-nativesdk = " python3-native"
>> 
>>  --
>>  2.34.1
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181824): 
> <https://lists.openembedded.org/g/openembedded-core/message/181824>
> Mute This Topic: <https://lists.openembedded.org/mt/99167320/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-ubQkjXoa7TQZnG6nANEo
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I noticed this because I was trying to see if my image could reproduce itself. To do this I installed some build tools, perl and python modules and tried if a core-image-minimal can be built in this environment.</div><div><br></div><div>This failed for some packages because crypt() was missing. I did not have any dev packages installed, so my guess was that it was because my image was missing crypt.h.</div><div><br></div><div>To reproduce this on my host machine (Ubuntu 22.04), I ran</div><div>sudo mv /usr/include/crypt.h /usr/include/crypt.h.old</div><div>sudo rm -r tmp sstate-cache</div><div><br></div><div>Now I also had errors on my host system</div></div><div id="geary-quote" dir="auto"><br>Am So, 28. Mai 2023 um 15:39:47 +0200 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Can you please show how it looks like? We do have a test for host
contamination via headers, so I'd like to see what happens exactly and
where the test isn't catching it.

Same for patches 3/4, 4/4.

Alex

On Sat, 27 May 2023 at 15:33, Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 crypt.h is otherwise taken from the host machine

 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  meta/recipes-devtools/python/python3_3.11.2.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
 index 421a305e22..1ca4ad35be 100644
 --- a/meta/recipes-devtools/python/python3_3.11.2.bb
 +++ b/meta/recipes-devtools/python/python3_3.11.2.bb
 @@ -72,7 +72,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
  ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"


 -DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses"
 +DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses libxcrypt-native"
  DEPENDS:append:class-target = " python3-native"
  DEPENDS:append:class-nativesdk = " python3-native"

 --
 2.34.1


 

</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#181824): <a href="https://lists.openembedded.org/g/openembedded-core/message/181824">https://lists.openembedded.org/g/openembedded-core/message/181824</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/99167320/3618223">https://lists.openembedded.org/mt/99167320/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-ubQkjXoa7TQZnG6nANEo--


