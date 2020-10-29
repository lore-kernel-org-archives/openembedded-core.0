Received: from relay.dream-property.net (relay.dream-property.net [178.19.67.222])
 by mx.groups.io with SMTP id smtpd.web09.6281.1603964892719000514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 02:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=bad algorithm. Only rsa-sha1 or rsa-sha256 are permitted;
 spf=pass (domain: opendreambox.org, ip: 178.19.67.222, mailfrom: obi@opendreambox.org)
Received: from mail.dream-property.net (mail.dream-property.net [82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 6077310095A0A;
	Thu, 29 Oct 2020 09:48:15 +0000 (UTC)
Received: from localhost (ip-88-152-32-15.hsi03.unitymediagroup.de [88.152.32.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 55C793147709;
	Thu, 29 Oct 2020 10:48:09 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org;
	s=dkim; t=1603964894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+jAUXDO8Rja8fQNOEmK75D5bqL5VOp7ABJv7wo0MuQ=;
	b=KQF4NCOcWkiNtjQOpgVvdtorps6+RDPAAnLI2FrLSSOh5LSglqWw+17vrP2tuMYu8X9RBR
	4ct3aPm1wcN5hFDw==
Date: Thu, 29 Oct 2020 10:48:04 +0100
From: "Andreas Oberritter" <obi@opendreambox.org>
To: "kai" <kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] systemd.bbclass: check whether systemctl works in post scripts
Message-ID: <20201029104804.4b6795ec@opendreambox.org>
In-Reply-To: <20201029092650.34868-2-kai.kang@windriver.com>
References: <20201029092650.34868-1-kai.kang@windriver.com>
	<20201029092650.34868-2-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Kai,

On Thu, 29 Oct 2020 17:26:50 +0800
"kai" <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> When use a core image tarball as a docker image with 'docker import', it
> fails to install/remove package which calls systemctl in post scripts.
> Because it fais to run systemctl in a container:
> 
> bash-5.0# systemctl
> System has not been booted with systemd as init system (PID 1). Can't operate.
> Failed to connect to bus: Host is down
> 
> Replace 'type systemctl' with 'systemctl list-machines' in package post
> scripts to check whether systemctl work rather than existence.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes/systemd.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 9e8a82c9f1..9938425e2d 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -23,7 +23,7 @@ python __anonymous() {
>  }
>  
>  systemd_postinst() {
> -if type systemctl >/dev/null 2>/dev/null; then
> +if systemctl list-machines >/dev/null 2>/dev/null; then
>  	OPTS=""
>  
>  	if [ -n "$D" ]; then

Shouldn't this already have been run during image construction?

Doesn't this break our systemctl emulation (meta/recipes-core/systemd/systemd-systemctl/systemctl)?

> @@ -48,7 +48,7 @@ fi
>  }
>  
>  systemd_prerm() {
> -if type systemctl >/dev/null 2>/dev/null; then
> +if systemctl list-machines >/dev/null 2>/dev/null; then
>  	if [ -z "$D" ]; then
>  		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
>  

You're running the prerm hook inside a docker container?

Wouldn't it be more appropriate to remove the systemd DISTRO_FEATURE for a use-case like this?

Best regards,
Andreas
