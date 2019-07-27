Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 521076007A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 10:12:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so56928577wru.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=DAEY6bEnbDP0Si6OxBOfRHsbOv4uryleRpm4wGHioC0=;
	b=QTH+NHUioWgDkJtgs+BF8njBKFVnft/5ZBJaxFVjmzbeTLDWhO29GDaXY65vqMzc/H
	vc8ZiCQNFp8wb0Kc2sy+3/w1aBPkYuNouOWv+xQe+i2QwTDCGtHcjS8KXbLcAFiNwFJk
	jYPcOzhpDn8XUKtgb1QqEeC8QJkFZfQkdm8ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DAEY6bEnbDP0Si6OxBOfRHsbOv4uryleRpm4wGHioC0=;
	b=igt4UvblfOc0pxOCF4jnnel0Di5jXGXoKz+5L4ttGtSVuZKI97oAo06sRu2kSixKVU
	ud/mlFmffgWnkO0D7ZLHoF1VWtoqItK6ETSLzVZ60VJLNY0BJiiTlZ6cPrD6JuDW6lcW
	Y4mA+1d8ckN0eBxVbk6mBKsFyo6fRliJwLN6ZnmXt59TB8waYL+3IrZmxTGHEVuVQ+Cm
	QHGZAXoCN63z+VQxyiFai6gPDeEy0nB1N+alZ13tN1SKbWVVDDMTrdpE405jebzqcIH+
	CVu7bpJWrSRQYDEUll1EN3MFLsWhG5U58QSxnGoXnuGZlkWtjEuGi+lKHTADRa55Lukg
	2gDg==
X-Gm-Message-State: APjAAAU9vcvWCU/POLnVtYjS2CIZ3Tv1QeTDW/6A6DnPUvFq8IaoUjlc
	Kf6u7slfdBC8W6msnUdpOgooyw==
X-Google-Smtp-Source: APXvYqz4q1gUMQdRmr9+opgMv0RslRdxSMSReeZ9wNR5rWYksRV9uq4YmmaI7ojeSzPhgn7OkShJDg==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr4936581wrv.207.1564222365720; 
	Sat, 27 Jul 2019 03:12:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o6sm109816205wra.27.2019.07.27.03.12.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 03:12:44 -0700 (PDT)
Message-ID: <35cbc68581c288a2d4066f8205d130061f4acf8a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Lock <jlock@vmware.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 27 Jul 2019 11:12:43 +0100
In-Reply-To: <5c2484a9c2c5dd78f7c4488839a4e2d2929e2c7d.1564139487.git.jlock@vmware.com>
References: <cover.1564139487.git.jlock@vmware.com>
	<5c2484a9c2c5dd78f7c4488839a4e2d2929e2c7d.1564139487.git.jlock@vmware.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [RFC PATCH 3/3] classes/sstate: regenerate sstate when signing enabled
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
X-List-Received-Date: Sat, 27 Jul 2019 10:12:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-26 at 11:26 +0000, Joshua Lock via Openembedded-core
wrote:
> This change ensures that the task signatures changes, and therefore
> sstate tasks are rerun, when signing is enabled. This has the
> positive outcome that if signing is enabled new signed shared state
> objects will be produced, rather than just signing shared state
> objects for tasks where no work has been performed yet.
> 
> The downside of this change is that enabling/disabling sstate object
> signing alters the taskhash and results in rebuilding the world.
> 
> Signed-off-by: Joshua Lock <jlock@vmware.com>
> ---
>  meta/classes/sstate.bbclass | 10 ++++++++--
>  meta/lib/oe/gpg_sign.py     | 10 ++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass
> b/meta/classes/sstate.bbclass
> index 3342c5ef50..b060e15053 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -659,8 +659,12 @@ def sstate_package(ss, d):
>      if d.getVar('SSTATE_SKIP_CREATION') == '1':
>          return
>  
> +    sstate_create_package = ['sstate_report_unihash',
> 'sstate_create_package']
> +    if d.getVar('SSTATE_SIG_KEY'):
> +        sstate_create_package.append('sstate_sign_package')
> +
>      for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
> -             ['sstate_report_unihash', 'sstate_create_package',
> 'sstate_sign_package'] + \
> +             sstate_create_package + \
>               (d.getVar('SSTATEPOSTCREATEFUNCS') or '').split():
>          # All hooks should run in SSTATE_BUILDDIR.
>          bb.build.exec_func(f, d, (sstatebuild,))
> @@ -774,7 +778,7 @@ sstate_create_package () {
>  }
>  
>  python sstate_sign_package () {
> -    from oe.gpg_sign import get_signer
> +    from oe.gpg_sign import get_signer, SignFailedError
>  
>      if d.getVar('SSTATE_SIG_KEY'):
>          signer = get_signer(d, 'local')
> @@ -783,6 +787,8 @@ python sstate_sign_package () {
>              os.unlink(sstate_pkg + '.sig')
>          signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY',
> False), None,
>                             d.getVar('SSTATE_SIG_PASSPHRASE'),
> armor=False)
> +    else:
> +        raise SignFailedError("Can't sign sstate packages without
> key, SSTATE_SIG_KEY empty")
>  }
>  
>  python sstate_report_unihash() {
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 2fd8c3b1ac..ec5ace0dd0 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -123,6 +123,16 @@ class LocalSigner(object):
>          return ret
>  
>  
> +class SignFailedError(bb.build.FuncFailed):
> +    def __init__(self, description, name=None, logfile=None):
> +        self.description = description
> +        self.name = name
> +        self.logfile = logfile
> +
> +    def __str__(self):
> +        return 'Signing failed: %s' % self.description
> +
> +

Whilst this subclass is quite pythonic, I'm not sure we want to do
this. At the back of my mind is the feeling that FuncFailed is a bit
pointless :/.

Put differently, what does this buy us that bb.fatal() doesn't?

We do have a few users of FuncFailed in OECore but not many (about
8)...

Cheers,

Richard




