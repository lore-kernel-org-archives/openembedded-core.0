Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id CA7166017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 08:23:33 +0000 (UTC)
Received: by labhs14 with SMTP id hs14so56151769lab.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 00:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=4j72XrTyo5EBcD7xWS051Vl1eJqaWzKH4oyrKoaAPSM=;
	b=CAH3DDtK076H97+L9xLjl9er4TCa9BhLVjnm9qRpBvlFyD1huzh0vRu5NG9So6mNdO
	DFFku38ZCtPlTgA5URc2lNw51EQvtu2NUMc2ALu4fisbq9MD1t6gWUO1aea0pGgAnl7C
	ZLeLWr5IJGF0gWbO6rNH0+E+gj4mYiekqipRWxrt20W2agpgGGEWM7DvsvM0W9VlJ30W
	hhjjg+QBsY3IODaES53eHSJ9djCgdV8CdnqBGMTAe3gPHOkzYi5o3o2zPIh8AGImWLHZ
	0myCxoepDYwyxCKK0ZdH4JKGWB3bfSityVLqDyrr0Aotj0IoiSar4aG+5h2Iui4AqVla
	4zbg==
X-Gm-Message-State: ALoCoQkCl5rq22+ZsX+PoNCPD11EABQUvM92YLPCASXbGGQaGTI7qTkMriG3FhbRYTqkGcZTL3of
X-Received: by 10.112.98.201 with SMTP id ek9mr11764588lbb.68.1425630213175;
	Fri, 06 Mar 2015 00:23:33 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id c2sm1683129lbn.10.2015.03.06.00.23.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Mar 2015 00:23:32 -0800 (PST)
Date: Fri, 6 Mar 2015 09:23:30 +0100
From: Anders Darander <anders@chargestorm.se>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Message-ID: <20150306082330.GA14309@ad.chargestorm.se>
Mail-Followup-To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
	<1425504462-6979-4-git-send-email-bruno.bottazzini@intel.com>
	<20150305142802.GA6833@ad.chargestorm.se>
	<1425572096.2831.16.camel@bottazzini-ThinkPad-T430>
MIME-Version: 1.0
In-Reply-To: <1425572096.2831.16.camel@bottazzini-ThinkPad-T430>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Fri, 06 Mar 2015 08:23:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bottazzini, Bruno <bruno.bottazzini@intel.com> [150305 17:15]:

> On Qui, 2015-03-05 at 15:28 +0100, Anders Darander wrote:

> > Just a quick question before I look into the patch in more detail.

> > Is the new setting of PACKAGECONFIG consistent with how systemd was
> > built previously? I guess it is.

> Hi Anders,

> it is consistent with how systemd was built previously. If you apply the
> patch and bitbake it. Systemd will be built and shipped normally.

> But now it will give some options on how to customize it by excluding
> packages you don't want to be with systemd.

Nice, I'm really liking this! That's something I've planned on doing
myself for a while.

> > Another comment, you should remove the dependcies that gets added using
> > PACKAGECONFIG from DEPENDS, e.g. acl etc. (Or are they required
> > nevertheless?)

> You mean I should do the following ?
> - PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
> + PACKAGECONFIG[acl] = "--enable-acl,--disable-acl"

No, I  meant to remove them from the long 
DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
line. (Unless I overlooked that part in your patch?)

> If I get what you said correctly, yes they are required. 

What I meant, was thas unless e.g. acl is required even when building
with --disable-acl, it's better to add the acl dependency in the
PACKAGECONFIG like you to. Though, at the same time, remove acl from the
long DEPENDS-line. (As otherwise we'll build acl anyway).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

