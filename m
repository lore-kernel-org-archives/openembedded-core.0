Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 890B37EC30
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 10:35:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n9so8376006wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 03:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=duvxzuUypxEUZqjgSxFcASARyxPAn5PowyT4k5W/c1c=;
	b=cNj+h9fd+jyHEQqCJhYMGhWXSy5067r65qHx6TqziXrJ6MAvqnWjnXIGLMhrCaSVOZ
	OJXeiR4bINeFQYSFw6CEfi7EfrIT6xoLxULK0LRfwJ+9HWrqG+c9DLN4ODSjyMOPI+i5
	Xs7891R+sjzDsCHVbbnW94zdsuZr+l3yBZPxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=duvxzuUypxEUZqjgSxFcASARyxPAn5PowyT4k5W/c1c=;
	b=QM1bdImlaBCzSv4HPBjTgpyzhwCx+f3LWwykT1hC/PT3/CgAng44+WGU2ET/HRnEN1
	dJThYO8pW074lVyetb2F9CpHFoMAnbEI7VwZlPZVLsbBYzwRoNBr4C5ovo+X0tLU9CrS
	QBOZYeqj9I6xj25zZxYv+KfJ2EIVJvfiM+LusjPv6a2fXTRP0gMevqUn6gu2YNMvxVBo
	XqWR6QWdAF6LRVGfP7zKkITz/C6iJoACFwme+pV26ufOHPNJ47pO6jshFsP+fVKPgbc/
	SzB2BvL8fYRB1G0rU+rwq5H1DF33WRLP8+AsqgrrMJPyodshwSv/I1FQd6XBU9KZkwJZ
	470Q==
X-Gm-Message-State: APjAAAWFhGMANlAIJT0wQdueZ20ji/MEAgOjOQznenBZNUYZ1AVzvu0b
	1bqc6NZFLnmYtTa7KMYIGddsEN6ETT8=
X-Google-Smtp-Source: APXvYqxR5ByMpPaG8H02KhNtbQDCsZNfDZ5XmmfPJeLqxntBdUCrdjyLTXqJ+2lyJgQcwZd3G2GfKQ==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr2918493wml.157.1562322908184; 
	Fri, 05 Jul 2019 03:35:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x16sm6897225wmj.4.2019.07.05.03.35.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 03:35:07 -0700 (PDT)
Message-ID: <492c90c8b33ad3a0313eac7bcd34ace062e2e89b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 05 Jul 2019 11:35:05 +0100
In-Reply-To: <c9d93056cbc6067892aa042e5f2c71f3cc264656.1562290204.git.Qi.Chen@windriver.com>
References: <cover.1562290204.git.Qi.Chen@windriver.com>
	<c9d93056cbc6067892aa042e5f2c71f3cc264656.1562290204.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] xmlcatalog.bbclass: execute xmlcatalog only if it's available
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
X-List-Received-Date: Fri, 05 Jul 2019 10:35:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-05 at 09:30 +0800, Chen Qi wrote:
> For build-sysroots.bb, the xmlcatalog would not be in its
> staging directory. Causing the following error for eSDK.
> 
> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status 127.
> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function failed: do_build_native_sysroot
> 
> The problem could be reproduced by the following steps.
> 1. Add in local.conf:
>    IMAGE_INSTALL_append = " btrfs-tools"
>    DISTRO_FEATURES_append = " api-documentation"
>    INHERIT += "testsdk"
> 2. bitbake core-image-minimal -c populate_sdk_ext
> 3. bitbake core-image-minimal -c testsdkext
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/xmlcatalog.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbclass
> index 075aef8..e805e7b 100644
> --- a/meta/classes/xmlcatalog.bbclass
> +++ b/meta/classes/xmlcatalog.bbclass
> @@ -5,6 +5,8 @@ XMLCATALOGS ?= ""
>  SYSROOT_PREPROCESS_FUNCS_append = " xmlcatalog_sstate_postinst"
>  
>  xmlcatalog_complete() {
> +	# In case of eSDK, build-sysroot does not have xmlcatalog in its staging directory.
> +	[ "`which xmlcatalog`" = "" ] && exit 0
>  	ROOTCATALOG="${STAGING_ETCDIR_NATIVE}/xml/catalog"
>  	if [ ! -f $ROOTCATALOG ]; then
>  		mkdir --parents $(dirname $ROOTCATALOG)

This seems rather risky since it leaves the sysroot in an unexpected
state and means that elsewhere in the code we now have to account for
postinst scripts which may or may not have run.

Whilst this fixes a bug I worry it may open up a whole new class of
even worse problems :(

Cheers,

Richard




