Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F7AC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:33:40 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.19827.1737743095632302297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 10:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hCscMRum;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401e6efffcso2700921e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 10:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737743094; x=1738347894; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mHjqHI2+Eunh5c98EIcAqNClw1d1LVzKoSTNiKohRE=;
        b=hCscMRum2dc2VAz/poVlqL6UC/NPTrkQb1LBdh9v/gY8odhrIoJKwcaxiAmOTryIBq
         Z0/vrW3QLN6G7YpgOu6+bM9k5xGyaG44ynN5oNPQp6xCilzQeUqCnsIoXIKdkHSrCfec
         NBq8FJ6tPif3Q3RXOamD0aWycbje7HuXkf1lK+RoEUboOxFnoWieZx4GUYYe2in0Ovf2
         mEAeqJ3akm/bkjhvdVvZxMnjglBuOL6p0xtZv/ntdZ6nvRYhFMJc30szvxSli6nnmFtq
         W7kmWKCSocotIbm87zBXPHfkpAC75GfYYOfkIxrdvt+FyGV+Wjiiup4rJOd9wbBFWZdv
         BZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737743094; x=1738347894;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+mHjqHI2+Eunh5c98EIcAqNClw1d1LVzKoSTNiKohRE=;
        b=lBVj4F0oVuJA2cM84ljmI0vRtY93O9hVXFmc5YYV8vY7usK0zDk+ir2BlkBnUaUZg6
         jp54R+/zpTJM8zf7q1eXaigtBcNAFN+ZzRZec6fpXB0kuhmytE4JwkBSvjrRZSCUR/jo
         AxX319WTjDNcvCno6oVX0jHMdIxmED2te6ECFJ3e5UpRh1BAoqglTQUFV84uwQtG0yxS
         3VB9EWmWczYHEojyDP22+pg7Y+cmRkO/3mca3meAspDH2gW7YBrva1bVHjwxlQ73nepc
         KiZR6fzmuNEfAoAJrcdSwwzKc+3yHBP/iAOG4c6lBOiHv4mJUpJKIj6f0gcBZx1BMOBC
         yq7g==
X-Gm-Message-State: AOJu0Yyv6S3DrZLKlUuI7q4HsnEoc1i86uTikB5yn9jT/IQ4p6U24rh/
	Zbz3TdEwJRuGS/PqGSXQvwhZ05KK0STVIqtGxuXU/eBSn1I5jTRp
X-Gm-Gg: ASbGncufCBIaheS5n0c0D2VvxmtCzPgFcwN4SOdi0rrPSYztqjNB5ajn3yOICZK38Tv
	sFtRuzfcj+lZdMCHDy0O8xmdeL6jrJX43yiNtOyQ/W1EkZvSmA1RPvL5AHVbmHaXWLCq5J/7qZv
	r3iNGr+MNl/byWRngIemYPNNWmAvNwlqLyjdmbxBLpqag719EAGfOMaXhy/zgLKfrLq9qKqg6qo
	04wFvmWtNsZrdaorSpHWLN9cUq4Tbfk483A/UlzhyFnQk0jCyt0MOEQ2V8fizbuVwWRm06qrQXY
	vCc0dGkTEBohCP2mHvxV/mMPmn/lu42XWl0TQhMNs1E9MGqXhut4sa2R
X-Google-Smtp-Source: AGHT+IHUboPmznARON1a1pJ+wcFsaiUdZifqNDtND3q2aGgOB8bvx7hTsutWhv2HXq0p32Pv/3C5CA==
X-Received: by 2002:ac2:44c8:0:b0:542:86e6:c16e with SMTP id 2adb3069b0e04-5439c282b30mr9286047e87.38.1737743093276;
        Fri, 24 Jan 2025 10:24:53 -0800 (PST)
Received: from [192.168.0.15] (89-64-20-185.dynamic.chello.pl. [89.64.20.185])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8368404sm371532e87.152.2025.01.24.10.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 10:24:52 -0800 (PST)
Message-ID: <bc3f0959-969e-4298-9d1f-04c5202f9b63@gmail.com>
Date: Fri, 24 Jan 2025 19:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 8/8] image.bbclass: enable systemd user services
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
References: <20250120124605.263817-2-arturkow2000@gmail.com>
 <20250120124605.263817-10-arturkow2000@gmail.com>
 <6QFLQS.3B9MTODL3DXT1@t-online.de>
