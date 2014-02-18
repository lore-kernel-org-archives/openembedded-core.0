Return-Path: <sledz@dresearch-fe.de>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 16CA46E9F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 07:30:36 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id d10so7688940eaj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 23:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=vl/KrOjck166Nd/dgQog5WSrvk4OpDgtxOIDcntS3eY=;
	b=YCgRTeVtfw1xOF+bBBqr94GPCAT+JJhZA+O/pjhXWU7bFGKF/4BICnZi4zgKefHfCI
	PWgsbBH4qiVLkBFWI8C+7UxKbqVCMlbAsZQKnpXMHwIIBt7GYMATN6wkb8Mz/v1ulzzV
	L6Vxyoo2Ikm3FlzrZV4DubIrVvyBrLsAF9Spil/wxmBnQ+DCUX1iTFAkTqmROvm1HUAw
	inTVbUCwDg8FqKekppctp3NqRE0MQJRYQjHa5lYT9ViRHtWAfVHR/3K7XG5Z8RpySE7p
	5t1OPBo918Ww+3ujAYHE9GeX+oeaO1k24dN/IBqnezKElAtewqa16rr+ErbhAyqqr4BI
	njGg==
X-Gm-Message-State: ALoCoQnhobRX4LP2ANgclesEDqgz3Xu/mS2WKuzahMhxa4If8dW8WNdQR3ovM4Kbp9GsxkFmWoW8
X-Received: by 10.14.5.11 with SMTP id 11mr7197794eek.57.1392708637315;
	Mon, 17 Feb 2014 23:30:37 -0800 (PST)
Received: from mobil-400-586.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116]) by mx.google.com with ESMTPSA id
	i43sm66699120eeu.13.2014.02.17.23.30.35 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Feb 2014 23:30:36 -0800 (PST)
Message-ID: <53030C1B.5080205@dresearch-fe.de>
Date: Tue, 18 Feb 2014 08:30:35 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1392109171-29549-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1392109171-29549-1-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] lighttpd: introduce /etc/lighttpd.d subdir for config file includes
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
X-List-Received-Date: Tue, 18 Feb 2014 07:30:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.02.2014 09:59, Steffen Sledz wrote:
> Extend default config file by a directive to include config file
> fragments from /etc/lighttpd.d. This allows other web application
> packages to put their configuration there.
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf | 3 +++
>  meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb     | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
> index 3342470..6e8402d 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
> +++ b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
> @@ -326,3 +326,6 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
>  #include_shell "echo var.a=1"
>  ## the above is same as:
>  #var.a=1
> +
> +# include other config file fragments from lighttpd.d subdir
> +include_shell "find /etc/lighttpd.d -maxdepth 1 -name '*.conf' -exec cat {} \;" 
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
> index 2ddab16..2ea5f85 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
> @@ -5,6 +5,7 @@ BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
>  
> +PR = "r1"
>  
>  SECTION = "net"
>  DEPENDS = "zlib libpcre"
> @@ -47,7 +48,7 @@ INITSCRIPT_PARAMS = "defaults 70"
>  SYSTEMD_SERVICE_${PN} = "lighttpd.service"
>  
>  do_install_append() {
> -	install -d ${D}${sysconfdir}/init.d ${D}/www/pages/dav
> +	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
>  	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
>  	install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
>  	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
> 

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

