Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 09A3A73DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 15:27:39 +0000 (UTC)
Received: by igfj19 with SMTP id j19so14303658igf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 08:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=xfKFpcn5a5JzoJbF8dW1JPbjM4ECDjnwD4jVFwnC/8M=;
	b=G+1TwyCOxMBh195N/97FBH7vBNFarqbyU1zNeZN/0G7gCdUZPmX2pqazPxyd90+0vO
	9dFSeeYGsU735INeMsvTTWWvxrL8SSZSj2ep9SeLuoecd8PJBYy8VUdqycayfS5N20cl
	87BXbeluDvJ6EXjl+I6B32jvrzwGhwGIxaYLrItG4xaEW5jKXeASmxsCnX+BQVgoFQaY
	MOAsXal+4tc4sP52O/l29deUK7jMVvVjbBbzRfxBvnUfDSIkjLlFHu3ZHl9Yun2b1DeL
	D8e0oFdwQPmTGXXnRuDJQldBTNm7MDjPB641U4vopm8oRtaOLF3eu9vpjQwPTFAukl/3
	TmaA==
X-Gm-Message-State: ALoCoQkt/xV1TyeoLAFZOnfuJkRjhMhrRbDsfn7yJJ7uUiOXUXkd8VYKhLY6mUHQPJj3USHPtdPk
X-Received: by 10.50.43.134 with SMTP id w6mr3393445igl.74.1440516459280;
	Tue, 25 Aug 2015 08:27:39 -0700 (PDT)
Received: from pohly-mobl1 (p57A57DEF.dip0.t-ipconnect.de. [87.165.125.239])
	by smtp.gmail.com with ESMTPSA id
	e33sm15653077ioi.12.2015.08.25.08.27.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Aug 2015 08:27:38 -0700 (PDT)
Message-ID: <1440516456.24929.78.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 25 Aug 2015 17:27:36 +0200
In-Reply-To: <55DC6D05.7010107@windriver.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbMmZ9rf-Jq_XoGJzTCj_0E=1qene_ooyf_T_nWsH60Jw@mail.gmail.com>
	<1439372036.28153.29.camel@intel.com>
	<CAJTo0LYZg-gX1_-qeiJ2O1KDDhoYGi0BdJJp3z=hBhYhma9TVA@mail.gmail.com>
	<1440503201.24929.53.camel@intel.com> <55DC6D05.7010107@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] mtd-utils: keep xattr support enabled
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
X-List-Received-Date: Tue, 25 Aug 2015 15:27:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-25 at 08:26 -0500, Mark Hatle wrote:
> On 8/25/15 6:46 AM, Patrick Ohly wrote:
> > On Fri, 2015-08-14 at 11:51 +0100, Burton, Ross wrote:
> >>
> >> On 12 August 2015 at 10:33, Patrick Ohly <patrick.ohly@intel.com>
> >> wrote:
> >>         > There's a "xattr" DISTRO_FEATURE that should be respected
> >>         here for
> >>         > target builds (and explicitly enabled for native I guess).
> >>         
> >>         I can add that check, if you want.
> >>         
> >>         > Does enabling xattr mean adding build dependencies?
> >>         
> >>         No, the conditional code uses lgetxattr and llistxattr, which
> >>         are in
> >>         glibc.
> >>
> >>
> >> From five seconds of google it looks like these are in musl and uclibc
> >> too, so I've merged this  to MUT as-is.
> > 
> > However, it turned out that the XATTR code also introduces a dependency
> > on sys/acl.h:
> > 
> > mkfs.jffs2.c:
> > 
> > #ifndef WITHOUT_XATTR
> > #include <sys/xattr.h>
> > #include <sys/acl.h>
> > #endif
> > 
> > sys/acl.h gets provided by acl, so it may or may not work depending on
> > build order and files on the host.
> > 
> > I hadn't caught that because I had only looked at library dependencies,
> > sorry for that.
> > 
> > What's the right fix? Add the dependency on acl-native in the native
> > case, disable XATTR support for target builds (same state as before) or
> > make it somehow depend on both "xattr" and "acl" distro features?
> > 
> > Or only check for "xattr"? I'm uncertain how the two are related.
> > 
> 
> Use PACKAGECONFIG, add xattr as a configuration that in turn adds the 'acl' as a
> dependency.  Then acl-native will automatically be converted from 'acl' if the
> '-native' version is built.

I agree, a PACKAGECONFIG sounds like the right approach. However, what
should the default depend on? The "xattr" or "acl" distro feature? What
if someone wants xattr, but not acl? Should xattr support in mtd-utils
be enabled in that case even though it pulls in the acl recipe as
dependency?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