From: "Artur Kowalski" <arturkow2000@gmail.com>
In-Reply-To: <6QFLQS.3B9MTODL3DXT1@t-online.de>
Content-Type: multipart/alternative;
 boundary="------------8MX98Oua0bsRihI1BTwX4TFV"
Content-Language: pl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 19:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210247

--------------8MX98Oua0bsRihI1BTwX4TFV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Can you provide your `log.do_image` file? I will try to reproduce this 
locally too.


W dniu 24.01.2025 o 13:51, Markus Volk pisze:
> With this patch applied I see an error in image creation after 
> do_rootfs if gnome-shell is installed:
>
> | Error: Systemctl preset_all issue in org.gnome.Shell@wayland.service
> | WARNING: 
> /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.2011511:158 
> exit 1 from 'systemctl 
> --root="/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs" 
> --global --preset-mode=enable-only preset-all'
>
>
>
> On Mon, Jan 20 2025 at 13:46:06 +01:00:00, Artur Kowalski via 
> lists.openembedded.org <arturkow2000=gmail.com@lists.openembedded.org> 
> wrote:
>> Run systemctl preset-all with --global flag so user unit's are 
>> enabled the same way system units are. Signed-off-by: Artur Kowalski 
>> <arturkow2000@gmail.com> --- meta/classes-recipe/image.bbclass | 1 + 
>> 1 file changed, 1 insertion(+) diff --git 
>> a/meta/classes-recipe/image.bbclass 
>> b/meta/classes-recipe/image.bbclass index 84a2017eb5..f08818db03 
>> 100644 --- a/meta/classes-recipe/image.bbclass +++ 
>> b/meta/classes-recipe/image.bbclass @@ -702,6 +702,7 @@ 
>> reproducible_final_image_task () { systemd_preset_all () { if [ -e 
>> ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then systemctl 
>> --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all + 
>> systemctl --root="${IMAGE_ROOTFS}" --global --preset-mode=enable-only 
>> preset-all fi }
>> -- 
>> 2.47.1
>> 

--------------8MX98Oua0bsRihI1BTwX4TFV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Can you provide your `log.do_image` file? I will try to reproduce
      this locally too.<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">W dniu 24.01.2025 o 13:51, Markus Volk
      pisze:<br>
    </div>
    <blockquote type="cite" cite="mid:6QFLQS.3B9MTODL3DXT1@t-online.de">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div id="geary-body" dir="auto">
        <div>With this patch applied I see an error in image creation
          after do_rootfs if gnome-shell is installed:</div>
        <div><br>
        </div>
        <div>
          <div>| Error: Systemctl preset_all issue in
            <a class="moz-txt-link-abbreviated" href="mailto:org.gnome.Shell@wayland.service">org.gnome.Shell@wayland.service</a></div>
          <div>| WARNING:
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.2011511:158
            exit 1 from 'systemctl
--root="/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs"
            --global --preset-mode=enable-only preset-all'</div>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
      </div>
      <div id="geary-quote" dir="auto"><br>
        On Mon, Jan 20 2025 at 13:46:06 +01:00:00, Artur Kowalski via
        lists.openembedded.org
        <a class="moz-txt-link-rfc2396E" href="mailto:arturkow2000=gmail.com@lists.openembedded.org">&lt;arturkow2000=gmail.com@lists.openembedded.org&gt;</a> wrote:<br>
        <blockquote type="cite">
          <div class="plaintext" style="white-space: break-spaces;">Run systemctl preset-all with --global flag so user unit's are enabled
the same way system units are.

Signed-off-by: Artur Kowalski &lt;<a
          href="mailto:arturkow2000@gmail.com" moz-do-not-send="true"
          class="moz-txt-link-freetext">arturkow2000@gmail.com</a>&gt;
---
 meta/classes-recipe/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 84a2017eb5..f08818db03 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -702,6 +702,7 @@ reproducible_final_image_task () {
 systemd_preset_all () {
     if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
 	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+	systemctl --root="${IMAGE_ROOTFS}" --global --preset-mode=enable-only preset-all
     fi
 }
 
<div>-- 
</div>2.47.1

</div>
          <div class="plaintext" style="white-space: break-spaces;">


</div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------8MX98Oua0bsRihI1BTwX4TFV--

