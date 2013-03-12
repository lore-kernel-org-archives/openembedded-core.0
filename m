Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UFN1L-0006on-Nu
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 12:05:28 +0100
Received: by mail-ea0-f169.google.com with SMTP id z7so1694850eaf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 03:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=M3JZDt22gkch/d3nOGFHb+zCL0ay7arcVv0pZoY4Gi4=;
	b=ZS9sEyCeKnTHhg/HP4gbwohjKgkDifiPgcFfICTj2HUoDajzLvjSZlPK5y4RQ8/tFq
	7CNfgw91crhwGjCs3hErXd4xl6PM4JiqHhdOF745mGCpxTZNtsj0OuRLhHXCzjvDW5zN
	A7C24vsB68lcb02vhpWNG7OJ7tqNtnswK0L9zVGj6HwoYORk4iAi1zsFuOcIm5qSISGA
	zLxyShKY3U12yXepDEY9byhlJaEQdQhV/3aMVVmrV8t9quQ2biFtfOIi4LKcMHz6K16v
	2qr214J+GIzzkZW4AKkA3YEyx9Pntm8f7PQQoahXs4dqM9470kAJ1kKS/7/SPPqrmoez
	Q4fQ==
X-Received: by 10.14.210.132 with SMTP id u4mr46509614eeo.19.1363085323560;
	Tue, 12 Mar 2013 03:48:43 -0700 (PDT)
Received: from ?IPv6:2001:610:612::65ec:b798:6105:9258?
	([2001:610:612:0:65ec:b798:6105:9258])
	by mx.google.com with ESMTPS id ca4sm25248496eeb.15.2013.03.12.03.48.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 03:48:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <513F0149.9080708@herbrechtsmeier.net>
Date: Tue, 12 Mar 2013 11:48:42 +0100
Message-Id: <8517DA88-71D7-462E-B068-163831AB5D3C@dominion.thruhere.net>
References: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
	<513E6C46.2010909@linux.intel.com>
	<513F0149.9080708@herbrechtsmeier.net>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlELpPtck7HeCj+4mwZrVqE59lyAE9pSsFpUdbUambHKq255S81o8+CtSFwavCaFTDIrjfi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Split out bjam build tool and add real native support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 11:05:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 mrt. 2013, om 11:19 heeft Stefan Herbrechtsmeier =
<stefan@herbrechtsmeier.net> het volgende geschreven:

> Am 12.03.2013 00:44, schrieb Saul Wold:
>> On 03/07/2013 08:37 AM, Stefan Herbrechtsmeier wrote:
>>> The current boost recipe only creates the bjam build tool during
>>> a native run and thereby is not usable for other native programs
>>> that depend on a boost library. Split out the build tool into its
>>> own bjam recipe and add real native support to the boost recipe.
>>> This allows recipes to depend on native boost libraries without
>>> increase of the build time for other use cases.
>>>=20
>>> Native compilation of bzip2 isn't working and therefore disabled.
>>>=20
>>> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
>>> ---
>>>  meta/recipes-support/boost/bjam_1.53.0.bb   |   21 +++++++++++
>>>  meta/recipes-support/boost/boost-1.53.0.inc |   21 +++++++++++
>>>  meta/recipes-support/boost/boost.inc        |   49 =
++-------------------------
>>>  meta/recipes-support/boost/boost_1.53.0.bb  |    6 +--
>>>  4 files changed, 47 insertions(+), 50 deletions(-)
>>>  create mode 100644 meta/recipes-support/boost/bjam_1.53.0.bb
>>>  create mode 100644 meta/recipes-support/boost/boost-1.53.0.inc
>>>=20
>> This change seems to have caused a failure on my test build:
> Sorry, I missed the no native case. I rename bjam to bjam-native and =
send a new patch. Bjam make no sense on the target as it is only used =
for compiling.

And what if you need bjam to compile something on the target?=


