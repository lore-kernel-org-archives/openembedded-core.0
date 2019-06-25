Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD1E7E403
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 14:14:33 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p13so18060273wru.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=TZs6Kq5ddr67nHx7T/H465o9/9QNp3uZ0dqfUMMwRHo=;
	b=ZEW7NEMNfcVv+qeTz+29GA8kl3Z0ze3OCjKu+UTmi7U+kzguILzdZyImFC2SB/JTmM
	9P84xnUV0fksfM9lmpi/bEH41a51w3KGt1TTbQ1uoFw8akn/9HL0X6/lsec0c9nZ6ikS
	jhO13hHWGuqEYpMFfc3hYSmc4c0Hek8GwY8RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TZs6Kq5ddr67nHx7T/H465o9/9QNp3uZ0dqfUMMwRHo=;
	b=UVEddMnJyQJaVRMEDWYPT+GKe1nprM3Fex2ZPI5HLTpbEKoeBNA4ZkElUqWwJLr03s
	dDbTqg5XtzdHppQJ0aGF/ZB9mDAUa1GhzC8pJcmBWnht1JSwbaybcGwEexIYmy65bLHj
	PSCl0laht6UlaII5uCGcuoX57EPogVI0Rnbnj6o/nmMR2Ywck2gksY/PZnhbp7xEE0zq
	sGshApsC6UGOOUoSAgjDcsVVbwIjVbB0otLsnSNx1HIS3WznqDrxYwzOepc+csozBzym
	hXGdIoeeDMzoUGg92yB+rKxob/peZfHpY+50nnOKsGyCW/Vq5CLVAgsNvtMkxzx2Z0QS
	D9Sw==
X-Gm-Message-State: APjAAAV3mIdod8D0HFj5wLvEtNgNRnC6aA42yWXQbPAjErTEHetvE+0f
	JlP4d6CdlPM4/532cd1BfmDbhA==
X-Google-Smtp-Source: APXvYqyw611/ZDXng0mEbmpp/LfeAqD3RWBT9N37DJejOyo/WE1X337GPSjVjI0FJs7KdoyW9FVLQg==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr6614272wrj.103.1561472073985; 
	Tue, 25 Jun 2019 07:14:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x8sm1953729wmc.5.2019.06.25.07.14.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 07:14:33 -0700 (PDT)
Message-ID: <d03b1b52ce889724523ea4bb22b1359cf0fe399d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 15:14:30 +0100
In-Reply-To: <d60c082c2c60c704d0d050c62ee91667c90a4eef.1561465895.git.liezhi.yang@windriver.com>
References: <cover.1561465895.git.liezhi.yang@windriver.com>
	<d60c082c2c60c704d0d050c62ee91667c90a4eef.1561465895.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] update-alternatives.bbclass: run update-alternatives firstly in postinst script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2019 14:14:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-25 at 20:44 +0800, Robert Yang wrote:
> Recipes like postfix run command newaliases in postinst, but newaliases is
> installed as newaliases.postfix, it needs run update-alternatives to update it
> to newaliases, so there was an error when installed postinst on target.
> 
> Fixed:
> $ opkg install postfix
> Configuring postfix.
> ///var/lib/opkg/info/postfix.postinst: line 4: newaliases: command not found
> 
> Run update-alternatives firstly will fix the problem. And handle busybox as an
> exception since it needs set basic tools such as sed command firstly, otherwise
> update-alternatives doesn't work.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/update-alternatives.bbclass | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
> index b702e77..9ab9298 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -265,6 +265,7 @@ python populate_packages_updatealternatives () {
>      if not update_alternatives_enabled(d):
>          return
>  
> +    bpn = d.getVar('BPN')
>      # Do actual update alternatives processing
>      for pkg in (d.getVar('PACKAGES') or "").split():
>          # Create post install/removal scripts
> @@ -284,8 +285,16 @@ python populate_packages_updatealternatives () {
>  
>              bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
>              bb.note('%s' % alt_setup_links)
> -            postinst = d.getVar('pkg_postinst_%s' % pkg) or '#!/bin/sh\n'
> -            postinst += alt_setup_links
> +            postinst = d.getVar('pkg_postinst_%s' % pkg)
> +            if postinst:
> +                # Busybox needs handle basic tools such as sed command
> +                # firstly, otherwise, update-alternatives doesn't work.
> +                if bpn == 'busybox':
> +                    postinst += alt_setup_links
> +                else:
> +                    postinst = alt_setup_links + postinst
> +            else:
> +                postinst = '#!/bin/sh\n' + alt_setup_links
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
>  
>              bb.note('%s' % alt_remove_links)

We don't write classes like this. We could just keep piling special
cases one on top of the other and it becomes a horrible unmaintainable
mess. I therefore don't want to see recipes "special cased" like this
in core code and we need to find another, better way to handle this.

Cheers,

Richard




