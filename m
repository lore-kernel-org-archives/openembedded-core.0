Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C1EC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 10:39:22 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.13159.1737455955276998265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 02:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E74biH5t;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385dece873cso2875678f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 02:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737455953; x=1738060753; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOkattKgQts5bRT7oqa1KH+XiRMsOP9Nq9VFc1Y3LFc=;
        b=E74biH5tJWBwJfAzs2jMqmbyHpKl1Rds4ENTIMKTVyHlRsdGjJBS8ohuMkJ2xbPzEU
         F9eo5VMhTN522xY/AkvafqbPIUXs+waOQ+QrAnC5zHXv2XEccyNDmHxFqVtqlQXmQtEk
         zzXQeAkEZsFfxdRLCMbnjlFPs/k8DVUeOMM61mpgzJObfmB2S/quyI02YBRKhWgaBjW5
         kYCStIehnzySD/Ko7Hs/pn0CI3LIncR9oim606bxizHcMjL9SJWPiBNck5qh3FJC4/Ga
         f+4ko5O/aSPghf9tqf/DNSeszOaC0D8un83SpsZ9quGLafGd6vp0/R10j5GzS9h1DQCR
         lhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455953; x=1738060753;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZOkattKgQts5bRT7oqa1KH+XiRMsOP9Nq9VFc1Y3LFc=;
        b=vfiin1WBsmGFDz+xeHvjfIogh0+Dig/oefdPCKw7NUi2rV11RlJts3CU7x0YzVsJgP
         rxnM5nHuCjSSchalk5eVpBlBTTh8If48JZz6QOCIUf61MrSUVXJmLM5fqgBrMwiIo8J8
         fF9FejnnSshv966AYhlRAleU0bQBUMJY/jziW50Q+KTEZutlWDDkh1eBmf1zeKu//aH7
         QI9h1c/MspMjVDxLcP3EPGhfsdz/tPF4xPmFP1nXqavL9mq6DEpmvPiykRyqu3mygNUR
         465nhCGBbf96OoQnMZQNjrTQXiTSZbP2EC/ANcjIF1EVLaKNw4YPSw68ams6Fo/7vN4V
         FXDw==
X-Forwarded-Encrypted: i=1; AJvYcCWGA6cS2Qm3S5jMrhXvFW+IVJ8hbDslNwXCDukKJYcLr05YnNmbgDO2N8kWiGVWXeNyrn4RGCRcq0SwstQcgFqEqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFozABoJ4xOuEAupG7XiqHy6qSsWvRQRKPCkRcKrCNOXurmlHM
	MwX8SHHfUpqSnugd6wSlXNNO5AC9w7sRIor0NZNff0i1AQnNst5eSRG3Gth0
X-Gm-Gg: ASbGncvqBk/grdKPO6ohLBh9TP2XxZnpq4hTHGYc26xbfh9zBN8KT1YzN2Jtsvxt+p8
	Hecm68QS6nxf63qU9HYH/38f00vRrmiqieyRLs86ZEszDnNY+RIZnDS+EcsTz3tfUT5ppRLld+V
	V3tj4U5qVRPfgGK5H9E3tep/1shCcGaN3f6rsrm0XhHytJyqBTQ3Pi7LvsRb3PsqqJr0Y13d7gG
	Xd86qyQ21sZyH4GqA7zErApK5xxLPde7qYyvQKjxv+DZWyQKz8pB8QIRv/g92JF7A5prOhxvWQa
	rjvWbO/M1CE=
X-Google-Smtp-Source: AGHT+IHdBuoQEnNziJCEv/rcHth5NGAJ0DRTsoErDr401FZyFV6oAUqBAKX8kmKbfKWtoThSWP0ICg==
X-Received: by 2002:adf:f811:0:b0:385:e3c5:61ae with SMTP id ffacd0b85a97d-38bf56785f2mr13091176f8f.31.1737455953286;
        Tue, 21 Jan 2025 02:39:13 -0800 (PST)
