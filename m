Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id F0853617AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 14:21:40 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id uy17so7636075igb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 06:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kSMZCKcLCrVwyHViR0K3ba+N5Hhc/WzUS1vO+RCn4iM=;
	b=nMzAvOrb1sPA5VZc3xJqiJ/DZ0Xk4yafAUVaIawTCzi/E6rsJdHfIy+ncPQbDx4vKF
	9p47bETLwrXh2rSGOWrIIfPSLqognPrOhvNvmIFwKVLf/uF1tiWVcmdd/CT3enN5s20l
	xA8myiZCAR0yzU7lr5IOhJMhhUUwY5QTe7hqrZgUig+dgTqJuV00mywfSFI63o+WmUGJ
	ew0kMXZj2A6DD0GKegVmpQ7vyKrvbca2nD3yeRDGelQFxKatrqdMvuZ9N42eygVvrqWf
	noorNIztsdLSVvWPBtQFw0FuNLTkGR1Pi/xEHRE77NzpYkwYTuzzik3rs0OdCnUTyh8U
	umkg==
X-Gm-Message-State: ALoCoQlmkxaODBU5iq1Qals1VAAJys1LGFbSevqNFM2dpwGtvXANq9fwcJ4B1YS8MQpJrYlN6wAW
X-Received: by 10.50.128.72 with SMTP id nm8mr37949504igb.10.1389277301594;
	Thu, 09 Jan 2014 06:21:41 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id x6sm14470719igb.3.2014.01.09.06.21.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Jan 2014 06:21:40 -0800 (PST)
Message-ID: <52CEB073.1020506@linaro.org>
Date: Thu, 09 Jan 2014 09:21:39 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <52CC470A.9030302@linaro.org> <20140107192305.GT3709@jama>
	<1389176918.6899.75.camel@ted>
In-Reply-To: <1389176918.6899.75.camel@ted>
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Thu, 09 Jan 2014 14:21:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/14 05:28, Richard Purdie wrote:
> On Tue, 2014-01-07 at 20:23 +0100, Martin Jansa wrote:
>> With PACKAGECONFIGs which can list optional dependencies which aren't
>> included in the the layer itself it's now easier to have recipe with
>> optional qt5 support in oe-core, but qt5 itself in separate meta-qt5.
> What dependencies on other layers does meta-qt5 have?
>
> If the policy is all qt5 things into meta-qt5, the risk is a fairly
> large set of layer dependencies for meta-qt5.
>
> There is some perception I don't like external layers which isn't true. 
>
> What I do dislike is "dependency creep". If the meta-qt5 isn't usable
> without pulling in chunks of meta-oe for example, I'd think that rather
> sad and it might as well move to meta-oe at that point.

Theoretically, which dependencies a given usage of qt5 has depends on
which PACKAGECONFIGs are used. In other words, one OE image or one OE
distribution might want to use OpenGL, while another might decide
against it.

    http://qt-project.org/doc/qt-5/linux-requirements.html

If we did move to breaking more things out into more layers, would the
resulting increase in the number of layers be easier to manage if we
didn't have to depend on the user correctly setting up their
conf/bblayers.conf? I admit I'm not familiar with a large number of
applications of OE/Yocto, but of the 3 of which I am aware (gumstix,
imx53qsb, and internally at Linaro) all have moved to using repo (an
external tool) and custom initialization scripts to better handle
setting up a user's layers and configuration.[1][2]

What if a distro configuration file, an image.bb, a MACHINE
specification, or a layer could specify its dependencies itself? Would
this lead to "DLL hell"[3] or would this be the missing ingredient which
keeps some projects from having to resort to using external tools?

If a distro has the power to decide which UI library to use on which
backend, should it then be up to the distro configuration to specify
which layer(s) to add, and maybe even which branch/commit to use, and
maybe also specify these layers' priority and ordering? Maybe in a
different scenario this decision wants to be handled by the image
configuration instead. In either case, we wouldn't have to rely on
external tools (repo) and manual intervention (hoping the user updates
conf/bblayers.conf correctly) to get our layers right before we can build.

Same goes for meta-qt5. If meta-qt5 has dependencies on specific other
layers, maybe those dependencies could be part of the meta-qt5
definition such that these other layers are pulled in automatically? Or
maybe a specific choice of PACKAGECONFIG would trigger the required
dependency?

Would it be possible to add a step in the build process that uses
bitbake's fetcher to get or sync a project's layers before starting the
process of fetching a recipe's sources based on information collected
from hints in the various configuration files?


[1]
https://github.com/gumstix/Gumstix-YoctoProject-Repo/blob/master/README.md
[2] https://github.com/Freescale/fsl-community-bsp-platform
[3] http://en.wikipedia.org/wiki/DLL_Hell

