Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id ADAF17F440
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:48:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r17so8293301wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=vWFROlJi4N7HbM+5R0Ko5vzhRDXb+Nr6UZIZdkXkVbg=;
	b=NVg8hWeQo1cfLelSyoMhqTE0KaiInAm+ieRslYXCy3aC9jk/TFIa/JnL4nNOGRO3JQ
	zTjMYd24YMSTUHTDG6cPijsrTSUYgg6ligefwl1lIi0NJRsV1ndYjQz+lBCiz5LpBcph
	Y+sEDCIsqOeb7uojuEfLNln9qnPj7pvgvF57M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vWFROlJi4N7HbM+5R0Ko5vzhRDXb+Nr6UZIZdkXkVbg=;
	b=JyhiSDchWE/rGQLfSgFu/81KoTpHFIlnmUBZHUVR6SEiM+32JEBuqB5OeZBoJjf3Jy
	pkrkVixYIPd89sRkY8KjleKzQTbMhGO541UAryBIU9AK7G4s7BDcla7ByiQfZQ/0JEi0
	MmicynGV0bW3uw+TJJ7oagofdD4ZGkpVo1hR3qWbNY0Rqz/Rl21V0brvxh30WdMO1F8H
	QuPj38x79b7zP18CoG0Gd1OfsLi0Q6o3mdBoojBPp2mfKj6ba4Tc0g1D7F6GEtIUc47n
	3aUNlT2hqO3rZPgUZfQa/02Yfy1Bkb48MYRsYtZA8rl75HG4xG87OERH/ENG7SGPP8CN
	PbOw==
X-Gm-Message-State: APjAAAWvGGco7/QoF/L2DE2rA1KNesNZIby2praKni7NYLo1SVNqrcKn
	Pp44dHxOn7aLHQUCOFckFDnnvA==
X-Google-Smtp-Source: APXvYqyve9b9PjJY59rN5yYs0jZyiK9CjO9b8cwNyGbRv5cfleltlokywhXNPcrW6HO9WofqoqP0Dw==
X-Received: by 2002:a1c:b745:: with SMTP id h66mr8789343wmf.70.1567806496323; 
	Fri, 06 Sep 2019 14:48:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h2sm10730764wrb.31.2019.09.06.14.48.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 14:48:15 -0700 (PDT)
Message-ID: <3f394af5d0dcaabf8465b5a53ce9c2c7b3d07e54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Sep 2019 22:48:14 +0100
In-Reply-To: <1567741059-137869-1-git-send-email-changqing.li@windriver.com>
References: <1567741059-137869-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] mdadm: fix do_package failed when changed local.conf but not cleaned
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
X-List-Received-Date: Fri, 06 Sep 2019 21:48:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-06 at 11:37 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> reproduce steps:
> 1. add DISTRO_FEATURE_append = 'usrmerge' in local.conf
> 2. bitbake mdadm --success
> 3. remove DISTRO_FEATURE_append = 'usrmerge' from local.conf
> 4. bitbake mdadm  -- failed when do_package
> 
> it is not proper to change source Makefile during do_install by sed,
> change to add patch for it.
> 
> [YOCTO #13493]
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

This somehow seems to break:

oe-selftest -r devtool.DevtoolModifyTests.test_devtool_buildclean
and
oe-selftest -r devtool.DevtoolModifyTests.test_devtool_modify

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/694

Cheers,

Richard



