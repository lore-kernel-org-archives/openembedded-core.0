Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SDeCk-0006og-Pw
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 17:57:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Mar 2012 08:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125281005"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 30 Mar 2012 08:48:24 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 30 Mar 2012 08:48:24 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Fri, 30 Mar 2012 23:48:22 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 0/1] genext2fs: support large files and
	filesystems without using large amounts of memor
Thread-Index: AQHNDfhyqgHwsgz94EeYS3328rjr0ZaBXAIAgAGfIFA=
Date: Fri, 30 Mar 2012 15:48:21 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCEB6F2@SHSMSX102.ccr.corp.intel.com>
References: <cover.1332952962.git.dexuan.cui@intel.com>
	<1333058859.18082.44.camel@ted> <4F74E85E.6060800@intel.com>
In-Reply-To: <4F74E85E.6060800@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] genext2fs: support large files and filesystems without using large amounts of memor
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
X-List-Received-Date: Fri, 30 Mar 2012 15:57:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2012-03-30:
> On 03/29/2012 03:07 PM, Richard Purdie wrote:
>> On Thu, 2012-03-29 at 00:51 +0800, Dexuan Cui wrote:
>>> Hi RP, Saul, Paul, Darren, Mark, Josh and joaohf and all, please commen=
t.
>>>=20
>>> Let's figure out if this big patch is acceptable or not...
>>>=20
>>> With this patch, I can successfully create a 8.5GB .ext3 file with gene=
xt2fs.
>>> The speed is slow -- I spent about 1.5 hours.
>>=20
>> If these patches solved all the problems and made things work
>> wonderfully I'd probably say we'd take them. Unfortunately I don't
>> consider taking 1.5 hours to build am 8GB filesystem "wonderful",
>> its rather worrying and I don't think its performing any where need
>> fast enough for our needs :(.
>>=20
>> Patching genext2fs at this point in the cycle is a rather risky
>> undertaking too and I'm getting very concerned about this.
I agree.=20
I understand the risk.

But, BTW, I personally tend to think the quality of the patches (which
Come from the genext2fs mailing list) are good:
please see my test results
http://sourceforge.net/mailarchive/message.php?msg_id=3D29062014

>> We might have to look at alternative ways to solve this problem. I
>> think Darren said he might help look at this and has some other ideas.
> Darren?
>=20
> Without having looked into this very far, I seem to recall this was
> generating sparse files. This means every time we copy something into
> the filesystem it has to allocate the space on the drive. This is
> great for building big filesystems that will be mostly empty - but for
> big filesystems that we plan to mostly populate, I believe we would be
> better off doing pre-allocation (I'm taking this from my experience
> creating VMs in virtmanager). However, since using dd to create the
> file would require mounting it in order to copy files across (and we
> want to avoid requiring root permissions during build), this may not be a=
n option.
>=20
> Have we tried without the -z option? (-z allows holes in files - I
> presume this means sparse files).
I tried the -z option of genext2fs, but the speed to create the filesystem
is the same.

>=20
> Depending on how much of the 8.5 GB image we are filling, we may get a
> significant speed increase by first generating a smaller image and then
> using resize2fs to grow it to the desired size (referencing
> http://landley.livejournal.com/47024.html).
>=20
>=20
> A quick test without passing an initial rootfs showed no difference
> between -z and no -z. It may still be worth trying with the actual
> population to see if that makes a difference.
>

Thanks,
-- Dexuan




