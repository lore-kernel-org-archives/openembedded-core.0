Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7A371AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:20:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v589KrsG018590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 8 Jun 2017 10:20:54 +0100
Message-ID: <1496913653.6630.233.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Jun 2017 10:20:53 +0100
In-Reply-To: <4e9ae0188740bcab90705399321c8db4631ecbc0.1496849345.git-series.patrick.ohly@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<4e9ae0188740bcab90705399321c8db4631ecbc0.1496849345.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 08 Jun 2017 10:20:55 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] utils.py: helper function for optional include files
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
X-List-Received-Date: Thu, 08 Jun 2017 09:20:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-06-07 at 17:31 +0200, Patrick Ohly wrote:
> By using oe.utils.optional_includes(), developers can simplify the
> code which selects which additional include files need to be included
> in a .bbappend.
> 
> In the simple case (one distro feature and one include file) the code
> is not shorter, but the intent is clearer than corresponding code
> using bb.utils.contains():
> 
>    require ${@ oe.utils.optional_includes(d, 'foo-feature:bar.inc') }
> 
> More complex cases are also supported, in particular include files
> that are required for one of several distro features or multiple
> different include files.
> 
> To keep the common use case simple, DISTRO_FEATURES are checked by
> default. Checking IMAGE_FEATURES might also be useful.
> 
> The DISTRO_FEATURES default and the intended usage make this more
> suitable for OE-core than bitbake.

I'm honestly not sure this actually aids readability. Taking your
example:

require ${@oe.utils.optional_includes(d, "foo,bar:foo-or-bar.inc xyz:x.inc,y.inc,z.inc")}

I think I actually prefer:

require ${@oe.utils.optional_includes(d, "foo,bar:foo-or-bar.inc")}
require ${@oe.utils.optional_includes(d, "xyz:x.inc,y.inc,z.inc")}

since its more explict. Spelling this out with the existing syntax
isn't so bad either, I probably still think that this is clearer too:

require ${@bb.utils.contains(d, "DISTRO_FEATURES", "foo bar", "foo-or-bar.inc", "")}
require ${@bb.utils.contains(d, "DISTRO_FEATURES", "xyz", "x.inc y.inc z.inc", "")}

How about simply:

require ${@oe.utils.distro_features(d, "foo bar", "foo-or-bar.inc")}
require ${@bb.utils.distro_features(d, "xyz", "x.inc y.inc z.inc")}

?

Cheers,

Richard


