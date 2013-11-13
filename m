Return-Path: <layliu@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id BEC8C6D476
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 03:02:42 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lf10so2797235pab.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 19:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=K3VgI0VDDMU32WSbARXk5cQ+6pwUb+szZHnER/8euAw=;
	b=HK4C4GUJ/umvqDbOLu+njUphe8pLYaEedTX8bX6XPI1F2x7tIOkspQNYQ83qzVJZfk
	ywD20kyaHaFK40SjFexpq2P2FASoRNhcU8Fy5D5SKyh+t0FiXW4VavXZ0eTgOpHqMnvs
	xXeB6hWekhQnmj/gGT+zZGVPYabcTzo9CzKY8u/6N3H7rdGgpj/Tf0yUeCG0ojAw4vr8
	uglTZyAojpSovt/dxOaZVdM2x9dstt5KYHbEzbRPQuYlimeB3GqOWiVtZNJsGRr98FZr
	Iu3bo9quXWs4Gi3J8YbufzclmMHgwHBRZh6otfB77q95goaDPWBT4lokwt3loLFji52B
	Ks6A==
X-Received: by 10.68.6.170 with SMTP id c10mr38936735pba.101.1384311764536;
	Tue, 12 Nov 2013 19:02:44 -0800 (PST)
Received: from [128.224.163.160] ([1.202.252.122])
	by mx.google.com with ESMTPSA id
	vk17sm47720895pab.5.2013.11.12.19.02.41 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Nov 2013 19:02:43 -0800 (PST)
Message-ID: <5282EBCC.4020401@gmail.com>
Date: Wed, 13 Nov 2013 11:02:36 +0800
From: Lei Liu <layliu@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <52805D73.4050306@gmail.com>
	<1384300735.3828.40.camel@x121e.pbcl.net>
In-Reply-To: <1384300735.3828.40.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Disable building libgcc with -O0
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
X-List-Received-Date: Wed, 13 Nov 2013 03:02:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2013年11月13日 07:58, Phil Blundell wrote:
> On Mon, 2013-11-11 at 12:30 +0800, Lei Liu wrote:
>> +def get_optimization(d):
>> +    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
>> +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
>> +        bb.note("libgcc can't be built with -O0, -O2 will be used instead.")
>> +        return selected_optimization.replace("-O0", "-O2")
>> +    return selected_optimization
>> +
>> +SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
> Do we really need a Python function for this?  It seems like a rather
> heavyweight mechanism to detect what is basically just a distro
> misconfiguration.

The python function is copied from eglibc recipe which does similar
job to force build the package with optimization enabled.  I think
it's not just a distro misconfiguration.  Sometimes it would be
convenient for user to select a global -O0 optimization level (to
create a more debug-friendly rootfs) for most packages, while
automatically switching to -O2 for those which can't be built without
optimizations.

>
> How about just patching the appropriate bit of libgcc to include:
>
> #if __OPTIMIZE__ == 0
> #error libgcc can't be built with -O0, please fix your distro to use at least -O1
> #endif

I think it would be more helpful if we can switch to -O1 or -O2 in
such case, instead of throwing out an error.

Lei

>
> or some such?  Even this seems slightly dubious, since it will prevent
> you from building an unoptimised libgcc even if you have no intention of
> running valgrind with it, but at least this doesn't add extra overhead
> within bitbake.
>
> p.
>
>


