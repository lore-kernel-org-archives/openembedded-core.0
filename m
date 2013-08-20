Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5093C6B8BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 11:59:11 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id jz10so195793veb.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 04:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K83F5VDD9Eno/DiifT3OyZQo3tPneeMU40vkfglkmYs=;
	b=CONYMDIvKcLa9bwByVrUpYbIaOhovb6B5Pi3DMW2tqPz6u2jgR+gDF7HNARjEO+09s
	vl+e/NhqGNixFPtUluFQ7La37PhNqVsuow5ahwgC9xP+UzJ94pvu6mc14r79ZHQcyITf
	aWUkhCz3eBCnf0OdLy8Ahrzx2N05jcAHzOZIjuFoUtB1W9VMojxZQjPpLT1W/gqIE1r7
	pUWDsYhUMFbgL+4illTYnyrqNg9BnKJ7V9B3ddt3Nsz1i1vYFIIB5nF3iDby3Yj3Z6Hy
	fIFnCM/83sF8KKpP5QqoFs7id4kQEUR/RW4FFCL3ri6dnnGqFhjJ8ORG54Bp+J7q+3zQ
	3qlg==
X-Gm-Message-State: ALoCoQlxBM4AfZCfN3+7fuN5raDw5vvE33n7cLGQVeVKulMAjX8+c0XmmtK+ExO86P/RdZY6QoYu
X-Received: by 10.58.152.3 with SMTP id uu3mr912019veb.16.1376999951735; Tue,
	20 Aug 2013 04:59:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 20 Aug 2013 04:58:51 -0700 (PDT)
In-Reply-To: <1376393206-14191-1-git-send-email-kirgene@gmail.com>
References: <1376393206-14191-1-git-send-email-kirgene@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Aug 2013 12:58:51 +0100
Message-ID: <CAJTo0LYOGTfkUFnWNUnFUA68ABwsYj_uZQc_FnBF4ka13ApaWQ@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] connman: fix systemd support for connman-* packages.
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
X-List-Received-Date: Tue, 20 Aug 2013 11:59:12 -0000
Content-Type: text/plain; charset=UTF-8

On 13 August 2013 12:26, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> +python __anonymous () {
> +    systemd_packages = "${PN}"
> +    pkgconfig = d.getVar('PACKAGECONFIG', True)
> +    if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
> +        systemd_packages += " ${PN}-vpn"
> +    d.setVar('SYSTEMD_PACKAGES', systemd_packages)
> +}

I'm not keen on this as its quite a lot of logic to put in the recipe
when it would be good to handle this case of optional packages in the
systemd class itself.

However I'm not sure how best to do this as the FILES_* manipulation
needs to happen *before* the package split, and this check can only
happen *after* the package split.  I wonder if it's possible to split
up the systemd class functionality like that.

So, we should probably merge this now, and try and fix the class so we
can remove it again later.

Ross

