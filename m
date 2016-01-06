Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 0106160620
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 21:05:10 +0000 (UTC)
Received: from [IPv6:fda8:8b75:6fa6:1000:d5bf:4e6e:4af8:7c54] (192.168.15.34)
	by smtp.enea.com (172.21.1.208) with Microsoft SMTP Server id
	14.3.224.2; Wed, 6 Jan 2016 22:05:08 +0100
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
	<568C5C24.5060601@enea.com> <568D36EE.1070505@linux.intel.com>
	<568D3BC3.6040607@linux.intel.com>
From: Tudor Florea <tudor.florea@enea.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <568D8182.7080308@enea.com>
Date: Wed, 6 Jan 2016 23:05:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <568D3BC3.6040607@linux.intel.com>
X-Originating-IP: [192.168.15.34]
Cc: paul.eggleton@linux.intel.com, poky@yoctoproject.org,
	benjamin.esquivel@intel.com, georgex.l.musat@intel.com
Subject: Re: [PATCH v3 0/3] ptest-runner 2.0
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
X-List-Received-Date: Wed, 06 Jan 2016 21:05:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alimon
See inline.
Tudor.

On 06/01/2016 18:07, An=C3=ADbal Lim=C3=B3n wrote:
> Hi again Tudor,
>=20
> Comments below,
>=20
> alimon
>=20
>=20
>=20
> On 01/06/2016 09:46 AM, An=C3=ADbal Lim=C3=B3n wrote:
>> Hi Todor,
>>=20
>> Comments below, alimon
>>=20
>>=20
>> On 01/05/2016 06:13 PM, Tudor Florea wrote:
>>> Hi Anibal, Please see my comments inline. Regards, Tudor.
>>>=20
>>> On 04/01/2016 20:29, An=C3=ADbal Lim=C3=B3n wrote:
>>>> The whole set is sent to two ML for reviewing purposes the
>>>> first two patches are for oe-core and the last one for poky.
>>>>=20
>>>> The first two commits (oe-core) adds a new ptest-runner
>>>> written in python the sh one is conserved to use in tiny
>>>> systems.
>>>>=20
>>>> What's new in ptest runner:
>>>>=20
>>>> - Monitor/timeout stdout, stderr of the test suite to avoid
>>>> block indefinetly.
>>> This is definitely something useful.
>>>> - Add option for change ptest root directory. - Add option
>>>> for list available tests. - Add option for only run certain
>>>> tests.
>>>>=20
>>>> The last commit (meta-yocto) sets ptest-runner to 1.0 in
>>>> poky-tiny systems due to python dependency.
>>> I think adding python dependency is a shift in a wrong
>>> direction for for ptest-runner. The assumption that most
>>> embedded devices (tiny or not) have python might not be
>>> correct. The alternative of using the old version of
>>> ptest-runner only complicate things. I do think this kind of
>>> work is really useful but this should be done into a testing
>>> framework that runs outside of the DUT.
>>=20
>> The original problem is the current sh ptest-runner blocks
>> indefinitely when a package ptest blocks (we don't control this),
>> now python-ptest is blocking the ptest-runner, see [1]. The way
>> to solve this is adding timeout in some place.
>>=20
>> I know that bash support timeout option but this option works
>> over the whole process making us to define timeouts too big or
>> per machine/device also tiny systems mainly don't use bash.
>> That's the reason for i decide to write python version of
>> ptest-runner that applies a timeout over the output of the
>> program give us better control/granularity over the running
>> ptest.
>>=20
>>=20
>> If you now other way to solve the problem please tell us.
We may have to use our own version of timeout as we cannot rely on
bash either. A good starting point is here:
http://www.pixelbeat.org/scripts/timeout

I'm thinking this is a good opportunity to improve ptest-runner to run
the package tests in parallel. That is, we could spawn a shell per
each run-ptest (wrapper) that have the output redirected to its own
file  (e.g. /var/log/ptest/{package}/output) and then we only timeout
monitoring the output file.
In future we may eventually mimic the logic of automake parallel test
harness
(https://www.gnu.org/software/automake/manual/html_node/Parallel-Test-Harne=
ss.html)

>=20
> I was thinking and one possible solution for this will be implement
> in C the ptest-runner with the same features of python version, any
> comment?
That would be great!
>=20
>=20
>>=20
>>=20
>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8021
>>=20
>>=20
>>>>=20
>>>> The changes are available in the git repository at:
>>>>=20
>>>> git://git.yoctoproject.org/poky-contrib alimon/ptest-runner=20
>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dalimon/ptes=
t-runner
>>>>
>>>>
>>>>=20
An=C3=ADbal Lim=C3=B3n (3): ptest-runner: Add version 2.0 re-implementation
>>>> in python. ptest-runner: Add a recipe for install
>>>> ptest-runner 2.0. conf/distro/poky-tiny.conf: Add default
>>>> install of ptest-runner 1.0
>>>>=20
>>>> meta-yocto/conf/distro/poky-tiny.conf              |   4 +=20
>>>> .../ptest-runner/files/ptest-runner_2.0.py         | 162=20
>>>> +++++++++++++++++++++ .../ptest-runner/ptest-runner_2.0.bb |
>>>> 27 ++++ 3 files changed, 193 insertions(+) create mode
>>>> 100755=20
>>>> meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py
>>>> create mode 100644
>>>> meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
>>>>=20

