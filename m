Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAReT-0001tI-22
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 22:01:29 +0100
Received: by mail-ve0-f171.google.com with SMTP id b10so4249278vea.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 12:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=W1vRQm50qcQOZwzkyWG1fBVQwdrbISsR3zFmaTFYerc=;
	b=THCU4qfcZmWpA+e+Sdqaq2WV6XlI5ER+/ezhUzbQUmqRokK2sDLGmxP3S0tt5Qdyq/
	uugQtHqV8qvYd0ZsijlorqplQNxY0TUcPE5jhe7ruXYixtyCQBIoMpaW53j8tVYgY7fb
	oAabx1G/8LA0QXZLCRKJrrgZ30BvwALhVdpM1032dowNBRNM9ttfMEZonN+i/GDlIwB3
	xW5gAk8lD3g81S/zG5S0Vqhg83VagNU/cxODvGzhtKiDkc02wRiOMUhe+oTCfID9+OuY
	pCDxkFc3wLUbM6j0I1W0xQtbrrfmhQ3BbFiiPeTOcPMSRohfLPywhXhFKA7Xdxlr57m4
	GSDg==
X-Received: by 10.58.214.231 with SMTP id od7mr12730496vec.44.1361911509048;
	Tue, 26 Feb 2013 12:45:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Tue, 26 Feb 2013 12:44:48 -0800 (PST)
In-Reply-To: <1361907835.5119.57.camel@ted>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
	<CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
	<CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
	<CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
	<1361907835.5119.57.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 20:44:48 +0000
Message-ID: <CAJTo0LbwqK6wxJoB8FwXx_eHuyy71QhUH-cFvcDGDTOCAkjPDQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnGS92F7aCpfLAIGx8OxqPSTNbUOr3jn8w+U3/MHu5G+fj8/JIKSdp1GxNFQtMWKa/GFW2T
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 21:01:30 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 19:43, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Check exactly what is in configure.ac. You should be able to use allarch
> and if you can't, it means the configure script is referencing the
> compiler, even if it shouldn't be using it. Its designed such that these
> accesses fail verbosely. It should be a simple fix if the recipe really
> is just configuration.

| configure:2707: checking host system type
| configure:2716: error: /bin/bash ./config.sub allarch-poky-linux failed

The configure.ac ends up running AC_CANONICAL_HOST because it uses
different manpage sections for Solaris and everything else.

I think they should be using AC_CANONICAL_SYSTEM, but that calls
AC_CANONICAL_HOST anyway so that wouldn't achieve anything.

So, extend my patch, or intrusively patch out the documentation build
code in xkeyboard-config.

Ross


