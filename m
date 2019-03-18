Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A4A406C0F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 23:34:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q1so3325015wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=3rK5RQIi3GgehgO0MrXIU0fMMEEKvk82fb6VR0V3tUY=;
	b=CgX+HMVUbOUO69KjhudC2kr7iDsMx8Bx8z1J4EDZCg1eSaSVDn8h2bz5+UfbFRQisw
	jAxf81y11KhTKsc8vLiVz5x9QYTF0YRjzLHcqMKqJxUht/I88G6XXAoQt4VFmKvtVCly
	KHKtIsTHUnEgxCGy/MvphIYWIq9CCPOZ4VLP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3rK5RQIi3GgehgO0MrXIU0fMMEEKvk82fb6VR0V3tUY=;
	b=k0168xSZym+dL0mQiEX3Vp09FwoMj4GyoGhNw0VboGMfkgHhYoYBrr/h2gkfTX9Gsp
	NzKTmNQX4kno4FxGsZjs2CXJBeSKJbqgcjJSJl8BFkSOASu++1uZMHXVgUonkQuzXNZf
	n6wiAcNIe7LRYc/q2H/MdJ3GDTJ0K0S6HSFWjIHY7t3KaDBl0UPjhxC11yJX0kqLtpU+
	lqlodLmrtkjaNGr+n855Xf1T33W0zQ/OifzVlyrtNndley5vnbS8Z7VYzv3pYVl0+97+
	Nph2KuNy7PP9YiqJW4n21SXyo05ZQ9JNzBBIBl31OahTn9sytByq1+b1d2iCvODbVXho
	ubeA==
X-Gm-Message-State: APjAAAUnlNr+herGSmGELfPlEewLIZLSoIJ1ZC/nDFskxCBkmO1t5YGs
	azwuQ5uF3BZz/LzLzWOwzyEMBQ==
X-Google-Smtp-Source: APXvYqxhPCetVDxgW12Ik3/Lb9lvj8PSxObpeut25YYvzqoh61gq1hbuS5faFNp2REGFZuptLruzHA==
X-Received: by 2002:a5d:500e:: with SMTP id e14mr13681513wrt.219.1552952099280;
	Mon, 18 Mar 2019 16:34:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o1sm7246124wrs.51.2019.03.18.16.34.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 16:34:58 -0700 (PDT)
Message-ID: <e9d01fa735d068ea16da35db9cf303841b67b909.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2019 23:34:57 +0000
In-Reply-To: <20190318133618.4022-1-otavio@ossystems.com.br>
References: <20190318133618.4022-1-otavio@ossystems.com.br>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Mon, 18 Mar 2019 23:34:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-18 at 10:36 -0300, Otavio Salvador wrote:
> We had a c_rehash shell re-implementation being used for the native
> package and there is no reason to not use it as well for the
> target. This allows it to be available without the need of perl being
> installed.
> 
> This partially reverts OE-Core:d2b1a889ef (openssl: move c_rehash pkg
> to avoid perl dep) but still allows the removal of perl
> dependency.
> 
> The respective re-implementation was already in use here at OE-Core
> by
> the OpenSSL 1.0 recipe (since 2016) and were removed from the target
> recipe during the upgrade to the 1.1 release. So it now aligns the
> native and target recipes.
> 
> ,----
> > Author: Otavio Salvador <otavio@ossystems.com.br>
> > Date:   Mon May 23 17:45:25 2016 -0300
> > 
> >     openssl: Add Shell-Script based c_rehash utility
> > 
> >     The PLD Linux distribution has ported the c_rehash[1] utility
> > from
> >     Perl to Shell-Script, allowing it to be shipped by default.
> > 
> >     1. 
> > https://git.pld-linux.org/?p=packages/openssl.git;a=blob;f=openssl-c_rehash.sh;h=0ea22637ee6dbce845a9e2caf62540aaaf5d0761
> > 
> >     The OpenSSL upstream intends[2] to convert the utility for C
> >     however did not yet finished the conversion.
> > 
> >     2. https://rt.openssl.org/Ticket/Display.html?id=2324
> > 
> >     This patch adds this script and thus removed the Perl
> > requirement
> >     for it.
> > 
> >     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >     Signed-off-by: Richard Purdie <
> > richard.purdie@linuxfoundation.org>
> `----

I went to have a look at how this upstream C utility was going and
found that they've moved to github issues and there is no such issue
open.

The closest I could get to patches was http://openssl.6102.n7.nabble.com/openssl-org-3505-rewrite-c-rehash-in-C-td53069.html

Could you open a github issue asking if they can move to a C or shell
util as some projects don't want a perl dependency like that? I'd like
to understand upstream's intentions in this area. Do they have a reason
for using perl here that we're missing?

Cheers,

Richard


