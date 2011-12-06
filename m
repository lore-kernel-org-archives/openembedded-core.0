Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RXrFP-0003RB-RQ
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 10:23:36 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Dec 2011 01:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,304,1320652800"; d="scan'208";a="99095951"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2011 01:15:33 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 6 Dec 2011 17:15:19 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Tue, 6 Dec 2011
	17:15:17 +0800
From: "Mei, Lei" <lei.mei@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Dec 2011 17:15:17 +0800
Thread-Topic: [OE-core] [PATCH 1/1] Fix some recipes upstream version check
	issue
Thread-Index: AcywCsmZtUBGViYPR6ms+wRG6y3UrgD6SXOA
Message-ID: <749B9D3DBF0F054390025D9EAFF47F2212D5FD5AE0@shsmsx501.ccr.corp.intel.com>
References: <cover.1322729357.git.lei.mei@intel.com>
	<ec329e79d07e83cb240dda3988017741c597b566.1322729357.git.lei.mei@intel.com>
	<1322731343.17484.86.camel@ted>
In-Reply-To: <1322731343.17484.86.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Fix some recipes upstream version check issue
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
X-List-Received-Date: Tue, 06 Dec 2011 09:23:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>Richard Purdie
>Sent: Thursday, December 01, 2011 5:22 PM
>To: Patches and discussions about the oe-core layer
>Cc: openembedded-core@openembedded.org
>Subject: Re: [OE-core] [PATCH 1/1] Fix some recipes upstream version check
>issue
>
>On Thu, 2011-12-01 at 16:54 +0800, Mei Lei wrote:
>> Some recipes didn't declare what protocal they use to check the upstream
>version, this will due to some errors.
>> Fix this by add the protocal at the end of the SRC_URI.
>
>What errors does this give? We should be defaulting to git these days.
>lib/bb/fetch2/git.py says:
>
>        if 'protocol' in ud.parm:
>            ud.proto =3D ud.parm['protocol']
>        elif not ud.host:
>            ud.proto =3D 'file'
>        else:
>            ud.proto =3D "git"
>

Oh, yes, but when check upstream version, we didn't use git.py, we still us=
e rsync as the default protocol in distrodata.bbclass for those git recipes=
.
So I sent a new patch to change the default protocol in distrodata.bbclass:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dlmei3/fi=
x-protocal&id=3D2fba54d2f6ada2272efaf8cd50b137bb7d2eaf26

Please ignore this patch.
Thank you for your reminder.

Thanks,
Lei



>?
>
>Cheers,
>
>Richard
>
>> Signed-off-by: Mei Lei <lei.mei@intel.com>
>> ---
>>  .../iproute2/iproute2_3.1.0.bb                     |    2 +-
>>  meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
>>  meta/recipes-rt/rt-tests/rt-tests_0.83.bb          |    2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
>b/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
>> index 0b47046..52e40e1 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
>> +++ b/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
>> @@ -2,7 +2,7 @@ require iproute2.inc
>>
>>  #v3.1.0 tag
>>  SRCREV =3D "9cbe6bc337a35b91882f92599eefeb161f3e776e"
>> -SRC_URI =3D
>"git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git \
>> +SRC_URI =3D
>"git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git;pro=
toco
>l=3Dgit \
>>             file://configure-cross.patch"
>>  S =3D "${WORKDIR}/git"
>>
>> diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
>b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
>> index 554ce81..7a1dc8e 100644
>> --- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
>> +++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
>> @@ -6,7 +6,7 @@ SRCREV =3D
>"de5452e56b537a11fd7f9453d048ff4b4793b5a2"
>>  PV =3D "0.12.1+git${SRCPV}"
>>  PR =3D "r0"
>>
>> -SRC_URI =3D "git://git.gnome.org/clutter-box2d.git"
>> +SRC_URI =3D "git://git.gnome.org/clutter-box2d.git;protocol=3Dgit"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> index 78d51b3..7e64032 100644
>> --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> @@ -12,7 +12,7 @@ SRCREV =3D
>"5f1e84f8b015df3ff950056494134eca3f640d70"
>>  # git -> 0.83 needs a PE bump
>>  PE =3D "1"
>>
>> -SRC_URI =3D "git://github.com/clrkwllms/rt-tests.git"
>> +SRC_URI =3D "git://github.com/clrkwllms/rt-tests.git;protocol=3Dgit"
>>
>>  S =3D "${WORKDIR}/git"
>>
>
>
>
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


