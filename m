Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4DFC67949C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 22:31:16 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id s14-v6so4015818wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2H0L0DcCi8unXNz2BNrenTjtfZbNJBKRQGIz7ywVlKc=;
	b=OuQ0K77FPo+9VqM+UveZ/sp5w0MnRW+2uTRO/TOyB+pEvUSSirtzsaaS3O+XOcJxZC
	40aEJO4KSPI9MKT9qhSOoB70l1w2qtby6TkbEZYyCBub91VO4IvHKolFrATr2HhX0OiD
	6TXdInk1EFRlgGkoghHIcmHy6NHilxQsIT5l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2H0L0DcCi8unXNz2BNrenTjtfZbNJBKRQGIz7ywVlKc=;
	b=Fe+HoXHaZgJm8oRmFsxCZmvkYIJBv2Esl92xVX6kwp5MQ1N/GEwZnYMhxfntKf+vww
	QMdBf/ECzBKsmvOcrVjmaKg5QUp1nV8xk7udK7zDCa8jXwZZqB4ezrtYatGpavUuxBJv
	9I9Qye9056xowV2fc7d9URJnqfh0nslGkigzMfzv76+MjwG+iOZi0QkbWlc8DDBwztHJ
	8IW6pNp+Yk3kl+/9GBxNTe36DzZnz1LUQCeX90YDpI5roRhNUZK3EiR8GVAHiFQ5SnLj
	v7cg2w43FQ2WHu60CP9QnUd6J/xb/ZsLdaifKhzitEE97AojdGeSzppKC0+BgXS3pCDE
	wIag==
X-Gm-Message-State: APzg51AfByRnahKh2aqFfr79NZx2w+2bb5f+7s+qE3SYnlxTDu7xEWU9
	1YF2Liu4H8/9mbutW7BkSTJWXg==
X-Google-Smtp-Source: ANB0VdZY71bGQZjF7NenspJZjnB8R6ItNmFlIRcflds9FJ/WAlUkx7YsURWPacRsRP87U6ZzLTwffw==
X-Received: by 2002:adf:9101:: with SMTP id j1-v6mr3972464wrj.3.1536273076951; 
	Thu, 06 Sep 2018 15:31:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r66-v6sm10869110wmb.37.2018.09.06.15.31.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Sep 2018 15:31:15 -0700 (PDT)
Message-ID: <3f4638c2cbe530b8da9954ea68ae4304c78ee18d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Thu, 06 Sep 2018 23:31:14 +0100
In-Reply-To: <daa5eda99a0a87cd55e79dd68d7aca71c2cde746.1536248856.git.kai.kang@windriver.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<daa5eda99a0a87cd55e79dd68d7aca71c2cde746.1536248856.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] multilib: fix install file conflicts
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
X-List-Received-Date: Thu, 06 Sep 2018 22:31:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-06 at 23:52 +0800, kai.kang@windriver.com wrote:
> diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb b/meta/recipes-
> core/udev/eudev_3.2.5.bb
> index 75617c8d4e..75130f03ef 100644
> --- a/meta/recipes-core/udev/eudev_3.2.5.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.5.bb
> @@ -23,7 +23,9 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/$
> {BP}.tar.gz \
>  SRC_URI[md5sum] = "6ca08c0e14380f87df8e8aceac123671"
>  SRC_URI[sha256sum] =
> "49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af"
>  
> -inherit autotools update-rc.d qemu pkgconfig distro_features_check
> +inherit autotools update-rc.d qemu pkgconfig distro_features_check
> multilib_script
> +
> +MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/pkgconfig/udev.pc"
>  
>  CONFLICT_DISTRO_FEATURES = "systemd"
>  
> @@ -65,7 +67,7 @@ PACKAGES =+ "eudev-hwdb"
>  
>  
>  FILES_${PN} += "${libexecdir} ${base_libdir}/udev ${bindir}/udevadm"
> -FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
> +FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc* \
>                     ${includedir}/libudev.h ${libdir}/libudev.so \
>                     ${includedir}/udev.h ${libdir}/libudev.la \
>                     ${libdir}/libudev.a
> ${libdir}/pkgconfig/libudev.pc"

I already commented on this, the file should be installed into libdir
if its arch specific. I suspect libudev.pc is, udev.pc is not and
udev.pc needs to stop referencing libdir. 

Regardless, we're not using MULTILIB_SCRIPTS for .pc files.

Cheers,

Richard

