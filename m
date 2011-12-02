Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWIgS-0004z5-SG
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 03:17:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2011 18:10:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="82351135"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2011 18:10:11 -0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 2 Dec 2011 10:10:07 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 2 Dec 2011 10:10:07 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Fri, 2 Dec 2011
	10:10:06 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2011 10:10:05 +0800
Thread-Topic: [OE-core] [PATCH 3/3] runqemu-ifup, runqemu-internal: be wiser
	when locating the network tools
Thread-Index: AcywFsuvlJtHFg7RSWaoMuSd1/ZQCQAgDOXg
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDF3A780@shsmsx502.ccr.corp.intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
	<7c75cf6a7d4a3c102f1f44eca16eb5c43c530391.1322731182.git.dexuan.cui@intel.com>
	<1322736506.17484.104.camel@ted>
In-Reply-To: <1322736506.17484.104.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] runqemu-ifup, runqemu-internal: be wiser when locating the network tools
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
X-List-Received-Date: Fri, 02 Dec 2011 02:17:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-12-01:
> On Thu, 2011-12-01 at 17:21 +0800, Dexuan Cui wrote:
>> When working on the self-hosted-image work, I found the PATH
>> variable in the
>> Level-1 target doesn't have /sbin and /usr/sbin, so "runqemu" can't
>> run properly since the tools are installeld at /sbin/ifconfig
>> /sbin/route /usr/sbin/iptables
>>=20
>> The patch is used to fix the issue by setting a temp PATH when running
>> which.
>>=20
>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>> ---
>>  scripts/runqemu-ifup     |    8 +++++---
>>  scripts/runqemu-internal |    3 ++-
>>  2 files changed, 7 insertions(+), 4 deletions(-)
>> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup index
>> 870cb6b..9e697a8 100755
>> --- a/scripts/runqemu-ifup
>> +++ b/scripts/runqemu-ifup
>> @@ -64,7 +64,9 @@ if [ $STATUS -ne 0 ]; then
>>  	exit 1
>>  fi
>> -IFCONFIG=3D`which ifconfig 2> /dev/null`
>> +PATH_TMP=3D"/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bi=
n"
>> +
>> +IFCONFIG=3D`{ PATH=3D$PATH:$PATH_TMP; which ifconfig 2> /dev/null; }`
>>  if [ "x$IFCONFIG" =3D "x" ]; then
>>  	# better than nothing...
>>  	IFCONFIG=3D/sbin/ifconfig
>=20
> I don't really like this, its getting hard to understand whats going on.
> Can we abstract this to a function which tries PATH, then tries our
> own PATH_TMP? This would reduce code duplication and makes it clearer
> what the code is doing...
Good suggestion!=20
I'll re-make the patch and re-send it out.
BTW, since I'll be on leave later today, I might not be able to finish this=
 today.
I discussed with Saul and he could kindly help me to finish this. :-)

Thanks,
-- Dexuan




