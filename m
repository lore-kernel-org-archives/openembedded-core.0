Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6DD77C32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:40:22 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id l28so1760500wre.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NGXdCLMcMDeq7hv6Wq2awmq+C43+tDgELOonhE4JxpI=;
	b=K9PEGWisTXp+SJ2iSH/x9jUUIFh4NHSKAo+ZoV0/B17oCoXIxRgkR2pGctMLFWk+1u
	1D8ud1p02XOb5HZIo9V+nQVDSUYgK3UZY+joO2kMSag/AHSBEvPtYp1bMvcWyX9eJoq9
	2UmKao1h8i9EQOAZXP4akRiQGHnl/G09R34gAGGe1CZZ3545VsQ3hhuX43lXiaaBBRvP
	bOAqB5oYe+QXtwBNPmH43rsw+dn5a5twZ/dwpDIzmTpRJt1zvYzIRovP8+V5fXN7SJdH
	40YW3Wha/mrEUr/NdweegWkV9jhV6lHui7Lez7SqXCfYYiy9Ez7dn+USQUdOagj9p2No
	PHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NGXdCLMcMDeq7hv6Wq2awmq+C43+tDgELOonhE4JxpI=;
	b=HmnQR1mnPooFBQeBclm+Y4GB5ay1kzo3kKbmajkpk3HPWS0d1Hiu88JOAXirSeHddS
	nuKyKd532P033OHZ9BOxgOGmMk4vBglYGUf0jpenotgCpf6pz0kKJe20Ty2M4A9A5Na5
	LGTovIwiaCj7OyI+dFgQ3pFFpWrAhZQvHAlWlDwyy1K8AEsNvOp4UA8DcthgLwYiBvKj
	09lMKRRHZZ/k9pKv2xV5Teu8RKZJPpYZaattlbq3npwLDZXeSdK8LrxhYgkljEy41eAC
	cNp85ZTW2w2bR40Vtev9OGWJxx91nMN/LLcGp0EMgO4m8Tm052/WJfQPBoR4LopWsddG
	VXZA==
X-Gm-Message-State: AN3rC/5bSss+W6J593K1Vh2r7DzUQMeMlEwwmoMgX3G1HmXMfRS6k1w3XqldYFIUqA+B30X+wj9F6icONmQB6Q==
X-Received: by 10.223.179.24 with SMTP id j24mr23421596wrd.172.1491928823097; 
	Tue, 11 Apr 2017 09:40:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Tue, 11 Apr 2017 09:39:52 -0700 (PDT)
In-Reply-To: <1491928471.10884.196.camel@intel.com>
References: <1491828558.10884.112.camel@intel.com>
	<1491928471.10884.196.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Apr 2017 09:39:52 -0700
Message-ID: <CAMKF1srOa1mWXXRvF9_EXrUFiy43_K4kAC4i9aYdpsm2hTJQNw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 11 Apr 2017 16:40:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 11, 2017 at 9:34 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Mon, 2017-04-10 at 14:49 +0200, Patrick Ohly wrote:
>> Hello!
>>
>> I'm currently extending the yocto-compat-layer.py so that it can detect
>> invalid signature changes when changing MACHINE. go-cross-x86_64 shows
>> up as broken when comparing signatures for MACHINE=intel-corei7-64 and
>> MACHINE=qemux86-64.
>>
>> Both machines share the same go-cross-x86_64, but that DEPENDS on
>> libgcc:
>>
>> meta/recipes-devtools/go/go.inc:# libgcc is required for the target specific libraries to build properly
>> meta/recipes-devtools/go/go.inc:DEPENDS += "go-bootstrap-native libgcc"
>>
>> And libgcc itself depends on the tune flags for the target architecture
>> and thus is different for these two machines:
>>
>> $ bitbake-diffsigs -t go-cross-x86_64 do_prepare_recipe_sysroot -s 563f419e3854c2351e2cbbf33a9025f6 64e378fd9853a6cd6a4e7f684f52d2fc
>> Hash for dependent task gcc/libgcc_6.3.bb.do_populate_sysroot changed from afb6b55c0e2b7d2e816b3d2d214a7326 to 208fac5ae428b07a4aa491b130879e4a
>>   Hash for dependent task gcc/libgcc_6.3.bb.do_multilib_install changed from 596e1612d7b84b7a9c1b409ee78cca89 to d41e2e835d0abe7646e53e3d63ce00cd
>>     Hash for dependent task gcc/libgcc_6.3.bb.do_install changed from 9ca4126c69fcceb410253a0603c3d76b to cb0c49687a91ea17f1027c6394baacab
>>       Hash for dependent task gcc/libgcc_6.3.bb.do_compile changed from ab80902424c73af49257cc3f6fe049aa to 436f978a703476968bd5ae1c1915ee5a
>>         Hash for dependent task gcc/libgcc_6.3.bb.do_configure changed from eb0c36d87f32ce1ceb7d1e42609578fb to f62c98806faf3a28c2144919b89d3460
>>           Hash for dependent task gcc/libgcc_6.3.bb.do_prepare_recipe_sysroot changed from b037b950e346bef71a4f8fd2c6a2195c to d4564b5730941279392932e3c670a5a5
>>             Hash for dependent task gcc/libgcc_6.3.bb.do_fetch changed from e64cd9e029ed63ba3a09e5fe085b7057 to ea4d3f9d10544219ceb8591d5a5a4041
>>               basehash changed from 8744593af2eddb60244788f2b9476e2d to dabeb22478ef501e35311af75119a2cf
>>               Variable TUNE_CCARGS value changed:
>>               " -m64 [--march=corei7 -mtune=corei7-] {+-march=core2 -mtune=core2 -msse3+} -mfpmath=sse [--msse4.2-]"
>>
>> Does this fix look correct? It turns go-cross into a package that is
>> specific to the tune flags for the target.
>
> [...]
>
>> The alternative would be to drop the libgcc dependency, but I have no
>> idea whether that would work at all.
>
> Besides Bruce who pointed out the implications on recipes depending on
> go-cross-${TARGET_ARCH}, Richard also had concerns about making go-cross
> tune-specific, so I ended up testing the libgcc removal approach. It
> happened to build okay, so the patch that I ended up proposing (see
> "go-cross: avoid libgcc dependency") just removes libgcc from DEPENDS
> for go-cross.
>
> I need to revise the method how its done (i.e. not with DEPENDS_remove),
> but besides that, can anyone explain whether such a change might hit
> some problems somewhere? Khem?
>

I think TUNE_PKGARCH is the granularity it needs for setting GOARM
anyway. It should be fine to change it.

> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>

