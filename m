Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB0375401
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jul 2018 05:36:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w685aKku001845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 7 Jul 2018 22:36:20 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.237]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0399.000;
	Sat, 7 Jul 2018 22:36:19 -0700
From: "Song, Hongzhi" <Hongzhi.Song@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] kernel-selftest: Add a recipe on kernel
	selftest
Thread-Index: AQHUFewXNXJx6O+LcECnhuXCLx+q+aSEzoPM
Date: Sun, 8 Jul 2018 05:36:19 +0000
Message-ID: <854398C72EAB594A93CFE8424E96450116E4E6BE@ALA-MBD.corp.ad.wrs.com>
References: <1530870706-206950-1-git-send-email-hongzhi.song@windriver.com>,
	<995cd601a894144e95c2a2f940b7ba240a2e55f1.camel@linuxfoundation.org>
In-Reply-To: <995cd601a894144e95c2a2f940b7ba240a2e55f1.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.105.68]
MIME-Version: 1.0
Subject: Re: [PATCH v3] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Sun, 08 Jul 2018 05:36:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
________________________________________=0A=
>From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
>Sent: Saturday, July 07, 2018 20:14=0A=
>To: Song, Hongzhi; openembedded-core@lists.openembedded.org=0A=
>Subject: Re: [OE-core] [PATCH v3] kernel-selftest: Add a recipe on kernel =
selftest=0A=
=0A=
>On Fri, 2018-07-06 at 05:51 -0400, Hongzhi.Song wrote:=0A=
>> The recipe builds the framework for kernel-selftest. Now, it just=0A=
>> contains two sets of testcase, bpf and vm. We are appending others=0A=
>> to the recipe.=0A=
>>=0A=
>> It needs some features which will be written into relevant recipe.=0A=
>> But now, you should add them to conf/local.conf manually.=0A=
>> KERNEL_FEATURES_append +=3D "features/bpf/bpf.scc"=0A=
>>=0A=
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>=0A=
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>=0A=
>> ---=0A=
>>  .../kernel-selftest/kernel-selftest.bb             | 94=0A=
>> ++++++++++++++++++++++=0A=
>>  1 file changed, 94 insertions(+)=0A=
>>  create mode 100644 meta/recipes-kernel/kernel-selftest/kernel-=0A=
>> selftest.bb=0A=
>>=0A=
>> diff --git a/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb=0A=
>> b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb=0A=
>> new file mode 100644=0A=
>> index 0000000..28fd178=0A=
>> --- /dev/null=0A=
>> +++ b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb=0A=
>> @@ -0,0 +1,94 @@=0A=
>> +SUMMARY =3D "Kernel selftest for Linux"=0A=
>> +DESCRIPTION =3D "Kernel selftest for Linux"=0A=
>> +LICENSE =3D "GPLv2"=0A=
>> +=0A=
>> +# for bpf and vm=0A=
>> +DEPENDS =3D " \=0A=
>> +    elfutils \=0A=
>> +    libcap \=0A=
>> +    libcap-ng \=0A=
>> +    fuse \=0A=
>> +    util-linux \=0A=
>> +    rsync-native \=0A=
>> +"=0A=
=0A=
> This adds a DEPENDS on fuse but fuse is not in OE-Core therefore this=0A=
> recipe can never build there.=0A=
=0A=
Considering other kernel-selftest will depend more recipes probably not exi=
sting =0A=
in oe-core. So how do you think about that move the recipe to meta-oe.=0A=
=0A=
Best Regards,=0A=
-- Hongzhi=0A=
=0A=
> +do_configure[prefuncs] +=3D "copy_perf_source_from_kernel remove_clang_r=
elated"=0A=
> +python copy_perf_source_from_kernel() {=0A=
=0A=
> We're copying to perf source here? The function name needs tweaking.=0A=
=0A=
> Cheers,=0A=
=0A=
> Richard=0A=
=0A=

