Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3384A77C5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:34:33 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id t68so11005785iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=cNQc+zQmX/a7CoRdxTdqbK892wTWuzFfnP3UQDnEFBU=;
	b=WAyhf53S4LtDK3eAL+RZT3x6CriWLAScfS4+G8urEkTtoUj9Djew/vkIdynhk6QZPf
	eUBInap1OLTZKQW0NDIvxNm4MKToH6ebK67ZCOPfMrdn4IqalKgT2mVISysx8cjd0hVg
	WVz/tOSwUXC2lbmMXdKhyph4eUI6n6Mp7uLzrhSSV7E5oGo+59FcSOARldqwbf+TkkJX
	5uSNFlRtgypISFMvuBERd1reVudD2OSZPIJF+p23wKAt1E9ZwXQ+/pI3QS97f6g0y5Pz
	BX/0GXdobehDWnuOhmj/kBwFOPSuG6FMpOAnGvubIr735HjIlEkD239xvHKJhDbTXKHZ
	nsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=cNQc+zQmX/a7CoRdxTdqbK892wTWuzFfnP3UQDnEFBU=;
	b=DC0yvyFwY3o/79HqbwYWUBDv1YOqi7AhiKlctt8S5Rjl/JjDoF+6Y8rxg/SAkiVdZO
	HxHQuyZj0tNUbmlScCspFt3aNLEYoFcjygsPPa1QXRwSzMKN+YvX7nXJI4CShHbBYbQw
	y/7SM/o3EOGYE7tlRMLz6qQ+4/oR2GIqqGUBZiWmubU+KzJNaBUlIroO41Y6VYTcB+MC
	3UWVj7KGVtORZWiAgc4Iap1haBQjq+kJG3n2NiuaEsQWURtVCASVhEVzVuxMFZVooHiu
	bKX9XzmDhznF5AOcChMxUSc28nkzhF4GMsV0xl3FSNE7OFeGTrRuL2kNskSt9BElUBMs
	fZpw==
X-Gm-Message-State: AN3rC/6WI2IIcTIiqFJYJSY59M+CLocMFmqQRzfScYOqPrxsDDrVmeGg
	nfG4Qa5rGAaoYa0s
X-Received: by 10.36.37.147 with SMTP id g141mr18544706itg.69.1491928475178;
	Tue, 11 Apr 2017 09:34:35 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D3A2.dip0.t-ipconnect.de. [93.232.211.162])
	by smtp.gmail.com with ESMTPSA id p79sm8151522ioe.1.2017.04.11.09.34.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 09:34:34 -0700 (PDT)
Message-ID: <1491928471.10884.196.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Apr 2017 18:34:31 +0200
In-Reply-To: <1491828558.10884.112.camel@intel.com>
References: <1491828558.10884.112.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Tue, 11 Apr 2017 16:34:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-04-10 at 14:49 +0200, Patrick Ohly wrote:
> Hello!
> 
> I'm currently extending the yocto-compat-layer.py so that it can detect
> invalid signature changes when changing MACHINE. go-cross-x86_64 shows
> up as broken when comparing signatures for MACHINE=intel-corei7-64 and
> MACHINE=qemux86-64.
> 
> Both machines share the same go-cross-x86_64, but that DEPENDS on
> libgcc:
> 
> meta/recipes-devtools/go/go.inc:# libgcc is required for the target specific libraries to build properly
> meta/recipes-devtools/go/go.inc:DEPENDS += "go-bootstrap-native libgcc"
> 
> And libgcc itself depends on the tune flags for the target architecture
> and thus is different for these two machines:
> 
> $ bitbake-diffsigs -t go-cross-x86_64 do_prepare_recipe_sysroot -s 563f419e3854c2351e2cbbf33a9025f6 64e378fd9853a6cd6a4e7f684f52d2fc
> Hash for dependent task gcc/libgcc_6.3.bb.do_populate_sysroot changed from afb6b55c0e2b7d2e816b3d2d214a7326 to 208fac5ae428b07a4aa491b130879e4a
>   Hash for dependent task gcc/libgcc_6.3.bb.do_multilib_install changed from 596e1612d7b84b7a9c1b409ee78cca89 to d41e2e835d0abe7646e53e3d63ce00cd
>     Hash for dependent task gcc/libgcc_6.3.bb.do_install changed from 9ca4126c69fcceb410253a0603c3d76b to cb0c49687a91ea17f1027c6394baacab
>       Hash for dependent task gcc/libgcc_6.3.bb.do_compile changed from ab80902424c73af49257cc3f6fe049aa to 436f978a703476968bd5ae1c1915ee5a
>         Hash for dependent task gcc/libgcc_6.3.bb.do_configure changed from eb0c36d87f32ce1ceb7d1e42609578fb to f62c98806faf3a28c2144919b89d3460
>           Hash for dependent task gcc/libgcc_6.3.bb.do_prepare_recipe_sysroot changed from b037b950e346bef71a4f8fd2c6a2195c to d4564b5730941279392932e3c670a5a5
>             Hash for dependent task gcc/libgcc_6.3.bb.do_fetch changed from e64cd9e029ed63ba3a09e5fe085b7057 to ea4d3f9d10544219ceb8591d5a5a4041
>               basehash changed from 8744593af2eddb60244788f2b9476e2d to dabeb22478ef501e35311af75119a2cf
>               Variable TUNE_CCARGS value changed:
>               " -m64 [--march=corei7 -mtune=corei7-] {+-march=core2 -mtune=core2 -msse3+} -mfpmath=sse [--msse4.2-]"
> 
> Does this fix look correct? It turns go-cross into a package that is
> specific to the tune flags for the target. 

[...]

> The alternative would be to drop the libgcc dependency, but I have no
> idea whether that would work at all.

Besides Bruce who pointed out the implications on recipes depending on
go-cross-${TARGET_ARCH}, Richard also had concerns about making go-cross
tune-specific, so I ended up testing the libgcc removal approach. It
happened to build okay, so the patch that I ended up proposing (see
"go-cross: avoid libgcc dependency") just removes libgcc from DEPENDS
for go-cross.

I need to revise the method how its done (i.e. not with DEPENDS_remove),
but besides that, can anyone explain whether such a change might hit
some problems somewhere? Khem?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




