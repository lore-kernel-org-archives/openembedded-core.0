Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S7Lfg-000363-9z
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 07:57:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2D6mdQr022238
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 23:48:39 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 12 Mar 2012 23:48:39 -0700
Message-ID: <4F5EEDCD.50804@windriver.com>
Date: Tue, 13 Mar 2012 14:48:45 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>	<6b45ee6d33a54d9abcbc0dd28f383a4993795017.1330771239.git.xiaofeng.yan@windriver.com>
	<4F5E4768.7030906@windriver.com>
In-Reply-To: <4F5E4768.7030906@windriver.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q2D6mdQr022238
Subject: Re: [PATCH 3/3] archiver_configure.bbclass: configure the content for archiving package
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
X-List-Received-Date: Tue, 13 Mar 2012 06:57:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8813=E6=97=A5 02:58, Mark Hatle wrote:
> A few quick comments to match up with the patch 2/3 comments..
>
> On 3/3/12 4:54 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> This is configuration file to point to what content a archive package
>> should include in the different stage of task by pointing to=20
>> different variable and
>> stage.
>>
>> [YOCTO #1977]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/classes/archiver_configure.bbclass | 35=20
>> +++++++++++++++++++++++++++++++
>> 1 files changed, 35 insertions(+), 0 deletions(-)
>> create mode 100644 meta/classes/archiver_configure.bbclass
>>
>> diff --git a/meta/classes/archiver_configure.bbclass=20
>> b/meta/classes/archiver_configure.bbclass
>> new file mode 100644
>> index 0000000..c9892d3
>> --- /dev/null
>> +++ b/meta/classes/archiver_configure.bbclass
>
> This seems odd that configuration items would be in a .bbclass file. I=20
> would have expected the configuration to inherit the archiver, and=20
> then either a default set of values be specified in the=20
> archive.bbclass or in the bitbake.conf (or similar)....
>
> As for the defaults below, I think they are fine....
>
I will define a default set in local.conf.sample in V2
>> @@ -0,0 +1,35 @@
>> +# This file is for getting tarball in different stage for sources,=20
>> patches, and logs by configuring
>> +# the following variable and tasks
>> +
>> +inherit archiver
>> +
>> +# SOURCE_ARCHIVE_PACKAGE_TYPE =3D {'tar','srpm'}
>> +SOURCE_ARCHIVE_PACKAGE_TYPE =3D 'tar'
>> +
>> +# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS =3D {'logs_with_scripts', 'logs'}
>> +# String 'logs_with_scripts' include temp directory and .bb and .inc=20
>> file
>> +# String 'logs' only include temp
>> +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS =3D 'logs_with_scripts'
>> +
>> +# PATCHES_ARCHIVE_WITH_SERIES =3D {'true', 'false'}
>> +# Strings 'true' means that patches including series files(series +=20
>> non-applying)
>> +# String 'false' means that no series and only archive applying patch=
es
>> +PATCHES_ARCHIVE_WITH_SERIES =3D 'true'
>> +
>> +# Archive packages for copy-left
>> +#COPYLEFT_COMPLIANCE =3D 'true'
>> +
>> +# Open this item when you want to get original sources tarball with=20
>> patches
>> +do_unpack[postfuncs] +=3D "do_archive_original_sources_patches "
>
> Instead of do_unpack[postfuncs] would a do_patch[prefuncs] be better?=20
> This would ensure that do_unpack and all other tasks between do_unpack=20
> and do_patch were run first... then do we can archive the results..
>
Some bb files do some chages after do_unpack before do_patch. The=20
following bb files are the case. Perhaps some other bb files could=20
change some stuff before do_patch. So I archive sources codes in=20
do_unpack[postfuncs].

meta$ grep "do_unpack_append" . -nr
./recipes-core/eglibc/eglibc_2.15.bb:76:do_unpack_append() {
./recipes-core/eglibc/eglibc_2.13.bb:73:do_unpack_append() {
./recipes-sato/web/web_git.bb:19:do_unpack_append () {
./recipes-extended/ltp/ltp_20120104.bb:46:do_unpack_append() {



>> +
>> +# Open this item when you want to get tarball for patched sources=20
>> including patches
>> +#do_patch[postfuncs] +=3D "do_archive_patched_sources "
>
> Perhaps the same here between do_patch and do_configure...
>
> --Mark
>
>> +
>> +# Open this item when you want to get tarball for configured sources=20
>> including patches
>> +#do_configure[postfuncs] +=3D "do_archive_configured_sources "
>> +
>> +# Open this item when you want to get tarball for logs tarball
>> +do_package_write_rpm[prefuncs] +=3D "do_archive_scripts_logs "
>> +
>> +# Get dump date and create diff file
>> +do_package_write_rpm[postfuncs] +=3D "do_dumpdata_create_diff_gz "
>> -- 1.7.0.4 _______________________________________________=20
>> Openembedded-core
>> mailing list Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



