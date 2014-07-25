Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8CA607FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 01:33:42 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id im17so6336900vcb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 18:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=8ts17zKOg4dTnX3qEfIdgK2CCg85h8Ef51uI3OnrL48=;
	b=Rml3yUlOMJ1Ifur/ELKd5fb2wdZdEKJP7QYLObzu/DhHtA6Q4uPo6WZFB/OHko+Z4W
	t49tv1vnaH+4QyIom5NT85sOaCp4ZNi2282YOf1f3P2U5Co0XOTuIFGjDZUsvsOuKBCz
	Ik90+B0I60zhiQwVKuSnNqXsWwzuHQEqx4S31tnfkbbW37CksO4VFpkmfaqBcWe98wEp
	p+W+an9IN89Zn/EDwVsWMapNTQjuAf6tVTsziRPFG3406J8fv3rXU7dtvYoB6aVqbm5z
	6ncDkYo8jwtkb2aNIHlL6bMdVpTdSM1ogKIWSwzk3kvd/8hgKWug61jGPDhTEpKJvqLj
	7lFw==
X-Received: by 10.221.47.9 with SMTP id uq9mr17613369vcb.48.1406252023273;
	Thu, 24 Jul 2014 18:33:43 -0700 (PDT)
Received: from [192.168.0.12] ([201.53.208.133])
	by mx.google.com with ESMTPSA id c4sm13723178vdc.9.2014.07.24.18.33.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 18:33:42 -0700 (PDT)
Message-ID: <53D1B3EA.10409@gmail.com>
Date: Thu, 24 Jul 2014 22:33:30 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1403131683-28758-1-git-send-email-paul.gortmaker@windriver.com>		
	<53C5EAC3.3020901@gmail.com> <1405499628.20402.13.camel@ted>	
	<53C72316.2070009@gmail.com> <1405601460.3668.17.camel@ted>
In-Reply-To: <1405601460.3668.17.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: strip RPATH from libxml-parser-perl Expat.so
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
X-List-Received-Date: Fri, 25 Jul 2014 01:33:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi,

On 17-07-2014 09:51, Richard Purdie wrote:
> First we need to understand the problem exactly. Do you have a
> reproducer that always works?

This happens on daisy. And my test case was:

1) add meta-intel and meta-crownbay layers
2) build MACHINE=qemux86 bitbake libxml-parser-perl
3) build MACHINE=genericx86 bitbake libxml-parser-perl
4) build MACHINE=crownbay-noemgd bitbake libxml-parser-perl

The step 4 wont complete because rpath issues.

To get it work:

  MACHINE=crownbay-noemgd bitbake libxml-parser-perl perl -c cleanssate

Then

  MACHINE=crownbay-noemgd bitbake libxml-parser-perl

Until now master is not affected.

I am working to fix the libxml-parser-perl 
(http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=joaohf/daisy-libxml-parser-perl-rpath). 
But I am not sure if it solves the root problem. Because OE should build 
using three differents MACHINEs using the same workdir, sstate-cache.


Thanks.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


