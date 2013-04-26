Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVhjY-0002ZC-3t
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 14:26:36 +0200
Received: by mail-vb0-f43.google.com with SMTP id q13so2576855vbe.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 05:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=+cPb98nZoCcYcpMJyHXedrBPf2wTfchHNK2xui7wv6I=;
	b=om/hLMXoTjZQZDBjntcgWSuI83B5RZRaFW/dI9ANtjhVJtdFKMDt1FPt8TmJdRO2ex
	TC4TEfyyqFg0qfNgpwNC+cpiQRvciQQJAaYGwMAMOCa/h4125asAMe54EWe4/hKVM6wk
	nqeblAhZ2a6MrWYdDtRHIb+MZ3HIOjVWtxQXN4MzGpPFq+fAf6CjzsqH4NocWSMM/uwf
	YhlzdV1acwW8esZPxpv9RC3XE8ChgDfXjniTVTdMMN1eUKJaS0153k+DJStO+U1grs61
	4Pio3nIX9DbSwNcg7J0MnrzGbr7pqNbS1E2rX3NYi76Qo2JKrpnpHeJuwA8ef3ULAF/v
	WcZw==
X-Received: by 10.220.155.8 with SMTP id q8mr22938608vcw.42.1366978131055;
	Fri, 26 Apr 2013 05:08:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 26 Apr 2013 05:08:30 -0700 (PDT)
In-Reply-To: <4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
References: <cover.1366963971.git.liezhi.yang@windriver.com>
	<4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Apr 2013 13:08:30 +0100
Message-ID: <CAJTo0LbU2=iEOpnw3GRSntQQyH73RaJ++zdzye2s1zvsgEznSQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Gm-Message-State: ALoCoQm2+D+cNvTLHAySsuiNh7rOJsE2LNZrOvdqkG4aPhUG+5spRm6XokuBQAI725EWqy9dPDwS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
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
X-List-Received-Date: Fri, 26 Apr 2013 12:26:36 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 26 April 2013 12:41, Robert Yang <liezhi.yang@windriver.com> wrote:
> The error message:
>   File "/path/to/glib-2.34.3/gio/gdbus-2.0/codegen/parser.py", line 25, in <module>
>     import xml.parsers.expat
>
> ImportError: No module named xml.parsers.expat
> make[2]: *** [gdbus-daemon-generated.h] Error 1
>
> This is because opensuse 12.2 doesn't install the expat.py (one of
> python's lib) by default, but our native python provides it, use the
> native python would fix the problem.

I don't like this.

xml.parsers.expat is a standard Python library that's been integrated since 2.0:

http://docs.python.org/2/library/pyexpat.html#module-xml.parsers.expat

If we can't assume that a distribution has shipped a working Python
we've got bigger problems.

We could sanity check this in some way, maybe in the recipe's
configure step so we can give a nicer message, but I don't think we
should depend on pythonnative when we're talking about a standard
feature of Python.

Ross


