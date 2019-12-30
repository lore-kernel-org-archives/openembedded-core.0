Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5697FA0A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 10:15:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c127so11303387wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 02:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=veWGqKe0Ak2QU21C5/bNSYj7q2fsBqljmge/RI4EthA=;
	b=X12FqPlKkArO0Yi/Jc6hrXYKk+21sz64b85APn0jgoycfX5C3wxadxekI4q8E2FWKq
	E0G41gSDCmtAmZpy5wZ7UmuIDKqOz+XfRXrV6u2qFbf2x++mNV5Wo6jHceYQbLDBkYf4
	ZTJ0tCqdnB4xJ+k15YWHMt3oSFvSEA4kPKSZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=veWGqKe0Ak2QU21C5/bNSYj7q2fsBqljmge/RI4EthA=;
	b=uBaTNoQKdVbWNam9ikujl6jG95jiTv8eyqO4VC562vyw/iB4XWhzonjd0quJ9XPDuP
	5ZkJNb4fJXZ6NC+NbU+1ALt0o2OJ0jrEdodfSQXUy4N1grXLy0SnnvCWHCMDe0Nd6bbd
	QfTDsSDIjA9qhBP6iCzpUCNdGY0tLQG8RhOhBv13TtDepKlOsjEBoh0E39rGAEuZEx1T
	Y0zBqQfr//soKFsJdxQkZ0cRpVkhlyJhn+7TFXPRjYbfpEOdsKunUoveBcxZ0ozeoSjP
	021opSC6ixZnW6OmqjhjmAZKe/eRBEw9QeBgOoQozGaBkSAs6hbMWV5PEI7WTmKLvCqI
	PUCA==
X-Gm-Message-State: APjAAAU2NJC7tDKBCFaZw0Gi6GQHw6tdeo7n6z9k0JnaFoi84J2/kkZB
	HZ1TASZEDdlarzDvVkvTbQ6wAg==
X-Google-Smtp-Source: APXvYqzdZefpkFl3LN5XCISV/ku24uHqWyLt3OzY+FPL5ysJMzlyvFQnKpyZtAGNqM2AuM11GAXgdA==
X-Received: by 2002:a1c:9cce:: with SMTP id
	f197mr32172373wme.133.1577700924222; 
	Mon, 30 Dec 2019 02:15:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t1sm20431167wma.43.2019.12.30.02.15.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 02:15:23 -0800 (PST)
Message-ID: <7321916d8c3e0fb6fc358d1356b5326a323e062c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 10:15:22 +0000
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 01/19] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Mon, 30 Dec 2019 10:15:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-12-29 at 10:43 -0800, Khem Raj wrote:
> Use PCRE, this enables using posix extended Regexps on cmdline
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 1fa82363b1..8262217fc1 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -106,6 +106,7 @@ EXTRA_OECONF_append_class-target = " --enable-setpriv"
>  EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
>  EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
>  
> +PACKAGECONFIG ?= "pcre2"
>  PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>  # inherit manpages requires this to be present, however util-linux does not have 
>  # configuration options, and installs manpages always
> @@ -117,6 +118,8 @@ PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_s
>  PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-python --disable-pylibmount,python3"
>  # Readline support
>  PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
> +# PCRE support in hardlink
> +PACKAGECONFIG[pcre2] = ",,libpcre2"
>  
>  EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"

Can we clarify whether this change is meant to be affecting the target
or not (a comment maybe)? At the moment it would only affect
native/nativesdk which I'm fine with, I just want to ensure someone
else doesn't think it was a bug.

Cheers,

Richard


