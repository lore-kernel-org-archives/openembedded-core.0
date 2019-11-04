Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8CAE7F8DA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 13:44:39 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v9so17155304wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=vkGhpWSyIqB45i3+wPnmyHhgG6fJBistU1KQvAW8HcA=;
	b=LT6H9bQGq20crb5yD72ugyvWl4iMtxlZcMs+L5rZ3Hoj3C0FQKIWKSFHlUm7lG8aMw
	y62FVnZ6ets/rAEDFR0eciRON38Jh724vx9vn72CHJACcGiRa75KYWNjU513F1qtFNC/
	y0zrxnyLj0AA1h/pWaQ4fZqzGDaAV5ssC5BDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vkGhpWSyIqB45i3+wPnmyHhgG6fJBistU1KQvAW8HcA=;
	b=hzviyEBrivP/LCGzSKAUZ+C9eo7aZoiqHvdxuj0UjbUi8e3MxZtRyqM8GSz4axltw5
	83Pb1xed15jGdierFHNrSuTluryIt3RED6xffY+j9cf5EZG0GawRWL0+FLScREYbSf+x
	S5g/7W0TeStdLiGqswt9Fvb4kyEab0JxIkl82vUlsYtLGewkzIA7e3T7n0dwGZNpz0SQ
	1UAZSPQ6d8EAEQ/ZAi0q9865eCHDJlNJpT7SnRnxEbNaIZXYeB+FNQOI75Bi3zFlIrvs
	Wa2/LQAAmfSXEQWgCxS73te6bgBDlcFVSgbYSQyx9VNvSq8Y2H97mtOiafsJcC+SYOP/
	wcjg==
X-Gm-Message-State: APjAAAVzFdvPoVw6QFcczCRsidHbdFbSV/ImRBgdWMgD8AXBW2gBCx57
	oQqA8BRqmsD1h56xTHOPa10bRA==
X-Google-Smtp-Source: APXvYqwu9j6XbSJDLDicDuN9RgbjmbZW4NfzuKHzuBWfqpEIxr1mWUeHWZNaUm4A2YhX7CkpepVz+w==
X-Received: by 2002:adf:f651:: with SMTP id x17mr7152244wrp.114.1572875080573; 
	Mon, 04 Nov 2019 05:44:40 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	205sm17340346wmb.3.2019.11.04.05.44.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 05:44:39 -0800 (PST)
Message-ID: <5fa064a8eb4129fa39867fa087a779b92849d16a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 04 Nov 2019 13:44:38 +0000
In-Reply-To: <1572850260-75346-1-git-send-email-changqing.li@windriver.com>
References: <1572850260-75346-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] target-sdk-provides-dummy: set nostamp for do_package
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
X-List-Received-Date: Mon, 04 Nov 2019 13:44:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-04 at 14:51 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> It exists a situation that there is a common config file includes
> multilib.conf but variable MULTILIBS is not set by default:
> 
>   require conf/multilib.conf
>   MULTILIBS ?= ""
> 
> When build target-sdk-provides-dummy in the same build project with
> following steps, it fails.
> 
> 1 $ echo 'MACHINE = "qemux86"' >>conf/local.conf
>   $ bitbake target-sdk-provides-dummy
> 2 $ cat <<EOF >>conf/local.conf
>     MACHINE = "qemux86-64"
>     MULTILIBS = "multilib:lib32"
>     DEFAULTTUNE_virtclass-multilib-lib32 = "i586"
>     EOF
>   $ bitbake target-sdk-provides-dummy
>   $ bitbake lib32-target-sdk-provides-dummy
> 
> It fails to build lib32-target-sdk-provides-dummy with error
> messages:
> 
> > ERROR: target-sdk-provides-dummy-1.0-r0 do_packagedata: The recipe
> > target-sdk-provides-dummy
> >  is trying to install files into a shared area when those files
> > already exist. Those files
> >  and their manifest location are:
> >   .../tmp/pkgdata/qemux86-64/lib32-target-sdk-provides-dummy
> >     (matched in manifest-qemux86_64-lib32-target-sdk-provides-
> > dummy.packagedata)
> >   .../tmp/pkgdata/qemux86-64/runtime/lib32-target-sdk-provides-
> > dummy
> >     (matched in manifest-qemux86_64-lib32-target-sdk-provides-
> > dummy.packagedata)
> >   ... snip ...
> > Please verify which recipe should provide the above files.
> 
> Because target-sdk-provides-dummy is a virtual package, its sstate
> caches are same for both qemux86 and qemux86_64. So when build
> target-sdk-provides-dummy for qemux86_64, it re-uses the sstate cache
> from qemux86 and then create file lib32-target-sdk-provides-dummy
> under
> ${PKGDATA_DIR} which should not and it conflicts with
> lib32-target-sdk-provides-dummy too.
> 
> So make do_package always be executed to fix the issue. Because it is
> a
> dummy package, it won't cost too much build time.

Shouldn't we ensure that the packagedata has different sstate
signatures? Maybe do_packagedata needs a dependency on PN through
vardeps?

Cheers,

Richard





