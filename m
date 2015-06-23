Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 992A173E36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NEw84L031381; Tue, 23 Jun 2015 15:58:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 114VfPN_c8cn; Tue, 23 Jun 2015 15:58:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NEvtIV031377
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Jun 2015 15:58:06 +0100
Message-ID: <1435071475.11489.84.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 23 Jun 2015 15:57:55 +0100
In-Reply-To: <1434560682-89221-4-git-send-email-mark.hatle@windriver.com>
References: <1434560682-89221-1-git-send-email-mark.hatle@windriver.com>
	<1434560682-89221-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] rpm: Generate per distribution and multilib macro files
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
X-List-Received-Date: Tue, 23 Jun 2015 14:58:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-06-17 at 12:04 -0500, Mark Hatle wrote:
> The distribution and multilib macro files are required for rpmbuild, on the
> target, to work properly.  These override the default settings from the
> upstream macro files with the proper values for the OE configuration.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
[...]
> +def multilib_rpmmacros(d):
> +    localdata = d.createCopy()
> +    # We need to clear the TOOLCHAIN_OPTIONS (--sysroot)
> +    localdata.delVar('TOOLCHAIN_OPTIONS')
> +
> +    # Set it to the consistent of 'd'.
> +    localdata.setVar('distromacrodir', d.getVar('distromacrodir', True))
> +    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
> +
> +    ret = gen_arch_macro(localdata)
> +
> +    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
> +    for item in variants.split():
> +        # Load overrides from 'd' to avoid having to reset the value...
> +        overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
> +        localdata.setVar("OVERRIDES", overrides)
> +        localdata.setVar("MLPREFIX", item + "-")
> +        bb.data.update_data(localdata)
> +        ret += gen_arch_macro(localdata)
> +    return ret

This doesn't look right. Usually there should be a loop of the form:

for x in y:
    localdata = d.createCopy()
    overrides = d.getVar("OVERRIDES", False) + f(x)
    localdata.setVar("OVERRIDES", overrides)
    bb.data.update_data(localdata)

where overrides is modified in the copy. If you don't do this, the
overrides will continue to be applied in the datastore with the way the
datastore currently works. This may happen to work but won't be correct.

As it happens, the datastore changes I've proposed will handle this
better but right now, the code above doesn't do what I think you'd want
it too. If its been copied from somewhere, that source also likely needs
fixing.

Cheers,

Richard



