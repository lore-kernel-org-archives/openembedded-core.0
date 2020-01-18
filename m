Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6AACA6C1CA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 08:40:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so9811319wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 00:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rrCvINmoIXl9cSli1I7jXL+ozWBc8mDs8KBpWF/P6Z4=;
	b=M+7lL6eeIcsDtZ1Iqz8W4ONO57V8O0Oo4jjswXXqhnlyMK4kgq/MXk3QaoQl/r9bKH
	FJjwlMtoDBUfKppIXcWtN+5umiFNGWm8+3/9GQo0W/+kyzqH4lkaEebNFypP8IP4RgbF
	ONda62cxoH4SGE9MhTlTX/G+FJmIEdZCXVQt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rrCvINmoIXl9cSli1I7jXL+ozWBc8mDs8KBpWF/P6Z4=;
	b=XNIHbOnkEDN/A8JYLrqqe6gn6d6DrazSpwCdVVxpfrDC0/+uj6w3ZvlJYuCGRakr+j
	ZPffIMabMOyMH5cjOzwbk/dKIKTkpNG3t6yMxBXhlQUyetEcmQr3P+RWVWs2wm8p+3p4
	B60XK+jQIF7/zn1JjAN1EvsQB5XoPGvuxwxTWljtmZTXg53tMnrwGVW5IGqzBn+q0sW2
	3TTOcHweDLPv7jKBt1QlMqyiKqTKwqV8odWRzaYiT1V33duX8skSqieGaDHEXVZoPM1W
	H9GY6C+NIZrhN7MeXOfTBk6uirgaVGHbMqW3n8N8uqVV+5XOvhIbs8c9pozY0Bg2zkZi
	UP5A==
X-Gm-Message-State: APjAAAUtMUBy62lLnQ2UlTgX9Qhgkb/CZcEkH0/zuA4R4KAwuCTBzUv3
	4zYoNpP84KuukL0wVfv1dUbaEQ==
X-Google-Smtp-Source: APXvYqye76L2PpGatYTWT4OPctQwcDeAEkKXHRql5StuqY2vz+tNd80vmbaB/H4AXVcKZcRz+nU4Xg==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr8565184wmb.126.1579336806908; 
	Sat, 18 Jan 2020 00:40:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c2sm37798302wrp.46.2020.01.18.00.40.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 00:40:05 -0800 (PST)
Message-ID: <045bded79ff6636698fe2f9d2b64171fdebd61d0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 08:40:04 +0000
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH][v2 00/10] Make MIME work on desktops
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
X-List-Received-Date: Sat, 18 Jan 2020 08:40:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-01-17 at 22:28 +0100, Andreas Müller wrote:
> On fresh images file-browsers do not know how to open files and
> usually open a
> dialog with ALL applications available on the machine. This is not
> what users
> are used to when working with linux: For just one application
> installed per
> Mime-Type, the application is opened automatically.
> 
> To get a working MIME on desktop it needs two 'databases' on target:
> 
> 1. Mime-Types: This is handled by mime.bbclass and creates database
> in
>    /usr/share/mime/mime.cache.
> 2. Mime associations: A simple text-list of pairs Mime-Type <->
> application
>    in /usr/share/applications/mimeinfo.cache
> 
> This patch series updates/implements/enhances both parts to get
> images work as
> expected.
> 
> @Khem: This series creates many QA warnings for layers in meta-
> openembedded and
> a patch series fixing many was prepared [1]. Once this series get's
> applied (or
> you ask for it) I can send them out.
> 
> [1] 
> https://github.com/schnitzeltony/meta-openembedded/tree/work-2020-01
> 
> V1 -> V2:
> * Shelve global path export thingy
> * Add me as maintainer of itstool (let's consider 'ü' in my name as
> test case :)
> * Change "to to" to "to" in commit message
> * Build shared-mime-info from git to allow automated upgrades
> * mime-xdg.bbclass: Be prepared for packages as libreoffice: Desktop
> files
>   installed are absolut symlinks broken for us. In case other
> projects do same: 
>   Offer asolution and guide recipe writers how to handle by
> generating warnings
>   with instructions how to handle.

Thanks, this looks good to me. It did generate a warning on master-next 
builds in many places:

WARNING: libfm-1.3.1-r0 do_package_qa: QA Issue: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: libfm-gtk path '/work/armv7vet2hf-neon-oe-linux-gnueabi/libfm/1.3.1-r0/packages-split/libfm-gtk/usr/share/applications/lxshortcut.desktop' [mime-xdg]
WARNING: libfm-1.3.1-r0 do_package_qa: QA Issue: package contains mime types but does not inhert mime: libfm-mime path '/work/armv7vet2hf-neon-oe-linux-gnueabi/libfm/1.3.1-r0/packages-split/libfm-mime/usr/share/mime/packages/libfm.xml' [mime]

It also generated:

https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1458

which partly is the python2 removal that was in with the test and
partly this series since itstool is GPLv3 :(.

I have to admit I'm not sure how reasonable it is to keep hacking the
gplv2 layer to work...

Cheers,

Richard




