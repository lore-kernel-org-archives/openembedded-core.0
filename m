Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6AE7CECA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 15:33:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so3484914wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/uSoEQe5eVVIW8ZmX2mJ+Z+kaOCp+Tp0drEl2XcgKWo=;
	b=G+fwrnFeAIltwY1AhY431vHJ3Kf6wiIAIdY9ZiNKWacDLb5daaFpGJYuiEoclCI+M3
	1QmtHJX7zpeM6738HvC8f7PCKOvAVtKODzK0J8Zhds1lK4DblSDPi4IIr1YobLXy+SJt
	7o6GvuNmttUcJRzYTaoqII8u3XR/OMaF31F8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/uSoEQe5eVVIW8ZmX2mJ+Z+kaOCp+Tp0drEl2XcgKWo=;
	b=dSxg+UtmTHfWndvjmTxpwyT3H99jBX202mJZCzKU7eFMZtgN+mytjJh5128nAOTIoI
	uF5EgdYZc9cyZEWee5Osb+0gQgXgTeQ0JqaOVbb7OX+zHw+q0Rok+DdxOdeQRIEcich6
	8Ood2ouAacRXf+ot1jyZVTNqVpSrxajPVu3DQp7mOdIdac7q+QL8jZtGf5YBPMJhWtDM
	HOBt5+GQgOOn13kbXmkANmw+uDkc5llRLhu2Helt9wAoGFULiBgAL3VRZKZ5/Vl+Loe9
	Fv7UOE9dU1fdIIpzIq6ZWOobxgRnNiI8Ks1IdB0MqNBaQJwZTgC7rhYrEpng+Xw6KRo0
	hVtA==
X-Gm-Message-State: APjAAAUVIAF6+EuRWYRwN2KxPJArFnMXsGGxlxYxZ9SLyGeca+sthwAr
	tg5QKYXiHbzXku2lPeZWzC6ncQ==
X-Google-Smtp-Source: APXvYqydUJdlFGJCgjCJ1YUIg0On16v7fAmmJWYocJcLNRlqS1NdYt+jWJDuShnHLT4uErr80NvMiw==
X-Received: by 2002:adf:c541:: with SMTP id s1mr77034720wrf.44.1561044837017; 
	Thu, 20 Jun 2019 08:33:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c17sm16192570wrv.82.2019.06.20.08.33.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 08:33:56 -0700 (PDT)
Message-ID: <162e4e6b1a2b9162e9702921cf171937bce5a024.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 16:33:55 +0100
In-Reply-To: <d02500d78c61f9cdee7a5f4bc99148379054cfcd.1561018476.git.liezhi.yang@windriver.com>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<d02500d78c61f9cdee7a5f4bc99148379054cfcd.1561018476.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] update-alternatives.bbclass: run update-alternatives firstly in postinst script
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
X-List-Received-Date: Thu, 20 Jun 2019 15:33:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-20 at 16:15 +0800, Robert Yang wrote:
> Recipes like postfix run command newaliases in postinst, but
> newaliases is
> installed newaliases.postfix, and need run update-alternatives to
> update it to
> newaliases, so we would get the error when install postinst on
> target.
> 
> Fixed:
> $ opkg install postfix
> Configuring postfix.
> ///var/lib/opkg/info/postfix.postinst: line 4: newaliases: command
> not found
> 
> Run update-alternatives firstly will fix the problem.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/update-alternatives.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

This seemed to result in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/724

Cheers,

Richard


