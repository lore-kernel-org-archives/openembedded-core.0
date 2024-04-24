Return-Path: <yocto@bsorensen.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6A1C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:19:03 +0000 (UTC)
Received: from mailrelay1-1.pub.mailoutpod3-cph3.one.com (mailrelay1-1.pub.mailoutpod3-cph3.one.com [46.30.211.240])
 by mx.groups.io with SMTP id smtpd.web11.11480.1713946740086354640
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bsorensen.net header.s=rsa2 header.b=McwsvM4h;
 dkim=pass header.i=@bsorensen.net header.s=ed2 header.b=Nk4LlJOC;
 spf=none, err=permanent DNS error (domain: bsorensen.net, ip: 46.30.211.240, mailfrom: yocto@bsorensen.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bsorensen.net; s=rsa2;
	h=in-reply-to:from:cc:references:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=7/b/hjaGvs3Ry9ugpFJVB2/9uoNd/T7xvuBXPUyIj7Y=;
	b=McwsvM4htDNCAx13MeOUztoGUM9Qiba9leDGxipH1BE+T84PpTCfFvsfpJXPKeHdA5297+hqSM833
	 ieTLx7s59jHkmBqWWDoe4DbNIq17HG6d4SscnQ5szSTt26LlCn4OzPV2uryRPPb4nF2MiCc/6r2YvI
	 M5s4fdeZyMpDJBX6ZDUJekWQ5GkdKGdepUMpgg7Y/omRFL54dd7R2PU6DsHc5Zq7M7eK9PYskdM7/O
	 B8DMq8nMOfsHO3c4ZIBxxVD+QrJ+Si0N6rByDuBD4ovS2ricjR1dcMQJWLQqV7OJil6CTlyJLh1aao
	 GJyTF1upm8UVWbM9oOSknH0tg7O2itA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=bsorensen.net; s=ed2;
	h=in-reply-to:from:cc:references:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=7/b/hjaGvs3Ry9ugpFJVB2/9uoNd/T7xvuBXPUyIj7Y=;
	b=Nk4LlJOCvNakjX9UVAXx7istSgFSS7m3CfelfUlpGUeD3ZdXeIlK8bnc0oZR/ZIDMaa5SR7LU0go9
	 T99iuyGDw==
X-HalOne-ID: 4968eb6c-0213-11ef-9cdb-bf3d7f4c9d3b
Received: from [172.16.11.8] (unknown [81.216.59.226])
	by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 4968eb6c-0213-11ef-9cdb-bf3d7f4c9d3b;
	Wed, 24 Apr 2024 08:18:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------eQ5eJbPIguqug7kAv9rRLHCH"
Message-ID: <e34afde6-9687-4f4e-bc98-b9d0c8260169@bsorensen.net>
Date: Wed, 24 Apr 2024 10:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] systemd: sed ROOT_HOME only if sysusers PACKAGECONFIG is
 set
To: openembedded-core@lists.openembedded.org
References: <20240418055843.547573-1-yocto@bsorensen.net>
Content-Language: en-US
Cc: Qi.Chen@windriver.com, alexandre.belloni@bootlin.com,
 richard.purdie@linuxfoundation.org
From: =?UTF-8?Q?Christian_Br=C3=A4uner_S=C3=B8rensen?= <yocto@bsorensen.net>
In-Reply-To: <20240418055843.547573-1-yocto@bsorensen.net>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198641

This is a multi-part message in MIME format.
--------------eQ5eJbPIguqug7kAv9rRLHCH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Added CC's that signed off by on commit ebafe46379 systemd: upgrade to 
255.1.

