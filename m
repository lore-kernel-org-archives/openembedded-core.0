Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id DFFE873DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:46:44 +0000 (UTC)
Received: by iodt126 with SMTP id t126so183191923iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 04:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=Azupw0D2wr2W5kUoJRuKZDMOBscbucHw0qa4bkMSYqs=;
	b=KTNiBV5YxP/ABwsUnR3Ny5qOlbQs2odnh7KrI0qJOP8U6f3hIIR4WumBuk8qazhmLA
	ww9QKyb/rGFX1et7mvGVzliFf2pGwqY4Tv8tsfl9l+e7PYBB455HKju6nREKSr1OZtnU
	8AfEpaan7b04Pea1lyKGiAqP9fvtOLWpzfjkzhbj8FKvK5rrJ9gnSLJff/WycjX+QGdz
	SIddyfcxbnQJzCMHuxb+GT3SMelbtxtfgV0cOI2lm2L7tFZ8OJ9eiDJmP7o0EmGRg9BL
	8U15F9fPaD3j3IbVixVORWV2u8VJDLkZ7ixtsozT3oBQZoUXrGYj5ApqSo/niyW3OC9z
	Nl2Q==
X-Gm-Message-State: ALoCoQkZo3/0ekI3RryyWgLWwoED0PhhG8II4wiZTs+kIiw60p5ZuNp+9H5q0K5QrHubgseXjpV8
X-Received: by 10.107.47.97 with SMTP id j94mr17495238ioo.136.1440503204432;
	Tue, 25 Aug 2015 04:46:44 -0700 (PDT)
Received: from pohly-mobl1 (p57A57DEF.dip0.t-ipconnect.de. [87.165.125.239])
	by smtp.gmail.com with ESMTPSA id oo2sm986247igb.6.2015.08.25.04.46.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Aug 2015 04:46:43 -0700 (PDT)
Message-ID: <1440503201.24929.53.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Aug 2015 13:46:41 +0200
In-Reply-To: <CAJTo0LYZg-gX1_-qeiJ2O1KDDhoYGi0BdJJp3z=hBhYhma9TVA@mail.gmail.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbMmZ9rf-Jq_XoGJzTCj_0E=1qene_ooyf_T_nWsH60Jw@mail.gmail.com>
	<1439372036.28153.29.camel@intel.com>
	<CAJTo0LYZg-gX1_-qeiJ2O1KDDhoYGi0BdJJp3z=hBhYhma9TVA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 25 Aug 2015 11:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-14 at 11:51 +0100, Burton, Ross wrote:
> 
> On 12 August 2015 at 10:33, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         > There's a "xattr" DISTRO_FEATURE that should be respected
>         here for
>         > target builds (and explicitly enabled for native I guess).
>         
>         I can add that check, if you want.
>         
>         > Does enabling xattr mean adding build dependencies?
>         
>         No, the conditional code uses lgetxattr and llistxattr, which
>         are in
>         glibc.
> 
> 
> From five seconds of google it looks like these are in musl and uclibc
> too, so I've merged this  to MUT as-is.

However, it turned out that the XATTR code also introduces a dependency
on sys/acl.h:

mkfs.jffs2.c:

#ifndef WITHOUT_XATTR
#include <sys/xattr.h>
#include <sys/acl.h>
#endif

sys/acl.h gets provided by acl, so it may or may not work depending on
build order and files on the host.

I hadn't caught that because I had only looked at library dependencies,
sorry for that.

What's the right fix? Add the dependency on acl-native in the native
case, disable XATTR support for target builds (same state as before) or
make it somehow depend on both "xattr" and "acl" distro features?

Or only check for "xattr"? I'm uncertain how the two are related.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