Received: from [10.139.9.253] ([154.47.27.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bfeb391ffsm10722576f8f.63.2025.01.21.02.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 02:39:12 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------XCuX0tw810ho06qqg0GhdnsE"
Message-ID: <7577a74b-59f0-4fd2-a73c-fea954855b92@gmail.com>
Date: Tue, 21 Jan 2025 11:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] files: overlayfs-create-dirs: Improve mount
 unit dependency
To: esben@geanix.com, openembedded-core@lists.openembedded.org
References: <20250118-overlayfs-requires-v1-1-8f3eafdb54d0@geanix.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20250118-overlayfs-requires-v1-1-8f3eafdb54d0@geanix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210086

This is a multi-part message in MIME format.
--------------XCuX0tw810ho06qqg0GhdnsE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Looks good. Thanks for the patch.

Slava

On 18.01.2025 19:49, Esben Haabendal via lists.openembedded.org wrote:
> The RequiresMountsFor configuration option of systemd.unit (added in
> systemd version 201) not only adds the Requires and After options for
> the required mount unit, but it adds them for all mount units required
> to access the specified path.
>
> So this change is both a simplification, and an improvement.
>
> Not only will all needed mount units be added to Requires and After, but
> the overlay path does not have to be a mountpoint, but can be at any
> directory level beneath a mountpoint.
>
> Signed-off-by: Esben Haabendal<esben@geanix.com>
> ---
>   meta/files/overlayfs-create-dirs.service.in | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
> index d8d916365a4562dbe522eca9f291a9a4c859f7d9..c8431548d76d18b8dfafd5a69d18f25b6629cc4f 100644
> --- a/meta/files/overlayfs-create-dirs.service.in
> +++ b/meta/files/overlayfs-create-dirs.service.in
> @@ -1,7 +1,6 @@
>   [Unit]
>   Description=Overlayfs directories setup {LOWERDIR}
> -Requires={DATA_MOUNT_UNIT}
> -After={DATA_MOUNT_UNIT}
> +RequiresMountsFor={DATA_MOUNT_POINT}
>   DefaultDependencies=no
>   
>   [Service]
>
> ---
> base-commit: f642edb006a8c16dbe45681afe547eabfae17073
> change-id: 20250118-overlayfs-requires-cc24981f679b
>
--------------XCuX0tw810ho06qqg0GhdnsE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Looks good. Thanks for the patch.<br>
      <br>
      Slava<br>
      <br>
      On 18.01.2025 19:49, Esben Haabendal via lists.openembedded.org
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20250118-overlayfs-requires-v1-1-8f3eafdb54d0@geanix.com">
      <pre wrap="" class="moz-quote-pre">The RequiresMountsFor configuration option of systemd.unit (added in
systemd version 201) not only adds the Requires and After options for
the required mount unit, but it adds them for all mount units required
to access the specified path.

So this change is both a simplification, and an improvement.

Not only will all needed mount units be added to Requires and After, but
the overlay path does not have to be a mountpoint, but can be at any
directory level beneath a mountpoint.

Signed-off-by: Esben Haabendal <a class="moz-txt-link-rfc2396E" href="mailto:esben@geanix.com">&lt;esben@geanix.com&gt;</a>
---
 meta/files/overlayfs-create-dirs.service.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
index d8d916365a4562dbe522eca9f291a9a4c859f7d9..c8431548d76d18b8dfafd5a69d18f25b6629cc4f 100644
--- a/meta/files/overlayfs-create-dirs.service.in
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -1,7 +1,6 @@
 [Unit]
 Description=Overlayfs directories setup {LOWERDIR}
-Requires={DATA_MOUNT_UNIT}
-After={DATA_MOUNT_UNIT}
+RequiresMountsFor={DATA_MOUNT_POINT}
 DefaultDependencies=no
 
 [Service]

---
base-commit: f642edb006a8c16dbe45681afe547eabfae17073
change-id: 20250118-overlayfs-requires-cc24981f679b

</pre>
    </blockquote>
  </body>
</html>

--------------XCuX0tw810ho06qqg0GhdnsE--