On 4/18/24 07:58, yocto@bsorensen.net wrote:
> From: Christian Bräuner Sørensen<yocto@bsorensen.net>
>
> Fixes a bug introducted in ebafe46379 systemd: upgrade to 255.1.
>
> Besides updating systemd, that commit also made other changes. One of them
> being when to perform the replacement in order to fix ROOT_HOME.
>
> Previously, that happened on a configure prefunc and on
> ${S}/sysusers.d/basic.conf.in.
> Now it happens in install and on image/usr/lib/sysusers.d/basic.conf.
>
> However, that file is not present if sysusers is not in PACKAGECONFIG,
> since that file in that case is not installed hence resulting in:
> sed: can't read <redactedpath>/image/usr/lib/sysusers.d/basic.conf: No such file or directory
>
> Previously, in the case of sysusers not being in PACKAGECONFIG, that was a
> "silent error" since the replacement was done but the file was not really
> used since the file was not installed.
>
> Signed-off-by: Christian Bräuner Sørensen<yocto@bsorensen.net>
> ---
>   meta/recipes-core/systemd/systemd_255.4.bb | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
> index e7498c802d..f58a1bc2b6 100644
> --- a/meta/recipes-core/systemd/systemd_255.4.bb
> +++ b/meta/recipes-core/systemd/systemd_255.4.bb
> @@ -271,14 +271,16 @@ WATCHDOG_TIMEOUT ??= "60"
>   
>   do_install() {
>   	meson_do_install
> -	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
> -	# This is done merely for backward compatibility with previous systemd recipes.
> -	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
> -	# may have unexpected runtime behaviors.
> -	if [ "${ROOT_HOME}" != "/root" ]; then
> -		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
> -		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
> -	fi
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'sysusers', 'true', 'false', d)}; then
> +            # Change the root user's home directory in /lib/sysusers.d/basic.conf.
> +            # This is done merely for backward compatibility with previous systemd recipes.
> +            # systemd hardcodes root user's HOME to be "/root". Changing to use other values
> +            # may have unexpected runtime behaviors.
> +            if [ "${ROOT_HOME}" != "/root" ]; then
> +                    bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
> +                    sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
> +            fi
> +        fi
>   	install -d ${D}/${base_sbindir}
>   	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
>   		# Provided by a separate recipe

Any input on the patchset ? Would appreciate if it could be included in 
the scarthgap release.

/Christian

--------------eQ5eJbPIguqug7kAv9rRLHCH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi</p>
    <p>Added CC's that signed off by on commit <span
      style="white-space: pre-wrap">ebafe46379 systemd: upgrade to 255.1.</span></p>
    <div class="moz-cite-prefix">On 4/18/24 07:58, <a class="moz-txt-link-abbreviated" href="mailto:yocto@bsorensen.net">yocto@bsorensen.net</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240418055843.547573-1-yocto@bsorensen.net">
      <pre class="moz-quote-pre" wrap="">From: Christian Bräuner Sørensen <a class="moz-txt-link-rfc2396E" href="mailto:yocto@bsorensen.net">&lt;yocto@bsorensen.net&gt;</a>

Fixes a bug introducted in ebafe46379 systemd: upgrade to 255.1.

Besides updating systemd, that commit also made other changes. One of them
being when to perform the replacement in order to fix ROOT_HOME.

Previously, that happened on a configure prefunc and on
${S}/sysusers.d/basic.conf.in.
Now it happens in install and on image/usr/lib/sysusers.d/basic.conf.

However, that file is not present if sysusers is not in PACKAGECONFIG,
since that file in that case is not installed hence resulting in:
sed: can't read &lt;redactedpath&gt;/image/usr/lib/sysusers.d/basic.conf: No such file or directory

Previously, in the case of sysusers not being in PACKAGECONFIG, that was a
"silent error" since the replacement was done but the file was not really
used since the file was not installed.

Signed-off-by: Christian Bräuner Sørensen <a class="moz-txt-link-rfc2396E" href="mailto:yocto@bsorensen.net">&lt;yocto@bsorensen.net&gt;</a>
---
 meta/recipes-core/systemd/systemd_255.4.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index e7498c802d..f58a1bc2b6 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -271,14 +271,16 @@ WATCHDOG_TIMEOUT ??= "60"
 
 do_install() {
 	meson_do_install
-	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
-	# This is done merely for backward compatibility with previous systemd recipes.
-	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
-	# may have unexpected runtime behaviors.
-	if [ "${ROOT_HOME}" != "/root" ]; then
-		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
-		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
-	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'sysusers', 'true', 'false', d)}; then
+            # Change the root user's home directory in /lib/sysusers.d/basic.conf.
+            # This is done merely for backward compatibility with previous systemd recipes.
+            # systemd hardcodes root user's HOME to be "/root". Changing to use other values
+            # may have unexpected runtime behaviors.
+            if [ "${ROOT_HOME}" != "/root" ]; then
+                    bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
+                    sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
+            fi
+        fi
 	install -d ${D}/${base_sbindir}
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
 		# Provided by a separate recipe
</pre>
    </blockquote>
    <p>Any input on the patchset ? Would appreciate if it could be
      included in the scarthgap release.<br>
    </p>
    <p>/Christian<br>
    </p>
  </body>
</html>

--------------eQ5eJbPIguqug7kAv9rRLHCH--

