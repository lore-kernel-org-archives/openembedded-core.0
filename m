Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QUv1K-0001Ei-RG
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 08:16:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2011 23:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,345,1304319600"; d="scan'208";a="14627165"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2011 23:13:16 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 10 Jun 2011 14:13:15 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 10 Jun 2011 14:13:15 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 10 Jun 2011 14:13:13 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>
Date: Fri, 10 Jun 2011 14:13:13 +0800
Thread-Topic: [OE-core] [RFC v1 PATCH 00/16] populate perl-native into its
	own	directory
Thread-Index: AcwmrRbZD9zYtWA1RCmmz41h5NKrOAAiE4lQ
Message-ID: <1865303E0DED764181A9D882DEF65FB69810B00D8F@shsmsx502.ccr.corp.intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com> <1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
	<4DE6A43A.3050401@mentor.com>
	<1306961135.3119.13.camel@lenovo.internal.reciva.com>
	<4DE6A836.3040004@mentor.com> <1307023591.27470.549.camel@rex>
	<4DE79D69.7080806@mentor.com> <1307025426.2529.209.camel@phil-desktop>
	<4DE7BA3F.4060600@mentor.com> <1307032545.27470.580.camel@rex>
	<4DE7C09F.9000104@mentor.com>  <1307606678.15712.130.camel@rex>
	<1307606884.15712.132.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69810B00D86@shsmsx502.ccr.corp.intel.com>
	<1307627792.15712.160.camel@rex>
In-Reply-To: <1307627792.15712.160.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Fri, 10 Jun 2011 06:16:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Thu, 2011-06-09 at 21:51 +0800, Cui, Dexuan wrote:
>> Richard Purdie wrote:
>>> On Thu, 2011-06-09 at 09:04 +0100, Richard Purdie wrote:
>>>> I suspect you've asking for some partial sstate cache to be shared
>>>> between two builds?=20
>>>>=20
>>>> Put simpler, you probably want:
>>>>=20
>>>> in tmp0 "bitbake perl-native"
>>>> in tmp1, different location to tmp0, "bitbake core-image-sato" but
>>>> sharing the same sstate cache
>>>=20
>>> I meant to add that tmp0 should be renamed before this second step
>>> so if there are hardcoded references in any of the sstate packages
>>> they couldn't find anything in tmp0 as it would no longer exist.
>>=20
>> Actually this doesn't work even without my patch series?
>> i.e., without my patch series,
>> 1) I "bitbake perl-native" in /poky.git/build/;
>> 2) mv /poky.git/build /poky.git/build.bak;
>> 3) in /poky.git/build2/, modify the conf/local.conf to set
>> SSTATE_MIRRORS to point to /poky.git/build.bak/sstate-cache/, and
>> "bitbake sgmlspl-native" would fail in do_compile: "Can't locate
>> ExtUtils/Command.pm in @INC (@INC contains:
>> /poky.git/build/tmp/sysroots/i686-linux/usr/lib/perl/5.12.3
>> /poky.git/build/tmp/sysroots/i686-linux/usr/lib/perl/5.12.3
>> /poky.git/build/tmp/sysroots/i686-"linux/usr/lib/perl/5.12.3" Is
>> this an existing bug?    =20
>=20
> Looks like it. This did work but it looks like its been broken
> somehow :(
>=20
Hi Richard,
I reported http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1157 to track=
 this issue.

Thanks,
-- Dexuan=


