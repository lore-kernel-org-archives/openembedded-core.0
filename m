Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A69837BE7F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 11:57:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q18so7835957wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 03:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=IZrxrDv5q4E5dW36ZAju4Whh+O15HmF4ejKiQrQjiiY=;
	b=KDnYbt67NdwWn4SXWZLGVyTApaUbkNqdpwzru49G9fLvSQIaJtYUM+jwZ677+C8gn3
	J/+QTx0SrrO7hfvwALMlgMZouw6K+xyyUbNyWY1xL8dMnnrTEMiqpoB237x09c3AAuos
	1ZPRjtzond0PW1mKjKzgL29pPjQW+OFHxJOnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IZrxrDv5q4E5dW36ZAju4Whh+O15HmF4ejKiQrQjiiY=;
	b=OBZYtqNgHXDIm9PSwWiDL5LdJ9ib4siEvGL1SMEN7hFu6LZktZNtriCndl+rOen4lA
	PHFIC3405fPfgWt0eSL/XWnDRtel5ZcN2LfMJBo9TrjBcJdakjoBFaHJcnbDXO/fWn2h
	0ZagToJ+7AOPOvZgP8kW2IIObq2fEZ5N56o0CyP0P4kmdpf+SJoJX+nD99NC4nu67BTM
	8AQIXkLzDoohFuXs1cSgzVOtmrvDtj8rBMFDAojXkGgbJRH8jXpGFQSdU4qlpg4f23Eg
	bRiKhDYYF7LUsZSZC7mKzFz1XqiYhfIkTdWPGweH3eWq11pQ5i9CcU21TL4BGe3OQpEx
	53jA==
X-Gm-Message-State: AA+aEWZSWLPu9bh9iTXij4y167jrGNw3vakilT86mRGiseMxq8l1hQJc
	4B4dJ4BZVsGXvgAr4JV+LMU0+cpb+ggukg==
X-Google-Smtp-Source: AFSGD/UJzMDSjGdFPBRvqhMsePc8GwtaFdxYh7r5s9B68zFOSaQFrhquRf/ZFhhQ1jwF7JAO7oE4AQ==
X-Received: by 2002:adf:9b11:: with SMTP id b17mr5494969wrc.168.1544875048356; 
	Sat, 15 Dec 2018 03:57:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d2sm6097880wrs.97.2018.12.15.03.57.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 15 Dec 2018 03:57:27 -0800 (PST)
Message-ID: <aaeddd16974eda95393a5a528ee3b864c12353af.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2018 11:57:26 +0000
In-Reply-To: <20181214171051.2030-1-ross.burton@intel.com>
References: <20181214171051.2030-1-ross.burton@intel.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] package_manager: don't search for binaries in $PATH explicitly
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
X-List-Received-Date: Sat, 15 Dec 2018 11:57:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-14 at 17:10 +0000, Ross Burton wrote:
> There's no point in looking for a command on $PATH using
> bb.utils.which() but
> then passing it to subprocess.check*() which will search $PATH.
> 
> By just using the command directly, the code is visibly neater.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oe/package_manager.py | 43 +++++++++++++++++++++-----------
> ----------
>  1 file changed, 21 insertions(+), 22 deletions(-)

This needs refreshing once the confusion with it and the runqemu path
is sorted!

Cheers,

Richard


