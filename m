Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D914EF06F8
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 22:52:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35981.1770591129044617842
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 14:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oe/hlFXG;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436e87589e8so741976f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 14:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770591127; x=1771195927; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJtYYYmpND4WB27F0P2XP+97Dlnh85lvA6lhS4SjvjM=;
        b=oe/hlFXGjBySnLw07Tcw3eiDP4EQbWYzcpQ+R4mB8jzGYWitiME/di9BBz9alBAdtH
         e6aWEeyMGyJVr0w9BRLZ+M0NRrcBO0iJAX1+PF0h4Ik9uyEQVXwymtZyhLoxqTSPe+65
         PJp3rhg9U+fCT9GHC+oE/Owi88LeQ1xsLcVU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770591127; x=1771195927;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJtYYYmpND4WB27F0P2XP+97Dlnh85lvA6lhS4SjvjM=;
        b=eF5BdPDYo4WVujMSl9eRaBx6Uougy7k4WOjg8DvEO5roACO5fM19zbHun0XERwfH+J
         SjCdCHx2D6wQx29s+dopHW/ry737WaqjwPgGWMbRpRST9HaSdYadvRp7v2Ig1lEUU9G4
         Z9FwmkFbkjYRtODVa4h9GaFP1TjG+QlNaQgsDOSDVO/TBp08egK5iJ52fBoqJq2nOgvx
         iiHIvcT3WdO70QnNr0a6qQ0C96vZhQPQO432hlhocdArXqYq9SGYJaaQALEorsradVCI
         WPI+yNqoovEHQZl8ecOMrgW8OBEAUnaRuhUO0BoUUnbtcNUvaI/dXBTGQjqvrnvLvM9r
         hXHA==
X-Forwarded-Encrypted: i=1; AJvYcCU3hI5FeHcJJfCu/Jtd+PbmHQI3HONM4Bi71LbV32wNXw0gXtjndZjxXFzAw63FicHM8WEoGw0FG8VsgpOZ9q/trw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMyn2CvQc8S8VGrZGI3nsPwIw9cC8n7CzvXJVIyPIJEAQFGDor
	7lvOKwGpv482H2ad+d9a1SvuBtlRCzRpjdrZhLPxiUDfNMxgDDvWXasAm8YHGLde1+E=
X-Gm-Gg: AZuq6aJ3sc370UpjQLePHxLI8unYqkbYcg7YiJqYyIGlZdKYeaDPLIaSHpm8Sb/Hmh3
	dS3sFkT3oMTAk0kIUP/qrVWc764mIXJz6VkR3d/BIlgSPA+xBinJgzWD0rD7p4sY5ED+v3Ns5PT
	b86HLBi2AiMGejBZfnsTKtfkVB1PNIG6/HXa/LXkIOltSOVKo2rG8oNPeiLAz0FCMExcE7FlBn7
	n2BN900tTVFtsswofEHKX0CNOCU8vWyNkobzFcdEEAj5uQLS9wHQnTMPAgIUZIrhL+Qy9b+1xje
	CR3BDjb86ORO0zwukOWuTXWr96UnsK+jB7clmcCRgsp8OLCVw9pVoShiPp5myvNQZfRVbOXPOv0
	m+7FcoVb28XsQCpeQiseiGV8uzw6qXoUCziVuzLZORTxYVIxaekDcxYC59eDpVL4knrRktNFgOI
	EJXGCPcT4eA5AFbL6/k4lsyZiwVIatxMy+DUcwM17CorHSPXbe/u+y299wYWpFCDqFAF1y0vF6j
	+g=
X-Received: by 2002:a5d:5c8a:0:b0:436:18d3:25 with SMTP id ffacd0b85a97d-4362933b989mr13299340f8f.10.1770591127258;
        Sun, 08 Feb 2026 14:52:07 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376accfc58sm6982625f8f.16.2026.02.08.14.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 14:52:06 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Feb 2026 23:52:07 +0100
Message-Id: <DG9Y66TJR6U3.290J0DTI0OT6Z@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/1] lighttpd: Fix trailing slash
 on files in mod_dirlisting
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Fred Bacon" <bacon@aerodyne.com>
To: <fred.w.bacon@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260120155748.32482-1-fred.w.bacon@gmail.com>
 <20260120155748.32482-2-fred.w.bacon@gmail.com>
In-Reply-To: <20260120155748.32482-2-fred.w.bacon@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 22:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230700

Hello,

