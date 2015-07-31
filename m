Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D009C7661D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 19:46:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2015 12:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,586,1432623600"; d="scan'208";a="616975155"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 31 Jul 2015 12:46:26 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 89C976A4087; Fri, 31 Jul 2015 12:45:41 -0700 (PDT)
Received: from 10.252.34.83 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 31 Jul 2015 22:45:41 +0300 (EEST)
Message-ID: <61426.10.252.34.83.1438371941.squirrel@linux.intel.com>
In-Reply-To: <55BB9568.3020305@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<3bfd35fc6c4860c569683b9e8943fecfe20a228f.1438262915.git.alexander.kanavin@linux.intel.com>
	<55BB8C1B.2020104@linux.intel.com> <55BB8FBB.4070809@linux.intel.com>
	<55BB94CB.1090003@linux.intel.com> <55BB9568.3020305@linux.intel.com>
Date: Fri, 31 Jul 2015 22:45:41 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: =?iso-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 25/26] distrodata.bbclass: do not use get_recipe_pv_without_srcpv() before comparing versions in checkpkg
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
X-List-Received-Date: Fri, 31 Jul 2015 19:46:26 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>>> re.compile("(?P<pfx>(v|))(?P<ver>((\d+[\.\-_]*)+))(?P<sfx>(\+|)(git|)(r|)(AUTOINC|)(\+|))(?P<rev>.*)")
>>> regex = re.compile("(?P<pfx>(v|r|))(?P<ver>((\d+[\.\-_]*)+))")
> I made a mistake here the case that i say is when have a prefix like,
>
>  >>> import bb
>  >>> bb.utils.vercmp_string('r2.7+gitX', '2.9+gitX')

But the <pfx> component should take care of any such leading characters,
right? So when they are taken out, there is no reason to limit the rest to
just numbers. I'll send a patch which changes the regexes to allow "pre",
"rc", "final", "stable", or anything else like "1.0.2a". We can't hardcode
everything that people can come up with, so it's best to write a generic
regex.

Alex

