Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 768776C59B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 12:47:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAMClLIr016375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Nov 2018 04:47:21 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.35]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0415.000;
	Thu, 22 Nov 2018 04:47:20 -0800
From: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/2] nopackages.bbclass: improve performance
	for cleansstate
Thread-Index: AQHUgl0VXi0sB/0BkUqwhu1x/7BSMaVbvkkX
Date: Thu, 22 Nov 2018 12:47:20 +0000
Message-ID: <D6B8D4F7-EC11-4C6B-8EEF-A498F4C4409A@windriver.com>
References: <cover.1542887170.git.liezhi.yang@windriver.com>
	<e1fef41e951d281c3d0f2eb99abbb6a13afff8de.1542887170.git.liezhi.yang@windriver.com>,
	<6a604c2114548416e44a6502839aca37e677b3ef.camel@linuxfoundation.org>
In-Reply-To: <6a604c2114548416e44a6502839aca37e677b3ef.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nopackages.bbclass: improve performance for cleansstate
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
X-List-Received-Date: Thu, 22 Nov 2018 12:47:25 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable



Sent from mobile phone

> =1B$B:_=1B(B 2018=1B$BG/=1B(B11=1B$B7n=1B(B22=1B$BF|!$=1B(B20:15=1B$B!$=
=1B(BRichard Purdie <richard.purdie@linuxfoundation.org> =1B$B<LF;!'=1B(B
>=20
>> On Thu, 2018-11-22 at 19:51 +0800, Robert Yang wrote:
>> Leave the task in SSTATETASKS doesn't make sense when it is removed,
>> so also
>> remove it from SSTATETASKS.
>>=20
>> This can improve the performance a lot for "bitbake <recipe-
>> native/cross/crosssdk>
>> -ccleansstate" when there are a lot of sstate files.
>>=20
>> For example:
>> * Before
>>  $ bitbake quilt-native -ccleansstate
>>  - Check log.do_cleansstate:
>>  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
>> linux:0.65:r0:x86_64:3:*_package.tgz*
>>  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
>> linux:0.65:r0:x86_64:3:*_package_qa.tgz*
>>  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
>> linux:0.65:r0:x86_64:3:*_package_write_rpm.tgz*
>>  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
>> linux:0.65:r0:x86_64:3:*_packagedata.tgz*
>>  Removing /sstate-cache/*/sstate:quilt-
>> native::0.65:r0::3:*_populate_lic.tgz*
>>  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
>> linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*
>>=20
>>  There are no package tasks for quilt-native, so the first 4 lines
>> doesn't
>>  make any sense, but the glob pattern "sstate-cache/*/*" is very
>> time
>>  consuming when there are no disk caches. E.g., I have more than
>> 600,000
>>  sstate files:
>>  - Without disk caches
>>  # echo 3 >/proc/sys/vm/drop_caches
>>  $ time python3 -c 'import glob; glob.glob("/sstate-
>> cache/*/*/sstate:quilt-native:x86_64-
>> linux:0.65:r0:x86_64:3:*_package.tgz*")'
>>    real    4m32.583s
>>    user    0m5.768s
>>    sys     0m12.892s
>>=20
>>  - With disk caches (e.g., run it in the second time)
>>  $ time python3 -c 'import glob; glob.glob("/sstate-
>> cache/*/*/sstate:quilt-native:x86_64-
>> linux:0.65:r0:x86_64:3:*_package.tgz*")'
>>    real    0m5.128s
>>    user    0m2.772s
>>    sys     0m2.308s
>>=20
>>  So the 4 removing *package* commands cost more than 20s or 272s in
>> theory.
>>=20
>> * After
>>  $ bitbake quilt-native -ccleansstate
>>  - Check log.do_cleansstate:
>>  Removing /sstate-cache/*/sstate:quilt-
>> native::0.65:r0::3:*_populate_lic.tgz*
>>  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
>> linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*
>>=20
>>  Now the package tasks are gone when cleanssate for native recipes,
>> which
>>  saved 20s or 272s in theory.
>>=20
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> meta/classes/nopackages.bbclass | 35 +++++++++++++++++++++++------
>> ------
>> 1 file changed, 23 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/meta/classes/nopackages.bbclass
>> b/meta/classes/nopackages.bbclass
>> index 559f507..66e4936 100644
>> --- a/meta/classes/nopackages.bbclass
>> +++ b/meta/classes/nopackages.bbclass
>> @@ -1,12 +1,23 @@
>> -deltask do_package
>> -deltask do_package_write_rpm
>> -deltask do_package_write_ipk
>> -deltask do_package_write_deb
>> -deltask do_package_qa
>> -deltask do_packagedata
>> -deltask do_package_setscene
>> -deltask do_package_write_rpm_setscene
>> -deltask do_package_write_ipk_setscene
>> -deltask do_package_write_deb_setscene
>> -deltask do_package_qa_setscene
>> -deltask do_packagedata_setscene
>> +NO_PACKAGES_TASKS =3D " \
>> +    do_package \
>> +    do_package_write_rpm \
>> +    do_package_write_ipk \
>> +    do_package_write_deb \
>> +    do_package_qa \
>> +    do_packagedata \
>> +"
>> +
>> +python() {
>> +    sstatetasks =3D (d.getVar('SSTATETASKS') or '').split()
>> +    for task in d.getVar('NO_PACKAGES_TASKS').split():
>> +        setscene_task =3D '%s_setscene' % task
>> +        tasks =3D (task, setscene_task)
>> +        for t in tasks:
>> +            bb.build.deltask(t, d)
>> +
>> +        if task in sstatetasks:
>> +            bb.debug(2, 'Removing sstate task %s from SSTATETASKS' %
>> task)
>> +            sstatetasks.remove(task)
>> +    d.setVar('SSTATETASKS', ' '.join(sstatetasks))
>> +
>> +}
>=20
> I really don't want to turn more comparatively readable classes into a
> mess of anonymous python if we can help it.
>=20
> Can we not just teach cleansstate to check if a task exists before
> trying to delete the sstate? It should be possible with
> d.getVarFlag(taskname, "task")?

Thanks, yes, this is my first thought, but I only knew __BBTASKS which is a=
n internal var of bitbake, I will use d.getVarFlag(taskname, "task") to sen=
d a v2.

// Robert


>=20
> Cheers,
>=20
> Richard
>=20