Thanks for the patch, it looks good!
Just 2 notes that I fixed:

On Tue Jan 20, 2026 at 4:57 PM CET, Fred Bacon via lists.openembedded.org w=
rote:
> From: Fred Bacon <fred.w.bacon@gmail.com>
>
> Fixes [YOCTO #16128]
>
> Backport of upstream bug fix from lighttpd-1.4.75. Version 1.4.74 introdu=
ced a bug that
> would append a trailing slash to files in a directory listing. When the u=
ser attempts to
> download one of these files, the web browser could not save the file with=
 a trailing
> slash. As a consequence, every web browser tested would generate a random=
 character string
> for the saved file name.
>
> Upstream-Status: Backport [1.4.75]

That line in the commit message is useless, I removed it.

> Signed-off-by: Fred Bacon <bacon@aerodyne.com>
> ---
>  .../lighttpd/0001-mod_dirlisting.patch        | 48 +++++++++++++++++++
>  .../lighttpd/lighttpd_1.4.74.bb               |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirl=
isting.patch
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.=
patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch
> new file mode 100644
> index 0000000000..8afdc1ecd0
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch
> @@ -0,0 +1,48 @@
> +From 3d400ce06dcb950a61363f87330324db244f4bac Mon Sep 17 00:00:00 2001
> +From: Glenn Strauss <gstrauss@gluelogic.com>
> +Date: Thu, 29 Feb 2024 20:59:57 -0500
> +Subject: [PATCH] [mod_dirlisting] fix suffix display of '/' on file (fix=
es
> + #3242)
> +
> +fix incorrect suffix display of '/' on files
> +
> +(regression in lighttpd 1.4.74)
> +
> +(thx guy)
> +
> +Upstream-Status: Backport [1.4.75]

We usually use the specific commit URL in patch. I replaced by:
Upstream-Status: Backport [https://github.com/lighttpd/lighttpd1.4/commit/3=
d400ce06dcb950a61363f87330324db244f4bac]
> +
> +References:
> +[1] https://redmine.lighttpd.net/issues/3242
> +
> +Signed-off-by: Glenn Strauss <gstrauss@gluelogic.com>
> +---
> + src/mod_dirlisting.c | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/mod_dirlisting.c b/src/mod_dirlisting.c
> +index a3432211..2686cd3e 100644
> +--- a/src/mod_dirlisting.c
> ++++ b/src/mod_dirlisting.c
> +@@ -1022,10 +1022,19 @@ static void http_list_directory_dirname(buffer *=
 const out, const dirls_entry_t
> + 	buffer_append_string_len(out, CONST_STR_LEN("</td><td class=3D\"s\">- =
&nbsp;</td><td class=3D\"t\">Directory</td></tr>\n"));
> + }
> +=20
> ++static void http_list_file_ent(buffer * const out, const dirls_entry_t =
* const ent, const char * const name) {
> ++	buffer_append_string_encoded(out, name, ent->namelen, ENCODING_REL_URI=
_PART);
> ++	buffer_append_string_len(out, CONST_STR_LEN("\">"));
> ++	buffer_append_string_encoded(out, name, ent->namelen, ENCODING_MINIMAL=
_XML);
> ++	buffer_append_string_len(out, CONST_STR_LEN("</a></td><td class=3D\"m\=
">"));
> ++
> ++	http_list_directory_mtime(out, ent);
> ++}
> ++
> + static void http_list_directory_filename(buffer * const out, const dirl=
s_entry_t * const ent, const char * const name, handler_ctx * const hctx) {
> + 	buffer_append_string_len(out, CONST_STR_LEN("<tr><td class=3D\"n\"><a =
href=3D\""));
> +=20
> +-	http_list_directory_ent(out, ent, name);
> ++	http_list_file_ent(out, ent, name);
> +=20
> + 	const buffer *content_type;
> +   #if defined(HAVE_XATTR) || defined(HAVE_EXTATTR) /*(pass full path)*/
> +
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb b/meta/rec=
ipes-extended/lighttpd/lighttpd_1.4.74.bb
> index 7460d3d716..e48fd16514 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/rele=
ases-1.4.x/lighttpd-${PV}.t
>             file://index.html.lighttpd \
>             file://lighttpd.conf \
>             file://lighttpd \
> +           file://0001-mod_dirlisting.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "5c08736e83088f7e019797159f306e88ec729abe976dc98f=
b3bed71b9d3e53b5"

--=20
Yoann Congal
Smile ECS


