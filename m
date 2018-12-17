Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 96B147BE75
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 17:16:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q26so13385252wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 09:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=u4KKAL7sg1jlDXtgCBco5e2sAzCQsClBAJjPo8Zn5j4=;
	b=Y0sxC8xPbXGMUJkwdMJBg8n6SjixH/S/cPD08uHWnRfykotAFL6WGqlafd434ohxk0
	+y0nrnz2FrRAUye9xO4qlud7DSesvrOtQ021lE0rffNoUQAJBcy1sJG9xy2wTiFpV3Et
	oRhRoFpZ+Va8EQMBh/p274wxtoU25YFYTPlmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=u4KKAL7sg1jlDXtgCBco5e2sAzCQsClBAJjPo8Zn5j4=;
	b=dXZ3LXwN9M0lq89jjkzTWP7yNxlE44K6BbG2aF8AKhcyghP18XAsYRkZH1PDERuGD6
	LYcncgbyLcWr7a/yZe/3ABSMWV6Ae5vDE1m373m/JChGv5kVFZOLaQaIq0BRGWrGlbno
	gp4d+7gqXE9mDbONlKma3PkPODjBYP16nBjGK1exTDh1Qv1DsVBVCj8uQ5zeJqagnaqC
	T8JYXRWG83gc9KzK/tinonzSJae2WpDuiWmMInpIwRWjMXCIm1KTgtCmBtTq8fwzfqWJ
	oAyJSh8O68N/0BQ6yUWLO7l6725ExAlEnhiZezqpjGpaCrE5NzMrOd1ZcVLAySiyW3GJ
	Gfrg==
X-Gm-Message-State: AA+aEWZnydO9hI03YYaNqirBiI9VsQZjOcpF2t7+3dXWh8vS0FuDhG9A
	H2FsNGnYGdIijVQnRN/Lrq4a/A==
X-Google-Smtp-Source: AFSGD/X+1X7nDAzLGITL5Y2MYSQZLAnGuUzD8tPZMp2boobe+hcf21PTDzGH6HPNR4VHLqtPMCtHqg==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr16246wmc.0.1545066964126;
	Mon, 17 Dec 2018 09:16:04 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y34sm1331399wrd.68.2018.12.17.09.16.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 09:16:03 -0800 (PST)
Message-ID: <7043db17733d9237d5b3e706dd66471b34e4f54e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2018 17:16:02 +0000
In-Reply-To: <20181217084739.115773-1-mingli.yu@windriver.com>
References: <20181217084739.115773-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] nfs-utils: fix build error under tests folder
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
X-List-Received-Date: Mon, 17 Dec 2018 17:16:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-12-17 at 00:47 -0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> * Redefine the reference path of libnfs.a to
>   ../support/nfs/.libs/libnfs.a to fix below
>   error when run "make -C tests statdb_dump".
>   | make: *** No rule to make target '../support/nfs/libnfs.a',
> needed by 'statdb_dump'.  Stop.
>   | make: *** No rule to make target '../../support/nfs/libnfs.a',
> needed by 'nsm_client'.  Stop.
> 
> * The function generic_make_pathname is introduced in
>   nfs-utils 2.3.1.
>   Add the source file which defines function generic_make_pathname to
>   libnsm_a_SOURCES of libnsm.a to fix the undefined reference
>   when run "make -C tests statdb_dump"
>   | ../support/nsm/libnsm.a(file.o): In function `nsm_make_pathname':
>   | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-
> 2.3.1/support/nsm/file.c:175: undefined reference to
> `generic_make_pathname'
>   | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-
> 2.3.1/support/nsm/file.c:175: undefined reference to
> `generic_make_pathname'
>   | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-
> 2.3.1/support/nsm/file.c:175: undefined reference to
> `generic_make_pathname'
>   | ../support/nsm/libnsm.a(file.o): In function
> `nsm_setup_pathnames':
>   | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-
> 2.3.1/support/nsm/file.c:280: undefined reference to
> `generic_setup_basedir'
>   | collect2: error: ld returned 1 exit status
> 
> * After the logic of commit[dbb643e Removed missing-prototypes
> warnings.]
>   introduced, there comes below error when run
>   "make -C tests/nsm_client nsm_client"
>   | nlm_sm_inter_svc.c:20:1: error: no previous prototype for
> 'nlm_sm_prog_3' [-Werror=missing-prototypes]
> 
>   It is because rpcgen doesn't generate -Wmissing-prototypes
>   free code for nlm_sm_inter_svc.c with below logic
>   in tests/nsm_client/Makefile.am
>   [snip]
>   GENFILES_SVC    = nlm_sm_inter_svc.c
>   [snip]
>   $(GENFILES_SVC): %_svc.c: %.x $(RPCGEN)
>         test -f $@ && rm -rf $@ || true
>         $(RPCGEN) -m -o $@ $<
>  So add the patch to not fatalize -Wmissing-prototypes.

Fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/104

Cheers,

Richard


