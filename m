Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZ2LK-0004jU-31
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:54:18 +0200
Received: by pvf24 with SMTP id 24so1848434pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=I1tre9crfb1JMuw+fJ8tKJf2WlK/SY+8ASRbuwiVNq0=;
	b=qVo2cxHIk1OHY5RFi6MhvNTmzyrchxu1jEwqlLlUThOWIG+FHlzBkQQ7umjdROURqn
	EfPVGcZ7FDaeAs+Om+akbVKfXzRCsbenbdTHrY9zZFE4Oidr3HqZnd2Nh9I8c6xouPiv
	7EvVcaaWKaSxxw4QOsVGq5cIApp5xsyqxBlpo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=bcDyZo+/zRpV/c36Pt8e50ZT0XLXjshvTWweex9o8rmMt+uwSjIcoAXORHVxHvZN3+
	GfpOT9WLAuGbOuXMFE3T7JU5u8iWL5TGyD4TeEiCZqa82P/U5OD2PQLcN7Z1Dg84+WQv
	CVvMToRQCE+qx9RUp0zl3Xd6dGjNpgn1DURqA=
Received: by 10.142.215.18 with SMTP id n18mr1060628wfg.332.1308667843916;
	Tue, 21 Jun 2011 07:50:43 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v6sm7157002wfe.14.2011.06.21.07.50.43
	(version=SSLv3 cipher=OTHER); Tue, 21 Jun 2011 07:50:43 -0700 (PDT)
Message-ID: <4E00AFC2.3090603@gmail.com>
Date: Tue, 21 Jun 2011 07:50:42 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20110621140419.GA8589@raven.pace.internal>
In-Reply-To: <20110621140419.GA8589@raven.pace.internal>
Subject: Re: Using TCLIBC = "uclibc" in oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2011 14:54:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/21/2011 07:04 AM, Tom Parkin wrote:
> Hi list,
>
> I'm trying to set up a working openembedded-core/uClibc mipsel
> environment.  I found that setting TCLIBC = "uclibc" in local.conf
> yielded the following:
>
> ERROR: Nothing PROVIDES 'glib-2.0-native'
>
> I traced this down to code in meta/recipes-core/glib-2.0/glib-2.0.inc,
> which raises a SkipPackage exception if USE_NLS = "no".
>
> The reason that USE_NLS = "no" in this case is that
> meta/conf/distro/include/tclibc-uclibc.inc sets USE_NLS ?= "no".
>
> Looking further at tclibc-uclibc.inc, though, it appears that there is
> some code attempting to work around this issue:
>
> USE_NLS_glib-2.0 = "yes"
>
> Sadly, this appears to get ignored.  Following this up on the #yocto
> IRC channel, it seems that a more appropriate formulation of the above
> would be:
>
> USE_NLS_pn-glib-2.0-native = "yes"
>
> The attached patch allows me to (at least) assemble the bitbake task
> list when TCLIBC = "uclibc".  I'm not sure whether this is the correct
> approach, though.
>
> Any comments?

Yes this seems to be ok. If you look into angstrom distribution then it
already has it in its distro config files

http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/conf/distro/include/angstrom-uclibc.inc

but probably putting it in core would be appropriate.
>
> Many thanks,
> Tom
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



