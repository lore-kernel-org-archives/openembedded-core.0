Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id BEF8061663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:55:32 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id cz10so9786238veb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=LuIYguditzCviOqRsqyqG91rnbTppVBP3jiI4s5CNGo=;
	b=iVH7XaamUIqkMAUzF/iFn0cFmpnUbgUVqGfMkPr0K3GLBYnRhoqhLpWDSc7nBjX7O2
	KrerIUziBWrx+gXUWQhrUmH6X10xArFhh/CvYEoaBKAWLigAjYMs+0Cqqh9LgBDndjao
	zpSAnC362n8km+sGHXjk4T/M+FA1HLJ0i9YOnVAd2hBi3ZqslLit/TLO0qmcfbqtd7zQ
	yRdkMf43yjq/DAssI0PUxNqVVxTx9aQdV5VeC1r4Y2gDBJlnRkI7SKsJu8d7q5XkKsII
	5NRWN62f1Ly7EsjK+Y6jVJ2SNQf4ysmCQvXaVR0yvjDce1VdMHzFkd2L2iNkJuBVGqYS
	pwbQ==
X-Received: by 10.220.73.66 with SMTP id p2mr28712613vcj.94.1373900133222;
	Mon, 15 Jul 2013 07:55:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 15 Jul 2013 07:55:13 -0700 (PDT)
In-Reply-To: <1373895869-25256-2-git-send-email-cristian.iorga@intel.com>
References: <1373895869-25256-1-git-send-email-cristian.iorga@intel.com>
	<1373895869-25256-2-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jul 2013 15:55:13 +0100
Message-ID: <CAJTo0LYHNwSaBE+mHq=YzUvwq9JywXQ7ii=xXeopL_CmWh6qaA@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQmbTMOJiDa4Qxm9A4/L+POLhR37ajPmpxVmHeNumW+lv5JjKS5CLvHp0IPt/6jvVtjMtdLR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/2] bluez5: new package for v5.7
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
X-List-Received-Date: Mon, 15 Jul 2013 14:55:33 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2013 14:44, Cristian Iorga <cristian.iorga@intel.com> wrote:
> +PACKAGECONFIG ??= "\
> +    ${@base_contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
> +"
> +PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"

Just noticed this "pie" thing.  There is no defined "pie"
DISTRO_FEATURE.  PIE is generally a good thing, so just enable this.

> +ASNEEDED = ""

Was this actually needed, or copied from bluez4?

> +  --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \

The patch that adds this has been removed, so drop this.

> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
> @@ -0,0 +1,37 @@
> +require bluez5.inc
> +
> +SRC_URI += "file://bluetooth.conf"
> +
> +SRC_URI[md5sum] = "ce0ef43938e8bfc230f3f06d6ad02d7e"
> +SRC_URI[sha256sum] = "902299204b7139c913765603c7054a604570aea9e9fddb30454bd1b5e5997860"
> +
> +RCONFLICTS_${PN} = "bluez4"
> +RREPLACES_${PN} = "bluez4"
> ...

Didn't notice this before.  :(  The bulk of this isn't specific to 5.7
but general to 5.x, so it should be in the .inc file.

Ross

