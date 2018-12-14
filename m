Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id CBA0E7BDF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 18:36:07 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBEIa7fw017617
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 19:36:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1544812568;
	bh=ZRKMAFVMNtClaziT+CQfRyaUhWYCr8LC1XlaP6oHzeE=; l=1355;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=Ts30i2R4uzwjbayLMj56S2u16moTypEO+/YgC/5DMJHiXqo/uj3AxEYU9rleQJjFb
	KSNJoktjr++gC9YIBA6Wtnst+eEAfTJIHT0u3OJD3vBYn3U8LvISqnDACSVUsPEijK
	88GC4i9EMofSSdCQhTH4JptbrXlBhrMsDN3/dL7A=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBEIa04d004570 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 14 Dec 2018 19:36:01 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 5E09BDA3AAE;
	Fri, 14 Dec 2018 19:36:41 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBEIZw6g004567
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 14 Dec 2018 19:35:58 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.91) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1gXsJa-006g92-Ex; Fri, 14 Dec 2018 19:35:58 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
	<CAJTo0Lbe3Kq+xtEQu9YJAK+8kop6C1ffgTHmo6ODGL-i-wmu9A@mail.gmail.com>
Date: Fri, 14 Dec 2018 19:35:58 +0100
In-Reply-To: <CAJTo0Lbe3Kq+xtEQu9YJAK+8kop6C1ffgTHmo6ODGL-i-wmu9A@mail.gmail.com>
	(Ross Burton's message of "Fri, 14 Dec 2018 17:01:49 +0000")
Message-ID: <lyy38s6jn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: updated acl + attr
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
X-List-Received-Date: Fri, 14 Dec 2018 18:36:08 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

>> Recent acl and attr package versions changed their buildsystem to
>> standard automake so that previous buildsystem related patches are not
>> needed anymore and recipes become very simple.
>
> pseudo-native doesn't build anymore:

strange... Requires an explicit '-c cleansstate pseudo-native' to show
the error but it built fine with a removed TMPDIR


> | In file included from pseudo_ports.h:15:0,
> |                  from pseudo.h:171,
> |                  from pseudo.c:37:
> | ports/linux/xattr/portdefs.h:1:24: fatal error: attr/xattr.h: No such file or directory
> |  #include <attr/xattr.h>

I thnk, fixing it in pseudo is the correct way because <attr/xattr.h>
has been removed by intention by upstream.  Most software seems to use
this "new" header already, but there can be a problem with ENOATTR which
requires either an #include of <attr/attributes.h>, a manual #define or
replacement by ENODATA.


Alternatively, we can ship -- like Fedora -- a compatibility wrapper
like

-------------- 
/* legacy wrapper; see
 * http://git.savannah.nongnu.org/cgit/attr.git/commit/include?id=7921157890d07858d092f4003ca4c6bae9fd2c38
 */

#warning Using legacy <attr/xattr.h>; please update program to include <sys/xattr.h>

#include <sys/xattr.h>
#include "attributes.h"
-------------- 



Enrico

