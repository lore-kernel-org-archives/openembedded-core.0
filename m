Return-Path: <spopovyc@cisco.com>
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2274677CD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1637; q=dns/txt; s=iport;
	t=1490791868; x=1492001468;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=CyCKWikgljo2/IX9gnTh7SeEJNLCQceOqNl4RUieO1c=;
	b=MEqQEpCAat+S82bz6BxlwBO3nORKT833wTk2MRYDW/+MOvp1PJ/ZIcNO
	XLtjqH/EDEZPKDxqteNYm6wunZvy+POFqkCvMK63SHX9PgDIzI0BSB8hy
	yYwLFBhFw1E+hkvEB7dx7Qd+XGRL677mW53YUe0d4VK53wYR9mxWyiCHJ Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CYAQDdrNtY/xbLJq1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBhUGDYooRc5Bdkz+CD4IOgmyDNgKDdxgBAgEBAQEBAQFrKIUVAQE?=
	=?us-ascii?q?BAQIBIw8BRhALDgoCAiMDAgI9CREGDQYCAQGJeQUIrW2CJopJAQEBAQEBAQECA?=
	=?us-ascii?q?QEBAQEBASETeIVDggWBQIEqhFSDBoJfBZBdjAOSUJEzk2ofOIEEOh8VhU+BTT0?=
	=?us-ascii?q?1hnkoghUBAQE?=
X-IronPort-AV: E=Sophos;i="5.36,241,1486425600"; d="scan'208";a="650760473"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2017 12:51:05 +0000
Received: from tuxracer.local ([10.61.218.101]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id v2TCp4Fi028116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 29 Mar 2017 12:51:05 GMT
To: Christopher Larson <kergoth@gmail.com>
References: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
	<CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
From: Serhii Popovych <spopovyc@cisco.com>
Message-ID: <a0db5863-003a-ab83-aa85-c719656ddc62@cisco.com>
Date: Wed, 29 Mar 2017 15:51:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: spopovyc
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Wed, 29 Mar 2017 12:51:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


> 
> On Tue, Mar 28, 2017 at 12:00 PM, Serhii Popovych <spopovyc@cisco.com
> <mailto:spopovyc@cisco.com>> wrote:
> 
>     Symlinks to certificates in buildtools-tarball at /etc/ssl/certs
>     installed with absolute pathes making these sumlinks pointing
>     outside of toolchain to the host system locations.
> 
>     These locations may not contain some certificates (thus link to
>     the certificate in toolchain is broken) or host system
>     certificate may be revoked by CRL or outdated.
> 
>     Since this change seems non intrusive for target package apply
>     patch for all builds.
> 
>     Cc: XE-Linux <xe-linux-external@cisco.com
>     <mailto:xe-linux-external@cisco.com>>
>     Signed-off-by: Serhii Popovych <spopovyc@cisco.com
>     <mailto:spopovyc@cisco.com>>
> 
> 
> We actually run a script against the entire sdk sysroot to convert all
> absolute links to relative (see `POPULATE_SDK_POST_TARGET_COMMAND +=
> “rootfs_sysroot_relativelinks;` in image.bbclass and
> rootfs_sysroot_relativelinks in rootfs-postcommands.bbclass), but this
> script had a bug. I recently sent a patch (this morning) to it to fix
> this exact issue.
That's great. What the subject of this change in openembedded-core?
I wish to test it.

Because with current *master* I see problem is still here.

Thanks,
Serhii

Of course, it wouldn’t hurt to also change the
> behavior in the recipe, but it’s not necessary with the script fixed.


> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics

