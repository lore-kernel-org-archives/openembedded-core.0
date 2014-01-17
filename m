Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4355561FE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 12:16:27 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wp4so4178882obc.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 04:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LVR1MOGkE/tHOuapSc2+r7BdCPG+mfMcJnKhitbrW0Y=;
	b=0r6z8CViVcVYhgRGlipeA5OyHlhqfDH1Bt6WJXJsCza1l8HjdDiyadAGtzreLAj8ka
	Uv0+X64FJVlrD/6ICDxVhAPXo7E6ha5OXvWdrDXRXoE6lSJfNEKP6i7ZnJUfzY1nzQh2
	TL3aU28kmC1mLDtiOjVmy5uAPreHk1WP5ziE858ASEAlK4/zLXbbj4Dg7wbEPCh8cGos
	yeuU4mhd3d3EbiS6+GWtf/M6J2ScO8gwrp1hPTHFHrV/LGbA2afkqnzYBxvYF1lk2yjI
	/bf7Xolz/SsU0+enrZW5Dens2cZwzRKX02GmiUGYWQMLarsu+dmkPZQvOHJzlrg/1muE
	ifJg==
X-Received: by 10.60.246.139 with SMTP id xw11mr1295680oec.36.1389960988091;
	Fri, 17 Jan 2014 04:16:28 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.122.171 with HTTP; Fri, 17 Jan 2014 04:15:48 -0800 (PST)
In-Reply-To: <1389955623.14987.109.camel@ted>
References: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
	<1389955623.14987.109.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 17 Jan 2014 12:15:48 +0000
X-Google-Sender-Auth: FtMNAz0lFkosSoMRsqkulTTjLMs
Message-ID: <CANyK_8f0_8PopbKNpp+gRmtKktiSrVGeJrjBLegkVCr7BPwe0g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] Change update-alternatives provider
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
X-List-Received-Date: Fri, 17 Jan 2014 12:16:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 17 January 2014 10:47, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-01-16 at 17:59 +0000, Paul Barker wrote:
>> The update-alternatives script has been copied from opkg to opkg-utils so the
>> openembedded recipe for opkg-utils is updated accordingly. Changing the default
>> provider of update-alternatives to opkg-utils allows dependencies to be added to
>> the opkg recipe without causing circular dependency loops. This series partially
>> solves Yocto Project issue 4836.
>>
>> Changes in v2:
>>
>>     - Reordered variables in opkg-utils recipe
>>     - Added nativesdk class to opkg-utils
>
> The errors still occurred on the autobuilder with the revised patchset.
> I tracked down a couple of issues and have sent out patches for those.
>

Ok, let me know if there's anything left that I need to fix after the
next autobuilder run.

> We do however have one more problematic regression:
>
> http://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/1/steps/BuildImages/logs/stdio
>
> Basically, the tiny configuration is quite cut down and we can't build
> python with it. Before this change we were able to build opkg and all
> was well. Now we need to build opkg-utils which depends on python.
>
> We're therefore building python when we never used to (due to the python
> scripts in opkg-utils).
>
> I suspect to resolve this and allow tiny to work again we'll have to put
> a PACKAGECONFIG on opkg-utils and disable python for tiny...
>

Most of the functionality of opkg-utils (other than
update-alternatives) does depend on python so I think this would
result in an opkg-utils package which doesn't run if installed on the
target. For tiny it might be better to have an
'update-alternatives-only' PACKAGECONFIG which is set for the target
class only and prevents the installation and packaging of all the
package creation & inspection tools.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

