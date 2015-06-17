Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id B274B72491
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:27:19 +0000 (UTC)
Received: by labko7 with SMTP id ko7so27506898lab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 01:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=Sg+wXatYSUQoMUd/iyT8zJ/gUenCbkcocoIR1vlZUvI=;
	b=BUWSLKobKwc1aXFb8E65ep10nE7vy8zAbtuzLRbcrMSZ4N+etr1IFNw6+Xr2WQ1DR1
	JbPQFppEr0whTBrxO/WkyxWm201+rTgY7J5OyNYLtEq1d41KsaNNastz4pkvVH8ItBT6
	FviJEsYQFcS9PXmqkoy8SWage5f4qfMAOw62VRDh625UDZ66djupCTMtdg10ksn+xTjd
	tV002/gNJlHdd1I8w+TQitA08ZJZ+Ur/JQqm/5NpG+LD+uAM1v8iXqaXEsOP2f/zR+Jz
	1mTtRyu+5lwSK24JJ7FS+8NhNu59D8l3BwzxYV4Sh93zf/cSncy0dWQROb8QUwe4e6LL
	RxfA==
X-Gm-Message-State: ALoCoQnGwVUGYCqcpYddpsFUZKdNoah/qvdIUBh51BmRiTXP+akxaP6zxtGuhULDnNRt6dKXiccc
X-Received: by 10.152.37.67 with SMTP id w3mr6374964laj.123.1434529639621;
	Wed, 17 Jun 2015 01:27:19 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id p9sm797732laf.11.2015.06.17.01.27.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 01:27:18 -0700 (PDT)
Date: Wed, 17 Jun 2015 10:27:16 +0200
From: Anders Darander <anders@chargestorm.se>
To: Leandro Dorileo <leandro.maciel.dorileo@intel.com>
Message-ID: <20150617082716.GA8881@ad.chargestorm.se>
Mail-Followup-To: Leandro Dorileo <leandro.maciel.dorileo@intel.com>,
	Andreas Oberritter <obi@opendreambox.org>,
	Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1431553871-23972-1-git-send-email-bruno.bottazzini@intel.com>
	<1431553871-23972-4-git-send-email-bruno.bottazzini@intel.com>
	<5553D30E.9010201@opendreambox.org> <5580690B.9070908@intel.com>
MIME-Version: 1.0
In-Reply-To: <5580690B.9070908@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 3/3] systemd: split modules into packages
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
X-List-Received-Date: Wed, 17 Jun 2015 08:27:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Leandro Dorileo <leandro.maciel.dorileo@intel.com> [150616 20:21]:

> On 05/13/2015 07:41 PM, Andreas Oberritter wrote:
> >Hello Bruno,

> >On 13.05.2015 23:51, Bruno Bottazzini wrote:
> >>+########################################################################
> >>+# Aggregation of Split Packages
> >>+########################################################################
> >>+PACKAGES =+ "${PN}-services-base"
> >>+SUMMARY_${PN}-services-base = "Base services aggregation"
> >>+ALLOW_EMPTY_${PN}-services-base = "1"
> >>+RDEPENDS_${PN}-services-base = " \

> >I think it would be better to use RRECOMMENDS, in order to support
> >BAD_RECOMMENDATIONS per image. This would also remove the need to use
> >bb.utils.contains, because unavailable recommended packages get ignored
> >by the package managers.


> In the end, isn't it just a different approach? a different way of
> doing the same thing? By the way, from my point of view, semantically
> we're saying "we want a given package feature" besides the "we want a
> given distro feature", don't you think?

Like Andreas already commented, no.

Please, use RRECOMMEND unless it's vital that the package is installed
(i.e. the package A needs package B to be able to run at all). If
package B only makes it possible for package A to provide some extra
feature, do RRECOMMEND it. This makes it a lot easier for all of us who
tries to not install things that are useless. (One example in my case,
fsck is pretty useless).

And please, go through all the created packages and try to use
RRECOMMENDS as much as possible.

Cheers,
Ander

-- 
Anders Darander
ChargeStorm AB / eStorm AB

